local amakna_team =  {}

function amakna_team.main()
    printF.debug("amakna_team.lua", "main()")

    MIN_MONSTERS = 1
    if GROUP_LEVEL < 25 then
        MAX_MONSTERS = 2
        return amakna.fight()
    elseif GROUP_LEVEL < 41 then
        MIN_MONSTERS = 3
        MAX_MONSTERS = 5
        if character:lifePointsP() > 80 then
            MIN_MONSTERS = 3
            MAX_MONSTERS = 6
        end
        return amakna.fight()
    elseif GROUP_LEVEL < 51 then
        MIN_MONSTERS = 4
        MAX_MONSTERS = 8
        return amakna.fight()
    else
        if map:currentSubArea() == "Campagne d'Amakna" then
            MIN_MONSTERS = 3
            MAX_MONSTERS = 5
        end
        if GROUP_LEVEL > 60 then
            if character:lifePointsP() > 80 then
                MIN_MONSTERS = MIN_MONSTERS + 1
            end
            if MAX_MONSTERS > 1 then
                MAX_MONSTERS = MAX_MONSTERS + 1
            end
        end
        return amakna.fight_two()
    end
end

return amakna_team
