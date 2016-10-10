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
 * along with plasma-XrendrMixer.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.5
import org.kde.plasma.configuration 2.0

ConfigModel {
    ConfigCategory {
         name: qsTr('General')
         icon: 'preferences-desktop-display-color'
         source: 'config/Config.qml'
    }
} 
