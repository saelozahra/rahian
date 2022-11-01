Type=Activity
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
	#Extends: android.support.v7.app.ActionBarActivity
#End Region

Sub Process_Globals
	Dim id As Int
End Sub

Sub Globals
	Private Actionbar As ACToolBarDark
	Dim ABHelper As ACActionBar
	Dim ac As AppCompat
	Dim xml1 As XmlLayoutBuilder
	Dim star_btn As Button
	Dim bbbd,star0,star1 As BitmapDrawable
	Private matn As WebView
	Dim web As PhoneIntents
	Dim stared As Boolean
	Dim header_html,full_html,link As String
	
End Sub

Sub Activity_Create(FirstTime As Boolean)

	Activity.LoadLayout("content")
	
	Main.cu1 = Main.sql1.ExecQuery("SELECT * FROM content WHERE id="&id)
			
	Main.cu1.Position = 0
	

	Actionbar.SetAsActionBar
	ABHelper.Initialize
	
	Actionbar.SetLayoutAnimated(200, 0, 0, 100%x, ac.GetMaterialActionBarHeight)
	Actionbar.SetVisibleAnimated(200, True)
	ac.SetElevation(Actionbar,8dip)	
	
	Dim back_btn As Button
	back_btn.Initialize("bb")
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
	
	
	Dim share_btn As Button
	share_btn.Initialize("share_btn")
	bbbd=xml1.GetDrawable("ic_action_social_share")
	share_btn.SetBackgroundImage(bbbd.Bitmap)
	share_btn.Gravity = Gravity.CENTER
	share_btn.Text=""	
	Actionbar.AddView(share_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.RIGHT,Gravity.TOP))
	
	If Main.cu1.GetString("link") == Null Then
		link=""
	Else
		link=Main.cu1.GetString("link")
	End If
	
'	Try
'		link=Main.cu1.GetString("link")
'	Catch
'		link=""
'	End Try
	
	If link.Length > 10 Then
		
		Dim link_btn As Button
		link_btn.Initialize("link_btn")
		bbbd=xml1.GetDrawable("ic_action_editor_insert_link")
		link_btn.SetBackgroundImage(bbbd.Bitmap)
		link_btn.Gravity = Gravity.CENTER
		link_btn.Text=""	
		Actionbar.AddView(link_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.RIGHT,Gravity.TOP))
		
	End If
		
	Dim act_title As Label
	act_title.Initialize("act_title")
	act_title.Text=Application.LabelName'Main.cu1.GetString("caption")
	act_title.Typeface = library.font
	act_title.TextColor = Colors.White
	act_title.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	act_title.TextSize = 20
	Actionbar.AddView(act_title,-2,ac.GetMaterialActionBarHeight , Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL))

	
	
	header_html = "<link href='https://cdn.rawgit.com/rastikerdar/tanha-font/v0.4.1/dist/font-face.css' rel='stylesheet' type='text/css' /><style> *{font-family:Tanha;} img{max-width:100%;} a{color:#222;font-family:Tanha;} </style><div style='background-image: url(""https://subtlepatterns.com/patterns/confectionary.png"");width:100%; line-height:2; direction:rtl; font-family:Tanha; color:#3E2723; font-size:133%;'>"
	
	full_html = header_html & "<h4 style='margin:1% auto;'>"&Main.cu1.GetString("caption")&"</h4>"&CRLF&"<img style='margin:2% auto;display:inline-block;' src='"&Main.cu1.GetString("image")&"'><br>" & Main.cu1.GetString("text") &"</div>"
	
	matn.LoadHtml(full_html)

	matn.SetLayout(0,Actionbar.Height,100%x,100%y-Actionbar.Height)
	
	'Main.cu1.Close
	
End Sub


'Sub matn_OverrideUrl (Url As String) As Boolean
'	
'	Log(Url)
'	If Url.StartsWith("https") Then
'		StartActivity(web.OpenBrowser(Url))
'		Return True
'	Else
''		ToastMessageShow("در حال جستجو به دنبال : " & library.urlEncode(Url) , False)
'		
'		'CallSub2(search,"loadDB",library.urlEncode(Url))
'		
'		StartActivity(search)
'		
'		search.searchQuery = library.urlEncode(Url)
'		
'		Return True
'	End If
'	
'End Sub

