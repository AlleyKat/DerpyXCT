-- No configs there!!!
local ns = select(2,...); ns[1] = {}
local ct = ns[1]
ns[2] = DerpyData[1]
ns[3] = DerpyData[2]

do
	if not _G.DerpyXCT then
		_G.DerpyXCT = {
			["blizzheadnumbers"] = false,
			["damagestyle"] = true,
			["damage"] = true,
			["healing"] = true,	
			["showhots"] = true,
			["damagecolor"] = true,
			["icons"] = true,
			["iconsize"] = 28,
			["petdamage"] = true,
			["dotdamage"] = true,
			["treshold"] = 1,
			["healtreshold"] = 1,
			["fontsize"] = 12,
			["damagefontsize"] = 12,
			["timevisible"] = 3, 
			["scrollable"] = false,
			["maxlines"] = 64,
			["justify_1"] = "LEFT",
			["justify_2"] = "RIGHT",
			["justify_3"] = "CENTER",
			["justify_4"] = "RIGHT",
			["stopvespam"] = false,
			["dkrunes"] = true,
			["mergeaoespam"] = true,
			["mergeaoespamtime"] = 3,
			["killingblow"] = false,
			["dispel"] = true,
			["interrupt"] = true,
			["fontstyle"] = "OUTLINE"
		}
	end
	for x,y in pairs(_G.DerpyXCT) do ct[x] = y end
end
	
local mis
local M = ns[2]
M.call.xct = function()
	if mis then mis:Show() return end
	local st = {
		["blizzheadnumbers"] = "Blizzard Output",
		["damagestyle"] = "Style Damage Font",
		["damage"] = "Show Damage",
		["healing"] = "Show Healing",
		["showhots"] = "Show Hots",
		["damagecolor"] = "Damage Color",
		["icons"] = "Show Icons",
		["petdamage"] = "Pet Damage",
		["dotdamage"] = "Dot`s Damage",
		["scrollable"] = "Able To Scroll",
		["stopvespam"] = "Stop Spam (Shadow Form)",
		["dkrunes"] = "DK Runes",
		["mergeaoespam"] = "Merge AOE Spam",
		["killingblow"] = "Killing Blow",
		["dispel"] = "Show Dispel",
		["interrupt"] = "Show Interrupt",}
	mis = M.make_settings(st,ct,300,256,"|cffff0000X|r COMBAT TEXT",true)
	local st = {
			["iconsize"] = {"Icon Size Ratio",6,60},
			["treshold"] = {"Minimum Damage To Show",1,2000},
			["healtreshold"] = {"Minimum Healing To Show",1,2000},
			["fontsize"] = {"Font Size",6,60},
			["damagefontsize"] = {"Damage Font Size",6,60},
			["timevisible"] = {"Visible Time",1,60},
			["maxlines"] = {"Max Lines",12,256},
			["mergeaoespamtime"] = {"Merge AOE Spam Time",1,60},}
	local bars = {}
		for name,text in pairs(st) do
			tinsert(bars,M.makevarbar(mis,254,text[2],text[3],ct,name,text[1]))
		end
		for i=1,8 do
			if i == 1 then 
				bars[i]:SetPoint("TOP",mis,0,-27)
			else
				bars[i]:SetPoint("TOP",bars[i-1],"BOTTOM")
			end
		end
	M.make_fonttype(mis,ct,"fontstyle","Font Style"):SetPoint("TOP",bars[8],"BOTTOM",0,-4)
	local acb = M.frame(mis,30,"HIGH")
	acb:SetSize(256,35)
	acb:SetPoint("TOP",mis,"BOTTOM",0,2)
	local about = M.setfont(acb,12,nil,nil,"CENTER")
	about:SetPoint("CENTER",0,1.5)
	about:SetSize(256,36)
	about:SetText("This is only a part of configuration\n Type |cffff0000/xct|r to get another one")
	mis:Show()
end
