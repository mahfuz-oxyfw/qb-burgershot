
RegisterServerEvent("qb-burgershot:bill:player")
AddEventHandler("qb-burgershot:bill:player", function(playerId, amount)
        local biller = QBCore.Functions.GetPlayer(source)
        local billed = QBCore.Functions.GetPlayer(tonumber(playerId))
        local customerbank = billed.PlayerData.money["bank"]
        local amount = tonumber(amount)
        if biller.PlayerData.job.name == 'burgershot' then
            if billed ~= nil then
                --if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
                    if amount and amount > 99 then
                        if (customerbank - amount) >= 0 then

                            billed.Functions.RemoveMoney("bank",amount,"paid-bill")
                            TriggerClientEvent("QBCore:Notify", billed.PlayerData.source, "You Paid $"..amount.." For Your Food!" , "success")
                            TriggerEvent("qb-bossmenu:server:addAccountMoney", "burgershot", (amount * 0.25))
                            biller.Functions.AddMoney("bank",(amount * 0.75),"paid-bill")
                            TriggerClientEvent("QBCore:Notify", source, "Your Shop Got $"..(amount * 0.25).." From Customer! (25%)", "success")
                            TriggerClientEvent("QBCore:Notify", source, "You Got $"..(amount * 0.75).." From Customer! (75%)", "success")
                            TriggerClientEvent("QBCore:Notify", source, "Your expense was 40% TK & your shop took 25% TK, finally you earned 35% TK")
                        else
                            TriggerClientEvent('QBCore:Notify', source, 'The customer have not enough money, he is missing $'..(amount - customerbank)..' in his bank!', 'error')
                        end
                    else
                        TriggerClientEvent('QBCore:Notify', source, 'Must Be A Valid Amount Above 99', 'error')
                    end
                --else
                --    TriggerClientEvent('QBCore:Notify', source, 'You Cannot Bill Yourself', 'error')
                --end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Player Not Online', 'error')
            end
        else
            TriggerClientEvent('QBCore:Notify', source, 'No Access', 'error')
        end
end)


QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBurgerMoneyShot', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        if lettuce.amount >= 2 and meat.amount >= 1 and bun.amount >= 1 and tomato.amount >= 2 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBurgerBleeder', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        if lettuce.amount >= 2 and meat.amount >= 2 and bun.amount >= 1 and tomato.amount >= 3 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientBurgerHeartStopper', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    if lettuce ~= nil and meat ~= nil and bun ~= nil and tomato ~= nil then
        if lettuce.amount >= 1 and meat.amount >= 3 and bun.amount >= 1 and tomato.amount >= 1 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientTorpedo', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local meat = Ply.Functions.GetItemByName("burger-meat")
    local bun = Ply.Functions.GetItemByName("burger-bun")
    if meat ~= nil and bun ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMeatfree', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local bun = Ply.Functions.GetItemByName("burger-bun")
    local tomato = Ply.Functions.GetItemByName("burger-tomato")
    local lettuce = Ply.Functions.GetItemByName("burger-lettuce")
    if bun ~= nil and lettuce ~= nil and tomato ~= nil then
        if bun.amount >= 2 and tomato.amount >= 2 and lettuce.amount >= 2 then 
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-burgershot:server:get:ingredientMurderMeal', function(source, cb)
    local src = source
    local Ply = QBCore.Functions.GetPlayer(src)
    local fries = Ply.Functions.GetItemByName("burger-fries")
    local heartstopper = Ply.Functions.GetItemByName("burger-heartstopper")
    local software = Ply.Functions.GetItemByName("burger-softdrink")
    if fries ~= nil and heartstopper ~= nil and software ~= nil then
        cb(true)
    else
        cb(false)
    end
end)

QBCore.Functions.CreateUseableItem("burger-murdermeal", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-burgershot:MurderMeal", source, item.name)
end)
