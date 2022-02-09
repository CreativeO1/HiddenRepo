local RayCastParams = RaycastParams.new()
RayCastParams.FilterType = Enum.RaycastFilterType.Blacklist

local function GetAllPartsUntilTarget(origin, direction)
	local Parts = {}
	local raycastResult

	repeat
		RayCastParams.FilterDescendantsInstances = Parts
		raycastResult = workspace:Raycast(origin, direction, RayCastParams)
		
		if raycastResult then
			table.insert(Parts, raycastResult.Instance)
		end
	until raycastResult == nil
	
	return Parts
end

local NPC = script.Parent
local head = NPC.Head

local event = game.ServerScriptService.ServerHandler.EnableSWAT

event.Event:Connect(function()
	for _, v in pairs(NPC:GetChildren()) do
		if v:IsA("BasePart") then
			v.Anchored = false
		end
	end

	NPC["NPC AI"].Disabled = false
end)

while true do
	local visibleTarget = nil
	
	for _, plr in pairs(game.Players:GetPlayers()) do
		if plr.Character then
			if plr.Character.Head then
				local direction = plr.Character.Head.Position - head.Position

				local parts = GetAllPartsUntilTarget(head.Position, direction)
				
				local rayBlocked = false
				
				for _, part in pairs(parts) do
					if part:IsDescendantOf(NPC) or part:IsDescendantOf(plr.Character) or part.Transparency > 0 then
						continue
					else
						rayBlocked = true
						break
					end
				end
				
				if not rayBlocked then
					visibleTarget = plr.Character.Head
				end
			end
		end
	end
	
	if visibleTarget then
		event:Fire()
	end
	
	wait(2)
	
	if not script.Parent["NPC AI"].Disabled then
		break
	end
end

script:Destroy()
