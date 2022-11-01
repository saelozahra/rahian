B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=6.3
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: True
#End Region

Sub Process_Globals
	Dim no As Notification
End Sub
Sub Service_Create


End Sub

Sub Service_Start (StartingIntent As Intent)
	StartServiceAt("timerMod", DateTime.Now+(60*1000), True)    'دستور تکرار سرویس
	
	If File.Exists(library.dir,"start") Then
		If File.ReadString(library.dir,"start") = 1 Then
			chk
		End If
	End If
	
End Sub

Sub Service_Destroy

End Sub


Sub chk

Dim timeNow,time As String
	
	Dim mt As KJ_MaterialToast
	
	timeNow = (DateTime.GetHour(DateTime.Now)*60)+DateTime.GetMinute(DateTime.Now)
	time=File.ReadString(library.dir,"time")

	If File.ReadString(library.dir,"start") = 1 Then
		If timeNow=time Then
		'aaa
			no.Initialize
			no.Icon="icon"
			no.Sound=True
			no.OnGoingEvent=False 'کاربر بتونه کنسلش کنه
			no.AutoCancel=True
			no.Vibrate=True
			no.Light=False
			no.SetInfo(" دعای خیر ماها بدرقه رزمنده ها" ," رزمنده ها منتظر دعای خیر شما هستن ... ",doa)
			no.Notify(1)
			
		Else If timeNow="780" Then
			mt.Initialize("یادمون نره برا رزمنده های اسلام دعا کنیم",mt.LENGTH_LONG,mt.TYPE_INFO)
		Else If timeNow="1080" Then
			mt.Initialize("شادی روح شهدای مدافع حرم صلوات",mt.LENGTH_LONG,mt.TYPE_INFO)
		Else If timeNow="600" Then
			mt.Initialize("یادمون نره برا رزمنده های اسلام دعا کنیم",mt.LENGTH_LONG,mt.TYPE_INFO)
		End If
	End If	
	
End Sub
