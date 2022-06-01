local incarnam_team =  {}

function incarnam_team.main()
    printF.debug("incarnam_team.lua", "main()")

    MIN_MONSTERS = 1
    MAX_MONSTERS = 1

    if GROUP_LEVEL < 3 then
        toolF.regen(90)
    elseif GROUP_LEVEL < 6 then
        MAX_MONSTERS = 2
        toolF.regen(90)
    elseif GROUP_LEVEL < 12 then
        MAX_MONSTERS = 3
        toolF.regen(90)
    elseif GROUP_LEVEL < 15 then
        toolF.regen(90)
        MIN_MONSTERS = 2
        MAX_MONSTERS = 4
    elseif GROUP_LEVEL < 20 then
        toolF.regen(90)
        MIN_MONSTERS = 2
        MAX_MONSTERS = 5
    elseif GROUP_LEVEL < 30 then
        toolF.regen(90)
        MIN_MONSTERS = 3
        MAX_MONSTERS = 6
    else
        MIN_MONSTERS = 5
        MAX_MONSTERS = 8
    end
    return incarnam.fight()
end

return incarnam_team
