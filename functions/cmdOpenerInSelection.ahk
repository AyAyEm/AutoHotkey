; Open cmd in a custom directory that's selected
cmdOpener()
{
    Path := GetActiveExplorerPath()
    key := % SubStr(A_ThisHotkey, 0)
    Sleep, 200
    if (GetKeyState(key, "P")) 
        try Run *RunAs cmd.exe, %Path% Catch {}
    else run, cmd.exe, %Path% 
    Return
}