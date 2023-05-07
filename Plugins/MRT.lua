local ADDON_NAME, ns = ...

local _E

local function getFrameFontStrings(table)
	for k, t in pairs(table) do
		if type(t) == "table" and t.IsObjectType then
			if t:IsObjectType("FontString") then
				ns.RegisterFontObject(t)
			elseif t:IsObjectType("Frame") then
				getFrameFontStrings(t)
			end
		end
	end
end

local function getWidgetFontStrings(widget, size)
	if not widget.T then
		for i = 1, #widget.List do
			ns.RegisterFontObject(widget.List[i].text, i == 1 and size + 2 or size)
		end
	else
		for i = 1, #widget.List do
			for j = 1, #widget.T do
				ns.RegisterFontObject(widget.List[i]["text"..j], size)
			end
		end
	end
end

local function enable()
	local MRT = _G["MRTOptionsFrame"]
	local MRTOptionsFrame = _G["MRTOptionsFrameMethod Raid Tools"]
	
	if MRT and MRTOptionsFrame then
		ns.RegisterFontObject(ExRTFontNormal)
		ns.RegisterFontObject(ExRTFontGrayTemplate)
		getFrameFontStrings(MRTOptionsFrame)

		MRTOptionsFrame:HookScript("OnShow", function()
			if _E then return end
			getWidgetFontStrings(MRT.modulesList, 13)
			ns.SetPluginFonts()
			_E = true
		end)

		ns.UnregisterPlugin("MRT")
	end
end

ns.RegisterPlugin("MRT", enable)