local tweenService = game:GetService("TweenService")

local PlayerCanSpawn = true

game.Players.PlayerAdded:Connect(function(Player)
	if PlayerCanSpawn then
		Player.CharacterRemoving:Connect(function()
			if PlayerCanSpawn then
				Player:LoadCharacter()
			end
		end)
		
		Player:LoadCharacter()
	end
end)

wait(5)

local Phase = workspace.SFX["Essence of Machines"].Phase

Phase.Value = 1

script.EnableSWAT.Event:Wait()

PlayerCanSpawn = false
Phase.Value = 2

while true do
	wait(1)
	
	local AnyPlayerAlive = false
	local anyNPCAlive = false
	
	for _, player in pairs(game.Players:GetPlayers()) do
		if player.Character then
			if player.Character.Humanoid then
				if player.Character.Humanoid.Health > 0 then
					AnyPlayerAlive = true
					break
				end
			end
		end
	end
	
	for _, child in pairs(workspace:GetChildren()) do
		if child.Name == "SWAT" then
			anyNPCAlive = true
			break
		end
	end
	
	if not AnyPlayerAlive then
		Phase.Value = 3

		wait(5)

		for _, part in pairs(workspace:GetDescendants()) do
			if part:IsDescendantOf(workspace.PermaAnchored) then continue end

			if part:IsA("BasePart") then
				part.Anchored = false
			elseif part:IsA("ClickDetector") then
				part:Destroy()
			end
		end
		
		workspace.SFX.Explosion:Play()
		local Explosion = Instance.new("Explosion")
		Explosion.Position = Vector3.new(-10, 6, 10)
		Explosion.ExplosionType = Enum.ExplosionType.NoCraters
		Explosion.BlastRadius = 100
		Explosion.Parent = workspace
		
		break
	elseif not anyNPCAlive then
		local tween = tweenService:Create(workspace.SFX["Essence of Machines"], TweenInfo.new(5), {Volume = 0})
		tween:Play()
		wait(5)
		workspace.SFX["Essence of Machines"]:Stop()
	end
end
