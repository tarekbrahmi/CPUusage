

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
import QtQuick 2.9
import appDesign 1.0
import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.3
import QtQuick.Timeline 1.0
import QtQuick.Layouts 1.3

Rectangle {
    id: root
    width: Constants.width
    height: Constants.height
    color: "#1a1e25"
    state: "Standard"
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




/*##^## Designer {
    D{i:1;anchors_height:720;anchors_width:720;anchors_x:0;anchors_y:0;timeline_expanded:true}
D{i:2;anchors_height:720;anchors_width:720;anchors_x:0}D{i:5;timeline_expanded:true}
D{i:3;anchors_height:720;anchors_width:720}
}
 ##^##*/
