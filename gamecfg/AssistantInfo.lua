pg = pg or {}

local var_0_0 = pg
local var_0_1 = {}

var_0_0.AssistantInfo = var_0_1
var_0_1.assistantEvents = {
	idleRandom1 = {
		action = "main_1",
		dialog = "main_1"
	},
	idleRandom2 = {
		action = "main_2",
		dialog = "main_2"
	},
	idleRandom3 = {
		action = "main_3",
		dialog = "main_3"
	},
	idleRandom4 = {
		action = "idle_1",
		dialog = "main_4"
	},
	idleRandom5 = {
		action = "idle_2",
		dialog = "main_5"
	},
	idleRandom6 = {
		action = "idle_3",
		dialog = "main_6"
	},
	idleRandom7 = {
		action = "main_4",
		dialog = "main_4"
	},
	idleRandom8 = {
		action = "main_5",
		dialog = "main_5"
	},
	idleRandom9 = {
		action = "main_7",
		dialog = "main_7"
	},
	event_complete = {
		action = "complete",
		dialog = "expedition"
	},
	event_login = {
		action = "login",
		dialog = "login"
	},
	home = {
		action = "home",
		dialog = "home"
	},
	mail = {
		action = "mail",
		dialog = "mail"
	},
	mission = {
		action = "mission",
		dialog = "mission"
	},
	mission_complete = {
		action = "mission_complete",
		dialog = "mission_complete"
	},
	event_wedding = {
		action = "wedding",
		dialog = "propose"
	},
	TouchHead = {
		action = "touch_head",
		dialog = "headtouch"
	},
	TouchBody = {
		action = "touch_body",
		dialog = "touch"
	},
	TouchSpecial = {
		action = "touch_special",
		dialog = "touch2"
	},
	event_change_in = {
		action = "change_in",
		dialog = ""
	},
	event_change_out = {
		action = "change_out",
		dialog = ""
	},
	event_change_get = {
		action = "get",
		dialog = ""
	}
}
var_0_1.assistantTouchParts = {
	"TouchSpecial",
	"TouchHead",
	"TouchBody"
}
var_0_1.assistantTouchEvents = {
	{
		"TouchSpecial"
	},
	{
		"TouchHead"
	},
	{
		"TouchBody",
		"idleRandom1",
		"idleRandom2",
		"idleRandom3",
		"idleRandom4",
		"idleRandom5",
		"idleRandom6",
		"idleRandom7",
		"idleRandom8",
		"idleRandom9"
	}
}
var_0_1.useNewTouchEventShip = {
	[205131] = {
		assistantTouchEventsNew = {
			{
				"TouchSpecial"
			},
			{
				"TouchHead"
			},
			{
				"TouchBody",
				"idleRandom1",
				"idleRandom2",
				"idleRandom3",
				"idleRandom4",
				"idleRandom5",
				"idleRandom6",
				"idleRandom8"
			}
		}
	}
}
var_0_1.action2Id = {
	touch_drag19 = 120,
	feeling2 = 23,
	touch_drag39 = 140,
	battle = 28,
	touch_drag3 = 104,
	touch_idle10 = 211,
	touch_drag6 = 107,
	mission = 9,
	touch_idle41 = 242,
	touch_idle4 = 205,
	touch_drag50 = 151,
	touch_body = 13,
	touch_drag5 = 106,
	touch_idle42 = 243,
	touch_idle43 = 244,
	touch_idle49 = 250,
	touch_idle50 = 251,
	idle = 1,
	feeling5 = 26,
	home_ex = 312,
	touch_drag40 = 141,
	touch_drag48 = 149,
	touch_idle39 = 240,
	main_1 = 2,
	main_2 = 3,
	wedding = 11,
	touch_drag20 = 121,
	hp_warning = 32,
	main_4 = 18,
	touch_idle28 = 229,
	touch_drag2 = 103,
	touch_drag10 = 111,
	touch_drag42 = 143,
	touch_idle36 = 237,
	touch_drag49 = 150,
	touch_idle1 = 202,
	touch_drag1 = 102,
	touch_special = 14,
	touch_idle17 = 218,
	touch_idle37 = 238,
	touch_idle20 = 221,
	main_2_ex = 302,
	touch_drag43 = 144,
	touch_drag8 = 109,
	touch_idle19 = 220,
	touch_drag26 = 127,
	touch_drag16 = 117,
	gold = 15,
	touch_drag = 101,
	touch_idle22 = 223,
	complete = 5,
	login = 6,
	touch_head = 12,
	upgrade = 27,
	touch_drag45 = 146,
	main_5 = 19,
	detail = 21,
	touch_idle = 201,
	home = 7,
	touch_idle11 = 212,
	oil = 16,
	feeling4 = 25,
	lose = 30,
	touch_idle34 = 235,
	touch_idle12 = 213,
	touch_drag9 = 110,
	diamond = 17,
	touch_drag41 = 142,
	touch_drag4 = 105,
	touch_idle24 = 225,
	touch_idle29 = 230,
	touch_idle6 = 207,
	touch_idle38 = 239,
	touch_drag44 = 145,
	main_3 = 4,
	change_in = 33,
	main_1_ex = 301,
	touch_idle9 = 210,
	touch_drag46 = 147,
	touch_idle5 = 206,
	touch_idle35 = 236,
	touch_drag22 = 123,
	touch_idle7 = 208,
	get = 35,
	touch_drag30 = 131,
	touch_drag47 = 148,
	win_mvp = 29,
	touch_idle44 = 245,
	unlock = 20,
	touch_drag23 = 124,
	touch_idle33 = 234,
	skill = 31,
	touch_drag12 = 113,
	touch_drag32 = 133,
	touch_idle25 = 226,
	touch_idle2 = 203,
	touch_drag25 = 126,
	touch_drag13 = 114,
	touch_drag33 = 134,
	touch_idle26 = 227,
	touch_idle23 = 224,
	touch_idle8 = 209,
	touch_idle48 = 249,
	touch_drag15 = 116,
	touch_drag28 = 129,
	touch_drag35 = 136,
	touch_idle3 = 204,
	touch_idle30 = 231,
	touch_drag18 = 119,
	touch_idle45 = 246,
	touch_drag38 = 139,
	main_3_ex = 303,
	touch_idle46 = 247,
	touch_drag21 = 122,
	feeling3 = 24,
	touch_idle27 = 228,
	touch_idle14 = 215,
	touch_drag11 = 112,
	touch_drag24 = 125,
	touch_drag31 = 132,
	mail = 8,
	feeling1 = 22,
	touch_idle31 = 232,
	mission_complete = 10,
	touch_drag14 = 115,
	touch_drag34 = 135,
	touch_idle40 = 241,
	touch_idle32 = 233,
	touch_drag27 = 128,
	touch_idle18 = 219,
	touch_idle47 = 248,
	touch_drag36 = 137,
	touch_idle21 = 222,
	touch_drag17 = 118,
	touch_drag37 = 138,
	touch_drag7 = 108,
	touch_idle15 = 216,
	touch_drag29 = 130,
	touch_special_ex = 311,
	change_out = 34,
	touch_idle16 = 217,
	touch_idle13 = 214
}
var_0_1.action2Words = {
	"main1",
	"main2",
	"main3",
	"mission",
	"mission_complete",
	"expedition",
	"login",
	"home",
	"mail",
	"touch",
	"touch2",
	"headtouch"
}
var_0_1.action2Drags = {
	touch_drag = 101,
	touch_idle2 = 203,
	touch_drag4 = 105,
	touch_idle1 = 202,
	touch_idle = 201,
	touch_idle4 = 205,
	touch_drag1 = 102,
	touch_idle3 = 204,
	touch_drag3 = 104,
	touch_idle5 = 206,
	touch_drag5 = 106,
	touch_drag2 = 103
}
var_0_1.idleActions = {
	var_0_1.action2Id.idle
}
var_0_1.IdleEvents = {
	"idleRandom1",
	"idleRandom2",
	"idleRandom3",
	"idleRandom4",
	"idleRandom5",
	"idleRandom6",
	"idleRandom7",
	"idleRandom8",
	"idleRandom9"
}
var_0_1.PaintingTouchEvents = {
	"TouchBody",
	"idleRandom1",
	"idleRandom2",
	"idleRandom3",
	"idleRandom4",
	"idleRandom5",
	"idleRandom6",
	"idleRandom9"
}
var_0_1.PaintingTouchParts = {
	["1"] = "TouchSpecial",
	["3"] = "TouchHead",
	["2"] = "TouchBody"
}

