local main = require(game.Nanoblox)
local Args = {}



-- ARRAY
Args.array = {
	
	-----------------------------------
	{
		name = "player",
		aliases = {},
		description	= "",
		defaultValue = 0,
		playerArg = true,
		parse = function(self, qualifiers)
			local targetsDict = {}
			for qualifierName, qualifierArgs in pairs(qualifiers or {}) do
				local targets = main.modules.Qualifiers.dictionary[qualifierName]
				for _, plr in pairs(targets) do
					targetsDict[plr] = true
				end
			end
			local players = {}
			for plr, _ in pairs(targetsDict) do
				table.insert(players, plr)
			end
			return players
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "players",
		aliases = {},
		description	= "",
		defaultValue = 0,
		playerArg = true,
		parse = function(self, qualifiers)
			return main.modules.Args.dictionary.player:parse(qualifiers)
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "optionalplayers",
		aliases = {},
		description	= "Hides the players argument for general use and only displays it within the preview menu.",
		defaultValue = 0,
		playerArg = true,
		hidden = true,
		parse = function(self, qualifiers)
			if qualifiers == nil then
				return main.Players:GetPlayers()
			end
			local qualifierPresent = false
			for k,v in pairs(self.qualifiers) do
				qualifierPresent = true
			end
			if not qualifierPresent then
				return main.Players:GetPlayers()
			end
			return main.modules.Args.dictionary.player:parse(qualifiers)
		end,
	};
	
	
	
	-----------------------------------
	{
		-- Consider filters for specific players or broadcast
		name = "text",
		aliases = {"string", "reason", "question", "teamname"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "code",
		aliases = {"lua"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "number",
		aliases = {"integer", "studs", "speed", "intensity"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "degrees",
		aliases = {},
		description	= "",
		defaultValue = 180,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "role",
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "color",
		aliases = {"colour", "color3", "uigradient", "colorgradient", "gradient"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "bool",
		aliases = {"boolean", "trueOrFalse", "yesOrNo"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "stat",
		aliases = {"statName"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "scale", -- Consider scale limits
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "gearId", -- Consider gear limits
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "user",
		aliases = {"username", "userid", "playerid", "playername"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "team",
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "teamcolor",
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "material",
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "tool",
		aliases = {"gear", "item"},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	{
		name = "morph",
		aliases = {},
		description	= "",
		defaultValue = 0,
		parse = function(self, stringToParse)
			
		end,
	};
	
	
	
	-----------------------------------
	
};



-- DICTIONARY
-- This means instead of scanning through the array to find a name match
-- you can simply do ``Args.dictionary.ARGUMENT_NAME`` to return its item
Args.dictionary = {}
for _, item in pairs(Args.array) do
	Args.dictionary[item.name] = item
	for _, alias in pairs(item.aliases) do
		Args.dictionary[alias] = item
	end
end



-- SORTED ARRAY(S)
Args.playerArgsWithoutHiddenDictionary = {}
for _, item in pairs(Args.array) do
	if item.playerArg and not item.hidden then
		Args.playerArgsWithoutHiddenDictionary[item.name] = true
	end
end



return Args