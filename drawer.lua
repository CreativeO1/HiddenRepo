local TweenService = game:GetService("TweenService")

local LDrawerTweenClose = TweenService:Create(script.Parent.LeftDrawer.Union, TweenInfo(2), {CFrame = script.Parent.LeftDrawer.Union.CFrame})
local RDrawerTweenClose = TweenService:Create(script.Parent.RightDrawer.Union, TweenInfo(2), {CFrame = script.Parent.RightDrawer.Union.CFrame})

local LDrawerTweenOpen = TweenService:Create(script.Parent.LeftDrawer.Union, TweenInfo(2), {CFrame = script.Parent.LeftDrawer.Union.CFrame * CFrame.new(Vector3.new(0, 0, 5))})
local RDrawerTweenOpen = TweenService:Create(script.Parent.RightDrawer.Union, TweenInfo(2), {CFrame = script.Parent.RightDrawer.Union.CFrame * CFrame.new(Vector3.new(0, 0, 5))})

local LDrawerOpen = false
local RDrawerOpen = false
local LDrawerDebounce = true
local RDrawerDebounce = true

script.Parent.LeftDrawer.ClickDetector.MouseClick:Connect(function()
	if LDrawerDebounce then
		LDrawerDebounce = false
		
		if LDrawerOpen then
			LDrawerTweenClose:Play()
		else
			LDrawerTweenOpen:Play()
		end
		
		wait(2.5)
		LDrawerDebounce = true
	end
end)

script.Parent.RightDrawer.ClickDetector.MouseClick:Connect(function()
	if RDrawerDebounce then
		RDrawerDebounce = false

		if LDrawerOpen then
			RDrawerTweenClose:Play()
		else
			RDrawerTweenOpen:Play()
		end

		wait(2.5)
		RDrawerDebounce = true
	end
end)
