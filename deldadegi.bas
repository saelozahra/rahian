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
	
End Sub

Sub Globals
	
	Dim mt As KJ_MaterialToast
	Dim contain	As AHPageContainer
	Dim AHViewPager1	As AHViewPager
	Dim tabs As AHViewPagerFixedTabs
	
	Dim ahd_et,delneveshte_et,vasiat_et As EditText
	
	
	Dim recorder As VoiceRecognition
	
	Private Actionbar As ACToolBarLight
	
	Dim bbbd As BitmapDrawable
	
	Dim ABHelper As ACActionBar
	Dim ac As AppCompat
	Dim xml1 As XmlLayoutBuilder
	
	Dim back_btn , act_title As Label
	
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("deldade")



	Actionbar.SetAsActionBar
	ABHelper.Initialize
	
	Actionbar.SetLayoutAnimated(200, 0, 0, 100%x, ac.GetMaterialActionBarHeight)
	
	Actionbar.SetVisibleAnimated(200, True)
	ac.SetElevation(Actionbar,8dip)	
	Activity.Title=""
	
	back_btn.Initialize("back_btn")
	bbbd=xml1.GetDrawable("ic_action_navigation_arrow_back")
	back_btn.SetBackgroundImage(bbbd.Bitmap)
	back_btn.Gravity = Gravity.CENTER
	back_btn.Text=""	
	Actionbar.AddView(back_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.LEFT,Gravity.TOP))

	
	
	act_title.Initialize("act_title")
	act_title.Text=library.selectedcat'Main.cu1.GetString("caption")
	act_title.Typeface = library.font
	act_title.TextColor = Colors.White
	act_title.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	act_title.TextSize = 20
	Actionbar.AddView(act_title,-2,ac.GetMaterialActionBarHeight , Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL))

	
	
		
'	cd.Initialize2(0x64154D66,5dip,1dip,0xFF0C4964)
'	Panel1.Background=cd
'	Panel1.Visible=False
	
	
	act_title.Text = "دلدادگی"
	
	ahd_et.Initialize("ahd_et")
	delneveshte_et.Initialize("delneveshte_et")
	vasiat_et.Initialize("vasiat_et")
	
	ahd_et.SetBackgroundImage(LoadBitmap(File.DirAssets,"note.png"))
	delneveshte_et.SetBackgroundImage(LoadBitmap(File.DirAssets,"note.png"))
	vasiat_et.SetBackgroundImage(LoadBitmap(File.DirAssets,"note.png"))
	
	
	
	ahd_et.Color=Colors.Transparent
	delneveshte_et.Color=Colors.Transparent
	vasiat_et.Color=Colors.Transparent
		
	ahd_et.TextColor=Colors.DarkGray
	delneveshte_et.TextColor=Colors.DarkGray
	vasiat_et.TextColor=Colors.DarkGray
		
	ahd_et.Typeface=library.font_tanha
	delneveshte_et.Typeface=library.font_tanha
	vasiat_et.Typeface=library.font_tanha
	act_title.Typeface=library.font
	
	ahd_et.Gravity=Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	delneveshte_et.Gravity=Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	vasiat_et.Gravity=Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	
	
	ahd_et.SingleLine=False
	delneveshte_et.SingleLine=False
	vasiat_et.SingleLine=False
	
'	Dim r As Reflector
	
'	r.Target = ahd_et
'	r.RunMethod3("setLineSpacing", 1, "java.lang.float",1.4, "java.lang.float")	
	
	
'	r.Target = delneveshte_et
'	r.RunMethod3("setLineSpacing", 1, "java.lang.float",2, "java.lang.float")	
'	
'	
'	r.Target = vasiat_et
'	r.RunMethod3("setLineSpacing", 1, "java.lang.float",1.5, "java.lang.float")	
		
	
	contain.Initialize
	
	Dim p1 As Panel
	p1.Initialize("p1")
	contain.AddPage(p1,"عهدنامه")
	p1.Color = 0x64154D66
	p1.SetBackgroundImage(LoadBitmap(File.DirAssets,"note.png"))
	p1.AddView(ahd_et, 0 , 0 , 100%x , 100%y - ac.GetMaterialActionBarHeight - 58dip )

	
	
	Dim p2 As Panel
	p2.Initialize("p2")
	contain.AddPage(p2,"دلنوشته")
	p2.Color = 0x64154D66
	p2.SetBackgroundImage(LoadBitmap(File.DirAssets,"note.png"))
	p2.AddView(delneveshte_et, 0 , 0 , 100%x , 100%y - ac.GetMaterialActionBarHeight - 58dip )
	
	
	Dim p3 As Panel
	p3.Initialize("p3")
	contain.AddPage(p3,"وصیت نامه")
	p3.Color = 0xFF8BC34A
	p3.SetBackgroundImage(LoadBitmap(File.DirAssets,"note.png"))
	p3.AddView(vasiat_et, 0 , 0 , 100%x , 100%y - ac.GetMaterialActionBarHeight - 58dip )
	
	
	
	
	
	
