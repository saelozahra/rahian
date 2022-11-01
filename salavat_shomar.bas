B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=6.3
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
	#Extends: androidx.appcompat.app.AppCompatActivity
#End Region

Sub Process_Globals

    Dim sensor As PhoneSensors
    Dim sounds As SoundPool
    Dim bounceId As Int
	
End Sub

Sub Globals
	
	Private Panel1 As Panel
	Private beshmar As Button
	Private taghdim_be As EditText
	Private label_salavat As Label
	
	Dim Actionbar As ACToolBarLight
	Dim ABHelper As ACActionBar
	Dim ac As AppCompat
	Dim xml1 As XmlLayoutBuilder
	Dim bbbd As BitmapDrawable
	
	Dim cd,cd2 As ColorDrawable
	Dim tedad As Int
	Private zekr As EditText
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("salavat")
	
	Actionbar.SetAsActionBar
	ABHelper.Initialize
	
	
	
	
	Actionbar.SetLayoutAnimated(200, 0, 0, 100%x, ac.GetMaterialActionBarHeight)
	Actionbar.SetVisibleAnimated(200, True)
	ac.SetElevation(Actionbar,8dip)	
	
	Dim back_btn As Button
	back_btn.Initialize("back_btn")
	bbbd=xml1.GetDrawable("ic_action_navigation_arrow_back")
	back_btn.SetBackgroundImage(bbbd.Bitmap)
	back_btn.Gravity = Gravity.CENTER
	back_btn.Text=""	
	Actionbar.AddView(back_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.LEFT,Gravity.TOP))



	Dim act_title As Label
	act_title.Initialize("act_title")
	act_title.Text="هدیه ای به شهدا"
	act_title.Typeface = library.font
	act_title.TextColor = Colors.White
	act_title.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	act_title.TextSize = 20
	Actionbar.AddView(act_title,-2,ac.GetMaterialActionBarHeight , Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL))
	
	
	
	cd2.Initialize2(0xBE154D66,2dip,1dip,0xDC154D66)
	
	
	cd.Initialize2(0x64154D66,5dip,1dip,0xFF0C4964)
	Panel1.Background=cd
	
	
	Main.cu1 = Main.sql1.ExecQuery( "SELECT * FROM salavat" )		
	Main.cu1.Position = 0		
	
	taghdim_be.Text = Main.cu1.GetString("taghdim_be")
	
	tedad=Main.cu1.GetString("tedad")
	
	beshmar.Text = tedad
	
	label_salavat.Text = tedad & "  " & zekr.Text & "  تقدیم به : " & taghdim_be.Text
	
	beshmar.Typeface=library.mjfont
	taghdim_be.Typeface=library.mjfont
	zekr.Typeface=library.mjfont
	label_salavat.Typeface=library.mjfont
	
	
	taghdim_be.Background=cd2
	zekr.Background=cd2
	
		
	taghdim_be.TextSize = 18
	zekr.TextSize = 18
	
	Activity.AddMenuItem("صفر کردن شمارنده","zero")
	
	
	
    If FirstTime Then
        sensor.Initialize(sensor.TYPE_ACCELEROMETER)
        Shake.CallBackActivity = "salavat_shomar" 'Set the activity that handles the Shake event
        sounds.Initialize(1)
        bounceId = sounds.Load(File.DirAssets, "salert.mp3")
    End If
	
	beshmar.Typeface=library.font
	beshmar.TextColor = 0xBE001B3B
'	SetNinePatchEditText(zekr,"kadr","kadrh","kadr")
	zekr.SetBackgroundImage(LoadBitmap(File.DirAssets,"kadr.png"))
	taghdim_be.SetBackgroundImage(LoadBitmap(File.DirAssets,"kadr.png"))
	
	zekr.TextColor=Colors.DarkGray
	taghdim_be.TextColor=Colors.DarkGray
	
	library.SetStatusBarColor(library.colorDark)
	
End Sub


Sub Activity_Resume
	sensor.StartListening("sensor")
	Main.media.Play
	ToastMessageShow(" دعا برای حاجات ما فراموش نشه  " & CRLF & "ظهور امام زمان عج" & CRLF & "حاجات امام زمان عج و رزمندگان اسلام" & CRLF & "پیروزی رزمندگان اسلام" , True )
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	sensor.StopListening
	Main.cu1.Close
	Main.media.Pause
End Sub




Sub back_btn_Click
	Activity.Finish
End Sub



Sub taghdim_be_TextChanged (Old As String, New As String)
	
	Main.sql1.ExecNonQuery("UPDATE salavat set taghdim_be = '" & New & "'" )
	
	label_salavat.Text = tedad & "  " & zekr.Text & "  تقدیم به : " & taghdim_be.Text
	
	
End Sub



Sub zekr_TextChanged (Old As String, New As String)
	
	Main.sql1.ExecNonQuery("UPDATE salavat set zekr = '" & New & "'" )
	
	label_salavat.Text = tedad & "  " & zekr.Text & "  تقدیم به : " & taghdim_be.Text
	
	
End Sub



Sub beshmar_Click
	
	
	tedad = tedad + 1
	
	beshmar.Text = tedad
	
	Main.sql1.ExecNonQuery("UPDATE salavat set tedad = " & tedad )
	
	label_salavat.Text = tedad & "  " & zekr.Text & "  تقدیم به : " & taghdim_be.Text
	
End Sub


Sub zero_click
	
	tedad = 0
	
	beshmar.Text = tedad
	
	Main.sql1.ExecNonQuery("UPDATE salavat set tedad = " & tedad )
	
	label_salavat.Text = tedad & "  " & zekr.Text & "  تقدیم به : " & taghdim_be.Text
	Main.cu1.Close
	Main.cu1 = Main.sql1.ExecQuery( "SELECT * FROM salavat" )
End Sub




'Delegate the event handling to the Shake module
Sub sensor_SensorChanged (Values() As Float)
    Shake.HandleSensorEvent(Values)
End Sub

'This event is raised when a shake is detected
Sub ShakeEvent
	
	ToastMessageShow("اللهم صل علی محمد و آل محمد و عجل فرجهم",False)
	
	beshmar_Click
	
    sounds.Play(bounceId, 1, 1, 1 , 0 , 1 )
	
End Sub