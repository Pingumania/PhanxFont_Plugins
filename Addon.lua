local Addon = _G.PhanxFont
local ADDON_NAME, ns = ...

local plugins = {}
local fontObjects = {}

function ns.RegisterPlugin(addon, action)
	if not addon then return end
	plugins[addon] = action
end

function ns.UnregisterPlugin(addon)
	if not addon then return end
	plugins[addon] = nil
end

function ns.RegisterFontObject(obj, size)
	if not obj then return end
	if fontObjects[obj] ~= nil then return end
	fontObjects[obj] = fontObjects[obj] or {}
	local font, _, outline = obj:GetFont()
	if not font then return end
	fontObjects[obj].size = size
	fontObjects[obj].outline = outline
end

local function SetPluginFonts()
	for obj, table in pairs(fontObjects) do
		if obj then
			Addon:SetFont(obj, ns.NORMAL, table.size, table.outline)
			fontObjects[obj] = nil
		end
	end
end
ns.SetPluginFonts = SetPluginFonts

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript("OnEvent", function(self, event, addon)
	if addon == "PhanxFont_Plugins"  then
		ns.NORMAL     = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.normal)
		ns.BOLD       = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.bold)
		ns.DAMAGE     = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.damage)
	elseif C_AddOns.IsAddOnLoaded("PhanxFont_Plugins") then
		for plugin, action in pairs(plugins) do
			if plugin and action and C_AddOns.IsAddOnLoaded(plugin) then
				action()
			end
		end

		SetPluginFonts()
	end
end)