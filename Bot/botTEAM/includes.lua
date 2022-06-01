
-- Functions
dofile("scripts\\Functions\\includes.lua")
dofile("scripts\\Bot\\botTEAM\\Functions\\includes.lua")
initTEAM = dofile("scripts\\Bot\\botTEAM\\initTEAM.lua")

-- Config
dofile("scripts\\Config\\includes.lua")
printF.Start()
global:loadConfiguration(xml.getPathConfig())

-- Manager
dofile("scripts\\Manager\\includes.lua")

-- Controller
dofile("scripts\\Controller\\includes.lua")

-- Objects
dofile("scripts\\Objects\\includes.lua")

-- Area
dofile("scripts\\Area\\includes.lua")

-- areaManager
dofile("scripts\\Bot\\botTEAM\\areaManager\\includes.lua")

-- Move
moveManager = dofile("scripts\\Bot\\botTEAM\\moveManager.lua")

-- Phenix
phenixManager = dofile("scripts\\Phenix\\phenixManager.lua")

-- IA
iaManager = dofile("scripts\\IA\\iaManager.lua")

-- Prefight
prefightManager = dofile("scripts\\IA\\prefightManager.lua")

-- Stopped
stoppedManager = dofile("scripts\\Manager\\stoppedManager.lua")


