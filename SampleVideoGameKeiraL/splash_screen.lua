-----------------------------------------------------------------------------------------
--
-- splash_screen.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the splash screen of the game. It displays the 
-- company logo that...
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-- Name the Scene
sceneName = "splash_screen"

-----------------------------------------------------------------------------------------

-- Create Scene Object
local scene = composer.newScene( sceneName )


-- set the background colour
display.setDefault("background", 1, 1, 1)

---------------------------------------------------------------
-- GLOBAL VARIABLES -- 
---------------------------------------------------------------
scrollSpeed = 10

---------------------------------------------------------------
-- LOCAL VARIABLES -- 
---------------------------------------------------------------
local plate
local slime
local fork
local spoon

---------------------------------------------------------------
-- SOUNDS -- 
---------------------------------------------------------------
local crashSound = audio.loadSound("Sounds/crash.mp3")
local crashSoundsChannel

--------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
--------------------------------------------------------------------------------------------
-- move the plate to the starting poisition
local function MovePlate( event )
    -- add the scroll speed to the y-value
    plate.y = plate.y + scrollSpeed

    -- make the plate stop after it reaches half
    if (plate.y >= display.contentHeight/2) then
        -- stop moving lamp
        Runtime:removeEventListener("enterFrame", MovePlate)
        -- play crash sound
        crashSoundsChannel = audio.play(crashSound )
    end
end

-- move the slime to the starting poisition
local function MoveSlime( event )
    -- add the scroll speed to the y-value
    slime.y = slime.y + scrollSpeed
        -- make the plate stop after it reaches half
    if (slime.y >= display.contentHeight/1.5) then
        -- stop moving lamp
        Runtime:removeEventListener("enterFrame", MoveSlime)
    end
end

-- move the fork to the starting poisition
local function MoveFork( event )
    -- add the scroll speed to the y-value
    fork.y = fork.y + scrollSpeed
        -- make the plate stop after it reaches half
    if (fork.y >= display.contentHeight/2) then
        -- stop moving lamp
        Runtime:removeEventListener("enterFrame", MoveFork)
        -- play crash sound
        crashSoundsChannel = audio.play(crashSound )
    end
end

-- move the spoon to the starting poisition
local function MoveSpoon( event )
    -- add the scroll speed to the y-value
    spoon.y = spoon.y + scrollSpeed
        -- make the plate stop after it reaches half
    if (spoon.y >= display.contentHeight/2) then
        -- stop moving lamp
        Runtime:removeEventListener("enterFrame", MoveSpoon)
        -- play crash sound
        crashSoundsChannel = audio.play(crashSound )
    end
end

-- The function that will go to the main menu 
local function gotoMainMenu()
    composer.gotoScene( "main_menu" )
end

-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    ---------------------------------------------------------------
    -- OBJECTS -- 
    ---------------------------------------------------------------
    -- create the plate
    plate = display.newImageRect("Images/plate.png", 600, 450)
    plate.x = display.contentWidth/2
    plate.y = display.contentHeight/-2

    -- create the slime
    slime = display.newImageRect("Images/slime.png", 600, 400)
    slime.x = display.contentWidth/2
    slime.y = display.contentHeight/-3

    -- create the fork
    fork = display.newImageRect("Images/fork.png", 150, 450)
    fork.x = display.contentWidth/8
    fork.y = display.contentHeight/-2

    -- create the spoon
    spoon = display.newImageRect("Images/spoon.png", 150, 450)
    spoon.x = 880
    spoon.y = display.contentHeight/-2

    sceneGroup:insert( plate )
    sceneGroup:insert( slime )
    sceneGroup:insert( fork )
    sceneGroup:insert( spoon)

end
--------------------------------------------------------------------------------------------

-- The function called when the scene is issued to appear on screen
function scene:show( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is still off screen (but is about to come on screen).
    if ( phase == "will" ) then
       
    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        -- start the splash screen music

        -- Call the moveplate, slime, fork, and spoon functions as soon as we enter the frame.        
        Runtime:addEventListener("enterFrame", MovePlate)
        Runtime:addEventListener("enterFrame", MoveSlime)
        Runtime:addEventListener("enterFrame", MoveFork)
        Runtime:addEventListener("enterFrame", MoveSpoon)

        -- Go to the main menu screen after the given time.
        timer.performWithDelay ( 3000, gotoMainMenu)          
        
    end

end --function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view
    local phase = event.phase

    -----------------------------------------------------------------------------------------

    -- Called when the scene is on screen (but is about to go off screen).
    -- Insert code here to "pause" the scene.
    -- Example: stop timers, stop animation, stop audio, etc.
    if ( phase == "will" ) then  

    -----------------------------------------------------------------------------------------

    -- Called immediately after scene goes off screen.
    elseif ( phase == "did" ) then
        -- remove event listeners
        Runtime:removeEventListener("enterFrame", MovePlate)
        Runtime:removeEventListener("enterFrame", MoveSlime)
        Runtime:removeEventListener("enterFrame", MoveFork)
        Runtime:removeEventListener("enterFrame", MoveSpoon)
    end

end --function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------


    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.
end -- function scene:destroy( event )


-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
