#SingleInstance, Force
#Include, library.ahk

SendMode Input
SetWorkingDir, %A_ScriptDir%
FileGetTime ScriptStartModTime, %A_ScriptFullPath%
SetTimer CheckScriptUpdate, 1000, 0x7FFFFFFF ; 100 ms, highest priority

GroupAdd, windowBlacklist, ahk_exe Code.exe

#IfWinNotActive ahk_group windowBlacklist
;function callers
!+s::googleSearch()
!+r::cmdOpener()

;simple commands
+!d::directoryOpener()
^!p::Run "C:\Program Files (x86)"
^!+p::Run "C:\Program Files"
^!r::Reload

; Brave browser
#if not WinActive("ahk_group windowBlacklist") or WinActive("ahk_exe brave.exe")
+^!b::braveOpen()
#IfWinActive, ahk_exe brave.exe
^b::braveQuit()

#MaxThreadsPerHotkey 255
^!Numpad1::loopWithSameKey(1, Click, 50)
#IfWinActive ahk_exe Warframe.x64.exe
^!Numpad1::loopWithSameKey(1, 2, 500)
^!Numpad2::loopWithSameKey(2, 1, 300)
^!Numpad3::loopWithSameKey(3, 4, 15000)
^!Numpad4::loopWithSameKey(4, 4, 30000)
^!Numpad5::loopWithSameKey(5, 4, 11000)
^!Numpad6::loopWithSameKey(6, 4, 1000)
#MaxThreadsPerHotkey 1