--
-- $Date $Revision$
--

NTL = LibStub("AceAddon-3.0"):NewAddon(
    "NADTTrustList",
    "AceConsole-3.0"
)

function NTL:IsGroupTrusted()

	local grouptrusted = false

	if GetNumRaidMembers() > 0 then
		for i = 1, GetNumRaidMembers() do
			local name = UnitName("raid"..i, true)
			if not self:IsUnitTrusted(name) then
				return false
			end
		end
	elseif GetNumPartyMembers() > 0 then
		for i = 1, GetNumPartyMembers() do
			local name = UnitName("party"..i, true)
			if not self:IsUnitTrusted(name) then
				return false
			end
		end
	end
	
	return true

end

function NTL:IsUnitTrusted(name)

	if NTL_DB.trusted[name] then return true else return false end

end

--
-- EOF
