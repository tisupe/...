#!/bin/bash

# Start only when not already running
systemctl --user is-active --quiet mpd || systemctl --user start mpd
systemctl --user is-active --quiet mpd-mpris || systemctl --user start mpd-mpris
systemctl --user is-active --quiet mpd-discord-rpc || systemctl --user start mpd-discord-rpc

# Launch rmpc
rmpc "$@"

# After closing rmpc, stop the services
systemctl --user stop mpd-discord-rpc
systemctl --user stop mpd-mpris
systemctl --user stop mpd
