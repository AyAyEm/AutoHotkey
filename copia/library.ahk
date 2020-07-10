#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%

; Looper with a key
/*
global RunLooperOfSingleKey := 0
loopWithSameKey(action, sleepTime) {
    if (RunLooperOfSingleKey = 2)
        return
    if (RunLooperOfSingleKey = 1)
    {
        RunLooperOfSingleKey := 2
        return
    }
    RunLooperOfSingleKey := 1
    i := 0
    Loop
    { 
        if (RunLooperOfSingleKey > 1 )
            break
        if (i >= sleepTime || i = 0) {
            send, %action%
            i := 0
        }
        sleep, 100
        i := i + 100
        
    }
    RunLooperOfSingleKey := 0
    return
}
*/

; Looper with a key v2
global operationInfo := {}
class senderLoop {
    __New() {
        this.timer := ObjBindMethod(this, "sendingTheKeys")
        this.action := 0
    }
    Start(action, sleepTime) {
        this.action := action
        send,% action
        timer := this.timer
        SetTimer,% timer,% sleepTime
    }
    Stop() {
        timer := this.timer
        SetTimer,% timer, Delete
    }
    sendingTheKeys() {
        send,% 4
    }
}

;global loopRunner := new senderLoop
loopWithSameKey(operationId, action, sleepTime) {
    if (operationInfo[(operationId)].runningInfo = "") {
        looperName := "looper" . operationId
        global (%looperName%) := new senderLoop
        operationInfo := { (operationId): { runningInfo: 0, looperName: (%looperName%)}}
        send,% 0
    }
    if (operationInfo[(operationId)].runningInfo = 0) {
        operationInfo := { (operationId): { runningInfo: 1 }}
        send, 1
        (%looperName%).Start(action, sleepTime)
    } else if (operationInfo[(operationId)].runningInfo = 1) {
        operationInfo := { (operationId): { runningInfo: 0 }}
        send, 2
        (%looperName%).Stop()
    } else {
        send, 3
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