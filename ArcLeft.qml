import QtQuick 2.10
import appDesign 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Timeline 1.0
import QtQuick.Shapes 1.11

ArcItem {
    id: arcLeft
    width: 360
    height: 360
    property real value: 30

    end: 82
    strokeColor: "#35e583"
    capStyle: 32
    strokeWidth: 14
    begin: -82

    Timeline {
        id: timeline
        currentFrame: arcLeft.value * 10
        endFrame: 600
        enabled: true
        startFrame: 0

        KeyframeGroup {
            target: arcLeft
            property: "end"

            Keyframe {
                value: -82
                frame: 0
            }

            Keyframe {
                value: 82
                frame: 600
            }
        }
    }
}
