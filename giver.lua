--[[ 
    script was made by skondoooo92
    discord https://discord.gg/4THYgrRQd3 
    site xeonhub.netlify.app
]]--

local plr = game:GetService("Players").LocalPlayer
local char = plr.Character
local watermark = loadstring(game:HttpGet("https://raw.githubusercontent.com/ProphecySkondo/Misc/refs/heads/main/watermark.lua"))()
local pack = plr:WaitForChild("Backpack", 3)
local humanoid = char:WaitForChild("Humanoid", 3)

function getalltools()
	local tools = {}
	for _, obj in pairs(workspace:GetDescendants()) do
		if obj:IsA("Tool") and obj.Parent ~= pack and not obj.Parent:IsA("Player") then
			table.insert(tools, obj)
		end
	end
	for _, player in pairs(game:GetService("Players"):GetPlayers()) do
		if player ~= plr and player.Backpack then
			for _, tool in pairs(player.Backpack:GetChildren()) do
				if tool:IsA("Tool") then
					table.insert(tools, tool)
				end
			end
		end
		if player.Character and player ~= plr then
			for _, tool in pairs(player.Character:GetChildren()) do
				if tool:IsA("Tool") then
					table.insert(tools, tool)
				end
			end
		end
	end
	for _, obj in pairs(game:GetService("ReplicatedStorage"):GetDescendants()) do
		if obj:IsA("Tool") then
			table.insert(tools, obj)
		end
	end
	pcall(function()
		for _, obj in pairs(game:GetService("ServerStorage"):GetDescendants()) do
			if obj:IsA("Tool") then
				table.insert(tools, obj)
			end
		end
	end)
	return tools
end
function collecttools()
	local tools = getalltools()
	local collected = 0
	for _, tool in pairs(tools) do
		pcall(function()
			if tool and tool.Parent and tool.Parent ~= pack then
				tool.Parent = pack
				collected = collected + 1
				task.wait(0.05)
			end
		end)
	end
	print("Collected " .. collected .. " tools!")
	return collected
end
function text(message)
	print("[XEON TOOL GIVER]:", tostring(message))
end
function dostuff()
	getgenv().getalltools = getalltools
	getgenv().collecttools = collecttools
	getgenv().savedtools = getalltools()
end

dostuff()
text("Use collecttools() to get all tools; savedtools(); getalltools()")
return {
	getalltools = getalltools,
	collecttools = collecttools,
	text = text
}
