-- Functions
dofile("scripts\\Functions\\includes.lua")
dofile("scripts\\Bot\\botHDV\\Functions\\includes.lua")

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

-- Move
moveManager = dofile("scripts\\Bot\\botHDV\\moveManager.lua")

-- Phenix
phenixManager = dofile("scripts\\Phenix\\phenixManager.lua")

-- IA
iaManager = dofile("scripts\\IA\\iaManager.lua")

-- Prefight
prefightManager = dofile("scripts\\IA\\prefightManager.lua")

-- Developper
registerManager = dofile("scripts\\Developper\\registerHDV.lua")

-- Stopped
stoppedManager = dofile("scripts\\Manager\\stoppedManager.lua")




