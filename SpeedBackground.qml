
import QtQuick 2.10
import appDesign 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import AppData 1.0

Item {
    id: element
    width: 454
    height: 440
    property alias dot01: dot01
    property alias text50Percent: text50Percent
    property alias currentFrame: timeline.currentFrame

    ArcItem {
        id: arcRight
        x: 36
        y: 37
        width: 360
        height: 360
        visible: true
        antialiasing: true
        end: 262
        capStyle: 32
        strokeColor: "#6d6d6d"
        strokeWidth: 14
        begin: 98
    }

    ArcItem {
        id: arcLeft
        x: 42
        y: 37
        width: 360
        height: 360
        antialiasing: true
        strokeColor: "#6d6d6d"
        strokeWidth: 14
        end: 82
        begin: -82
        capStyle: 32
    }

    Item {
        id: details
        anchors.fill: parent

        ArcItem {
            id: arc
            x: 29
            y: 27
            width: 380
            height: 380
            antialiasing: true
            strokeWidth: 2
            begin: 0.1
            strokeStyle: 2
            strokeColor: "#5d5d5d"
            dashPattern: [1, 4]
            end: 360
        }

        Row {
            x: 176
            y: 345
            spacing: 8

            CircleIndicator {
                id: dot01
                checked: true
            }

            CircleIndicator {
                id: dot02
                y: 4
                checked: true
            }

            CircleIndicator {
                id: dot03
                y: 4
            }

            CircleIndicator {
                id: dot04
            }
        }

        Text {
            id: text0Percent
            x: 231
            y: 415
            color: "#6d6d6d"
            text: qsTr("0%")
            font.pixelSize: 14
        }

        Text {
            id: text0
            x: 194
            y: 415
            color: "#6d6d6d"
            text: qsTr("0")
            font.pixelSize: 14
        }

        Text {
            id: text50Percent
            y: 192
            color: "#6d6d6d"
            text: qsTr("50%")
            anchors.left: parent.left
            anchors.leftMargin: 424
            anchors.right: parent.right
            font.pixelSize: 14
        }

        Text {
            id: text30
            x: 0
            y: 192
            color: "#6d6d6d"
            text: qsTr("30")
            anchors.left: parent.left
            font.pixelSize: 14
        }

        Text {
            id: text100Percent
            x: 231
            y: 0
            color: "#6d6d6d"
            text: qsTr("100%")
            font.pixelSize: 14
        }

        Text {
            id: text60
            x: 194
            y: 0
            color: "#6d6d6d"
            text: qsTr("60")
            font.pixelSize: 14
        }

        CustomLabel {
            id: assistLeft
            x: 305
            y: 232
            width: 31
            height: 70
            color: "#6d6d6d"
            text: "mi. assist left"
            wrapMode: Text.WordWrap
            lineHeight: 0.8
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }

        CustomLabel {
            id: avgMPH
            x: 118
            y: 235
            width: 31
            height: 47
            color: "#6d6d6d"
            text: "AVG mph"
            lineHeight: 0.8
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            wrapMode: Text.WordWrap
        }

        CustomLabel {
            id: batteryLabel
            x: 305
            y: 186
            text: "11"
            font.pixelSize: 48
        }

        CustomLabel {
            id: averageSpeedLabel
            x: 119
            y: 186
            text: "12"
            lineHeight: 0.8
            font.pixelSize: 48
        }

        Image {
            x: 116
            y: 144
            source: "images/speed.png"
        }

        Image {
            x: 295
            y: 144
            source: "images/battery.png"
        }

        Image {
            x: 207
            y: 299
            source: "images/assist.png"
        }
    }

    Timeline {
        id: timeline
        endFrame: 1000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: details
            property: "opacity"
            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.645, 0.045, 0.355, 1, 1, 1]
                value: 0
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speed
            property: "x"
            Keyframe {
                value: 160
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                value: 163
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speed
            property: "y"
            Keyframe {
                value: 126
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                value: 180
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speed
            property: "scale"
            Keyframe {
                value: 1
                frame: 0
            }

            Keyframe {
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                value: 1.6
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speed
            property: "width"
            Keyframe {
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                value: 128
                frame: 1000
            }
        }

        KeyframeGroup {
            target: speed
            property: "height"
            Keyframe {
                easing.bezierCurve: [0.455, 0.03, 0.515, 0.955, 1, 1]
                value: 160
                frame: 1000
            }
        }

        KeyframeGroup {
            target: mph
            property: "y"
            Keyframe {
                value: 88
                frame: 0
            }

            Keyframe {
                value: 71
                frame: 1000
            }
        }
    }

    Item {
        id: speed
        x: 160
        y: 126
        width: 128
        height: 135

        CustomLabel {
            id: mph
            x: 47
            y: 88
            width: 31
            height: 47
            color: "#6d6d6d"
            text: " mph"
            wrapMode: Text.WordWrap
            lineHeight: 0.8
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
        }

        CustomLabel {
            id: speedLabel
            x: 34
            y: -8
            text: Backend.speedString
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 82
        }
    }
}
