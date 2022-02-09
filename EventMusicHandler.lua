local RunService = game:GetService("RunService")

local Music = workspace.SFX["Essence of Machines"]
local Phase = workspace.SFX["Essence of Machines"].Phase

local FirstConnection
local SecondConnection

Phase.Changed:Connect(function()
	
	if Phase.Value == 1 then
		Music:Play()
		
		FirstConnection = RunService.Heartbeat:Connect(function()
			if Music.TimePosition > 11 then
				Music.TimePosition = 0
			end
		end)
	elseif Phase.Value == 2 then
		FirstConnection:Disconnect()

		SecondConnection = RunService.Heartbeat:Connect(function()
			if Music.TimePosition < 11 then
				Music.TimePosition = 11
			end
		end)
	else
		FirstConnection:Disconnect()
		SecondConnection:Disconnect()
		Music:Stop()
	end
end)
