local var_0_0 = class("ShipType")

var_0_0.QuZhu = 1
var_0_0.QingXun = 2
var_0_0.ZhongXun = 3
var_0_0.ZhanXun = 4
var_0_0.ZhanLie = 5
var_0_0.QingHang = 6
var_0_0.ZhengHang = 7
var_0_0.QianTing = 8
var_0_0.HangXun = 9
var_0_0.HangZhan = 10
var_0_0.LeiXun = 11
var_0_0.WeiXiu = 12
var_0_0.ZhongPao = 13
var_0_0.QianMu = 17
var_0_0.ChaoXun = 18
var_0_0.Yunshu = 19
var_0_0.DaoQuV = 20
var_0_0.DaoQuM = 21
var_0_0.FengFanS = 22
var_0_0.FengFanV = 23
var_0_0.FengFanM = 24
var_0_0.YuLeiTing = 14
var_0_0.JinBi = 15
var_0_0.ZiBao = 16
var_0_0.WeiZhi = 25
var_0_0.AllShipType = {
	1,
	2,
	3,
	18,
	4,
	5,
	6,
	7,
	10,
	17,
	13,
	8,
	12,
	19,
	20,
	21,
	22,
	23,
	24
}
var_0_0.SpecificTypeTable = {
	auxiliary = "AUX",
	gunner = "GNR",
	torpedo = "TORP"
}
var_0_0.SpecificTableTips = {
	GNR = "breakout_tip_ultimatebonus_gunner",
	TORP = "breakout_tip_ultimatebonus_torpedo",
	AUX = "breakout_tip_ultimatebonus_aux"
}

function var_0_0.Type2Name(arg_1_0)
	return pg.ship_data_by_type[arg_1_0].type_name
end

function var_0_0.Type2Print(arg_2_0)
	if not var_0_0.prints then
		var_0_0.prints = {
			"quzhu",
			"qingxun",
			"zhongxun",
			"zhanlie",
			"zhanlie",
			"hangmu",
			"hangmu",
			"qianting",
			"zhanlie",
			"hangzhan",
			"zhanlie",
			"weixiu",
			"zhongpao",
			"quzhu",
			"battle_jinbi",
			"battle_zibao",
			"qianmu",
			"chaoxun",
			"yunshu",
			"daoquv",
			"daoqum",
			"fengfans",
			"fengfanv",
			"fengfanm",
			"weizhi"
		}
	end

	return var_0_0.prints[arg_2_0]
end

function var_0_0.Type2BattlePrint(arg_3_0)
	if not var_0_0.bprints then
		var_0_0.bprints = {
			"battle_quzhu",
			"battle_qingxun",
			"battle_zhongxun",
			"battle_zhanlie",
			"battle_zhanlie",
			"battle_hangmu",
			"battle_hangmu",
			"battle_qianting",
			"battle_zhanlie",
			"battle_hangmu",
			"battle_zhanlie",
			"battle_hangmu",
			"battle_zhanlie",
			"battle_weixiu",
			"battle_zhanlie",
			"battle_quzhu",
			"battle_jinbi",
			"battle_zibao",
			"battle_hangmu",
			"battle_zhanlie",
			"battle_yunshu",
			"battle_daoqu",
			"battle_daoqu",
			"battle_fengfans",
			"battle_fengfanv",
			"battle_fengfanm",
			"battle_weizhi"
		}
	end

	return var_0_0.bprints[arg_3_0]
end

function var_0_0.Type2CNLabel(arg_4_0)
	if not var_0_0.cnLabel then
		var_0_0.cnLabel = {
			"label_1",
			"label_2",
			"label_3",
			"label_4",
			"label_5",
			"label_6",
			"label_7",
			"label_19",
			"label_3",
			"label_10",
			"label_3",
			"label_20",
			"label_21",
			"label_1",
			"label_1",
			"label_1",
			"label_17",
			"label_18",
			"label_22",
			"label_23",
			"label_23",
			"label_24",
			"label_25",
			"label_26",
			fengfan = "label_27"
		}
	end

	return var_0_0.cnLabel[arg_4_0]
end

