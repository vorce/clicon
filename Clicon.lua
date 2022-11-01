local SupportedUnits = { ['player'] = true, ['party1'] = true, ['party2'] = true, ['party3'] = true, ['party4'] = true, ['focus'] = true, ['target'] = true }

function SetClassPortrait(frame)
    local _, unitClass = UnitClass(frame.unit)
    if (unitClass and UnitIsPlayer(frame.unit)) then
        frame.portrait:SetTexture("Interface\\TargetingFrame\\UI-Classes-Circles")
        frame.portrait:SetTexCoord(unpack(CLASS_ICON_TCOORDS[unitClass]))
    else
        frame.portrait:SetTexCoord(0, 1, 0, 1)
    end
end

hooksecurefunc("UnitFramePortrait_Update", function (self)
    if (SupportedUnits[self.unit] and self.portrait) then
        SetClassPortrait(self)
    end
end)
