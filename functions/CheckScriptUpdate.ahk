; Check if the script is changed and reload
CheckScriptUpdate() {
    global ScriptStartModTime
    FileGetTime curModTime, %A_ScriptFullPath%
    If (curModTime <> ScriptStartModTime) {
        SetTimer CheckScriptUpdate, Off
        Loop
        {
            reload
            Sleep 300 ; ms
            MsgBox 0x2, %A_ScriptName%, Reload failed. ; 0x2 = Abort/Retry/Ignore
            IfMsgBox Abort
            ExitApp
            IfMsgBox Ignore
            break
        } ; loops reload on "Retry"
    }
}