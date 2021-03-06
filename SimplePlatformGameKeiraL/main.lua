-----------------------------------------------------------------------------------------
-- Title: Simple Platform Game
-- Name: Keira Lawson
-- Course: ICS2O/3C
-- This program is a simple platform game, when the character hits 3 soccer balls 
-- the character can go to the door and the player wins. I added a sound effect for the
-- "you lose", "you win", and hitting the spikes. I added a right wall so the character 
-- cannot go off screen.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar( display.HiddenStatusBar )

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "level1_screen" )