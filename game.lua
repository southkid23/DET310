local composer = require( "composer" )
local scene = composer.newScene()

----Psysics----
local physics = require "physics"
physics.start()
physics.setGravity(0, 1)

function flyUp(event)
	
   if event.phase == "began" then
       
		if gameStarted == false then
			 player.bodyType = "dynamic"
			 instructions.alpha = 0
			 tb.alpha = 1
			 addColumnTimer = timer.performWithDelay(1000, addColumns, -1)
			 moveColumnTimer = timer.performWithDelay(2, moveColumns, -1)
			 gameStarted = true
			 player:applyForce(0, -300, player.x, player.y)
		else 
       
	    player:applyForce(0, -600, player.x, player.y)
		
      end
	end
end

function scene:create(event)
	local sceneGroup = self.view
----Background----

	local background = display.newImage("img/bg.png")
	background.x = 250
	background.y = 200

	----Player -----
	local rocket = display.newImage("img/ship-inverted.png")
	rocket:scale (-0.5, -0.5)
	rocket.x = 200
	rocket.y = 250
	physics.addBody(rocket, "dynamic", {density=.1, bounce=0.1, })


	line1 = display.newImage("img/line-inverted.png")
    line1.x = 500
    line1.y = 100
    line1.speed = math.random(2,6)
    line1.initY = line1.y
    line1.amp = math.random(20,100)
    line1.angle = math.random(1,360)
    physics.addBody(line1, "static", {density=.1, bounce=0.1, friction=.2, radius=12})

	
	line2 = display.newImage("img/line-inverted.png")
    line2.x = 500
    line2.y = 100
    line2.speed = math.random(2,6)
    line2.initY = line2.y
    line2.amp = math.random(20,100)
    line2.angle = math.random(1,360)
    physics.addBody(line2, "static", {density=.1, bounce=0.1, friction=.2, radius=12})
	
	
	line3 = display.newImage("img/line-inverted.png")
    line3.x = 500
    line3.y = 100
    line3.speed = math.random(2,6)
    line3.initY = line3.y
    line3.amp = math.random(20,100)
    line3.angle = math.random(1,360)
    physics.addBody(line3, "static", {density=.1, bounce=0.1, friction=.2, radius=12})
	
end

function scene:show( event )
	local sceneGroup = self.view
   	local phase = event.phase

   	if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
	  
	composer.removeScene("start")
	Runtime:addEventListener("touch", flyUp)
	
   end
end

function scene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
	  Runtime:removeEventListener("touch", flyUp)
	
	  
	  
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

function scene:destroy( event )

   local sceneGroup = self.view

   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

--------------------

-- Listener Setup
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

--------------------

return scene