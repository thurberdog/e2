import QtQuick 2.3
import QtQuick.Window 2.2
import QtMultimedia 5.5
import QtQuick.Controls 1.4
import Exercises.constants 1.0
import Exercises.actions 1.0
import Exercises.stores 1.0
import Exercises.middlewares 1.0
import Exercises.uikit 1.0
import QtWebSockets 1.0


import QuickFlux 1.1

Window {
    id: mainWindow
    visible: false
    width: 480
    height: 640

    MiddlewareList {
        applyTarget: AppDispatcher
        SystemMiddleware {
            mainWindow: mainWindow
            socket: webSocket
        }
    }

    WebSockets {
        id: webSocket
        onWebsocketReady: {
            AppActions.fetchWorkout();
        }

        function sendMessage (type, id, payload) {
            console.log('SEND MESSAGE CALLED');
            if (status === WebSocket.Open) {
                webSocket.sendTextMessage(JSON.stringify({type: type, id: id, payload: payload}));
            }
        }
    }

    MainPanel {
        anchors.fill: parent


    }
    Component.onCompleted: {

//            websocket.sendTextMessage(JSON.stringify({type: 1}))
        console.log(webSocket)
    }
}
