directoryOpener() {
    Path := GetExplorerPath()
    explorerpath := "explorer /e," Path
    key := % SubStr(A_ThisHotkey, 0)
    Sleep, 200
    if (GetKeyState(key, "P")) {
         run, %explorerpath%
    } else run "E:\"
    Return
}