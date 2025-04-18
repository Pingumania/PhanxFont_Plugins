local ADDON_NAME, ns = ...

local _E
local fontInstances = {}

local function GetChildren(frame)
	if frame:GetNumChildren() > 0 then
		local children = {frame:GetChildren()}
		for i, child in ipairs(children) do
			if child:IsObjectType("FontString") then
				tinsert(fontInstances, child)
			end
			local regions = {child:GetRegions()}
			for j, region in ipairs(regions) do
				if region:IsObjectType("FontString") then
					tinsert(fontInstances, region)
				end
			end
			GetChildren(child)
		end
	end
end

local function GetChildFontInstances()
    fontInstances = {}
	GetChildren(WeakAurasFrame)
	for _, fontInstance in ipairs(fontInstances) do
		ns.RegisterFontObject(fontInstance)
	end
end

EventUtil.ContinueOnAddOnLoaded("WeakAuras", function()
	ns.RegisterPlugin("MRT", GetChildFontInstances)
end)