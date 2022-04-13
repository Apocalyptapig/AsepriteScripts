local sprite = app.activeSprite
local listfile = sprite.filename .. "_frames"
local all = app.activeSprite.frames 

local dlg = Dialog()
dlg:entry{ id="bpm", label="Beats Per Minute", text="e.g. 100",
	focus=true }
dlg:button{ id="confirm", text="Confirm",
	focus=true }
dlg:button{ id="cancel", text="Cancel" }
dlg:show()
data = dlg.data
if data.confirm then
	local mspf = 60000/data.bpm
  
	local frame_dur
	local frames = {}
	
	function getFrames()
		local total = 0
		for i, frame in ipairs(all) do 
			app.activeFrame = i 
			frame_dur = app.activeFrame.duration * 1000
			total = total + frame_dur
		end
		
		ratio = mspf / total
	end 
	
	function editFrames()
		for i, frame in ipairs(all) do 
			app.activeFrame = i 
			new_time = app.activeFrame.duration * ratio
			app.activeFrame.duration = new_time
		end
	end 

	app.alert("Animation successfully aligned to " .. data.bpm .. " BPM")
end

--clearList() 
getFrames() 
editFrames()
--clearList()