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
	
End Sub

Sub Globals
	Private matn As WebView
	Dim cd As ColorDrawable
	Dim css As String
	Dim Actionbar As ACToolBarLight
	Dim ABHelper As ACActionBar
	Dim ac As AppCompat
	Dim xml1 As XmlLayoutBuilder
	Dim bbbd,star0,star1 As BitmapDrawable
	Dim stared As Boolean
	Dim star_btn As Button
	Dim mt As KJ_MaterialToast
End Sub

Sub Activity_Create(FirstTime As Boolean)
	Activity.LoadLayout("content")
	
	Actionbar.SetAsActionBar
	ABHelper.Initialize
	
	Main.cu1 = Main.sql1.ExecQuery("SELECT * FROM content WHERE id = " & library.selectedContent )
	
	Main.cu1.Position = 0
	
	If Main.cu1.GetString("name")=="پدر و مادر شهدا" Then
		css=" <style>@import url(http://cdn.rawgit.com/rastikerdar/tanha-font/v0.4.1/dist/font-face.css); *{ line-height:2;direction:rtl; font-size:110%; font-family:'Tanha'; color:white; } h1,h2,h3,h4,h5,h6,h7{ font-size:125%; font-weight: bold; } img{max-width:100%;} iframe{border:0;} </style>"
		matn.LoadHtml( css & Main.cu1.GetString("html"))
	Else
		css=" <style>@import url(http://cdn.rawgit.com/rastikerdar/tanha-font/v0.4.1/dist/font-face.css); *{ line-height:2;direction:rtl; font-size:110%; font-family:'Tanha'; color:white; } h1,h2,h3,h4,h5,h6,h7{ font-size:125%; font-weight: bold; } img{max-width:100%;}  pre{ white-space: pre-wrap; font-family:'Tanha'; } iframe{border:0;} </style><pre>"
		matn.LoadHtml( css & Main.cu1.GetString("html") & "</pre> ")
	End If
	
	
	
	
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

	
	star0=xml1.GetDrawable("ic_star_border_white_24dp")
	star1=xml1.GetDrawable("ic_star_white_24dp")
	
	
	star_btn.Initialize("star_btn")
	
	If Main.cu1.GetString("star") == 1 Then
		stared = True
		star_btn.SetBackgroundImage(star1.Bitmap)
	Else
		stared = False
		star_btn.SetBackgroundImage(star0.Bitmap)
	End If
	star_btn.Gravity = Gravity.CENTER
	star_btn.Text=""
	
	Actionbar.AddView(star_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.RIGHT,Gravity.TOP))
	
	
	
	Dim act_title As Label
	act_title.Initialize("act_title")
	
	If Main.cu1.GetString("cat").Length>12 Then
		act_title.Text= Main.cu1.GetString("cat") & "  »  " & Main.cu1.GetString("name")
	Else
		act_title.Text= Main.cu1.GetString("name")
	End If
	
	act_title.Typeface = library.font
	act_title.TextColor = Colors.White
	act_title.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	act_title.TextSize = 20
	Actionbar.AddView(act_title,-2,ac.GetMaterialActionBarHeight , Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL))
	
	
	If Main.cu1.GetString("read") == "1" Then mt.Initialize("این مطلب قبلا خوانده شده",mt.LENGTH_LONG,mt.TYPE_INFO)
	
	cd.Initialize2(0x64154D66,1dip,1dip,0xFF0C4964)
	matn.Color=Colors.Transparent
	matn.Background=cd
	
	library.SetStatusBarColor(library.colorDark)
	
End Sub

Sub Activity_Resume
	Main.media.Play
	mt.Initialize("برای برآورده شدن حاجات خادمین شهدا ، صلوات",mt.LENGTH_LONG,mt.TYPE_INFO)
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	Main.cu1.Close
	Main.media.Pause
End Sub

Sub back_btn_Click
	Activity.Finish
End Sub


Sub star_btn_Click
	
	If stared Then
		stared = False
		star_btn.SetBackgroundImage(star0.Bitmap)
		Main.sql1.ExecNonQuery("UPDATE content set star = 0 WHERE id = " & library.selectedContent )
	Else
		stared = True
		star_btn.SetBackgroundImage(star1.Bitmap)
		Main.sql1.ExecNonQuery("UPDATE content set star = 1 WHERE id = " & library.selectedContent )
	End If

End Sub