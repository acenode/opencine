import QtQuick 2.4
import QtQuick.Layouts 1.1
import QtQuick.Controls 1.3

Rectangle {
    id: root
    width: 640
    height: 480
    color: "#1b1b1b"

    MouseArea {
        id: rootMouseArea
        anchors.rightMargin: -700
        anchors.bottomMargin: -780
        anchors.leftMargin: 700
        anchors.topMargin: 780
        anchors.fill: parent
        hoverEnabled: true

        propagateComposedEvents: true
    }

    GridView {
        id: gridView1
        cacheBuffer: 20
        anchors.fill: parent
        boundsBehavior: Flickable.StopAtBounds
        cellWidth: 276
        scale: 1
        cellHeight: 223
        highlightRangeMode: GridView.NoHighlightRange
        snapMode: GridView.NoSnap

        //keyNavigationWraps: false

        model: fileList
        delegate: ThumbnailItem
        {
            id: thumbnailItem
            clipResolution: model.modelData.clipName
            clipName: model.modelData.clipName
            clipPath: model.modelData.clipPath
        }

        addDisplaced: Transition {
            NumberAnimation {
                properties: "x,y"
                duration: 1000
            }
        }

        ScrollBar
        {
                flickable: gridView1;
        }
    }

    Rectangle {
        id: rectangle1
        color: "#00000000"
        anchors.topMargin: 447
        anchors.fill: parent
        visible: rootMouseArea.containsMouse
        opacity: controlMouseArea.containsMouse ? 1.0 : 0.3

        MouseArea {
            id: controlMouseArea
            anchors.fill: parent
            hoverEnabled: true

            propagateComposedEvents: true
        }

        Slider {
            id: scaleSlider
            width: 250
            stepSize: 0.1
            tickmarksEnabled: true
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 6
            anchors.horizontalCenter: parent.horizontalCenter
            value: 0.5
        }
    }
}
