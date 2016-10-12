/*
 * Copyright (C) 2016 by vycb <vycb777@gmail.com>
 *
 * This file is part of plasma-XrendrMixer.
 *
 * plasma-XrendrMixer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-codeship is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-codeship.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

Item {
    id: root
    property string screen: plasmoid.configuration.screen == "" ? "LVDS-1" : plasmoid.configuration.screen
		Layout.preferredHeight: units.gridUnit * 7
		Layout.minimumWidth: 12
		Layout.preferredWidth: units.gridUnit * 14
		Layout.maximumWidth: plasmoid.screenGeometry.width

    Label {
        id: heading
        width: parent.width
        text: "Xrendr Mixer"
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize : 12
        horizontalAlignment: "AlignHCenter"
    }
    
    Connections {
        target: plasmoid.configuration
    }
  
    GridLayout{
			id: mainGrid
			anchors.rightMargin: 8
			anchors.bottomMargin: 1
			anchors.leftMargin: 12
			anchors.topMargin: 12
			anchors.top: parent.top
			anchors.fill: parent
			columns: 1
			
			GridLayout {
					anchors.rightMargin: 8
					anchors.leftMargin: 12
					anchors.bottomMargin: 6
					anchors.topMargin: 12
					columns: 2
					anchors.fill: parent
					anchors.top: heading.bottom

					Label {
							text: qsTr("Brightness")
							Layout.alignment: Qt.AlignRight
					}
					
					SpinBox {
						id: brightness
						minimumValue: 0
						value: 0.2
						maximumValue: 7
						stepSize: 0.01
						decimals: 2
						onEditingFinished:{
							sync()
						}
					}
					
					Label {
							text: qsTr("Gamma")
							Layout.alignment: Qt.AlignRight
					}
					
					SpinBox {
						id: gamma
						minimumValue: 0
						value: 1
						maximumValue: 5
						stepSize: 0.01
						decimals: 2
						onEditingFinished: {
							sync()
						}
					}
					

			}
    
			Button {
				id: apply
        anchors.horizontalCenter: parent.horizontalCenter
				text: "Apply"
				onClicked: {
// 					console.log("brightness="+brightness.value+' gamma='+gamma.value);
					sync();
					}
				}
		}

		PlasmaCore.DataSource {
			id: executeSource
			engine: "executable"
			connectedSources: []
			onNewData: {
					disconnectSource(sourceName)
			}
		}
    function exec(cmd) {
// 			console.log('cmd='+cmd);
			executeSource.connectSource(cmd)
    }

		Component.onCompleted: {
			plasmoid.setAction("sync", i18n("Sinc"), "configure");
    }

    function sync() {
			exec("xrandr --output "+root.screen+" --brightness "+brightness.value+" --gamma "+gamma.value+":"+gamma.value+":"+gamma.value)
    }

    function action_sync() {
			sync()
    }
}
