braveOpen() {
    if not WinExist("ahk_exe brave.exe") {
        run %USERPROFILE%\scoop\apps\brave\current\brave.exe --user-data-dir="E:\browsers\brave\userdata"
    }
}
braveQuit() {
    If WinActive("ahk_exe brave.exe") {
        MouseGetPos, mouseX, mouseY
        MouseMove, 1345, 55
        MouseClick
        MouseMove, 1220, 640
        Sleep, 5
        MouseClick
        MouseMove, mouseX, mouseY
    }
}