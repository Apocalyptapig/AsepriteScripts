local all = app.activeSprite.frames 

local dlg = Dialog()
dlg:entry{ id="bpm", label="Beats Per Minute", text="e.g. 100",
    focus=true }
dlg:button{ id="confirm", text="Confirm",
    focus=true }
dlg:button{ id="cancel", text="Cancel" }
dlg:show()
data = dlg.data

function getFrames()
    local mspf = 60000/data.bpm
    local total = 0
    for i, frame in ipairs(all) do 
        app.activeFrame = i 
        total = total + app.activeFrame.duration * 1000
    end
        ratio = mspf / total
end

function editFrames()
    for i, frame in ipairs(all) do 
        app.activeFrame = i 
        app.activeFrame.duration = app.activeFrame.duration * ratio
    end
end
    
if data.confirm then

    getFrames() 
    editFrames()

    app.alert("Animation successfully aligned to " .. data.bpm .. " BPM")
end
