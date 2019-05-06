-- Title: SampleVideoGame
-- Name: Keira L
-- Course: ICS2O/3C
-- This program runs a sample video game with an instructions screen
-- and credits screen to give the user information. It also displays a level 1 when you 
-- click play.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