var_0_0.BundleBattleShip = "zhan"
var_0_0.BundleAircraftCarrier = "hang"
var_0_0.BundleSubmarine = "qian"
var_0_0.BundleLargeCrusier = "zhong"
var_0_0.BundleAntiSubmarine = "fanqian"
var_0_0.BundleList = {
	zhan = {
		var_0_0.ZhanXun,
		var_0_0.ZhanLie
	},
	hang = {
		var_0_0.QingHang,
		var_0_0.ZhengHang
	},
	qian = {
		var_0_0.QianTing,
		var_0_0.QianMu,
		var_0_0.FengFanS
	},
	zhong = {
		var_0_0.ZhongXun,
		var_0_0.ChaoXun
	},
	fanqian = {
		var_0_0.QuZhu,
		var_0_0.QingXun,
		var_0_0.DaoQuV
	},
	quzhu = {
		var_0_0.QuZhu,
		var_0_0.DaoQuM,
		var_0_0.DaoQuV
	},
	fengfan = {
		var_0_0.FengFanS,
		var_0_0.FengFanV,
		var_0_0.FengFanM
	}
}

function var_0_0.BundleType2CNLabel(arg_5_0)
	if not var_0_0.bundleLabel then
		var_0_0.bundleLabel = {
			zhong = "label_13",
			qian = "label_8",
			zhan = "label_11",
			fanqian = "label_55",
			hang = "label_12",
			quzhu = "label_1"
		}
	end

	return var_0_0.bundleLabel[arg_5_0]
end

function var_0_0.ContainInLimitBundle(arg_6_0, arg_6_1)
	if type(arg_6_0) == "string" then
		for iter_6_0, iter_6_1 in ipairs(var_0_0.BundleList[arg_6_0]) do
			if iter_6_1 == arg_6_1 then
				return true
			end
		end
	elseif type(arg_6_0) == "number" then
		return arg_6_0 == 0 or arg_6_1 == arg_6_0
	end

	return false
end

var_0_0.CloakShipTypeList = {
	var_0_0.QingHang,
	var_0_0.ZhengHang,
	var_0_0.DaoQuM
}

function var_0_0.CloakShipType(arg_7_0)
	return table.contains(var_0_0.CloakShipTypeList, arg_7_0)
end

var_0_0.QuZhuShipType = {}

for iter_0_0, iter_0_1 in ipairs(var_0_0.BundleList.quzhu) do
	var_0_0.QuZhuShipType[iter_0_1] = true
end

function var_0_0.IsTypeQuZhu(arg_8_0)
	return var_0_0.QuZhuShipType[arg_8_0]
end

function var_0_0.FilterOverQuZhuType(arg_9_0)
	local var_9_0 = false

	return underscore.filter(arg_9_0, function(arg_10_0)
		if not var_9_0 or not var_0_0.IsTypeQuZhu(arg_10_0) then
			var_9_0 = var_9_0 or var_0_0.IsTypeQuZhu(arg_10_0)

			return true
		else
			return false
		end
	end)
end

var_0_0.FengFanType = {}

for iter_0_2, iter_0_3 in ipairs(var_0_0.BundleList.fengfan) do
	var_0_0.FengFanType[iter_0_3] = true
end

function var_0_0.IsTypeFengFan(arg_11_0)
	return var_0_0.FengFanType[arg_11_0]
end

function var_0_0.FilterOverFengFanType(arg_12_0)
	local var_12_0 = false

	return underscore.filter(arg_12_0, function(arg_13_0)
		if not var_12_0 or not var_0_0.IsTypeFengFan(arg_13_0) then
			var_12_0 = var_12_0 or var_0_0.IsTypeFengFan(arg_13_0)

			return true
		else
			return false
		end
	end)
end

function var_0_0.MergeFengFanType(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = var_0_0.BundleList.fengfan[1]

	if underscore.all(var_0_0.BundleList.fengfan, function(arg_15_0)
		return arg_14_1[var_14_0] == arg_14_1[arg_15_0] and arg_14_2[var_14_0] == arg_14_2[arg_15_0]
	end) then
		local var_14_1 = table.indexof(arg_14_0, var_14_0)

		arg_14_0 = underscore.filter(arg_14_0, function(arg_16_0)
			return not table.contains(var_0_0.BundleList.fengfan, arg_16_0)
		end)

		table.insert(arg_14_0, var_14_1, "fengfan")

		arg_14_1.fengfan = arg_14_1[var_14_0]
		arg_14_2.fengfan = arg_14_2[var_14_0]
	end

	return arg_14_0
end

return var_0_0
