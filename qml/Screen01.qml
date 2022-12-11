import QtQuick 2.9
import appDesign 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.3
import data
Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: "#1a1e25"
    state: "Standard"
    Data{
        id:myData
    }

    Foreground {
        id: foreground
        width: 1080
        height: 720
        anchors.fill: parent
        currentFrame: 0
    }

    Connections {
        target: foreground
        onClicked: {
            myData.start()
            console.log("cpuUsagePercent ",myData.cpuUsagePercent)
            if (state === "Standard")
                root.state = "ToBig"
            else if (state === "Big")
                root.state = "FromBig"
        }
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: fromBigAnimation
                onFinished: root.state = "Standard"
                loops: 1
                duration: 250
                from: 4998
                to: 4100
                running: false
            },
            TimelineAnimation {
                id: toBigAnimation
                onFinished: root.state = "Big"
                loops: 1
                duration: 250
                from: 4100
                to: 5000
                running: false
            }
        ]
        endFrame: 5000
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: foreground
            property: "currentFrame"

            Keyframe {
                value: "2000"
                frame: 992
            }

            Keyframe {
                value: "2000"
                frame: 2992
            }

            Keyframe {
                value: 0
                frame: 2993
            }

            Keyframe {
                value: "2000"
                frame: 4094
            }

            Keyframe {
                value: "2500"
                frame: 4992
            }
        }
    }

    states: [
        State {
            name: "Standard"

            PropertyChanges {
                target: timeline
                currentFrame: 0
                enabled: true
            }

            PropertyChanges {
                target: root
                width: 720
                height: 620
            }

            PropertyChanges {
                target: foreground
                width: 720
                height: 620
            }
        },
        State {
            name: "Big"

            PropertyChanges {
            }

            PropertyChanges {
                target: timeline
                currentFrame: 5000
                enabled: true
            }
        },
        State {
            name: "ToBig"

            PropertyChanges {
                target: timeline
                currentFrame: 4100
                enabled: true
            }

            PropertyChanges {
                target: toBigAnimation
                running: true
            }
        },
        State {
            name: "FromBig"

            PropertyChanges {
                target: timeline
                enabled: true
            }

            PropertyChanges {
                target: timeline
                currentFrame: 4998
                enabled: true
            }

            PropertyChanges {
                target: fromBigAnimation
                running: true
            }
        }
    ]
}
