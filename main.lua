
local w = display.contentWidth
local h = display.contentHeight


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
        song = audio.loadStream("./audios/C.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 1
        },
        enable = false
    },
    {   text = "C#/Db",
        x = wPositionLeft,
        y = h * .0,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadStream("./audios/C#-Db.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 2
        },
        enable = false
    },
    {   text = "D",
        x = wPositionRight,
        y = h * .2,
        font = font,
        fontSize = fontSize,
        song = audio.loadStream("./audios/D.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 3
        },
        enable = false
    },
    {   text = "D#/Eb",
        x = wPositionLeft,
        y = h * .2,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadStream("./audios/D#-Eb.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 4
        },
        enable = false
    },
    {   text = "E",
        x = wPositionRight,
        y = h * .4,
        font = font,
        fontSize = fontSize,
        song = audio.loadStream("./audios/E.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 5
        },
        enable = false
    },
    {   text = "F",
        x = wPositionLeft,
        y = h * .4,
        font = font,
        fontSize = fontSize,
        song = audio.loadStream("./audios/F.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 6
        },
        enable = false
    },
    {   text = "F#/Gb",
        x = wPositionRight,
        y = h * .6,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadStream("./audios/F#-Gb.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 7
        },
        enable = false
    },
    {   text = "G",
        x = wPositionLeft,
        y = h * .6,
        font = font,
        fontSize = fontSize,
        song = audio.loadStream("./audios/G.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 8
        },
        enable = false
    },
    {   text = "G#/Ab",
        x = wPositionRight,
        y = h * .8,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadStream("./audios/G#-Ab.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 9
        },
        enable = false
    },
    {   text = "A",
        x = wPositionLeft,
        y = h * .8,
        font = font,
        fontSize = fontSize,
        song = audio.loadStream("./audios/A.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 10
        },
        enable = false
    },
    {   text = "A#/Bb",
        x = wPositionRight,
        y = h * 1,
        font = font,
        fontSize = fontSizeWithAccident,
        song = audio.loadStream("./audios/A#-Bb.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 11
        },
        enable = false
    },
    {   text = "B",
        x = wPositionLeft,
        y = h * 1,
        font = font,
        fontSize = fontSize,
        song = audio.loadStream("./audios/B.mp3"),
        aduioOptions = {
            loops = -1,
            channel = 12
        },
        enable = false
    },

}

local background = display.newImageRect("./images/backgorund.jpg", 1080, 1920 )
background.x = display.contentCenterX
background.y = display.contentCenterY

local function startOrStopSong(square, note)
    return function (event)
        if note.enable == false then
            note.enable = true
            square:setFillColor(0,0,255,0.1)
            audio.play(note.song, note.aduioOptions);
        elseif note.enable == true then
            note.enable = false
            square:setFillColor(0,0,255,0.3)
            audio.stop(note.aduioOptions.channel);
        end
    end
end


local function drawSquares()
    for index, note in ipairs(notes) do
        local square= display.newRoundedRect(note.x, note.y, w/2.2, w/3.4, 12)
        square:setFillColor(0,0,255,0.3)
        display.newText(note.text, note.x, note.y, note.font, note.fontSize)
        square:addEventListener("tap", startOrStopSong(square, note))
        table.insert(squares, square)
    end
end
drawSquares()