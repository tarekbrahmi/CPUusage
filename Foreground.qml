import QtQuick 2.10
import appDesign 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0

Item {
    id: root
    width: 454
    height: 440
    visible: true
    property alias currentFrame: timeline.currentFrame

    state: "Normal"

    signal clicked

    SpeedoMeter {
        id: speedoMeter
        width: 454
        height: 440
        anchors.leftMargin: 120
        anchors.topMargin: 111
        anchors.fill: parent

        MouseArea {
            id: mouseArea
            width: 454
            height: 440
            anchors.topMargin: 0
            anchors.fill: parent
        }
    }

    Connections {
        target: mouseArea
        onClicked: root.clicked()
    }

    Timeline {
        id: timeline

        endFrame: 2500
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: speedoMeter
            property: "x"
            Keyframe {
                value: 413
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 413
                frame: 1999
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: -118
                frame: 960
            }

            Keyframe {
                value: "413"
                frame: 2500
            }

            Keyframe {
                value: -118
                frame: 1017
            }

            Keyframe {
                value: -118
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speedoMeter
            property: "y"
            Keyframe {
                value: 180
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 180
                frame: 1999
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 476
                frame: 960
            }

            Keyframe {
                value: 180
                frame: 2500
            }

            Keyframe {
                value: 476
                frame: 1017
            }

            Keyframe {
                value: 476
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speedoMeter
            property: "scale"
            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 1
                frame: 1999
            }

            Keyframe {
                easing.bezierCurve: [0.39, 0.575, 0.565, 1, 1, 1]
                value: 0.45
                frame: 960
            }

            Keyframe {
                value: "1.4"
                frame: 2499
            }

            Keyframe {
                value: 0.45
                frame: 1017
            }

            Keyframe {
                value: 0.45
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speedoMeter
            property: "currentFrame"
            Keyframe {
                value: ""
                frame: 0
            }

            Keyframe {
                value: 1000
                frame: 928
            }

            Keyframe {
                value: 1000
                frame: 1085
            }

            Keyframe {
                value: 0
                frame: 1999
            }
        }
    }
}
