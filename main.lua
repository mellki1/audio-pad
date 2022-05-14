-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here
local w = display.contentWidth
local h = display.contentHeight

local background = display.newImageRect( "backgorund.jpg", 1080, 1920 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local font = native.systemFont
local fontSize = 45
local fontSizeWithAccident = 35
local wPositionRight = w * .26
local wPositionLeft = w * .74
local squares = {}


local notes = {
    {   text = "C",
        x = wPositionRight,
        y = h * .0,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/C.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 1
        }
    },
    {   text = "C#/Db",
        x = wPositionLeft,
        y = h * .0,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadSound("./audios/C#-Db.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "D",
        x = wPositionRight,
        y = h * .2,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/D.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 3
        }
    },
    {   text = "D#/Eb",
        x = wPositionLeft,
        y = h * .2,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadSound("./audios/D#-Eb.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "E",
        x = wPositionRight,
        y = h * .4,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/E.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 5
        }
    },
    {   text = "F",
        x = wPositionLeft,
        y = h * .4,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/F.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "F#/Gb",
        x = wPositionRight,
        y = h * .6,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadSound("./audios/F#-Gb.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "G",
        x = wPositionLeft,
        y = h * .6,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/G.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 8
        }
    },
    {   text = "G#/Ab",
        x = wPositionRight,
        y = h * .8,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadSound("./audios/G#-Ab.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "A",
        x = wPositionLeft,
        y = h * .8,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/A.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "A#/Bb",
        x = wPositionRight,
        y = h * 1,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadSound("./audios/A#-Bb.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },
    {   text = "B",
        x = wPositionLeft,
        y = h * 1,
        font = font,
        fontSize = fontSize,
        song = audio.loadSound("./audios/B.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        }
    },

}

local function start(square, note)
    return function(event)
        square:setFillColor(0,0,255,0.1)
        audio.play(note.song, note.aduioOptions);
        square:addEventListener("tap", function (event)
            square:setFillColor(0,0,255,0.3)
            audio.pause(note.aduioOptions.channel)
            square:addEventListener("tap", start(square, note))
            return true;
        end)
    end
end

local function drawSquares()
    for index, note in ipairs(notes) do
        local square= display.newRect(note.x, note.y, w/2.2, w/3.4)
        square:setFillColor(0,0,255,0.3)
        display.newText(note)
        square:addEventListener("tap", start(square, note))
        table.insert(squares, square)
    end
end

drawSquares()

