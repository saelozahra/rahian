﻿B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=6.3
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
	#ExcludeFromLibrary: True
#End Region

Sub Process_Globals
	Public analytics As FirebaseAnalytics
End Sub

Sub Service_Create
	
	CallSubDelayed2(FirebaseMessaging, "SubscribeToTopics","general")
	
	analytics.Initialize
	
End Sub

Sub Service_Start (StartingIntent As Intent)

End Sub

Sub Service_Destroy

End Sub



'Return true to allow the OS default exceptions handler to handle the uncaught exception.
Sub Application_Error (Error As Exception, StackTrace As String) As Boolean
	Log("APP Error: " & Error.Message)
'	ToastMessageShow(Error.Message,True)
'	ToastMessageShow(Error.Message,True)
''	Msgbox(Error.Message,"Error")
	Return False
End Sub




