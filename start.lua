-- requires --
local composer = require ("composer")
local scene = composer.newScene()

-- background
function scene:createScene(event)

	local screenGroup = self.view

	background = display.newImage("img/start.jpg")
	screenGroup:insert(background)

    city2 = display.newImage("img/city2.png")
    city2:setReferencePoint(display.BottomLeftReferencePoint)
    city2.x = 200
    city2.y = 250
    screenGroup:insert(city2)

end


function start(event)
	if event.phase == "began" then
		composer.gotoScene("game", "fade", 400)
	end
end


function scene:enterScene(event)

	background:addEventListener("touch", start)

end

function scene:exitScene(event)
	background:removeEventListener("touch", start)
end

function scene:destroyScene(event)

end


scene:addEventListener("createScene", scene)
scene:addEventListener("enterScene", scene)
scene:addEventListener("exitScene", scene)
scene:addEventListener("destroyScene", scene)

return scene