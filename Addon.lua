local _, ns = ...
local Addon = _G.PhanxFont

local pending = {}
local fontObjects = {}

--[[ ns.RegisterPlugin(_addon_, _action_)
Runs `action` once `addon` is loaded, or straight away if it already is.
--]]
function ns.RegisterPlugin(addon, action)
	if not (addon and action) then
		return
	end

	if C_AddOns.IsAddOnLoaded(addon) then
		action()
	else
		pending[addon] = action
	end
end

--[[ ns.UnregisterPlugin(_addon_)
Drops a plugin registered with `ns.RegisterPlugin` that has not run yet.
--]]
function ns.UnregisterPlugin(addon)
	pending[addon] = nil
end

--[[ ns.ApplyFont(_obj_)
Restyles one registered font object with the current normal font.
--]]
function ns.ApplyFont(obj)
	local info = fontObjects[obj]
	if info then
		Addon:SetFont(obj, Addon.Fonts.normal, info.size, info.outline)
	end
end

--[[ ns.RegisterFontObject(_obj_[, _size_])
Takes ownership of a font object, restyling it now and whenever the fonts change.
`size` defaults to the object's current size.
--]]
function ns.RegisterFontObject(obj, size)
	if not obj then
		return
	end

	local font, current, outline = obj:GetFont()
	if not font then
		return
	end

	fontObjects[obj] = {size = size or current, outline = outline}
	ns.ApplyFont(obj)
end

--[[ ns.SetPluginFonts()
Restyles every registered font object. Called automatically after PhanxFont applies its fonts.
--]]
function ns.SetPluginFonts()
	for obj in next, fontObjects do
		ns.ApplyFont(obj)
	end
end

hooksecurefunc(Addon, "SetFonts", ns.SetPluginFonts)

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(_, _, addon)
	local action = pending[addon]
	if action then
		pending[addon] = nil
		action()
	end
end)
