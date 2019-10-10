# mpv-spotify-script

![example](/readme.png)

## Usage

Press P to add current title to your Spotify playlist.

## Config

Edit `spotify.lua`

```bash
local settings = {
    spotify_helper_path = "/usr/local/bin/spotify_helper", -- Path to Spotify Helper
    playlist_id = "spotify:playlist:0OlQjrqrHIJq7cOED2Qm7H", -- Right click on playlist > Share > Copy Spotify URI
    autosave = false, -- Autosave to Spotify when title is changing
}
```

## Install

```bash
git clone https://github.com/olivierlemoal/mpv-spotify-script
mv mpv-spotify-script/spotify_helper /usr/local/bin/
mv mpv-spotify-script/spotify.lua ~/.config/mpv/script
python3 -m pip install --user -r requirements.txt
```



