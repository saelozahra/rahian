B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=6.3
@EndOfDesignText@
Sub Process_Globals
	Dim dir As String = File.DirInternalCache '& "rahian"
	Dim mjfont As Typeface=Typeface.LoadFromAssets("mj_two.ttf")
	Dim font As Typeface=Typeface.LoadFromAssets("Shabnam-Light-FD.ttf")
	Dim font_tanha As Typeface=Typeface.LoadFromAssets("Tanha.ttf")
	Dim selectedcat As String
	Dim site_url As String = "https://t.me/rahpouyan_shohada"
	Dim selectedContent As Int
	Dim color,colorDark,colorLight As Int
	Dim p As Phone
End Sub


Sub SetStatusBarColor(clr As Int)
   Dim p As Phone
   If p.SdkVersion >= 21 Then
     Dim jo As JavaObject
     jo.InitializeContext
     Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
     window.RunMethod("addFlags", Array (0x80000000))
     window.RunMethod("clearFlags", Array (0x04000000))
     window.RunMethod("setStatusBarColor", Array(clr))
   End If
End Sub




Sub CheckConnection As Boolean
	
    If (p.GetDataState == "CONNECTED") Or (p.GetSettings ("wifi_on") == 1) Then
        Return True
    else If (p.GetDataState == "DISCONNECTED") Or (p.GetDataState == "SUSPENDED") Then
        Return False
	Else
		Return False
	End If
	
End Sub


'Sub icon(iconname As String , icocolor As Int) As MSIconicDrawable
'
'	Dim ico As MSIconicDrawable
'	
'	Try
'		ico.Initialize(iconname)
'	Catch
'		ico.Initialize("faw_heart")
'	End Try
'	
'	ico.paddingDp(1dip)
'	ico.actionBarSize
'	
'	If icocolor == 1 Then
'		ico.Color = colorDark
'	else if icocolor == 0 Then
'		ico.Color = color
'	else if icocolor == 2 Then
'		ico.Color = colorLight
'	Else
'		ico.Color=icocolor
'	End If
'		
'	Return ico
'
'End Sub



' Sub SetNinePatchDrawable(Control As View, ImageName As String)
'   Dim r As Reflector
'   Dim package As String
'   Dim id As Int
'   package = r.GetStaticField("anywheresoftware.b4a.BA", "packageName")
'   id = r.GetStaticField(package & ".R$drawable", ImageName)
'   r.Target = r.GetContext
'   r.Target = r.RunMethod("getResources")
'   Control.Background = r.RunMethod2("getDrawable", id, "java.lang.int")
'End Sub


'PressedImage and DisabelImage can be empty string ("")
'Sub SetNinePatchButton(Btn As Button, DefaultImage As String, PressedImage As String, DisabelImage As String)
'   Dim r As Reflector
'   Dim package As String
'   Dim idDefault, iddisabel, idPressed As Int
'   package = r.GetStaticField("anywheresoftware.b4a.BA", "packageName")
'   idDefault = r.GetStaticField(package & ".R$drawable", DefaultImage)
'   If PressedImage <> "" Then idPressed = r.GetStaticField(package & ".R$drawable", PressedImage)
'   If DisabelImage <> "" Then iddisabel = r.GetStaticField(package & ".R$drawable", DisabelImage)
'   r.Target = r.GetContext
'   r.Target = r.RunMethod("getResources")
'   Dim sd As StateListDrawable
'   sd.Initialize
'   If PressedImage <> "" Then sd.AddState(sd.State_Pressed, r.RunMethod2("getDrawable", idPressed, "java.lang.int"))
'   If DisabelImage <> "" Then sd.AddState(sd.State_Disabled, r.RunMethod2("getDrawable", iddisabel, "java.lang.int"))
'   sd.AddCatchAllState( r.RunMethod2("getDrawable", idDefault, "java.lang.int"))
'   Btn.Background = sd
'End Sub

