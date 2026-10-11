import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts


PanelWindow {
  anchors.top: true
  anchors.left: true
  anchors.right: true
  implicitHeight: 30
  color: "#1a1b26"
}

// Row layout arranges children horizontally
RowLayout{
  anchors.fill: parent
  anchors.margins: 8
		  
  Repeater {
  model:9

  Text{
    text:index + 1
    color: "#444b6a"
    }
  }		
}
