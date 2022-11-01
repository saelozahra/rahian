B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=6.3
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: true
	#Extends: androidx.appcompat.app.AppCompatActivity
#End Region

Sub Process_Globals
	Dim t As Timer
End Sub

Sub Globals
	Dim ac As AppCompat
	Dim act_title As Label
	Private label_salavat As Label
	Private zekr As ACEditText
	Private taghdim_be As ACEditText
'	Private beshmar As ACButton
	Private pContent As Panel
	Private ActionBar As ACToolBarLight
	Dim bbbd As BitmapDrawable
	Dim xml1 As XmlLayoutBuilder
	Dim ret As String
	Dim cd1 As ColorDrawable
	Dim r As Reflector
	Dim htj As HttpJob
	Dim man As String
	Private desc As Label
	Dim input1 As InputDialog
	Dim x1,xold As Int
	Private FloatingActionButton1 As FloatingActionButton
	Dim mt As KJ_MaterialToast
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	Activity.LoadLayout("doa")
	
	cd1.Initialize2( library.colorLight,5,2,ac.GetThemeAttribute("colorPrimary"))

'	inp.Initialize("inp")
	
	

	
	ActionBar.SetAsActionBar
	ActionBar.Title = Application.LabelName
	ActionBar.SetLayoutAnimated(200, 0, 0, 100%x, ac.GetMaterialActionBarHeight)
	ActionBar.SetVisibleAnimated(200, True)
	ac.SetElevation(ActionBar,8dip)
	pContent.SetLayoutAnimated(200, 0, ActionBar.Height , 100%x, 100%y - ActionBar.Height)
	pContent.SetColorAnimated(2020,Colors.White,library.colorLight)

	act_title.Initialize("act_title")
	act_title.Typeface = library.font
	act_title.TextColor = Colors.White
	act_title.Gravity = Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL)
	act_title.TextSize = 18
	act_title.Text = "    دعا برای رزمنده ها    "
	ActionBar.AddView(act_title,-2,ac.GetMaterialActionBarHeight , Bit.Or(Gravity.CENTER_HORIZONTAL,Gravity.CENTER_VERTICAL))
	ActionBar.Title=""
	
	
	Dim back_btn As Button
	back_btn.Initialize("bb")
	bbbd=xml1.GetDrawable("ic_arrow_back_white_36dp")
	back_btn.SetBackgroundImage(bbbd.Bitmap)
	back_btn.Gravity = Gravity.CENTER
	back_btn.Text=""	
	ActionBar.AddView(back_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.LEFT,Gravity.TOP))
	
	
	

	Dim save_btn As Button
	save_btn.Initialize("save_btn")
	bbbd=xml1.GetDrawable("ic_check_white_24dp")
	save_btn.SetBackgroundImage(bbbd.Bitmap)
	save_btn.Gravity = Gravity.CENTER
	save_btn.Text=""	
	ActionBar.AddView(save_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.RIGHT,Gravity.TOP))
	

	Dim saat_btn As Button
	saat_btn.Initialize("saat_btn")
	bbbd=xml1.GetDrawable("ic_access_alarms_white_24dp")
'	bbbd.Gravity=Gravity.CENTER
	saat_btn.SetBackgroundImage(bbbd.Bitmap)
	saat_btn.Gravity = Gravity.CENTER
	saat_btn.Text=""	
	ActionBar.AddView(saat_btn,ac.GetMaterialActionBarHeight / 1.5 ,ac.GetMaterialActionBarHeight / 1.5 ,Bit.Or(Gravity.RIGHT,Gravity.TOP))
	
	

	
	label_salavat.TextColor = library.colorDark
	desc.TextColor = library.colorDark
	zekr.TextColor = library.colorDark
	taghdim_be.TextColor = library.colorDark
	zekr.HintColor = Colors.White
	taghdim_be.HintColor = Colors.White
'	beshmar.TextColor = Colors.White
	

'	beshmar.color=library.colorDark

	zekr.Hint = "چی میخونین؟"
	taghdim_be.Hint = "اینو برای کی یا چی میخونین؟"
'	zekr.SingleLine = True
'	taghdim_be.SingleLine = True
	label_salavat.Typeface=library.font
	zekr.Typeface=library.font_tanha
	taghdim_be.Typeface=library.font_tanha
	desc.Typeface=library.font
	
	If File.Exists(library.dir,"tedad_doa") Then
		
		desc.Text = " تا حالا  " & File.ReadString(library.dir,"tedad_doa").Replace(CRLF," ") & " تا دعای خیر برا رزمنده ها فرستادیم "
	
	End If
	
	r.Target = label_salavat
	r.RunMethod3("setLineSpacing", 1, "java.lang.float",0.9, "java.lang.float")
	
	htj.Initialize("htj",Me)
	
	
	If File.Exists(library.dir,"man.txt") Then
		
		man = File.ReadString(library.dir,"man.txt")
	
	Else
		
