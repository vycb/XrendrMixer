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
    id: root
    width: parent.width
    height: parent.height

    GridLayout {
        id: layout
        columns: 2
        rows: 1
        Layout.fillWidth: true
        width: parent.width

        Label {
            text: qsTr("Screen name")
            Layout.alignment: Qt.AlignRight
        }

        TextField {
            id: screen
            text: qsTr("LVDS-1")
            Layout.fillWidth: true
            placeholderText: qsTr("LVDS-1")
        }
    }
}
