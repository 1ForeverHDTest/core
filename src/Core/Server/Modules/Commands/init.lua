local main = require(game.Nanoblox)
local Commands = {
	array = {},
	dictionary = {},
}



local function setupCommands(group, tags)
	local groupClass = group.ClassName
	local thisTag = (groupClass == "Folder" or groupClass == "Configuration") and group.Name:lower()
	local newTags = tags and {table.unpack(tags)} or {}
	if thisTag then
		table.insert(newTags, thisTag)
	end
	for _, instance in pairs(group:GetChildren()) do
		if instance:IsA("ModuleScript") then
			local command = require(instance)
			command.tags = (typeof(command.tags == "table") and command.tags) or {}
			command.UID = instance.Name
			print(instance.Name, "tags = ", table.unpack(newTags))
			for _, tagToAdd in pairs(newTags) do
				table.insert(command.tags, tagToAdd)
			end
			local client = instance:FindFirstChild("Client") or instance:FindFirstChild("client")
			if client then
				client.Name = instance.Name
				client.Parent = main.shared.Modules.ClientCommands
			end
			table.insert(Commands.array, command)
			Commands.dictionary[command.name] = command
		else
			setupCommands(instance, newTags)
		end
	end
end
setupCommands(script)



return Commands