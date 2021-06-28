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
GetExplorerPath(hwnd=0){
	if(hwnd==0){
		explorerHwnd := WinActive("ahk_class CabinetWClass")
		if(explorerHwnd==0)
			explorerHwnd := WinExist("ahk_class CabinetWClass")
	}
	else
		explorerHwnd := WinExist("ahk_class CabinetWClass ahk_id " . hwnd)
	
	if (explorerHwnd){
		for window in ComObjCreate("Shell.Application").Windows{
			try{
				if (window && window.hwnd && window.hwnd==explorerHwnd)
					return window.Document.Folder.Self.Path
			}
		}
	}
	return false
}
