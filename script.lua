local plr = game.Players.LocalPlayer
local chat = game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest

local function findPlayer(stringg)
    for _, v in pairs(game.Players:GetPlayers()) do
        if stringg:lower() == (v.Name:lower()):sub(1, #stringg) then
            return v
        end
    end
end

plr.Chatted:Connect(function(msg)
    args = msg:split(" ")
    if args[1] == ".arrest" then
        if args[2] == nil then
            for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
                i = 0
                repeat wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    game.Workspace.Remote.arrest:InvokeServer(player.Character.HumanoidRootPart)
                    i = i + 1
                until i == 10
            end
        else
            local player = findPlayer(args[2])
            if player then
                local i = 0
                repeat wait(0.1)
                    plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
                    game.Workspace.Remote.arrest:InvokeServer(player.Character.HumanoidRootPart)
                    i = i + 1
                until i == 10
            else
                wait(0.5)
                chat:FireServer("No player found!","all")
            end
        end
    elseif msg == ".cmds" then
        wait(0.5)
        chat:FireServer("Commands: .arrest <player>, .give <gun>, .rejoin, .cmds","all")
    elseif args[1] == ".give" then
        local function findgun(stringg)
            local guns = {
                "Remington 870",
                "M9",
                "AK-47",
                "M4A1"
            }
            
            for i,v in pairs(guns) do
                if stringg:lower() == (v:lower()):sub(1, #stringg) then
                    return v
                end
            end
        end
        
        local gun = findgun(args[2])
        if gun then
            local giver = game:GetService("Workspace")["Prison_ITEMS"].giver[gun].ITEMPICKUP
            game.Workspace.Remote.ItemHandler:InvokeServer(giver)
            wait(0.5)
            chat:FireServer("Gave Gun","all")
        else
            chat:FireServer("No gun found","all")
        end
    elseif args[1] == ".rejoin" then
        game:GetService("TeleportService"):Teleport(game.PlaceId)
    end
end)

chat:FireServer("Loaded Atom/Avian's Admin script","all")
chat:FireServer("Made by Avian 0004","all")
chat:FireServer("Prefix: .","all")
