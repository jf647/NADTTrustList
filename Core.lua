--
-- $Date $Revision$
--

NTL = LibStub("AceAddon-3.0"):NewAddon(
    "NADTTrustList",
    "AceConsole-3.0"
)

function NTL:IsGroupTrusted()

	local grouptrusted = false

	if GetNumGroupMembers() > 0 then
		if IsInRaid then
			for i = 1, GetNumGroupMembers() do
				local name = UnitName("raid"..i, true)
				if not self:IsUnitTrusted(name) then
					return false
				end
			end
		else
			for i = 1, GetNumGroupMembers() do
				local name = UnitName("party"..i, true)
				if not self:IsUnitTrusted(name) then
					return false
				end
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
