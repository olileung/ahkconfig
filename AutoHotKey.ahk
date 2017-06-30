; ************************************************************************************
; * VARIABLES
; ************************************************************************************
	deviceID = 1474-6390-A3DB-2E5B-5D3E-C26F-4D65-9A59


; ************************************************************************************
; * OPEN SOCIALSAFE DIRS
; ************************************************************************************
	!^Q::Run explorer.exe C:\Users\Oli\AppData\Roaming\me.digi.dev
	!^A::Run explorer.exe C:\Users\Oli\AppData\Roaming\me.digi
	!^Z::Run explorer.exe C:\Users\Oli\Adobe Flash Builder 4.5\SocialSafe (trunk)

	
	
; ************************************************************************************
; * LAUNCH SOCIALSAFE LANG PACK EXCEL
; ************************************************************************************
	!^L::Run C:\Users\Oli\Adobe Flash Builder 4.5\ibundle_lang\trunk\language-document.xlsm

	
	
; ************************************************************************************
; * LAUNCH SOCIALSAFE INSTALLED
; ************************************************************************************
	!^1::Run "C:\Program Files (x86)\digi.me\digi.me.exe"

	
	
; ************************************************************************************
; * LAUNCH SOCIALSAFE INSTALLED DEV
; ************************************************************************************
	!^2::Run "C:\Program Files (x86)\digi.meDev\digi.meDev.exe"

	
	
; ************************************************************************************
; * EMPTY RECYCLE BIN
; ************************************************************************************
	!^T::Run C:\Users\Oli\Desktop\Programs\nircmd-x64\nircmd.exe emptybin

	
	
; ************************************************************************************
; * SHOW COMMIT DIALOG
; ************************************************************************************
	!^C::Run TortoiseProc.exe /command:commit /path:"C:\Users\Oli\Adobe Flash Builder 4.5\SocialSafe (trunk)"
	;!^C::Run TortoiseProc.exe /command:commit /path:"C:\Users\Oli\Adobe Flash Builder 4.5\SocialSafe [do not modify]"
	!^D::Run TortoiseProc.exe /command:commit /path:"C:\Users\Oli\Adobe Flash Builder 4.5\ibundle_socialsafe (trunk2)"

	
	
; ************************************************************************************
; * CLOSE PROGRAMS
; ************************************************************************************
	!^G::
		Process, Close, SocialSafe.exe
		Process, Close, SQLiteExpertPers64.exe
		Process, Close, SocialSafe.exe
		Process, Close, adl.exe
		Process, Close, Dev.digi.me.exe
		Process, Close, Dev.digi.me.Helper.exe
		Process, Close, digi.me.exe
		Process, Close, digi.me.Helper.exe
		MsgBox, 4144, Closed Programs, - adl.exe\n- Sql lite expert personal\n- digi.me helpers (inc dev), 0.25
	return
	
	;; close on 'Esc'
	;~Escape::
	;  ;If (A_ThisHotkey=A_PriorHotkey && A_TimeSincePriorHotkey<250)
	;	Send !{F4}
	;return


; ************************************************************************************
; * DELETE DEV LOCAL
; * (and call to replace device)
; ************************************************************************************
	!^W::
		MsgBox, 4, Remove Local Store & Reset Device, Remove (Dev) Local Store and Reset, 3
		IfMsgBox No
			return

		; todo - output replacement deviceid to popup
		Process, Close, SocialSafe.exe
		Process, Close, adl.exe
		Process, Close, Dev.digi.me.exe
		Process, Close, Dev.digi.me.Helper.exe
		Process, Close, Dev.SocialSafe.Helper.exe
		Process, Close, SQLiteExpertPers.exe
		Process, Close, SQLiteExpertPers64.exe
		FileRemoveDir, C:\Users\Oli\AppData\Roaming\me.digi.dev\Local Store, 1
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\hosts-dev.db
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\digi.me.hosts-dev.db
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\application.log
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\application_ERROR.log
		
		UrlDownloadToFile, https://dev-device.digi.me/device/ReplaceDeviceID?deviceid=%deviceID%, C:\Users\Oli\Desktop\replaced_device_id_dev.txt
		FileDelete C:\Users\Oli\Desktop\replaced_device_id_dev.txt
		MsgBox, 48, Removed, Removed (Dev) Local Store, 0.25
	return



