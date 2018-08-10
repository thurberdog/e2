import QtQuick 2.4
import QtQuick.Controls 1.0
import QtQuick.Controls.Styles 1.0

Item {
    id: basicButton

    property alias text: buttonText.text

    signal clicked

    implicitWidth: buttonText.implicitWidth + 25
    implicitHeight: buttonText.implicitHeight + 10

    Button {
        id: buttonText
        width: parent.width
        height: parent.height

        style: ButtonStyle {
            label: Component {
                Text {
                    text: buttonText.text
                    color: "white"
                    clip: true
                    wrapMode: Text.WordWrap
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    anchors.fill: parent
                }
            }

            background: Rectangle {
                opacity: 1
                color: "transparent"
                border.color: "white"
                border.width: 1
                radius: 2
            }
        }

        onClicked: basicButton.clicked()
    }
}
