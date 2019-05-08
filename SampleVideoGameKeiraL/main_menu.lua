-----------------------------------------------------------------------------------------
--
-- main_menu.lua
-- Created by: Your Name
-- Date: Month Day, Year
-- Description: This is the main menu, displaying the credits, instructions & play buttons.
-----------------------------------------------------------------------------------------

-----------------------------------------------------------------------------------------
-- INITIALIZATIONS
-----------------------------------------------------------------------------------------

-- Use Composer Library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Use Widget Library
local widget = require( "widget" )

-----------------------------------------------------------------------------------------

-- Naming Scene
sceneName = "main_menu"

-----------------------------------------------------------------------------------------

-- Creating Scene Object
local scene = composer.newScene( sceneName )

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES
-----------------------------------------------------------------------------------------

local bkg_image
local playButton
local creditsButton
local instructionsButton
local muteButton
local unmuteButton

-- background music
local bkgMusic = audio.loadStream("Sounds/mii-plaza.mp3")
local bkgMusicChannel 

-----------------------------------------------------------------------------------------
-- GLOBAL VARIABLES
-----------------------------------------------------------------------------------------

soundOn = true

-----------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-----------------------------------------------------------------------------------------

-- Creating Transition Function to Credits Page
local function CreditsTransition( )       
    composer.gotoScene( "credits_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------
-- Creating Transition Function to Instructions Page
local function InstructionsTransition( )       
    composer.gotoScene( "instruction_screen", {effect = "flipFadeOutIn", time = 500})
end 

-----------------------------------------------------------------------------------------

-- Creating Transition to Level1 Screen
local function Level1ScreenTransition( )
    composer.gotoScene( "level1_screen", {effect = "flipFadeOutIn", time = 1000})
end    

-----------------------------------------------------------------------------------------

-- this function mmutes the sound when the mute button is pressed
local function Mute(touch)
    if (touch.phase == "ended") then
        -- pause the sound 
        audio.pause(bkgMusic)
        -- set the boolean variable to be false (sound is now muted)
        soundOn = false
        -- hide the mute button
        muteButton.isVisible = false
        -- reveal the unmute button
        unmuteButton.isVisible = true
    end
end


-----------------------------------------------------------------------------------------
-- GLOBAL SCENE FUNCTIONS
-----------------------------------------------------------------------------------------

-- The function called when the screen doesn't exist
function scene:create( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------
    -- BACKGROUND IMAGE & STATIC OBJECTS
    -----------------------------------------------------------------------------------------

    -- Insert the background image and set it to the center of the screen
    bkg_image = display.newImage("Images/MainMenuScreen.png")
    bkg_image.x = display.contentCenterX
    bkg_image.y = display.contentCenterY
    bkg_image.width = display.contentWidth
    bkg_image.height = display.contentHeight


    -- Associating display objects with this scene 
    sceneGroup:insert( bkg_image )

    -----------------------------------------------------------------------------------------
    -- BUTTON WIDGETS
    -----------------------------------------------------------------------------------------   

    -- Creating Play Button
    playButton = widget.newButton( 
        {   
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*4.75/8,

            -- Insert the images here
            defaultFile = "Images/PlayButtonUnpressed.png",
            overFile = "Images/PlayButtonPressed.png",

            -- When the button is released, call the Level1 screen transition function
            onRelease = Level1ScreenTransition          
        } )


        -- scale down the size
        playButton:scale(0.55, 0.55)

    -----------------------------------------------------------------------------------------

    -- Creating Credits Button
    creditsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*7.25/8,

            -- Insert the images here
            defaultFile = "Images/CreditsButtonUnpressed.png",
            overFile = "Images/CreditsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = CreditsTransition
        } ) 

        -- scale down the size
        creditsButton:scale(0.55, 0.55)

    -----------------------------------------------------------------------------------------

    -- Creating instructions Button
    instructionsButton = widget.newButton( 
        {
            -- Set its position on the screen relative to the screen size
            x = display.contentWidth*1/8,
            y = display.contentHeight*6/8,

            -- Insert the images here
            defaultFile = "Images/InstructionsButtonUnpressed.png",
            overFile = "Images/InstructionsButtonPressed.png",

            -- When the button is released, call the Credits transition function
            onRelease = InstructionsTransition
        } ) 


        -- scale down the size
        instructionsButton:scale(0.55, 0.55)

    -----------------------------------------------------------------------------------------
    -- creating the mute button
    muteButton = display.newImageRect("Images/muteButton.png", 200, 200)
    muteButton.x = display.contentWidth*1/10
    muteButton.y = display.contentHeight*1.3/10
    muteButton.isVisible = true

    -- scale down the size
    muteButton:scale(0.75, 0.75)

    -----------------------------------------------------------------------------------------
    -- creating the unmute button
    unmuteButton = display.newImageRect("Images/unmuteButton.png", 200, 200)
    unmuteButton.x = display.contentWidth*1/10
    unmuteButton.y = display.contentHeight*1.3/10
    unmuteButton.isVisible = false   

    -- scale down the size
    muteButton:scale(0.75, 0.75)    
    
    -----------------------------------------------------------------------------------------
    -- Associating button widgets with this scene
    sceneGroup:insert( playButton )
    sceneGroup:insert( creditsButton )
    sceneGroup:insert( instructionsButton ) 
    sceneGroup:insert( muteButton )
    sceneGroup:insert( unmuteButton )

    -- INSERT INSTRUCTIONS BUTTON INTO SCENE GROUP

end -- function scene:create( event )   



-----------------------------------------------------------------------------------------

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

    -- Called when the scene is now on screen.
    -- Insert code here to make the scene come alive.
    -- Example: start timers, begin animation, play audio, etc.
    elseif ( phase == "did" ) then       
        -- play the background music for this scene
        bkgMusicChannel = audio.play( bkgMusic, {channel=1, loops=-1} )
        muteButton:addEventListener("touch", Mute)
    end

end -- function scene:show( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to leave the screen
function scene:hide( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -----------------------------------------------------------------------------------------

    local phase = event.phase

    -----------------------------------------------------------------------------------------

    if ( phase == "will" ) then
        bkgMusic = audio.stop()

    -----------------------------------------------------------------------------------------

    elseif ( phase == "did" ) then
        muteButton:removeEventListener("touch", Mute)

    end

end -- function scene:hide( event )

-----------------------------------------------------------------------------------------

-- The function called when the scene is issued to be destroyed
function scene:destroy( event )

    -- Creating a group that associates objects with the scene
    local sceneGroup = self.view

    -- Called prior to the removal of scene's view ("sceneGroup").
    -- Insert code here to clean up the scene.
    -- Example: remove display objects, save state, etc.

end -- function scene:destroy( event )

-----------------------------------------------------------------------------------------
-- EVENT LISTENERS
-----------------------------------------------------------------------------------------

-- Adding Event Listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

-----------------------------------------------------------------------------------------

return scene