; ************************************************************************************
; * DELETE DEV LOCAL
; * (just remove the local store etc, device kept on the server)
; ************************************************************************************
	+!^W::
		MsgBox, 4, Remove Local Store?, Remove (Dev) Local Store [Keep deviceID (%deviceID%)], 3
		IfMsgBox No
			return		
		Process, Close, adl.exe
		Process, Close, Dev.digi.me.exe
		Process, Close, Dev.digi.me.Helper.exe
		Process, Close, Dev.SocialSafe.Helper.exe
		Process, Close, SQLiteExpertPers64.exe
		Process, Close, SQLiteExpertPers.exe
		FileRemoveDir, C:\Users\Oli\AppData\Roaming\me.digi.dev\Local Store, 1
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\hosts-dev.db
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\digi.me.hosts-dev.db
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\application.log
		FileDelete, C:\Users\Oli\AppData\Roaming\me.digi.dev\application_ERROR.log
		MsgBox, 48, Removed, Removed (Dev) Local Store, 0.25
	return



; ************************************************************************************
; * DELETE LIVE LOCAL
; ************************************************************************************
	!^S::
		MsgBox, 4, Removed, Remove (Live) Local Store?, 3
		IfMsgBox No
			return

		Process, Close, SocialSafe.exe
		Process, Close, SocialSafe.Helper.exe
		Process, Close, digi.me.exe
		Process, Close, digi.me.Helper.exe
		Process, Close, SQLiteExpertPers64.exe
		Process, Close, SQLiteExpertPers.exe
		FileRemoveDir, C:\Users\Oli\AppData\Roaming\me.digi\Local Store, 1
		
		UrlDownloadToFile, https://device.digi.me/device/ReplaceDeviceID?deviceid=%deviceID%, C:\Users\Oli\Desktop\replaced_device_id_dev.txt
		FileDelete C:\Users\Oli\Desktop\replaced_device_id_dev.txt
		MsgBox, 48, Removed, Removed (Live) Local Store, 0.25
	return


; f4 override
	F4::Send, {alt down}{F4}{alt up}

; ************************************************************************************
; * MEDIA COMMANDS	
; * FYI http://www.autohotkey.com/docs/commands/Send.htm
; ************************************************************************************
	+^z::Send,{Media_Prev}
	+^x::
		Send,{Media_Play_Pause}
		;Send {Volume_Mute}
	return
	
	+^c::Send,{Media_Next}
	+^v::winactivate, ahk_class SpotifyMainWindow

	
	
; ************************************************************************************
; * ACTIVATE SKYPE
; ************************************************************************************
	!^v::
		WinActivate, ahk_exe Skype.exe
	Return

	
	
; ************************************************************************************
; * ADJUST VOLUME
; ************************************************************************************
	+^q::
		Send {Volume_Up}
	Return
	+^a::
		Send {Volume_Down}
	Return
	
; ************************************************************************************
; * ACTIVATE SLACK
; ************************************************************************************
	!^b::
		WinActivate, ahk_exe Slack.exe
	Return

; ************************************************************************************
; * STRING UTILS
; * http://www.autohotkey.com/board/topic/24431-convert-text-uppercase-lowercase-capitalized-or-inverted/
; *
; * (See functions below)
; ************************************************************************************


; ************************************************************************************
; * CONVERT TEXT TO UPPER
; ************************************************************************************
	+^u::
		StringUpper Clipboard, Clipboard
		Send %Clipboard%
	Return



; ************************************************************************************
; * CONVERT TEXT TO LOWER
; ************************************************************************************
	+^l::
		StringLower Clipboard, Clipboard
		Send %Clipboard%
	RETURN



; ************************************************************************************
; * CONVERT TEXT TO __CLIPBOARD
; ************************************************************************************
	+^s::
		Send __%Clipboard%
	RETURN



; ************************************************************************************
; * EXPERIMENTAL STUFF...
; ************************************************************************************
; +^k::
;  StringUpper Clipboard, Clipboard, T
;  Send %Clipboard%
; RETURN
;
; ^k::
;  Lab_Invert_Char_Out:= ""
;  Loop % Strlen(Clipboard) {
;     Lab_Invert_Char:= Substr(Clipboard, A_Index, 1)
;     if Lab_Invert_Char is upper
;        Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) + 32)
;     else if Lab_Invert_Char is lower
;        Lab_Invert_Char_Out:= Lab_Invert_Char_Out Chr(Asc(Lab_Invert_Char) - 32)
;     else
;        Lab_Invert_Char_Out:= Lab_Invert_Char_Out Lab_Invert_Char
;  }
;  Send %Lab_Invert_Char_Out%
; RETURN

