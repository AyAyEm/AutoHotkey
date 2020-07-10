braveOpen() {
    if not WinExist("ahk_exe brave.exe") {
        run brave.exe, "C:\Program Files (x86)\BraveSoftware\Brave-Browser\Application"
    }
}
braveQuit() {
    If WinActive("ahk_exe brave.exe") {
        MouseGetPos, mouseX, mouseY
        MouseMove, 1345, 55
        MouseClick
        MouseMove, 1220, 625
        Sleep, 5
        MouseClick
        MouseMove, mouseX, mouseY
    }
}