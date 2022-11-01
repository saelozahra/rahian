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
	Dim PageNumber As Int
	
	Dim paragraph As String
	
	Dim paracount As Int : paracount = 8
	Dim LeftMargin As Int : LeftMargin = 12dip
	Dim TopMargin As Int : TopMargin = 12dip
	Dim LineSpacing As Int : LineSpacing = 1.2
End Sub

Sub Globals
	Dim PageTurner As PageTurnView
	Dim Pager As TextPaginator
	Dim Font As Typeface
End Sub

Sub Activity_Create(FirstTime As Boolean)
	
	paragraph = File.ReadString(File.DirAssets,"about.txt")
	PageTurner.Initialize("PageTurner", 20)
	Activity.AddView(PageTurner, 0, 0 , 100%x , 100%y)
	
	If Activity.Width > Activity.Height Then
		PageTurner.TwoPages = True ' the default is False
		PageTurner.RenderLeftPage = True ' the default is True
		Pager.SetPageParameters(Pager.ALIGN_NORMAL , PageTurner.Width/2 - 12dip, LeftMargin, PageTurner.Height - 12dip, TopMargin, LineSpacing)
		PageTurner.SetMarginPixels(6dip, 6dip, 6dip, 6dip)
	Else	
		PageTurner.TwoPages = False 
		PageTurner.RenderLeftPage = False
		Pager.SetPageParameters(Pager.ALIGN_CENTER, PageTurner.Width - 20dip, LeftMargin, PageTurner.Height - 20dip, TopMargin, LineSpacing)
		PageTurner.SetMarginPixels(10dip, 10dip, 10dip, 10dip)
	End If
	PageTurner.AllowLastPageCurl = False ' the default is true	
	
	Font = Font.CreateNew(library.font , Typeface.STYLE_NORMAL)
	Dim text As String
	For i = 0 To paracount - 1
		text = text & paragraph & CRLF & CRLF
	Next
	Pager.SetPaintParameters(Font , 20 , Colors.White, True)
	Pager.Paginate(text)
	
	library.SetStatusBarColor(library.colorDark)
	
	
End Sub

Sub Activity_Resume
	PageTurner.CurrentPage = PageNumber
	PageTurner.Color = Colors.LightGray ' otherwise it gets lost on Pause and Resume without a Create
	PageTurner.OnResume
End Sub

Sub Activity_Pause (UserClosed As Boolean)
	PageNumber = PageTurner.CurrentPage
	PageTurner.OnPause
End Sub

'Sub ShowPTError(title As String, msg As String)
'	Msgbox(msg, title)
'End Sub


Sub PageTurner_GetBitmap(Width As Int, Height As Int, Page As Int) As Bitmap 
	Dim bmp As Bitmap
	Dim cnv As Canvas
	bmp.InitializeMutable(Width, Height) 
	Try	
		
		If Page = 0 Then	
			cnv.Initialize2(bmp)
			cnv.DrawColor(library.colorDark)
			cnv.DrawText( " بسم رب الشهدا و الصدیقین " , Width/2, 100dip, library.mjfont, 24, Colors.White, "CENTER")
			Return bmp
		Else If Page = Pager.PageCount + 1 Then	
			cnv.Initialize2(bmp)
			cnv.DrawColor(Colors.DarkGray)
			cnv.DrawText( "یا زهرا س", Width/2, 100dip, library.mjfont , 24 , Colors.White, "CENTER")
			Return bmp
		Else
			Return Pager.GetPageBitmap(Page - 1, 0xFF014D7F)
		End If	
	Catch
		
		PTException
	End Try	
	Return bmp 
End Sub 

Sub PageTurner_GetPages() As Int 
	Try
		Return Pager.PageCount + 2
	Catch
		Return 0 
	End Try 
End Sub

Sub PTException()
	Dim Ex As ExceptionEx
	Dim where As String
	Ex = LastException
	Dim args(2) As Object
	args(0) = LastException.Message
	where = Ex.StackTraceElement(2) 
	args(1) = where	
	PageTurner.RunOnGuiThread("ShowPTError", args)
End Sub


Sub bb_Click
	Activity.Finish
End Sub