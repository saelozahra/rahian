Type=StaticCode
Version=6
ModulesStructureVersion=1
B4A=true
@EndOfDesignText@
Sub Process_Globals
	Dim dir As String = File.DirDefaultExternal '& "rahian"
	Dim mjfont As Typeface=Typeface.LoadFromAssets("mj_two.ttf")
	Dim font As Typeface=Typeface.LoadFromAssets("Shabnam.ttf")
	Dim selectedcat As String
	Dim site_url As String = "http://rahpouyan.ir"
	Dim selectedContent As Int
	Dim color,colorDark As Int
End Sub




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
'
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
''DisabelImage can be empty string ("")
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
'
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