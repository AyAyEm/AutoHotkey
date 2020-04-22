#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Timer looper
class timerLooper {
    __New() {
        this.timer := ObjBindMethod(this, "sendingTheKeys")
    }
    Start(action, sleepTime) {
        this.action := action
        timer := this.timer
        send,% action
        SetTimer,% timer,% sleepTime
    }
    Stop() {
        timer := this.timer
        SetTimer,% timer, Delete
    }
    
    sendingTheKeys() {
        send,% this.action
    }
}

; Looper with a key v2
global operationInfo := {}
loopWithSameKey(operationId, action, sleepTime) {
    if (operationInfo[(operationId)].runningInfo = "") {
        operationInfo[(operationId)] := { runningInfo: 0, looper: new timerLooper}
    }
    operation := operationInfo[(operationId)]
    if (operation.runningInfo = 0) {
        operation.runningInfo := 1
        operation.looper.Start(action, sleepTime)
    } else if (operation.runningInfo = 1) {
        operation.runningInfo := 0
        operation.looper.Stop()
    } else {
        return
    } 
}

; Google Search highlighted text
googleSearch()
{
    Send, ^c
    Sleep 50
    Run, http://www.google.com/search?q=%clipboard%
    Return
}

; Open cmd in a custom directory that's selected
cmdOpenerInSelection()
{ 
    Send, ^c
    Sleep 50
    Run, cmd.exe, %clipboard%
    Return
}

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
