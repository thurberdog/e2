import QtQuick 2.0

Item {
    id: component
    width: 80
    height: 40
    property string title: ""
    property bool isCompleted: false
    property bool isInProgress: false
    property int counter: 0
    property int resistance: 0

    Rectangle {
        width: 4
        height: parent.height
        color: isCompleted ? "#da82ff" : (isInProgress ? "#019abd" : "#e5e5e5")
        anchors.right: parent.right
    }

    Column {
        spacing: 10

        Text {
            font.capitalization: Font.AllUppercase
            text: component.title
            color: isCompleted ? "#da82ff" : (isInProgress ? "#019abd" : "#e5e5e5")
        }

        Text {
            text: component.isCompleted ? "%1 lb x %2 ".arg(resistance).arg(counter) : ""
            color: "white"
        }

    }

}
