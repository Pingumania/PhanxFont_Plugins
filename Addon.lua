local Addon = _G.PhanxFont
local ADDON_NAME, ns = ...

local fontObjects = {}

function ns.RegisterFontObject(obj, size)
	fontObjects[obj] = {}
	fontObjects[obj].size = size
end

local function SetPluginFonts()
	for obj, table in pairs(fontObjects) do
		Addon:SetFont(obj, ns.NORMAL, table.size)
	end
end

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addon)
	ns.NORMAL     = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.normal)
	ns.BOLD       = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.bold)
	ns.DAMAGE     = LibStub("LibSharedMedia-3.0"):Fetch("font", PhanxFontDB.damage)

	SetPluginFonts()

	-- frame:UnregisterEvent("ADDON_LOADED")
end)