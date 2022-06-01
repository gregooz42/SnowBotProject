local astrub_team =  {}

function astrub_team.main()
    printF.debug("astrub_team.lua", "main()")

    if map:currentArea() == "Incarnam" then
        printF.info("On descend à Astrub !")
        return resetF.incarnamToAstrub()
    end

    MIN_MONSTERS = 1
    MAX_MONSTERS = 1

    if GROUP_LEVEL < 30 then
        MAX_MONSTERS = 2
    elseif GROUP_LEVEL < 40 then
        MIN_MONSTERS = 2
        MAX_MONSTERS = 3
    elseif GROUP_LEVEL < 50 then
        MIN_MONSTERS = 2
        MAX_MONSTERS = 5
    elseif GROUP_LEVEL < 60 then
        MIN_MONSTERS = 3
        MAX_MONSTERS = 6
    else
        MIN_MONSTERS = 5
        MAX_MONSTERS = 8
    end
    return astrub.fight()
end

return astrub_team
