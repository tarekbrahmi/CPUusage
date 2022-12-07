
import QtQuick 2.10
import appDesign 1.0
import QtQuick.Studio.Components 1.0

Rectangle {
    id: circle
    width: 16
    height: 16
    radius: 8
    states: [
        State {
            name: "checked"
            when: circle.checked
        },
        State {
            name: "unchecked"
            when: !circle.checked

            PropertyChanges {
                target: gradientStop
                color: "#808080"
            }

            PropertyChanges {
                target: gradientStop1
                color: "#808080"
            }
        }
    ]
    property bool checked: false
    gradient: Gradient {
        GradientStop {
            id: gradientStop
            position: 0
            color: "#cc9320"
        }

        GradientStop {
            id: gradientStop1
            position: 1
            color: "#f6de1b"
        }
    }
}
