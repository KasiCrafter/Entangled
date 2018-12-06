local IM_WorldMenu = nil

local function init(self)

	local originalConditionalHook
	if originalConditionalHook == nil then

		function modApi:conditionalHook(conditionFn, fn, remove)
			assert(type(conditionFn) == "function")
			assert(type(fn) == "function")
			remove = remove == nil and true or remove
			assert(type(remove) == "boolean")

			table.insert(self.conditionalHooks, {
				condition = conditionFn,
				hook = fn,
				remove = remove
			})
		end
	end

	IM_WorldMenu = require(self.scriptPath.."worldmenu")
	IM_WorldMenu.visible = false

	sdlext.addUiRootCreatedHook(function(screen, uiRoot)
		IM_WorldMenu:create(screen, uiRoot)
	end)

end

local function load(self)

	modApi:conditionalHook(
		function()
			--LOG("Is Game? "..tostring(sdlext.isGame()))
			--LOG("Is Main Menu? "..tostring(sdlext.isMainMenu()))
			--LOG("Is Hangar? "..tostring(sdlext.isHangar()))
			--LOG("Mission Status? "..tostring(GetCurrentMission()))
			if sdlext.isGame() and GetCurrentMission() == nil and not (sdlext.isMainMenu() or sdlext.isHangar()) then
				return true
			else
				IM_WorldMenu.visible = false
				return false
			end
		end,
		function()
			LOG("eyy")
			IM_WorldMenu.visible = true
		end,
		false
	)


end

return {
	id = "IM_Drawtest",
	name = "Draw Test",
	version = "1.0.0",
	requirements = {},--Not a list of mods needed for our mod to function, but rather the mods that we need to load before ours to maintain compability 
	init = init,
	load = load,
}