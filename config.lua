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

local M = ns[2]	
local mis = M.make_settings_template("COMBAT TEXT",266,570)

local st = {
	["blizzheadnumbers"] = "BLIZZARD OUTPUT",
	["damagestyle"] = "STYLE DAMAGE FONT",
	["damage"] = "SHOW DAMAGE",
	["healing"] = "SHOW HEALING",
	["showhots"] = "SHOW HOTS",
	["damagecolor"] = "DAMAGE COLOR",
	["icons"] = "SHOW ICONS",
	["petdamage"] = "PET DAMAGE",
	["dotdamage"] = "DET`S DAMAGE",
	["scrollable"] = "ABLE TO SCROLL",
	["stopvespam"] = "STOP SPAM (SHADOW)",
	["dkrunes"] = "DK RUNES",
	["mergeaoespam"] = "MERGE AOE SPAM",
	["killingblow"] = "KILLING BLOW",
	["dispel"] = "SHOW DISPEL",
	["interrupt"] = "SHOW INTERRUPT",}
	
M.tweaks_mvn(mis,ct,st,322)	

local st = {
	["iconsize"] = {"ICON SIZE RATIO",6,60},
	["treshold"] = {"MINIMUM DAMAGE TO ShOW",1,2000},
	["healtreshold"] = {"MINIMUM HEALING TO SHOW",1,2000},
	["fontsize"] = {"FONT SIZE",6,60},
	["damagefontsize"] = {"DAMAGE FONT SIZE",6,60},
	["timevisible"] = {"VISIBLE TIME",1,60},
	["maxlines"] = {"MAX LINES",12,256},
	["mergeaoespamtime"] = {"MERGE AOE SPAM TIME",1,60},}
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