''DisabelImage can be empty string ("")
'Sub SetNinePatchcheckbox(chb As CheckBox, DefaultImage As String, CheckImage As String, UncheckImage As String, DisabelImage As String)
'   Dim r As Reflector
'   Dim package As String
'   Dim idDefault, idChecked, idUnChecked ,idDisabel As Int
'   package = r.GetStaticField("anywheresoftware.b4a.BA", "packageName")
'   idDefault = r.GetStaticField(package & ".R$drawable", DefaultImage)
'   idChecked = r.GetStaticField(package & ".R$drawable", CheckImage)
'   idUnChecked = r.GetStaticField(package & ".R$drawable", UncheckImage)
'   If DisabelImage <> "" Then idDisabel = r.GetStaticField(package & ".R$drawable", DisabelImage)
'   r.Target = r.GetContext
'   r.Target = r.RunMethod("getResources")
'   Dim sd As StateListDrawable
'   sd.Initialize
'   sd.AddState(sd.State_Checked, r.RunMethod2("getDrawable", idChecked, "java.lang.int"))
'   sd.AddState(sd.State_Unchecked, r.RunMethod2("getDrawable", idUnChecked, "java.lang.int"))
'   If DisabelImage <> "" Then sd.AddState(sd.State_Disabled, r.RunMethod2("getDrawable", idDisabel, "java.lang.int"))
'   sd.AddCatchAllState( r.RunMethod2("getDrawable", idDefault, "java.lang.int"))
'   chb.Background = sd
'End Sub
'
'DisabelImage can be empty string ("")
'Sub SetNinePatchEditText(EDT As EditText, DefaultImage As String, FocusedImage As String, DisabelImage As String)
'   Dim r As Reflector
'   Dim package As String
'   Dim idDefault, iddisabel, idFocused As Int
'   package = r.GetStaticField("anywheresoftware.b4a.BA", "packageName")
'   idDefault = r.GetStaticField(package & ".R$drawable", DefaultImage)
'   idFocused = r.GetStaticField(package & ".R$drawable", FocusedImage)
'   If DisabelImage <> "" Then iddisabel = r.GetStaticField(package & ".R$drawable", DisabelImage)
'   r.Target = r.GetContext
'   r.Target = r.RunMethod("getResources")
'   Dim sd As StateListDrawable
'   sd.Initialize
'   sd.AddState(sd.State_Focused, r.RunMethod2("getDrawable", idFocused, "java.lang.int"))
'   If DisabelImage <> "" Then sd.AddState(sd.State_Disabled, r.RunMethod2("getDrawable", iddisabel, "java.lang.int"))
'   sd.AddCatchAllState( r.RunMethod2("getDrawable", idDefault, "java.lang.int"))
'   EDT.Background = sd
'End Sub

''PressedImage, FocusedImage, CeckImage, UncheckImage, SelectedImage and DisabelImage can be empty string ("")
'Sub SetNinePatchControl(Control As View, DefaultImage As String, PressedImage As String, FocusedImage As String, CheckImage As String, UncheckImage As String, SelectedImage As String, DisabelImage As String)
'	Dim r As Reflector
'	Dim package As String
'	Dim idDefault, idDisabel, idFocused, idChecked, idUnChecked, idPressed, idSelected As Int
'	package = r.GetStaticField("anywheresoftware.b4a.BA", "packageName")
'	idDefault = r.GetStaticField(package & ".R$drawable", DefaultImage)
'	If PressedImage <> "" Then idPressed = r.GetStaticField(package & ".R$drawable", PressedImage)
'	If DisabelImage <> "" Then idDisabel = r.GetStaticField(package & ".R$drawable", DisabelImage)
'	If CheckImage <> "" Then idChecked = r.GetStaticField(package & ".R$drawable", CheckImage)
'	If UncheckImage <> "" Then idUnChecked = r.GetStaticField(package & ".R$drawable", UncheckImage)
'	If FocusedImage <> "" Then idFocused = r.GetStaticField(package & ".R$drawable", FocusedImage)
'	If SelectedImage <> "" Then idSelected = r.GetStaticField(package & ".R$drawable", SelectedImage)
'	r.Target = r.GetContext
'	r.Target = r.RunMethod("getResources")
'	Dim sd As StateListDrawable
'	sd.Initialize
'	If PressedImage <> "" Then sd.AddState(sd.State_Pressed, r.RunMethod2("getDrawable", idPressed, "java.lang.int"))
'	If DisabelImage <> "" Then sd.AddState(sd.State_Disabled, r.RunMethod2("getDrawable", idDisabel, "java.lang.int"))
'	If CheckImage <> "" Then sd.AddState(sd.State_Checked, r.RunMethod2("getDrawable", idChecked, "java.lang.int"))
'	If UncheckImage <> "" Then sd.AddState(sd.State_Unchecked, r.RunMethod2("getDrawable", idUnChecked, "java.lang.int"))
'	If FocusedImage <> "" Then sd.AddState(sd.State_Focused, r.RunMethod2("getDrawable", idFocused, "java.lang.int"))
'	If SelectedImage <> "" Then sd.AddState(sd.State_Selected, r.RunMethod2("getDrawable", idSelected, "java.lang.int"))
'	sd.AddCatchAllState( r.RunMethod2("getDrawable", idDefault, "java.lang.int"))
'	Control.Background = sd
'End Sub