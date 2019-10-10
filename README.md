# mpv-spotify-script

![example](/readme.png)

## Usage

Press P to add current title to your Spotify playlist.

## Config

Edit `spotify.lua`

```lua
local settings = {
    spotify_helper_path = "/usr/local/bin/spotify_helper", -- Path to Spotify Helper
    playlist_id = "spotify:playlist:0OlQjrqrHIJq7cOED2Qm7H", -- Right click on playlist > Share > Copy Spotify URI
    autosave = false, -- Autosave to Spotify when title is changing
}
```

Edit `spotify_helper`

```python
# Create an app on https://developer.spotify.com/dashboard/
# Configure CLIENT_ID / SECRET_ID in spotify_helper
# Configure callback to http://localhost:{PORT_CALLBACK}/callback on Spotify dashboard

CLIENT_ID = ""
SECRET_ID = ""
PORT_CALLBACK = 45678
```

## Install

```bash
git clone https://github.com/olivierlemoal/mpv-spotify-script
mv mpv-spotify-script/spotify_helper /usr/local/bin/
mv mpv-spotify-script/spotify.lua ~/.config/mpv/script
python3 -m pip install --user -r requirements.txt
```