'
'Sub hashTagLink(text As String) As String
''	#(\w+) 
'	
''	Dim char1 As String
'	Dim listHashtags() As String
'	Dim shomareHalghe As Int = 1
'	Dim macher1 As Matcher
'	
'	macher1 = Regex.Matcher("#(\w+)",text)
'		
'	
'		Do While macher1.Find
'			
''			Log(macher1.Match)
'			
'			For i = 0 To shomareHalghe
'			
'				If listHashtags(i).Contains(macher1.Match) Then
'					
'					Log("تکراریه داداش")
'					
'				Else
'			
'					listHashtags(shomareHalghe)=macher1.Match
'					text = text.Replace(macher1.Match,"<a href='"&macher1.Match.SubString2(1,macher1.Match.Length)&"'>"&macher1.Match&"</a>")
'			
'				End If
'			
'			Next
'			
'			shomareHalghe = shomareHalghe + 1
'			
''			Try
''				char1=text.CharAt(text.IndexOf(macher1.Match)-1)
''			Catch
''				char1=""
''			End Try
''		
''			Log("char1: "&char1)
''			
''			If char1 ==">" Or char1 =="'"  Then
''				Log("تکراریه داداش")
''			Else
''				text = text.Replace(macher1.Match,"<a href='"&macher1.Match.SubString2(1,macher1.Match.Length)&"'>"&macher1.Match&"</a>")
''			End If
'			
''			text = text.Replace(macher1.Match,"<a href='"&macher1.Match&"'>"&macher1.Match&"</a>")
'
'		Loop
'	
'	macher1 = Regex.Matcher("@(\w+)",text)
'	
'	Do While macher1.Find
'		Log(macher1.Match)
'		text = text.Replace(macher1.Match,"<a href='https://telegram.me/"&macher1.Match&"'>"&macher1.Match&"</a>")
'	Loop
'	
''	Dim hashtags(),hashtag As String
''	hashtags = Regex.Split("#",text)
''	For i = 1 To hashtags.Length - 1
''		Try
''			hashtag = hashtags(i).SubString2(0,hashtags(i).IndexOf(" "))
''			'Log("###" & hashtag )
''			text = text.Replace(hashtag,"<a href='"&hashtag&"'>"&hashtag&"</a>")
''		Catch
'''			hashtag = hashtags(i).SubString2(0,hashtags(i).IndexOf(CRLF))
'''			'Log("###" & hashtag )
'''			text = text.Replace(hashtag,"<a href='"&hashtag&"'>"&hashtag&"</a>")
''			Log("نتونست متن رو تبدیل کنه : "&LastException.Message)
''		End Try
''	Next
'
'	Return text
'	
'End Sub


Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
End Sub

Sub star_btn_Click
	
	If stared Then
		stared = False
		star_btn.SetBackgroundImage(star0.Bitmap)
		Main.sql1.ExecNonQuery("UPDATE content set star = 0 WHERE id = " & id )
	Else
		stared = True
		star_btn.SetBackgroundImage(star1.Bitmap)
		Main.sql1.ExecNonQuery("UPDATE content set star = 1 WHERE id = " & id )
	End If

End Sub


Sub link_btn_Click
	
	StartActivity(web.OpenBrowser(link))
	
End Sub

Sub share_btn_Click
	
	Main.share.Initialize(Main.share.ACTION_SEND,"")
	Main.share.SetType("text/plain")
	Main.share.PutExtra("android.intent.extra.TEXT", Main.cu1.GetString("caption") &CRLF&Main.cu1.GetString("text") & CRLF & CRLF & "https://cafebazaar.ir/app/"&Application.PackageName)
	Main.share.WrapAsIntentChooser("ارسال این خاطره")
	StartActivity(Main.share)
	
End Sub


Sub bb_Click
	Activity.Finish
End Sub
