B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=6.3
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: false
	#Extends: androidx.appcompat.app.AppCompatActivity
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals

	Private lv1 As ListView
	
	Private hr As Label
	
	Private Actionbar As ACToolBarLight
	Dim bbbd As BitmapDrawable
	
	Dim ABHelper As ACActionBar
	Dim ac As AppCompat
	Dim xml1 As XmlLayoutBuilder
	
	Dim back_btn , act_title As Label
	
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("cat")


	Actionbar.SetAsActionBar
	ABHelper.Initialize
	
	Actionbar.SetLayout( 0, 0, 100%x, ac.GetMaterialActionBarHeight)
	lv1.SetLayout( 0 , ac.GetMaterialActionBarHeight , 100%x , 100%y-ac.GetMaterialActionBarHeight )
	
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

	

	lv1.SingleLineLayout.ItemHeight=120dip
'	lv1.SingleLineLayout.Label.Top=0dip
	lv1.SingleLineLayout.Label.Left = 30dip
	bbbd.Initialize(LoadBitmap(File.DirAssets,"list.png"))
'	bbbd.Gravity=Gravity.NO_GRAVITY
	lv1.SingleLineLayout.Background=bbbd
	lv1.ScrollingBackgroundColor=Colors.Transparent
	lv1.SingleLineLayout.Label.Gravity=Bit.Or(Gravity.CENTER_VERTICAL,Gravity.CENTER_HORIZONTAL)
	lv1.SingleLineLayout.Label.Typeface=library.font_tanha
	lv1.SingleLineLayout.Label.Color=Colors.Transparent
	lv1.SingleLineLayout.Label.TextSize=14
	

	  
	
	

	If library.selectedcat =="ویژه ها" Then
		Main.cu1 = Main.sql1.ExecQuery("SELECT * FROM content WHERE star = '1'" )		
	Else
		Main.cu1 = Main.sql1.ExecQuery("SELECT * FROM content WHERE cat = '" & library.selectedcat & "'" )		
	End If
	
		Dim t1 As String
		For i = 0 To Main.cu1.RowCount-1
			Main.cu1.Position = i		
			
			t1=Main.cu1.GetString("name")
			If t1.Length > 32 Then t1 = t1.SubString2(0,32) & "..."
			lv1.AddSingleLine2( t1 ,Main.cu1.GetString("id"))
			
		Next
	
	Main.cu1.Close
	
	SetDivider(lv1,Colors.Blue,0dip)


	library.SetStatusBarColor(library.colorDark)
	 	
End Sub


Sub Activity_Resume

	Main.media.Play
	
End Sub


Sub Activity_Pause (UserClosed As Boolean)
	Main.media.Play
End Sub

Sub lv1_ItemClick ( Position As Int , Value As Object )
	
	library.selectedContent = Value

	StartActivity(content_old)

End Sub


Sub back_btn_Click
	Activity.Finish
End Sub



Sub SetDivider(lv As ListView, Color As Int, Height As Int)

	Try
	  Dim r As Reflector
	  r.Target = lv
	  Dim CD As ColorDrawable
	  CD.Initialize(Color, 0)
	  r.RunMethod4("setDivider", Array As Object(CD), Array As String("android.graphics.drawable.Drawable"))
	  r.RunMethod2("setDividerHeight", Height, "java.lang.int")

	Catch
		Log(LastException.Message)
	End Try  

End Sub
	