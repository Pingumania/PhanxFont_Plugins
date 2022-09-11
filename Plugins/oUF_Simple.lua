local ADDON_NAME, ns = ...

if not IsAddOnLoaded("oUF_Simple") then return end

if oUF_SimplePlayer.Name then ns.RegisterFontObject(oUF_SimplePlayer.Name) end
if oUF_SimplePlayer.Health then ns.RegisterFontObject(oUF_SimplePlayer.Health.Text) end
if oUF_SimplePlayer.Castbar then ns.RegisterFontObject(oUF_SimplePlayer.Castbar.Text) end
if oUF_SimpleTarget.Name then ns.RegisterFontObject(oUF_SimpleTarget.Name) end
if oUF_SimpleTarget.Health then ns.RegisterFontObject(oUF_SimpleTarget.Health.Text) end
if oUF_SimpleTarget.Castbar then ns.RegisterFontObject(oUF_SimpleTarget.Castbar.Text) end
if oUF_SimpleFocus.Name then ns.RegisterFontObject(oUF_SimpleFocus.Name) end
if oUF_SimpleFocus.Health then ns.RegisterFontObject(oUF_SimpleFocus.Health.Text) end
if oUF_SimpleFocus.Castbar then ns.RegisterFontObject(oUF_SimpleFocus.Castbar.Text) end
if oUF_SimplePet.Name then ns.RegisterFontObject(oUF_SimplePet.Name) end
if oUF_SimplePet.Health then ns.RegisterFontObject(oUF_SimplePet.Health.Text) end
if oUF_SimplePet.Castbar then ns.RegisterFontObject(oUF_SimplePet.Castbar.Text) end
if oUF_SimpleTargetTarget.Name then ns.RegisterFontObject(oUF_SimpleTargetTarget.Name) end
if oUF_SimpleTargetTarget.Health then ns.RegisterFontObject(oUF_SimpleTargetTarget.Health.Text) end
for i = 1, 5 do
	local arena = _G["oUF_SimpleArena"..i]
	if arena then
		ns.RegisterFontObject(arena.Name)
		ns.RegisterFontObject(arena.Health.Text)
		ns.RegisterFontObject(arena.Castbar.Text)
	end

	local party = _G["oUF_SimplePartyHeaderUnitButton"..i]
	if party then
		ns.RegisterFontObject(party.Name)
		ns.RegisterFontObject(party.Health.Text)
	end
end
for i = 1, MAX_BOSS_FRAMES do
	local boss = _G["oUF_SimpleBoss"..i]
	if boss then
		ns.RegisterFontObject(boss.Name)
		ns.RegisterFontObject(boss.Health.Text)
		ns.RegisterFontObject(boss.Castbar.Text)
	end
end

-- ns.RegisterFontObject(oUF_SimpleParty.Name)
-- ns.RegisterFontObject(oUF_SimpleParty.Health.Text)
-- ns.RegisterFontObject(oUF_SimpleParty.Castbar.Text)

-- ns.RegisterFontObject(oUF_SimpleRaid.Name)
-- ns.RegisterFontObject(oUF_SimpleRaid.Health.Text)
-- ns.RegisterFontObject(oUF_SimpleRaid.Castbar.Text)