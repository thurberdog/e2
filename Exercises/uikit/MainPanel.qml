import QtQuick 2.0
import Exercises.stores 1.0
import Exercises.actions 1.0

FocusScope {
    width: 640
    height: 480
    focus: true

    Rectangle {
        visible: !MainStore.isFinished
        color: "black"
        anchors.fill: parent

        Item {
            width: parent.width

            height: 40
            Text {
                text: MainStore.displayTitle
                anchors.centerIn: parent
                color: "white"
                font.capitalization: Font.AllUppercase
            }
        }

        ListView {
            id: listView
            width: 120
            spacing: 10
            anchors {
                right: parent.right
                bottom: parent.bottom
                top: parent.top
                rightMargin: 20
                topMargin:  40
            }

            model: MainStore.exercises
            delegate: WorkoutItem {
                width: listView.width
                title: model.name
                isCompleted: model.isCompleted
                isInProgress: model.isInProgress
                counter: model.counter
                resistance: model.resistance
            }
        }


        RepoCounter {
            y: 40
            x: 20
        }
    }

    Rectangle {
        color: "black"
        anchors.fill: parent
        visible: MainStore.isFinished

        Text {
            anchors.centerIn: parent
            text: MainStore.totalFinishedCounter
            font.pixelSize: 80
            color: "white"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                AppActions.restartWorkout();
            }
        }
    }

    Keys.onPressed: {
        if (event.key === Qt.Key_R) {
            AppActions.incCounter(1);
        } else if (event.key === Qt.Key_N) {
            AppActions.next();
        }
    }

}
