function init(plugin)
    print("Aseprite is initializing Apoco's Scripts Pack!")
	
    plugin:newCommand {
        id="align_bpm",
        title="Align BPM",
        group="cel_frames",
        onclick=function()
            local executable = app.fs.joinPath(app.fs.userConfigPath, "extensions", "apoco_scripts_pack", "align_bpm.lua")
            -- load the lua script into a Lua chunk, then execute it with the parameter plugin.preferences
            loadfile(executable)(plugin.preferences)
        end
    }
end
  
function exit(plugin)
    print("Aseprite is closing Apoco's Scripts Pack!")
end