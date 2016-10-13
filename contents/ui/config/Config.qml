/*
 * Copyright (C) 2016 by vycbm <vycb777@gmail.com>
 *
 * This file is part of XrendrMixer.
 *
 * plasma-XrendrMixer is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * plasma-XrendrMixer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with plasma-codeship.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Item {
    property alias cfg_screen: screen.text
    property alias cfg_brightness: brightness.value
    property alias cfg_gamma: gamma.value
    id: root
    width: parent.width
    height: parent.height

    GridLayout {
        id: lconf
        columns: 2
        rows: 4
        Layout.fillWidth: true
        width: parent.width

        Label {
            text: qsTr("Screen name")
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: screen
            Layout.fillWidth: true
            placeholderText: qsTr("LVDS-1")
        }
        
				Label {
					Layout.columnSpan: 2
					text: qsTr("Defaults:")
					Layout.alignment: Qt.AlignLeft
				}
				
        Label {
            text: qsTr("Brightness")
            Layout.alignment: Qt.AlignRight
        }

        SpinBox {
						id: brightness
						minimumValue: 0.01
						value: 0.12
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
						minimumValue: 0.01
						value: 1
						maximumValue: 5
						stepSize: 0.01
						decimals: 2
						onEditingFinished: {
							sync()
						}
					}
				
    }
}
