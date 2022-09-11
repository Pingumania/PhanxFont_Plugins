local ADDON_NAME, ns = ...

if not CrystalSocketsAddon then return end

for slotID, info in pairs(CrystalSocketsAddon.slots.info) do
	ns.RegisterFontObject(CrystalSocketsAddon.slots.info[slotID].enchantFrame.fontString, 13)
end
