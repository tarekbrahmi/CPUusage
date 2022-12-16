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
            name: "default"
            when: charging==="default"
        },
        State {
            name: "yellow"
            when: charging==="yellow"
            PropertyChanges {
                target: gradientStop
                color: "#cc9320"
            }

            PropertyChanges {
                target: gradientStop1
                color: "#f6de1b"
            }
        },
        State {
            name: "green"
            when: charging==="green"
            PropertyChanges {
                target: gradientStop
                color: "#0e5d14"
            }

            PropertyChanges {
                target: gradientStop1
                color: "#3e935e"
            }
        },
        State {
            name: "red"
            when: charging==="red"
            PropertyChanges {
                target: gradientStop
                color: "#630000"
            }

            PropertyChanges {
                target: gradientStop1
                color: "#A1001B"
            }
        }
    ]
    property string charging: "defualt"
    gradient: Gradient {
        GradientStop {
            id: gradientStop
            position: 0
            color: "#808080"
        }
        GradientStop {
            id: gradientStop1
            position: 1
            color: "#808080"
        }
    }
}
