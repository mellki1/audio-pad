-----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
local composer = require( "composer" )
local socket = require ("socket")

local scene = composer.newScene()
local function toAppScreen()
    local options = {
        effect = "fade",
        time = 2000
    }
    composer.gotoScene("appScreen", options)
end

function scene:create( event )
    local sceneGroup = self.view
    local w = display.contentCenterX
	local h = display.contentCenterY
    display.newImage(sceneGroup, "./images/splashScreen.png", w, h)
    toAppScreen()
end
scene:addEventListener( "create", scene )
return scene