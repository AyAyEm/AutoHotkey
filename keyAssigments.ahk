#SingleInstance, Force
#Include, library.ahk
SendMode Input
SetWorkingDir, %A_ScriptDir%
FileGetTime ScriptStartModTime, %A_ScriptFullPath%
SetTimer CheckScriptUpdate, 1000, 0x7FFFFFFF ; 100 ms, highest priority

;function callers
!+s::googleSearch()
!+r::cmdOpenerInSelection()

;simple commands
+!d::Run "E:\"
^!p::Run "C:\Program Files (x86)"
^!+p::Run "C:\Program Files"
^!r::Reload

#MaxThreadsPerHotkey 255
^!Numpad1::loopWithSameKey(1, 4, 1000)
^!Numpad2::loopWithSameKey(2, 5, 1000)
#IfWinActive ahk_exe Warframe.x64.exe
^!Numpad1::loopWithSameKey(1, 4, 1000)
^!Numpad2::loopWithSameKey(2, 4, 1000)
^!Numpad3::loopWithSameKey(3, 4, 1000)
^!Numpad4::loopWithSameKey(4, 4, 1000)
^!Numpad5::loopWithSameKey(5, 4, 1000)
^!Numpad6::loopWithSameKey(6, 4, 1000)
#MaxThreadsPerHotkey 1
