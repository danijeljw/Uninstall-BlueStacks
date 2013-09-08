#!/bin/sh

# Uninstall BlueStacks 1.4
# Copyright (c) 2013, Danijel J
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of the Danijel J nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL DANIJEL J BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


# ################################################### #
# PORTIONS OF THIS CODE COPYRIGHT (c) BLUESTACKS 2013 #
# ################################################### #



# Kill active running service
killall -TERM uHD-Frontend
killall -TERM uHD-Agent
killall -TERM uHD-Updater

# Begin automatic uninstaller
bash ~/Library/BlueStacks\ App\ Player/Uninstall/uHD-InstallHelper uninstall-begin
bash ~/Library/BlueStacks\ App\ Player/Uninstall/uHD-InstallHelper uninstall-success

# Unload plist files
launchctl unload ~/Library/LaunchAgents/com.BlueStacks.AppPlayer.Service.plist
launchctl unload ~/Library/LaunchAgents/com.BlueStacks.AppPlayer.LogRotator.plist
launchctl unload ~/Library/LaunchAgents/com.BlueStacks.AppPlayer.UpdaterAgent.plist
launchctl unload ~/Library/LaunchAgents/com.BlueStacks.AppPlayer.UninstallAgent.plist

# Remove Preference file
rm -rf ~/Library/Preferences/com.BlueStacks.AppPlayer.plist

# Remove LaunchAgent
rm -rf ~/Library/LaunchAgents/com.BlueStacks.AppPlayer.*

# Remove other associated files
rm -f ~/Library/BlueStacks\ App\ Player/AppBundle
rm -f ~/Library/BlueStacks\ App\ Player/Runtime
rm -f ~/Library/BlueStacks\ App\ Player/InstalledVersion.txt
rm -rf ~/Library/BlueStacks\ App\ Player/Uninstall
rm -rf ~/Library/Logs/BlueStacks\ App\ Player
rm -rf /Applications/BlueStacks.app

# Run maintenance scripts
periodic daily weekly monthly

# Restart the Mac
shutdown -r now