
-- requires --
local storyboard = require ("storyboard")
local scene = storyboard.newScene()

-- background

function scene:createScene(event)

	local screenGroup = self.view

<<<<<<< HEAD
<<<<<<< HEAD
	background = display.newImage("img/bg.png")
	screenGroup:insert(background)
	background.x = display.contentCenterX
	background.y = display.contentCenterY
=======
	background = display.newImage("img/start.jpg")
=======
	background = display.newImage("start.png")
>>>>>>> parent of 6c2d238... Wasn't working but now a little
	screenGroup:insert(background)

    city2 = display.newImage("city2.png")
    city2:setReferencePoint(display.BottomLeftReferencePoint)
    city2.x = 0
    city2.y = 320
    screenGroup:insert(city2)
>>>>>>> 6c2d238ddcf5968f3ce465891b019d556c05befe

end


function start(event)
	if event.phase == "began" then
		storyboard.gotoScene("game", "fade", 400)
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
