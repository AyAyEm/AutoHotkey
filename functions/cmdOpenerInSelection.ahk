; Open cmd in a custom directory that's selected
cmdOpener()
{
    command := "wt.exe"
    if WinActive("ahk_exe Explorer.exe")
    {
        command := "wt.exe -d" GetExplorerPath()
    }
    key := % SubStr(A_ThisHotkey, 0)
    Sleep, 200
    if (GetKeyState(key, "P"))
    {
        try { 
            Run *RunAs %command% 
        } Catch {}
    }
    else
    {
        run %command%
    }
    Return
}