'		If library.p.SdkVersion > 16 Then
'			inp.Show( "نام" , " لطفا نام خود را وارد کنید " , "اسمتون چیه؟" , "" ,False,0,"تائید","لغو","",Null,True,True )	
'		Else
			If input1.Show("لطفا نام خود را وارد کنید","اسمتون چیه","تائید","","",Null) == DialogResponse.POSITIVE Then
				File.WriteString(library.dir,"man.txt",input1.Input)
				man = input1.Input
			End If
'		End If
		
	End If
	
	
	
	If File.Exists(library.dir,"taghdim_be") Then
		taghdim_be.Text = File.ReadString(library.dir,"taghdim_be")
		zekr.Text = File.ReadString(library.dir,"zekr")
	End If

	FloatingActionButton1.Icon = xml1.GetDrawable("ic_check_white_24dp")
	FloatingActionButton1.Color = library.color
	FloatingActionButton1.Type = FloatingActionButton1.TYPE_NORMAL
	FloatingActionButton1.ShowShadow = True
	FloatingActionButton1.Hide(True)
	FloatingActionButton1.Top = 100%y-(FloatingActionButton1.Height*1.7)
	t.Initialize("t",313)
	t.Enabled=True
	
	library.SetStatusBarColor(library.colorDark)
	
	
End Sub

Sub t_Tick
	
	If zekr.Text.Length>3 And taghdim_be.Text.Length>3 Then
		FloatingActionButton1.Show(True)
	Else
		FloatingActionButton1.Hide(True)
	End If
	
End Sub

Sub pContent_Touch (Action As Int, X As Float, Y As Float)
	
	Log(x&" : "&y&" : "&Action)
	
	If x1 > 0 Then
	
		If Action == 2 And x > xold And x1 < 24 Then
			
			xold = x
			
			If x > 202 Then
				Activity.Finish
			End If
			
		End If
	Else
		x1 = x
		xold = x
	End If
	
End Sub

Sub inp_Input(Result As String)
	
	File.WriteString(library.dir,"man.txt",Result)
	Log(Result)
	man = Result
	
End Sub

Sub taghdim_be_TextChanged (Old As String, New As String)
	File.WriteString(library.dir,"taghdim_be",New)
End Sub

Sub zekr_TextChanged (Old As String, New As String)
	File.WriteString(library.dir,"zekr",New)
End Sub

Sub yadavari_Click
	Dim td As TimeDialog

	Dim time As String
		td.Hour = DateTime.GetHour(DateTime.Now)
		td.Minute = DateTime.GetMinute(DateTime.Now)
		td.Is24Hours = True
		bbbd=xml1.GetDrawable("ic_access_alarms_white_24dp")
		ret = td.Show("زمان مورد نظر خود را انتخاب کنید", "انتخاب زمان یادآوری", "تایید", "انصراف", "غیر فعال",bbbd.Bitmap)
		If ret= DialogResponse.POSITIVE Then
			time=(td.Hour*60)+td.Minute
			File.WriteString(library.dir,"time",time)
			File.WriteString(library.dir,"start","1")
			Log(time)
			StartService(timerMod)
		Else If ret= DialogResponse.NEGATIVE Then
			File.WriteString(library.dir,"start","0")
			StopService(timerMod)
		End If
		
End Sub

Sub saat_btn_LongClick
	mt.Initialize("تنظیم ساعت یادآوری",mt.LENGTH_LONG,mt.TYPE_INFO)
End Sub

Sub saat_btn_Click
	yadavari_Click
End Sub

Sub bb_LongClick
	ToastMessageShow("بازگشت به صفحه قبل",False)
End Sub

Sub bb_Click
	Activity.Finish
End Sub

Sub save_btn_LongClick
	mt.Initialize("ثبت",mt.LENGTH_LONG,mt.TYPE_SUCCESS)
End Sub

Sub save_btn_Click
	beshmar_Click
End Sub



Sub beshmar_Click
	
	If zekr.Text.Length > 2 Then
		ProgressDialogShow("لطفا کمی صبر کنید")
		htj.PostString("http://amg-fars.ir/shohada/doa/insert.php","user="&man&"&doa="&zekr.Text&"&taghdim="&taghdim_be.Text)
	Else
		mt.Initialize("چی برا رزمنده ها یا شهدا میخواین بخونین ؟",mt.LENGTH_LONG,mt.TYPE_INFO)
		
	End If
	
End Sub



Sub JobDone (job As HttpJob)
	ProgressDialogHide
	If job.Success Then
		mt.Initialize("با موفقیت ثبت شد",mt.LENGTH_LONG,mt.TYPE_SUCCESS)
		File.WriteString(library.dir,"tedad_doa",job.GetString.Replace(CRLF,""))
		Log(job.GetString)
		Dim str As RichString
		str.Initialize(job.GetString.Replace(CRLF,""))
		str.Color(Colors.Red,0,str.Length)
		desc.Text = "تا حالا " & job.GetString.Replace(CRLF,"") & " تا دعای خیر برا رزمنده ها فرستادیم"
		Activity.Finish
	End If
		job.Release	
End Sub



Sub FloatingActionButton1_Click
	beshmar_Click
End Sub