'	page.Initialize("page")
	AHViewPager1.PageContainer = contain
	tabs.Initialize(AHViewPager1)
	tabs.Color=0xFF014D7F
	tabs.LineColor=0xFF014D7F
	tabs.LineColorSelected = 0xFF043A5E
	tabs.LineHeight = 5dip
	tabs.LineHeightSelected = 5dip
	tabs.TextColor = Colors.White
'	tabs.TextColorCenter = 0xFF000000
	tabs.TextSize = 18
	

	

'	Activity.AddView(tabs,0, 14%y ,100%x, 58dip)
	Activity.AddView(tabs, 0 , ac.GetMaterialActionBarHeight ,100%x, ac.GetMaterialActionBarHeight)
'	Activity.AddView(page,0, ac.GetMaterialActionBarHeight*2 ,100%x, 100%y - (ac.GetMaterialActionBarHeight*2) )
	AHViewPager1.SetLayout(0, ac.GetMaterialActionBarHeight*2 ,100%x, 100%y - (ac.GetMaterialActionBarHeight*2) )
	Activity.AddMenuItem("صحبت کنید","talk")
	Activity.AddMenuItem("دلنوشته ها","delneveshte_list")
	recorder.Initialize("recorder")





	
	library.SetStatusBarColor(library.colorDark)
	
End Sub

Sub Activity_Resume
	
	Main.cu1 = Main.sql1.ExecQuery( "SELECT * FROM deldade" )				
	Main.cu1.Position = 0		
	
	ahd_et.Text = Main.cu1.GetString("ahdname")
	delneveshte_et.Text = Main.cu1.GetString("delneveshte")
	vasiat_et.Text = Main.cu1.GetString("vasiat")
	
'	Log("ahdname : " & Main.cu1.GetString("ahdname") )
	Main.media.Play
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Main.cu1.Close
	Main.media.Pause
End Sub


Sub ahd_et_TextChanged (Old As String, New As String)
'	Log("new : " & New)
	Main.sql1.ExecNonQuery("UPDATE deldade set ahdname = '" & New & "'" )
End Sub

Sub delneveshte_et_TextChanged (Old As String, New As String)
	Main.sql1.ExecNonQuery("UPDATE deldade set delneveshte = '" & New & "'" )
End Sub

Sub vasiat_et_TextChanged (Old As String, New As String)
	Main.sql1.ExecNonQuery("UPDATE deldade set vasiat = '" & New & "'" )
End Sub


Sub back_btn_Click
	Activity.Finish
End Sub

Sub talk_click
	If recorder.IsSupported Then
		recorder.Prompt = "لطفا صحبت کنید تا متن آن اینجا نوشته شود"
		recorder.Language = "fa"
		recorder.Listen
	Else
		ToastMessageShow("در دستگاه شما پشتیبانی نمیشود",True)
	End If
End Sub



Sub delneveshte_list_click
	
	library.selectedcat="دلنوشته"
	StartActivity(cat)
	
End Sub

Sub recorder_Result (Success As Boolean, Texts As List)
	
	If Success Then
		
		If AHViewPager1.CurrentPage = 0 Then
'			For i = 0 To 1
'				Log(Texts.Get(i))
'				ToastMessageShow(Texts.Get(i),False)
				ahd_et.Text = ahd_et.Text & Texts.Get(0)
'			Next
		Else If AHViewPager1.CurrentPage = 1 Then
'			For i = 0 To 1
'				Log(Texts.Get(i))
'				ToastMessageShow(Texts.Get(i),False)
				delneveshte_et.Text = delneveshte_et.Text & Texts.Get(0)
'			Next
		Else If AHViewPager1.CurrentPage = 2 Then
'			For i = 0 To 1
'				Log(Texts.Get(i))
'				ToastMessageShow(Texts.Get(i),False)
				vasiat_et.Text = vasiat_et.Text & Texts.Get(0)
'			Next
		End If
	
	Else
		mt.Initialize("نتوانستیم صدا را تشخیص دهیم",mt.LENGTH_LONG,mt.TYPE_ERROR)
	End If
	
End Sub



