local composer = require( "composer" )
local scene = composer.newScene()

----Psysics----
local physics = require "physics"
physics.start()
physics.setGravity(1, 3)

function flyUp(event)
	
  if event.phase == "began" then
     
    physics.setGravity(1,-3)

  elseif event.phase == "ended" then

    physics.setGravity(1,3)

  end
end

function scene:create(event)
	local sceneGroup = self.view
  ----Background----


  local background = display.newImage("img/bg.png")
  background.x = 250
  background.y = 200



  ----Player -----
  local rocket = display.newImage("img/ship.png")
  rocket:scale (-0.5, -0.5)
  rocket.x = 200
  rocket.y = 250
  physics.addBody(rocket, "dynamic", {density=.1, bounce=0.1, })
  rocket.gravityScale = 6.0


  local line1 = display.newImage("img/line-inverted.png")
  line1.x = 1000
  line1.y = 750
  line1:scale(.5, .5)
  line1:rotate(90)
  --line1.fill = { 1, 0, 0.5 }

  local nw, nh = line1.width*0.003, line1.height*0.005;
  physics.addBody(line1, "kinematic", { shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} });
  line1:setLinearVelocity(0,-150)

  local line2 = display.newImage("img/line-inverted.png")
  line2.x = 700
  line2.y = 150
  line2:scale(.5, .5)
  line2:rotate(90)
  --line1.fill = { 1, 0, 0.5 }

  local nw, nh = line2.width*0.003, line2.height*0.005;
  physics.addBody(line2, "kinematic", { shape={-nw,-nh,nw,-nh,nw,nh,-nw,nh} });
  line2:setLinearVelocity(0,150)



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