function var_0_1.enable()
	return HXSet.isHx()
end

function var_0_1.getAssistantTouchEvents(arg_2_0, arg_2_1)
	if var_0_1.enable() and var_0_1.assistantTouchParts[arg_2_0] == "TouchSpecial" then
		arg_2_0 = 1
	end

	if var_0_1.useNewTouchEventShip and var_0_1.useNewTouchEventShip[arg_2_1] then
		return var_0_1.useNewTouchEventShip[arg_2_1].assistantTouchEventsNew[arg_2_0]
	end

	return var_0_1.assistantTouchEvents[arg_2_0]
end

function var_0_1.getPaintingTouchEvents(arg_3_0)
	if var_0_1.enable() and var_0_1.PaintingTouchParts[arg_3_0] == "TouchSpecial" then
		arg_3_0 = "1"
	end

	return var_0_1.PaintingTouchParts[arg_3_0]
end

function var_0_1.isDisableSpecialClick(arg_4_0)
	if var_0_1.enable() and arg_4_0 == "touch2" then
		return true
	end

	return false
end

function var_0_1.filterAssistantEvents(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = {}

	arg_5_2 = arg_5_2 or 0

	local var_5_1 = ShipWordHelper.GetMainSceneWordCnt(arg_5_1, arg_5_2)

	for iter_5_0, iter_5_1 in ipairs(arg_5_0) do
		local var_5_2 = var_0_1.assistantEvents[iter_5_1].dialog
		local var_5_3 = string.split(var_5_2, "_")

		if var_5_3[1] == "main" then
			if var_5_1 >= tonumber(var_5_3[2]) then
				table.insert(var_5_0, iter_5_1)
			end
		else
			table.insert(var_5_0, iter_5_1)
		end
	end

	return var_5_0
end

var_0_1.Expressions = {
	dunkeerke = {
		faces = {
			propose = "2",
			feeling3 = "1",
			home = "1",
			touch2 = "1",
			expedition = "1",
			login = "1",
			mission_complete = "1",
			mission = "1",
			feeling2 = "1",
			feeling4 = "2",
			touch = "2",
			main_3 = "1",
			detail = "1"
		}
	},
	masazhusai = {
		faces = {
			login = "2",
			win_mvp = "1",
			mission_complete = "2",
			battle = "1"
		}
	},
	xixuegui_3 = {
		faces = {
			touch2 = "3",
			feeling5 = "1",
			main_1 = "1",
			win_mvp = "1",
			main_2 = "1",
			touch = "3",
			home = "3"
		}
	},
	safuke = {
		faces = {
			mail = "9",
			feeling3 = "9",
			main_1 = "10",
			main_2 = "7",
			expedition = "3",
			touch = "3",
			home = "4",
			mission = "2",
			touch2 = "14",
			feeling4 = "4",
			lose = "14",
			main_3 = "6",
			feeling5 = "2",
			profile = "9",
			mission_complete = "5",
			feeling2 = "4",
			detail = "13"
		}
	},
	bushi = {
		faces = {
			touch2 = "1",
			feeling3 = "2",
			main_1 = "2",
			lose = "1",
			main_2 = "1",
			win_mvp = "2",
			mission_complete = "2",
			feeling4 = "2"
		}
	},
	banrenma = {
		faces = {
			feeling4 = "3",
			feeling3 = "4",
			main_1 = "2",
			main_2 = "4",
			expedition = "3",
			touch2 = "4",
			login = "3",
			feeling1 = "1",
			main_3 = "3",
			detail = "4"
		}
	},
	birui_2 = {
		faces = {
			feeling1 = "3",
			lose = "3",
			main_1 = "2",
			touch = "1",
			touch_2 = "1",
			detail = "2"
		}
	},
	sanli_2 = {
		faces = {
			touch2 = "2",
			main_2 = "1",
			lose = "3",
			detail = "1",
			mail = "1",
			feeling1 = "3",
			home = "1",
			mission = "3"
		}
	},
	bangfeng_2 = {
		faces = {
			touch2 = "2",
			win_mvp = "1",
			main_1 = "3",
			main_3 = "1",
			login = "3",
			touch = "2",
			mission_complete = "1",
			feeling1 = "2"
		}
	},
	chuixue_4 = {
		faces = {
			login = "2",
			main_2 = "1",
			touch = "1",
			expedition = "2",
			home = "1",
			feeling2 = "2",
			mail = "2",
			feeling1 = "3",
			main_3 = "3",
			detail = "3"
		}
	},
	zaoshen_2 = {
		faces = {
			touch2 = "3",
			feeling2 = "2",
			touch = "3",
			home = "2",
			login = "1",
			feeling1 = "3",
			main_3 = "2",
			detail = "1"
		}
	},
	luodeni_3 = {
		faces = {
			touch2 = "1",
			login = "3",
			main_1 = "3",
			home = "3",
			main_2 = "2",
			feeling1 = "1",
			main_3 = "1",
			detail = "2"
		}
	},
	ajiakesi_2 = {
		faces = {
			default = "0"
		}
	},
	zaoshen_2 = {
		faces = {
			touch2 = "3",
			feeling2 = "2",
			touch = "3",
			home = "2",
			login = "1",
			feeling1 = "3",
			main_3 = "2",
			detail = "1"
		}
	},
	ajiakesi_2 = {
		faces = {
			default = "0",
			feeling3 = "1",
			feeling5 = "3",
			main_1 = "3",
			mail = "1",
			upgrade = "1",
			mission_complete = "3",
			propose = "2",
			touch2 = "1",
			login = "3",
			main_2 = "1",
			touch = "2"
		}
	},
	daqinghuayu = {
		faces = {
			feeling4 = "3",
			main_2 = "3",
			touch = "2",
			expedition = "2",
			home = "2",
			touch2 = "3",
			login = "3",
			feeling1 = "1",
			main_3 = "1",
			detail = "2"
		}
	},
	U81_2 = {
		faces = {
			propose = "2",
			home = "3",
			touch2 = "1",
			main_2 = "2",
			touch = "2",
			mission_complete = "1",
			feeling2 = "3",
			login = "1",
			feeling1 = "1",
			main_3 = "3",
			detail = "3"
		}
	},
	aisaikesi = {
		faces = {
			touch2 = "3",
			feeling3 = "2",
			feeling5 = "3",
			touch = "2",
			expedition = "2",
			feeling1 = "1",
			main_3 = "2"
		}
	},
	chuixue_3 = {
		faces = {
			feeling5 = "1",
			mail = "3",
			main_1 = "2",
			touch = "1",
			win_mvp = "2",
			mission = "3",
			touch2 = "2",
			battle = "3",
			propose = "1",
			lose = "2",
			main_3 = "3"
		}
	},
	guanghui_3 = {
		faces = {
			propose = "1",
			battle = "2",
			main_1 = "3",
			login = "4",
			touch = "4",
			mission = "2",
			touch2 = "3",
			skill = "3",
			hp_warning = "3",
			mail = "4",
			feeling1 = "2",
			main_3 = "2",
			detail = "1"
		}
	},
	junzhu_2 = {
		faces = {
			login = "3",
			upgrade = "1",
			main_1 = "1",
			main_2 = "3",
			touch = "1",
			win_mvp = "1",
			mission = "3",
			touch2 = "2",
			battle = "2",
			mail = "2",
			lose = "2",
			main_3 = "1"
		}
	},
	lumang = {
		faces = {
			touch = "10",
			propose = "5",
			main_1 = "3",
			main_2 = "12",
			lose = "9",
			win_mvp = "4",
			home = "7",
			mission = "12",
			touch2 = "7",
			battle = "1",
			feeling4 = "4",
			feeling1 = "1",
			main_3 = "11",
			feeling5 = "8",
			upgrade = "3",
			mission_complete = "7",
			feeling2 = "8",
			hp_warning = "9",
			detail = "2"
		}
	},
	mingshi_3 = {
		faces = {
			home = "3",
			feeling3 = "1",
			main_1 = "1",
			main = "3",
			touch2 = "2",
			upgrade = "1",
			mission_complete = "2",
			win_mvp = "2",
			feeling2 = "3",
			lose = "3",
			touch = "3",
			hp_warning = "4",
			feeling1 = "4",
			main_3 = "2",
			detail = "4"
		}
	},
	nvjiang_2 = {
		faces = {
			lose = "1",
			feeling3 = "3",
			feeling5 = "1",
			feeling2 = "1",
			feeling4 = "2",
			touch = "2",
			mission_complete = "3",
			mission = "3",
			touch2 = "3",
			propose = "2",
			feeling1 = "3"
		}
	},
	ouruola_3 = {
		faces = {
			feeling5 = "1",
			feeling3 = "2",
			main_1 = "2",
			home = "1",
			propose = "4",
			touch2 = "2",
			mission_complete = "3",
			login = "4",
			feeling2 = "3",
			skill = "3",
			main_2 = "4",
			lose = "1",
			main_3 = "1",
			detail = "3"
		}
	},
	yilishabai_2 = {
		faces = {
			login = "1",
			feeling3 = "2",
			main_1 = "2",
			mission_complete = "3",
			mission = "3",
			touch2 = "1",
			hp_warning = "1",
			mail = "2",
			feeling1 = "1",
			main_3 = "1",
			detail = "3"
		}
	},
	nandaketa_2 = {
		faces = {
			feeling4 = "2",
			propose = "4",
			main_1 = "1",
			mission_complete = "1",
			lose = "1",
			battle = "3",
			home = "4",
			main_2 = "3",
			touch = "4",
			hp_warning = "3",
			login = "4",
			feeling1 = "3",
			detail = "2"
		}
	},
	dafeng = {
		faces = {
			feeling1 = "2",
			feeling3 = "1",
			battle = "5",
			mail = "3",
			expedition = "1",
			lose = "4",
			hp_warning = "5",
			main_2 = "1",
			touch = "1",
			main_3 = "5"
		}
	},
	dafeng_2 = {
		faces = {
			feeling5 = "3",
			feeling3 = "2",
			main_1 = "1",
			lose = "1",
			home = "1",
			battle = "1",
			mission_complete = "2",
			mission = "2",
			touch = "3",
			skill = "3",
			hp_warning = "1",
			mail = "3",
			feeling1 = "1",
			main_3 = "3",
			detail = "2"
		}
	},
	huangchao = {
		faces = {
			win_mvp = "2",
			propose = "1",
			lose = "1",
			upgrade = "3",
			touch2 = "2",
			battle = "2",
			main_2 = "1",
			feeling1 = "2",
			main_3 = "2"
		}
	},
	gaoxiong_h = {
		faces = {
			propose = "1",
			home = "3",
			feeling5 = "3",
			lose = "2",
			main_2 = "1",
			win_mvp = "2",
			mission_complete = "3",
			touch = "2",
			touch2 = "1",
			feeling4 = "1",
			feeling1 = "2",
			main_3 = "3",
			detail = "3"
		}
	},
	jiahe_h = {
		faces = {
			home = "1",
			feeling3 = "3",
			main_1 = "1",
			feeling5 = "1",
			win_mvp = "4",
			upgrade = "1",
			mission_complete = "1",
			main_2 = "2",
			touch2 = "2",
			touch = "3",
			skill = "1",
			propose = "2",
			feeling1 = "4",
			main_3 = "4",
			detail = "2"
		}
	},
	lingbo_h = {
		faces = {
			main_2 = "5",
			feeling3 = "1",
			main_1 = "1",
			touch = "2",
			battle = "4",
			win_mvp = "5",
			home = "5",
			touch2 = "5",
			skill = "4",
			propose = "2",
			feeling1 = "1",
			feeling5 = "5",
			mission_complete = "1",
			headtouch = "3",
			hp_warning = "1",
			login = "3",
			detail = "2"
		}
	},
	shancheng_4 = {
		faces = {
			propose = "1",
			mission_complete = "1",
			main_1 = "3",
			lose = "2",
			touch2 = "1",
			upgrade = "3",
			home = "1",
			main_2 = "2",
			feeling2 = "2",
			touch = "3",
			battle = "1",
			login = "1",
			feeling1 = "4"
		}
	},
	xili_h = {
		faces = {
			feeling4 = "1",
			feeling1 = "2",
			main_1 = "3",
			main_2 = "2",
			touch = "3",
			battle = "2",
			home = "3",
			mission = "2",
			touch2 = "1",
			skill = "2",
			propose = "1",
			lose = "2",
			main_3 = "1",
			feeling5 = "3",
			upgrade = "2",
			hp_warning = "2",
			login = "3",
			detail = "1"
		}
	},
	xiao_2 = {
		faces = {
			main_2 = "3",
			feeling3 = "1",
			main_1 = "1",
			mission = "3",
			touch2 = "2",
			skill = "2",
			battle = "2",
			login = "3",
			lose = "4",
			main_3 = "2"
		}
	},
	shengdiyage_g = {
		faces = {
			login = "4",
			propose = "3",
			upgrade = "2",
			feeling2 = "4",
			main_2 = "4",
			win_mvp = "1",
			mission_complete = "3",
			touch2 = "3",
			skill = "2",
			hp_warning = "3",
			feeling4 = "2",
			feeling1 = "1",
			main_3 = "3",
			detail = "3"
		}
	},
	shentong_2 = {
		faces = {
			main_1 = "3",
			feeling3 = "3",
			feeling5 = "1",
			login = "3",
			main_2 = "1",
			win_mvp = "3",
			mission_complete = "1",
			touch = "1",
			touch2 = "3",
			battle = "2",
			mail = "2",
			lose = "2"
		}
	},
	huobi = {
		faces = {
			propose = "1",
			upgrade = "3",
			mission_complete = "3",
			touch2 = "2",
			login = "1",
			win_mvp = "1",
			home = "2",
			headtouch = "3",
			feeling2 = "1",
			feeling1 = "2",
			skill = "1",
			hp_warning = "2",
			feeling4 = "1",
			lose = "2",
			main_3 = "1",
			detail = "1"
		}
	},
	huobi_2 = {
		faces = {
			propose = "1",
			feeling3 = "1",
			main_2 = "2",
			feeling1 = "3",
			win_mvp = "2",
			touch2 = "1",
			skill = "1",
			feeling4 = "1",
			lose = "3",
			main_3 = "1",
			feeling5 = "1",
			upgrade = "2",
			mission_complete = "3",
			headtouch = "1",
			hp_warning = "3",
			login = "1",
			detail = "1"
		}
	},
	keerke = {
		faces = {
			login = "2",
			propose = "2",
			feeling5 = "3",
			upgrade = "2",
			feeling2 = "2",
			win_mvp = "2",
			mission_complete = "2",
			main_2 = "2",
			touch2 = "3",
			skill = "2",
			hp_warning = "3",
			feeling4 = "2",
			feeling1 = "3",
			main_3 = "1",
			detail = "2"
		}
	},
	keerke_2 = {
		faces = {
			propose = "3",
			upgrade = "2",
			mission_complete = "3",
			touch2 = "2",
			expedition = "3",
			win_mvp = "3",
			home = "2",
			mission = "3",
			feeling2 = "2",
			login = "3",
			skill = "3",
			hp_warning = "3",
			feeling4 = "2",
			feeling1 = "1",
			main_3 = "2",
			detail = "2"
		}
	},
	keluoladuo = {
		faces = {
			login = "3",
			propose = "3",
			upgrade = "2",
			feeling2 = "3",
			main_2 = "2",
			win_mvp = "3",
			mission_complete = "3",
			feeling1 = "1",
			touch2 = "1",
			skill = "3",
			hp_warning = "1",
			feeling4 = "2",
			lose = "1",
			main_3 = "1",
			detail = "3"
		}
	},
	malilan = {
		faces = {
			feeling4 = "2",
			upgrade = "2",
			home = "1",
			touch2 = "3",
			expedition = "3",
			win_mvp = "2",
			mission_complete = "3",
			main_2 = "1",
			feeling2 = "3",
			feeling1 = "1",
			skill = "3",
			hp_warning = "1",
			login = "3",
			lose = "1",
			main_3 = "3",
			detail = "3"
		}
	},
	mingniabolisi = {
		faces = {
			feeling4 = "2",
			feeling1 = "1",
			main_2 = "1",
			touch = "3",
			battle = "3",
			win_mvp = "1",
			home = "1",
			mission = "3",
			touch2 = "1",
			skill = "3",
			propose = "3",
			lose = "2",
			main_3 = "3",
			upgrade = "3",
			feeling2 = "3",
			hp_warning = "3",
			login = "3",
			detail = "1"
		}
	},
	mingniabolisi_2 = {
		faces = {
			login = "2",
			feeling3 = "1",
			propose = "3",
			upgrade = "3",
			battle = "2",
			win_mvp = "2",
			mission_complete = "1",
			main_2 = "1",
			touch2 = "3",
			feeling1 = "2",
			skill = "2",
			hp_warning = "2",
			feeling4 = "2",
			lose = "1",
			main_3 = "1",
			detail = "1"
		}
	},
	xifujiniya = {
		faces = {
			login = "2",
			propose = "1",
			feeling5 = "1",
			upgrade = "1",
			touch2 = "3",
			win_mvp = "2",
			mission_complete = "1",
			main_2 = "3",
			feeling2 = "2",
			feeling1 = "3",
			skill = "2",
			hp_warning = "3",
			feeling4 = "1",
			lose = "3",
			main_3 = "2",
			detail = "3"
		}
	},
	mengfeisi = {
		faces = {
			propose = "3",
			feeling3 = "1",
			main_1 = "4",
			lose = "1",
			main_2 = "2",
			win_mvp = "4",
			home = "4",
			touch = "1",
			touch2 = "2",
			skill = "2",
			feeling4 = "4",
			feeling1 = "2",
			main_3 = "1",
			feeling5 = "3",
			upgrade = "3",
			mission_complete = "3",
			feeling2 = "4",
			battle = "2",
			login = "3",
			detail = "2"
		}
	},
	beili_2 = {
		faces = {
			mail = "1",
			feeling4 = "2",
			feeling5 = "1",
			propose = "1",
			expedition = "1",
			upgrade = "1",
			mission_complete = "1",
			win_mvp = "2",
			feeling2 = "2",
			main_2 = "1",
			skill = "2",
			hp_warning = "1",
			login = "2",
			feeling1 = "1",
			main_3 = "2",
			detail = "2"
		}
	},
	kongbu_2 = {
		faces = {
			login = "2",
			propose = "2",
			feeling5 = "3",
			upgrade = "1",
			feeling2 = "2",
			win_mvp = "2",
			main_2 = "3",
			touch2 = "2",
			skill = "2",
			feeling4 = "3",
			touch = "3",
			main_3 = "2",
			detail = "1"
		}
	},
	naerxun_2 = {
		faces = {
			login = "2",
			feeling3 = "3",
			feeling5 = "3",
			propose = "2",
			win_mvp = "2",
			upgrade = "3",
			home = "1",
			main_2 = "3",
			skill = "2",
			hp_warning = "3",
			feeling4 = "1",
			lose = "3",
			main_3 = "2",
			detail = "3"
		}
	},
	wushiling_2 = {
		faces = {
			mail = "4",
			feeling3 = "5",
			propose = "5",
			feeling1 = "3",
			main_2 = "3",
			win_mvp = "5",
			touch = "5",
			touch2 = "2",
			skill = "2",
			feeling4 = "2",
			lose = "3",
			main_3 = "2",
			feeling5 = "4",
			upgrade = "1",
			mission_complete = "1",
			feeling2 = "2",
			hp_warning = "3",
			login = "2",
			detail = "1"
		}
	},
	heizewude = {
		faces = {
			feeling4 = "1",
			win_mvp = "1",
			main_2 = "1",
			feeling1 = "2",
			upgrade = "1",
			mission_complete = "1",
			hp_warning = "2",
			propose = "1",
			lose = "2",
			detail = "1"
		}
	},
	kangkede = {
		faces = {
			mail = "4",
			feeling3 = "4",
			propose = "2",
			feeling1 = "5",
			main_2 = "3",
			win_mvp = "2",
			touch = "5",
			touch2 = "6",
			skill = "4",
			feeling4 = "2",
			lose = "6",
			main_3 = "2",
			feeling5 = "2",
			upgrade = "3",
			mission_complete = "1",
			feeling2 = "2",
			hp_warning = "5",
			login = "2",
			detail = "1"
		}
	},
	kangkede_2 = {
		faces = {
			propose = "1",
			feeling3 = "2",
			mail = "3",
			lose = "4",
			main_2 = "2",
			win_mvp = "2",
			touch = "3",
			mission = "2",
			touch2 = "1",
			battle = "1",
			skill = "4",
			feeling4 = "2",
			feeling1 = "5",
			main_3 = "1",
			feeling5 = "2",
			upgrade = "3",
			mission_complete = "2",
			feeling2 = "1",
			hp_warning = "5",
			login = "2",
			detail = "1"
		}
	},
	fumilulu = {
		faces = {
			upgrade = "1",
			feeling3 = "2",
			feeling5 = "2",
			main_2 = "2",
			feeling1 = "3",
			win_mvp = "2",
			mission_complete = "1",
			skill = "3",
			hp_warning = "3",
			login = "1",
			lose = "3",
			main_3 = "1",
			detail = "2"
		}
	},
	jiuyuan = {
		faces = {
			home = "1",
			feeling3 = "2",
			headtouch = "3",
			win_mvp = "3",
			expedition = "1",
			upgrade = "1",
			mission_complete = "1",
			mission = "2",
			touch2 = "2",
			login = "1",
			feeling1 = "3",
			hp_warning = "3",
			main_2 = "2",
			lose = "3",
			main_3 = "3",
			feeling4 = "1"
		}
	},
	lulutiye = {
		faces = {
			feeling4 = "1",
			main_2 = "2",
			main_1 = "1",
			feeling1 = "3",
			battle = "2",
			win_mvp = "2",
			home = "1",
			touch2 = "2",
			skill = "2",
			propose = "2",
			lose = "3",
			main_3 = "2",
			feeling5 = "2",
			upgrade = "1",
			mission_complete = "1",
			headtouch = "3",
			hp_warning = "2",
			login = "2",
			detail = "2"
		}
	},
	maoyin = {
		faces = {
			feeling4 = "1",
			mission_complete = "1",
			mission = "2",
			propose = "2",
			lose = "3",
			upgrade = "1",
			home = "2",
			headtouch = "3",
			feeling2 = "2",
			main_2 = "2",
			touch = "2",
			hp_warning = "2",
			login = "2",
			feeling1 = "3",
			touch2 = "2",
			detail = "2"
		}
	},
	salana = {
		faces = {
			main_2 = "2",
			feeling3 = "3",
			feeling1 = "1",
			win_mvp = "2",
			home = "3",
			touch2 = "1",
			skill = "2",
			feeling4 = "3",
			lose = "1",
			main_3 = "2",
			feeling5 = "3",
			upgrade = "1",
			mission_complete = "3",
			headtouch = "1",
			hp_warning = "2",
			login = "3",
			detail = "3"
		}
	},
	wululu = {
		faces = {
			propose = "2",
			feeling3 = "2",
			main_2 = "2",
			feeling1 = "3",
			win_mvp = "2",
			home = "1",
			touch2 = "1",
			skill = "1",
			feeling4 = "2",
			lose = "3",
			main_3 = "3",
			feeling5 = "2",
			upgrade = "1",
			mission_complete = "1",
			headtouch = "1",
			hp_warning = "1",
			login = "2",
			detail = "2"
		}
	},
	longxiang = {
		faces = {
			feeling4 = "4",
			mail = "3",
			main_1 = "4",
			lose = "2",
			main_2 = "3",
			win_mvp = "1",
			touch = "3",
			mission = "2",
			touch2 = "4",
			battle = "1",
			skill = "1",
			propose = "1",
			feeling1 = "2",
			main_3 = "1",
			feeling5 = "1",
			upgrade = "1",
			mission_complete = "4",
			feeling2 = "1",
			hp_warning = "1",
			login = "1",
			detail = "1"
		}
	},
	longxiang_2 = {
		faces = {
			feeling4 = "3",
			feeling3 = "1",
			main_1 = "2",
			mail = "2",
			expedition = "1",
			win_mvp = "2",
			home = "1",
			mission = "1",
			touch2 = "2",
			main_2 = "2",
			skill = "1",
			battle = "1",
			propose = "1",
			main_3 = "3",
			feeling5 = "1",
			upgrade = "1",
			mission_complete = "3",
			headtouch = "1",
			feeling2 = "1",
			hp_warning = "1",
			login = "2",
			detail = "1"
		}
	},
	yanzhan_2 = {
		faces = {
			touch = "1",
			feeling3 = "1",
			main_1 = "2",
			mail = "7",
			feeling4 = "7",
			win_mvp = "3",
			home = "5",
			lose = "4",
			touch2 = "1",
			profile = "4",
			battle = "3",
			main_2 = "6",
			feeling1 = "4",
			main_3 = "5",
			upgrade = "3",
			hp_warning = "4",
			login = "1"
		}
	},
	nigulasi_3 = {
		faces = {
			feeling1 = "1",
			touch2 = "1",
			main_1 = "3",
			feeling4 = "1",
			login = "3",
			win_mvp = "1",
			mission_complete = "1",
			mission = "3",
			feeling2 = "3",
			touch = "2",
			battle = "1",
			main_2 = "1",
			lose = "4",
			detail = "1"
		}
	},
	pufeng_2 = {
		faces = {
			touch = "1",
			feeling3 = "2",
			main_1 = "2",
			feeling4 = "1",
			propose = "3",
			win_mvp = "1",
			home = "1",
			mission = "3",
			lose = "3",
			battle = "3",
			main_2 = "1",
			feeling1 = "3",
			main_3 = "4",
			feeling5 = "4",
			upgrade = "3",
			feeling2 = "1",
			hp_warning = "2"
		}
	},
	dachao_2 = {
		faces = {
			win_mvp = "4",
			feeling3 = "4",
			battle = "3",
			feeling4 = "2",
			lose = "1",
			upgrade = "3",
			mission_complete = "4",
			touch2 = "1",
			hp_warning = "3",
			propose = "4",
			feeling1 = "2",
			main_3 = "4",
			detail = "3"
		}
	},
	yueke_g = {
		faces = {
			lose = "4",
			touch2 = "4",
			main_2 = "1",
			touch = "1",
			mission_complete = "2",
			mission = "1",
			feeling2 = "2",
			mail = "1",
			feeling1 = "3"
		}
	},
	yueke_g = {
		faces = {
			lose = "4",
			touch2 = "4",
			main_2 = "1",
			touch = "1",
			mission_complete = "2",
			mission = "1",
			feeling2 = "2",
			mail = "1",
			feeling1 = "3"
		}
	},
	canglong_g = {
		faces = {
			main_1 = "3",
			feeling3 = "1",
			feeling5 = "2",
			battle = "1",
			feeling4 = "2",
			win_mvp = "3",
			mission = "1",
			touch2 = "3",
			skill = "3",
			hp_warning = "1",
			propose = "2",
			lose = "1",
			main_3 = "1",
			detail = "1"
		}
	},
	feilong_g = {
		faces = {
			upgrade = "1",
			feeling3 = "1",
			main_1 = "3",
			home = "1",
			feeling5 = "3",
			win_mvp = "1",
			mission_complete = "1",
			touch2 = "2",
			feeling2 = "3",
			feeling4 = "3",
			skill = "2",
			battle = "2",
			propose = "3",
			feeling1 = "2",
			main_3 = "1",
			hp_warning = "2"
		}
	},
	tiancheng = {
		faces = {
			win_mvp = "2",
			feeling3 = "1",
			feeling5 = "1",
			home = "2",
			touch2 = "3",
			upgrade = "1",
			mission_complete = "1",
			propose = "3",
			feeling2 = "2",
			main_2 = "2",
			skill = "2",
			lose = "3",
			feeling4 = "2",
			touch = "2",
			main_3 = "1",
			detail = "2"
		}
	},
	jiahezhanlie = {
		faces = {
			profile = "2",
			feeling3 = "2",
			main_2 = "2",
			touch2 = "2",
			feeling4 = "1",
			upgrade = "1",
			mail = "3",
			mission = "3",
			feeling2 = "2",
			lose = "2",
			login = "1",
			feeling1 = "3",
			detail = "2"
		}
	},
	zubing = {
		faces = {
			feeling4 = "6",
			feeling3 = "5",
			main_1 = "2",
			propose = "3",
			expedition = "1",
			win_mvp = "2",
			home = "1",
			mission = "5",
			touch2 = "4",
			mail = "1",
			touch = "5",
			main_2 = "1",
			feeling1 = "4",
			main_3 = "3",
			feeling5 = "5",
			upgrade = "1",
			mission_complete = "1",
			login = "1",
			detail = "5"
		}
	},
	juanbo = {
		faces = {
			win_mvp = "2",
			feeling3 = "2",
			feeling5 = "2",
			lose = "3",
			feeling4 = "3",
			upgrade = "1",
			home = "1",
			headtouch = "2",
			touch2 = "4",
			main_2 = "4",
			touch = "2",
			hp_warning = "3",
			mail = "2",
			feeling1 = "4",
			main_3 = "1",
			mission = "3"
		}
	},
	qifeng = {
		faces = {
			default = "0",
			propose = "2",
			feeling5 = "2",
			touch2 = "2",
			battle = "1",
			upgrade = "3",
			login = "3",
			mission = "1",
			feeling2 = "3",
			lose = "2",
			hp_warning = "2",
			feeling4 = "3",
			feeling1 = "1",
			main_3 = "3"
		}
	},
	kelifulan_h = {
		faces = {
			feeling1 = "2",
			main_2 = "1",
			feeling5 = "3",
			lose = "2",
			expedition = "1",
			win_mvp = "1",
			mission_complete = "1",
			touch2 = "2",
			feeling4 = "2",
			touch = "3",
			detail = "1"
		}
	},
	xiaotiane_5 = {
		faces = {
			feeling1 = "1",
			feeling3 = "3",
			main_1 = "3",
			feeling5 = "3",
			touch2 = "1",
			upgrade = "1",
			mission_complete = "2",
			login = "2",
			feeling2 = "1",
			lose = "1",
			battle = "1",
			propose = "1",
			touch = "2",
			detail = "3"
		}
	},
	aierdeliqi_4 = {
		faces = {
			feeling5 = "4",
			battle = "1",
			main_1 = "3",
			login = "3",
			lose = "2",
			mission = "1",
			touch2 = "3",
			skill = "1",
			hp_warning = "2",
			mail = "2",
			feeling1 = "2",
			main_3 = "3",
			detail = "2"
		}
	},
	yichui_2 = {
		faces = {
			propose = "2",
			feeling3 = "1",
			main_1 = "4",
			mail = "2",
			lose = "5",
			win_mvp = "4",
			home = "6",
			hp_warning = "3",
			touch2 = "6",
			skill = "3",
			feeling4 = "6",
			feeling1 = "1",
			main_3 = "1",
			feeling5 = "4",
			profile = "6",
			mission_complete = "3",
			battle = "3"
		}
	},
	chuyun_2 = {
		faces = {
			propose = "2",
			feeling3 = "1",
			feeling5 = "3",
			touch2 = "2",
			expedition = "2",
			win_mvp = "3",
			mission_complete = "2",
			login = "2",
			feeling2 = "2",
			battle = "2",
			main_2 = "3",
			touch = "1",
			main_3 = "3",
			detail = "3"
		}
	},
	weiershiqinwang_4 = {
		faces = {
			touch2 = "3",
			feeling3 = "1",
			main_1 = "1",
			feeling5 = "3",
			expedition = "2",
			upgrade = "2",
			home = "3",
			mission = "4",
			feeling2 = "2",
			login = "2",
			lose = "4",
			battle = "4",
			feeling4 = "3",
			feeling1 = "4",
			main_3 = "2",
			propose = "2"
		}
	},
	shengluyisi_3 = {
		faces = {
			mission_complete = "3",
			feeling3 = "4",
			main_1 = "3",
			touch2 = "5",
			feeling4 = "3",
			upgrade = "2",
			home = "1",
			login = "1",
			feeling2 = "1",
			lose = "2",
			hp_warning = "3",
			main_2 = "1",
			feeling1 = "2"
		}
	},
	jifeng_2 = {
		faces = {
			main_2 = "3",
			feeling3 = "2",
			feeling4 = "3",
			touch = "4",
			expedition = "2",
			win_mvp = "3",
			home = "2",
			mission = "3",
			touch2 = "4",
			propose = "1",
			lose = "4",
			mail = "1",
			feeling1 = "2",
			main_3 = "2",
			feeling5 = "1",
			hp_warning = "2",
			login = "1"
		}
	},
	hailunna_2 = {
		faces = {
			main_2 = "3",
			feeling3 = "2",
			feeling4 = "3",
			touch = "4",
			expedition = "2",
			win_mvp = "3",
			home = "2",
			mission = "3",
			touch2 = "4",
			propose = "1",
			lose = "4",
			mail = "1",
			feeling1 = "2",
			main_3 = "2",
			feeling5 = "1",
			hp_warning = "2",
			login = "1"
		}
	},
	hailunna_2 = {
		faces = {
			feeling5 = "2",
			feeling3 = "2",
			main_1 = "2",
			propose = "2",
			expedition = "1",
			upgrade = "1",
			mission_complete = "3",
			mission = "2",
			touch2 = "1",
			login = "2",
			battle = "3",
			feeling4 = "3",
			lose = "1",
			main_3 = "2"
		}
	},
	mengbiliai_2 = {
		faces = {
			propose = "2",
			feeling3 = "4",
			feeling5 = "2",
			profile = "3",
			battle = "3",
			win_mvp = "4",
			main_2 = "2",
			touch2 = "1",
			skill = "3",
			hp_warning = "3",
			feeling4 = "2",
			touch = "1",
			main_3 = "4"
		}
	},
	zubing_2 = {
		faces = {
			feeling5 = "4",
			feeling3 = "4",
			main_1 = "4",
			home = "1",
			feeling4 = "2",
			win_mvp = "3",
			mission_complete = "3",
			mission = "4",
			touch2 = "2",
			propose = "1",
			feeling1 = "3",
			main_3 = "1"
		}
	},
	nake = {
		faces = {
			touch = "3",
			feeling3 = "2",
			main_1 = "2",
			feeling5 = "3",
			touch2 = "2",
			profile = "3",
			home = "3",
			feeling4 = "3",
			feeling2 = "2",
			lose = "1",
			hp_warning = "2",
			propose = "3",
			feeling1 = "1",
			detail = "3"
		}
	},
	aidang_h = {
		faces = {
			mail = "2",
			feeling3 = "2",
			propose = "4",
			win_mvp = "3",
			login = "4",
			upgrade = "1",
			mission = "1",
			touch2 = "3",
			battle = "4",
			main_2 = "2",
			feeling1 = "1",
			main_3 = "3",
			detail = "4"
		}
	},
	xili_3 = {
		faces = {
			win_mvp = "1",
			feeling3 = "3",
			feeling5 = "2",
			propose = "1",
			expedition = "3",
			upgrade = "3",
			battle = "3",
			main_2 = "3",
			touch2 = "3",
			skill = "3",
			hp_warning = "3",
			feeling4 = "2",
			lose = "2",
			main_3 = "1"
		}
	},
	chuchun_2 = {
		faces = {
			feeling1 = "2",
			feeling3 = "2",
			main_1 = "1",
			feeling4 = "3",
			expedition = "2",
			win_mvp = "1",
			lose = "3",
			mission = "1",
			touch2 = "3",
			propose = "3",
			touch = "1",
			main_3 = "3",
			upgrade = "3",
			mission_complete = "3",
			feeling2 = "3",
			battle = "1",
			login = "3",
			detail = "2"
		}
	},
	wensensi_2 = {
		faces = {
			upgrade = "2",
			feeling5 = "1",
			main_1 = "1",
			touch2 = "3",
			expedition = "2",
			win_mvp = "1",
			mail = "2",
			mission = "2",
			feeling2 = "2",
			lose = "3",
			skill = "2",
			hp_warning = "2",
			propose = "1",
			feeling1 = "3",
			main_3 = "2",
			detail = "1"
		}
	},
	shengli_2 = {
		faces = {
			feeling4 = "2",
			propose = "3",
			feeling5 = "2",
			battle = "2",
			login = "2",
			win_mvp = "1",
			home = "3",
			mission = "2",
			touch2 = "2",
			hp_warning = "2",
			main_2 = "2",
			feeling1 = "1",
			main_3 = "3",
			detail = "3"
		}
	},
	tianlangxing = {
		faces = {
			propose = "1",
			feeling3 = "3",
			feeling5 = "3",
			touch2 = "1",
			login = "3",
			upgrade = "3",
			home = "3",
			mission = "2",
			feeling2 = "2",
			skill = "2",
			hp_warning = "2",
			main_2 = "2",
			lose = "2",
			main_3 = "3"
		}
	},
	yamaijia_2 = {
		faces = {
			main_2 = "3",
			feeling3 = "4",
			propose = "2",
			lose = "5",
			battle = "4",
			win_mvp = "6",
			mission = "3",
			touch2 = "4",
			skill = "2",
			feeling4 = "2",
			feeling1 = "5",
			main_3 = "1",
			feeling5 = "6",
			upgrade = "6",
			hp_warning = "5",
			login = "3",
			detail = "1"
		}
	},
	yuekegongjue_3 = {
		faces = {
			profile = "3",
			feeling3 = "2",
			feeling5 = "3",
			battle = "2",
			login = "2",
			win_mvp = "3",
			mission_complete = "3",
			mission = "2",
			touch2 = "2",
			lose = "1",
			skill = "3",
			hp_warning = "1",
			main_2 = "2",
			feeling1 = "1",
			main_3 = "3",
			detail = "3"
		}
	},
	tianlangxing_2 = {
		faces = {
			feeling1 = "2",
			feeling5 = "1",
			main_1 = "3",
			touch2 = "3",
			login = "1",
			profile = "3",
			home = "1",
			mission = "1",
			feeling2 = "2",
			lose = "3",
			skill = "2",
			hp_warning = "2",
			propose = "1",
			touch = "1",
			main_3 = "1",
			detail = "1"
		}
	},
	xiefeierde_2 = {
		faces = {
			main_2 = "3",
			feeling3 = "2",
			feeling5 = "1",
			feeling1 = "3",
			profile = "3",
			touch2 = "2",
			battle = "2",
			propose = "1",
			touch = "3",
			main_3 = "2",
			detail = "3"
		}
	},
	changyue = {
		faces = {
			feeling5 = "3",
			feeling3 = "2",
			main_1 = "3",
			propose = "3",
			battle = "1",
			win_mvp = "3",
			main_2 = "2",
			mission = "3",
			touch2 = "1",
			skill = "3",
			hp_warning = "1",
			mail = "3",
			lose = "1",
			touch1 = "3"
		}
	},
	gelunweier = {
		faces = {
			feeling4 = "5",
			feeling3 = "7",
			main_1 = "6",
			lose = "2",
			expedition = "5",
			win_mvp = "6",
			home = "4",
			mission = "1",
			touch2 = "2",
			battle = "7",
			propose = "3",
			feeling1 = "6",
			main_3 = "4",
			feeling5 = "3",
			mission_complete = "4",
			hp_warning = "7",
			login = "1",
			detail = "5"
		}
	},
	sipeibojue_3 = {
		faces = {
			login = "3",
			upgrade = "5",
			main_1 = "1",
			main_2 = "3",
			touch = "2",
			win_mvp = "4",
			home = "4",
			headtouch = "6",
			battle = "1",
			propose = "2",
			lose = "7",
			main_3 = "4"
		}
	},
	huonululu_4 = {
		faces = {
			touch = "2",
			feeling3 = "2",
			main_1 = "3",
			feeling4 = "2",
			propose = "2",
			win_mvp = "3",
			main_2 = "2",
			mission = "3",
			touch2 = "5",
			lose = "4",
			mail = "2",
			feeling1 = "5",
			main_3 = "2",
			feeling5 = "2",
			profile = "2",
			mission_complete = "3",
			feeling2 = "3",
			battle = "3",
			login = "3"
		}
	}
}

function var_0_1.GetCvList()
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(var_0_1.action2Words) do
		local var_6_1 = var_0_0.character_voice[iter_6_1]

		if var_6_1 and not var_0_0.AssistantInfo.isDisableSpecialClick(iter_6_1) and var_6_1.unlock_condition[1] >= 0 then
			table.insert(var_6_0, var_6_1)
		end
	end

	return var_6_0
end

function var_0_1.GetCVListForProfile(arg_7_0, arg_7_1)
	local var_7_0 = {}

	for iter_7_0, iter_7_1 in pairs(var_0_0.character_voice) do
		if not var_0_0.AssistantInfo.isDisableSpecialClick(iter_7_0) and iter_7_1.unlock_condition[1] >= 0 and iter_7_1.l2d_action ~= "" then
			if iter_7_1.l2d_action == "get" then
				if PaintingShowScene.GetSkinShowAble(arg_7_1) then
					table.insert(var_7_0, iter_7_1)
				end
			elseif iter_7_1.sp_trans_l2d == 1 then
				if arg_7_0 then
					table.insert(var_7_0, iter_7_1)
				end
			elseif iter_7_1.sp_trans_l2d == 0 or not iter_7_1.sp_trans_l2d then
				table.insert(var_7_0, iter_7_1)
			end
		end
	end

	return var_7_0
end
