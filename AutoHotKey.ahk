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
	
	!^v::
		WinActivate, ahk_exe outlook.exe
	Return

	
	!^c::
		WinActivate, ahk_exe onenote.exe
	Return

	!^x::
		WinActivate, ahk_exe webstorm64.exe
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

