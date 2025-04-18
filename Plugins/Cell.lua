local ADDON_NAME, ns = ...

local fontInstances = {}

local function GetChildren(frame)
	local regions = {frame:GetRegions()}
	for _, region in ipairs(regions) do
		if region:IsObjectType("FontString") then
			tinsert(fontInstances, region)
		end
	end
end

local function GetChildFontInstances()
    fontInstances = {}
	GetChildren(CellBattleResFrame)
	for _, fontInstance in ipairs(fontInstances) do
		ns.RegisterFontObject(fontInstance)
	end
end

EventUtil.ContinueOnAddOnLoaded("Cell", function()
	ns.RegisterPlugin("Cell", GetChildFontInstances)
end)


