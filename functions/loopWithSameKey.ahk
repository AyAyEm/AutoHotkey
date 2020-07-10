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