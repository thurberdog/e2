import QtQuick 2.0
import QtWebSockets 1.0
import Exercises.actions 1.0
import Exercises.constants 1.0


WebSocket {
    id: socket
    signal websocketReady()

    url: "ws://localhost:8000"
    onTextMessageReceived: {
        var data = JSON.parse(message);
        switch (data.type) {
        case Constants.getWorkouts:
            break;
        case Constants.getWorkout:
            AppActions.workoutRecieved(data.payload);
            break;
        case Constants.workoutStarted:
            break;
        case Constants.workoutEnded:
            break;
        case Constants.setStarted:
            break;
        case Constants.setEnded:
            break;
        case Constants.repStarted:
            break;
        case Constants.repEnded:
            AppActions.incCounter(1);
            break;
        case Constants.repStatusChanged:
            break;
        case Constants.stationInUse:
            break;
        case Constants.stationNotInUse:
            break;
        case Constants.heartRateChanged:
            break;
        case Constants.resistanceChanged:
            break;
        default:
        }
    }
    onStatusChanged: function () {
        if (socket.status == WebSocket.Error) {
             console.log("Error: " + socket.errorString)
         } else if (socket.status == WebSocket.Open) {
            socket.websocketReady();
             // socket.sendTextMessage("{ \"type\": 1 }")
         } else if (socket.status == WebSocket.Closed) {
             console.log('Socket Connection Ended')
         }
    }
    active: true
}
