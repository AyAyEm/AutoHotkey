#Include, functions/lib.ahk
#Include, libTypeFunc.ahk
#Include, dumbFixes.ahk

; Timer looper
class timerLooper {
    __New() {
        this.timer := ObjBindMethod(this, "sendingTheKeys")
    }
    Start(action, sleepTime) {
        if (action = Click) {
            this.timer := ObjBindMethod(this, "mouseClicker")
        } else {
            send,% action
        }
        timer := this.timer
        this.action := action
        SetTimer,% timer,% sleepTime
    }
    Stop() {
        timer := this.timer
        SetTimer,% timer, Delete
    }
    mouseClicker() {
        send, {Click}
    }
    sendingTheKeys() {
        send,% this.action
    }
}

; Get windows explorer path
GetActiveExplorerPath()
{
	explorerHwnd := WinActive("ahk_class CabinetWClass")
	if (explorerHwnd)
	{
		for window in ComObjCreate("Shell.Application").Windows
		{
			if (window.hwnd==explorerHwnd)
			{
				return window.Document.Folder.Self.Path
			}
		}
	}
}