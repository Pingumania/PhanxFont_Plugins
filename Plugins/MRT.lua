local ADDON_NAME, ns = ...

if not IsAddOnLoaded("MRT") then return end

ns.RegisterFontObject(ExRTFontNormal)
ns.RegisterFontObject(ExRTFontGrayTemplate)

if _G["MRTOptionsFrameMethod Raid Tools"] then
	local MRTOptionsFrame = _G["MRTOptionsFrameMethod Raid Tools"]
	if MRTOptionsFrame.score then
		ns.RegisterFontObject(MRTOptionsFrame.score)
	end
	ns.RegisterFontObject(MRTOptionsFrame.authorLeft)
	ns.RegisterFontObject(MRTOptionsFrame.authorRight)
	ns.RegisterFontObject(MRTOptionsFrame.versionLeft)
	ns.RegisterFontObject(MRTOptionsFrame.versionRight)
	ns.RegisterFontObject(MRTOptionsFrame.contactLeft)
	ns.RegisterFontObject(MRTOptionsFrame.contactRight)
	ns.RegisterFontObject(MRTOptionsFrame.thanksLeft)
	ns.RegisterFontObject(MRTOptionsFrame.thanksRight)
	if MRTOptionsFrame.translateLeft then
		ns.RegisterFontObject(MRTOptionsFrame.translateLeft)
	end
	if MRTOptionsFrame.translateRight then
		ns.RegisterFontObject(MRTOptionsFrame.translateRight)
	end
	ns.RegisterFontObject(MRTOptionsFrame.Changelog.Text)
	ns.RegisterFontObject(MRTOptionsFrame.Changelog.Header)

	ns.RegisterFontObject(MRTOptionsFrame.chkIconMiniMap.text)
	ns.RegisterFontObject(MRTOptionsFrame.chkHideOnEsc.text)

	hooksecurefunc(_G.MRTOptionsFrame.modulesList, "Update", function(self)
		_G.MRTOptionsFrame.modulesList:Font("ExRTFontNormal", 14)
	end)
end
