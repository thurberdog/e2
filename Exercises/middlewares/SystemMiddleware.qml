import QtQuick 2.7
import QuickFlux 1.1
import "../actions"
import "../constants"

Middleware {

    property var mainWindow: null
    property var socket: null

    function dispatch(type, message) {

        switch (type) {
        case ActionTypes.startApp:
            mainWindow.visible = true;
            next(type, message);
            break;
        case ActionTypes.quitApp:
            Qt.quit();
            break;
        case ActionTypes.fetchWorkouts:
            socket.sendMessage(Constants.getWorkouts);
            break;
        case ActionTypes.fetchWorkout:
            socket.sendMessage(Constants.getWorkout, 6, { });
            break;
        default:
            next(type, message);
            break;
        }
    }

}

