--[[
  Save current track title to Spotify playlist.
  Bindkey is P.
  Save to ~/.config/mpv/scripts/
]]--

local settings = {
    spotify_helper_path = "spotify_helper", -- Path to Spotify Helper
    playlist_id = "spotify:playlist:0OlQjdqrHIJq7cOED2Qm7H", -- Right click on playlist > Share > Copy Spotify URI
    autosave = false, -- Autosave to Spotify when title is changing
}

require 'mp.options'
read_options(settings, "spotify")
local msg = require 'mp.msg'
local utils = require 'mp.utils'

function save_to_spotify()
  local songname = mp.get_property('media-title')
  local filename = mp.get_property('filename')
  if songname ~= filename then
    if settings.autosave then
      msg.warn("Autosave is on, song is saved to playlist without input")
      return
    end
    save(songname)
  else
    msg.error("No media title available") 
  end
end

function save(songname)
  t = {}  
  t.args = {settings.spotify_helper_path, settings.playlist_id, songname}
  res = utils.subprocess(t)
  if res.status == 0 then
      mp.msg.info("Saved to Spotify: "..res.stdout)
  elseif res.status == 2 then
      mp.msg.warn("Could not find "..songname)
  else
      mp.msg.error("Adding to Spotify failed")
  end
end

function titlechanged(_, title)
  local f = mp.get_property('filename')
  if title ~= f then
    save(title)
  end
end

mp.add_key_binding('P', 'save-to-spotify', save_to_spotify)

if settings.autosave then
  mp.observe_property('media-title', "string", titlechanged)
end
