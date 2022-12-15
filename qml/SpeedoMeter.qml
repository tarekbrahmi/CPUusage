import QtQuick 2.10
import appDesign 1.0
import QtQuick.Studio.Components 1.0

SpeedBackground {
    id: speedoMeter
    property alias speed: arcLeft.value
    property alias battery: arcRight.value

    ArcRight {
        id: arcRight
        x: 36
        y: 37
        antialiasing: true
        value: myData.capaBattery
    }

    ArcLeft {
        id: arcLeft
        objectName: arcleft
        x: 42
        y: 37
        strokeColor: myData.arcleftsorckColor
        antialiasing: true
        value:myData.cpuUsagePercent
    }
}
