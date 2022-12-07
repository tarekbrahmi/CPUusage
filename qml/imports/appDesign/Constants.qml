pragma Singleton
import QtQuick

QtObject {
    readonly property int width: 664
    readonly property int height: 620
    readonly property FontLoader mySystemFont: FontLoader { source: "Teko-Medium.ttf" }
    /* Edit this comment to add your custom font */
    readonly property FontLoader myCustomFont: FontLoader { source: "Teko-Medium.ttf" }
    readonly property font font: Qt.font({
                                             family: mySystemFont.name,
                                             pixelSize: Qt.application.font.pixelSize
                                         })
    readonly property font largeFont: Qt.font({
                                                  family: mySystemFont.name,
                                                  pixelSize: Qt.application.font.pixelSize * 1.6
                                              })
    readonly property color backgroundColor: "#c2c2c2"
}
