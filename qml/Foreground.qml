

/****************************************************************************
**
** Copyright (C) 2019 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Design Studio.
**
** $QT_BEGIN_LICENSE:BSD$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** BSD License Usage
** Alternatively, you may use this file under the terms of the BSD license
** as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/
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
