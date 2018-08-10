import QtQuick 2.6
import QtQuick.Controls 2.1
import Exercises.stores 1.0
import Exercises.actions 1.0

Item {
    width: 320
    height: 320

    Column {
        spacing: 10

        Rectangle {
            width: parent.width
            height: width
            radius: width / 2
            color: "transparent"
            border.color: "#019abd"
            anchors.horizontalCenter: parent.horizontalCenter

            Text {
                id: repoCounter
                color: "white"
                anchors.centerIn: parent
                font.pixelSize: 48
                text: MainStore.displayCounter
            }

            Text {
                color: "white"
                text: "REPS"
                anchors.top: repoCounter.bottom
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        Row {
            spacing: 6
            anchors.horizontalCenter: parent.horizontalCenter

            BasicButton {
                text: "-"

                onClicked: {
                    AppActions.incResistance(-1);
                }

            }

            Text {
                text: MainStore.displayResistance
                color: "white"
                height: 30
            }

            BasicButton {
                text: "+"

                onClicked: {
                    AppActions.incResistance(+1);
                }
            }
        }



        BasicButton {
            text: "Next"
            anchors.horizontalCenter: parent.horizontalCenter

            onClicked: {
                AppActions.next();
            }
        }

    }


}
