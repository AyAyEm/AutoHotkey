; No double middle click
#SingleInstance, force
MButtonNoDoubleClick(timeSinceHotkey) {
    if (timeSinceHotkey > 200 or timeSinceHotkey = -1) {
        send {MButton}
        return
    }
    Return
}