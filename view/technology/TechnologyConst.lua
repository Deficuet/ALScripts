local var_0_0 = class("TechnologyConst")

var_0_0.OPEN_TECHNOLOGY_TREE_SCENE = "TechnologyConst:OPEN_TECHNOLOGY_TREE_SCENE"
var_0_0.OPEN_SHIP_BUFF_DETAIL = "TechnologyConst:OPEN_SHIP_BUFF_DETAIL"
var_0_0.OPEN_TECHNOLOGY_NATION_LAYER = "TechnologyConst:OPEN_TECHNOLOGY_NATION_LAYER"
var_0_0.CLOSE_TECHNOLOGY_NATION_LAYER = "TechnologyConst:CLOSE_TECHNOLOGY_NATION_LAYER"
var_0_0.CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION = "TechnologyConst:CLOSE_TECHNOLOGY_NATION_LAYER_NOTIFICATION"
var_0_0.OPEN_ALL_BUFF_DETAIL = "TechnologyConst:OPEN_ALL_BUFF_DETAIL"
var_0_0.UPDATE_REDPOINT_ON_TOP = "TechnologyConst:UPDATE_REDPOINT_ON_TOP"
var_0_0.CLICK_UP_TEC_BTN = "TechnologyConst:CLICK_UP_TEC_BTN"
var_0_0.START_TEC_BTN_SUCCESS = "TechnologyConst:START_TEC_BTN_SUCCESS"
var_0_0.FINISH_UP_TEC = "TechnologyConst:FINISH_UP_TEC"
var_0_0.FINISH_TEC_SUCCESS = "TechnologyConst:FINISH_TEC_SUCCESS"
var_0_0.GOT_TEC_CAMP_AWARD = "TechnologyConst:GOT_TEC_CAMP_AWARD"
var_0_0.GOT_TEC_CAMP_AWARD_ONESTEP = "TechnologyConst:GOT_TEC_CAMP_AWARD_ONESTEP"
var_0_0.SET_TEC_ATTR_ADDITION_FINISH = "TechnologyConst:SET_TEC_ATTR_ADDITION_FINISH"
var_0_0.SHIP_LEVEL_FOR_BUFF = 120
var_0_0.AtlasName = "ui/technologytreeui_atlas"
var_0_0.QUEUE_TOTAL_COUNT = 5
var_0_0.NationOrder = {
	Nation.US,
	Nation.EN,
	Nation.JP,
	Nation.DE,
	Nation.CN,
	Nation.SN,
	Nation.FF,
	Nation.MNF,
	Nation.ITA,
	Nation.NL,
	Nation.LDP
}
var_0_0.NationResName = {
	"nation_all_",
	"nation_baiying_",
	"nation_huangjia_",
	"nation_chongying_",
	"nation_tiexue_",
	"nation_donghuang_",
	"nation_beilian_",
	"nation_ziyou_",
	"nation_weixi_",
	"nation_sading_",
	"nation_yujinwangguo_",
	"nation_jinghuanlianmeng_"
}

if LOCK_NATION_HNLMS then
	table.removebyvalue(var_0_0.NationOrder, Nation.NL)
	table.removebyvalue(var_0_0.NationResName, "nation_yujinwangguo_")
end

var_0_0.TECH_NATION_ATTRS = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Armor,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}

function var_0_0.GetNationSpriteByIndex(arg_1_0)
	local var_1_0 = GetSpriteFromAtlas(var_0_0.AtlasName, var_0_0.NationResName[arg_1_0] .. "01")
	local var_1_1 = GetSpriteFromAtlas(var_0_0.AtlasName, var_0_0.NationResName[arg_1_0] .. "02")

	return var_1_0, var_1_1
end

var_0_0.TypeOrder = {
	{
		ShipType.QuZhu
	},
	{
		ShipType.QingXun
	},
	{
		ShipType.ZhongXun,
		ShipType.ChaoXun
	},
	{
		ShipType.QingHang,
		ShipType.ZhengHang
	},
	{
		ShipType.ZhanXun,
		ShipType.ZhanLie
	},
	{
		ShipType.QianTing,
		ShipType.QianMu
	},
	{
		ShipType.WeiXiu,
		ShipType.ZhongPao,
		ShipType.Yunshu,
		ShipType.HangZhan,
		ShipType.FengFanS,
		ShipType.FengFanV,
		ShipType.FengFanM
	}
}
var_0_0.TypeResName = {
	"type_qvzhu_",
	"type_qingxun_",
	"type_zhongxun_",
	"type_hangmu_",
	"type_zhanlie_",
	"type_qianting_",
	"type_other_",
	"type_all_"
}

function var_0_0.GetTypeSpriteByIndex(arg_2_0)
	local var_2_0 = GetSpriteFromAtlas(var_0_0.AtlasName, var_0_0.TypeResName[arg_2_0] .. "01")
	local var_2_1 = GetSpriteFromAtlas(var_0_0.AtlasName, var_0_0.TypeResName[arg_2_0] .. "02")

	return var_2_0, var_2_1
end

function var_0_0.ClassToGroupIDList()
	local var_3_0 = {}

	for iter_3_0, iter_3_1 in ipairs(pg.fleet_tech_ship_template.all) do
		local var_3_1 = pg.fleet_tech_ship_template[iter_3_1].class

		if var_3_0[var_3_1] then
			table.insert(var_3_0[var_3_1], iter_3_1)
		else
			var_3_0[var_3_1] = {
				iter_3_1
			}
		end
	end

	return var_3_0
end

function var_0_0.GetOrderClassList()
	local var_4_0 = {}

	for iter_4_0, iter_4_1 in ipairs(pg.fleet_tech_ship_class.all) do
		local var_4_1 = pg.fleet_tech_ship_class[iter_4_1].nation

		if var_4_1 ~= Nation.META and var_4_1 ~= Nation.MOT then
			table.insert(var_4_0, iter_4_1)
		end
	end

	local function var_4_2(arg_5_0, arg_5_1)
		local var_5_0 = pg.fleet_tech_ship_class[arg_5_0]
		local var_5_1 = pg.fleet_tech_ship_class[arg_5_1]
		local var_5_2

		if var_5_0.t_level == var_5_1.t_level then
			var_5_2 = var_5_0.t_level_1 > var_5_1.t_level_1
		else
			var_5_2 = var_5_0.t_level > var_5_1.t_level
		end

		return var_5_2
	end

	table.sort(var_4_0, var_4_2)

	return var_4_0
end

var_0_0.MetaClassConfig = nil
var_0_0.MotClassConfig = nil

function var_0_0.CreateMetaClassConfig()
	if var_0_0.MetaClassConfig or var_0_0.MotClassConfig then
		return
	end

	for iter_6_0, iter_6_1 in ipairs(pg.fleet_tech_ship_class.all) do
		local var_6_0 = pg.fleet_tech_ship_class[iter_6_1]
		local var_6_1 = var_6_0.nation

		if var_6_1 == Nation.META then
			if var_0_0.MetaClassConfig == nil then
				var_0_0.MetaClassConfig = {}
			end

			local var_6_2 = var_6_0.t_level
			local var_6_3 = "meta_class_t_level_" .. var_6_2

			if var_0_0.MetaClassConfig[var_6_3] == nil then
				var_0_0.MetaClassConfig[var_6_3] = {}
			end

			if var_0_0.MetaClassConfig[var_6_3].ships == nil then
				var_0_0.MetaClassConfig[var_6_3].ships = {}
			end

			local var_6_4 = i18n(var_6_3)
			local var_6_5 = var_6_0.t_level_1

			if var_0_0.MetaClassConfig[var_6_3].ships[var_6_5] == nil then
				var_0_0.MetaClassConfig[var_6_3].ships[var_6_5] = {}
			end

			if var_0_0.MetaClassConfig[var_6_3].indexList == nil then
				var_0_0.MetaClassConfig[var_6_3].indexList = {}
			end

			if not table.contains(var_0_0.MetaClassConfig[var_6_3].indexList, var_6_5) then
				table.insert(var_0_0.MetaClassConfig[var_6_3].indexList, var_6_5)
			end

			local var_6_6 = var_0_0.MetaClassConfig[var_6_3]

			var_6_6.id = var_6_3
			var_6_6.name = var_6_4
			var_6_6.nation = var_6_1
			var_6_6.t_level = var_6_2

			table.insert(var_6_6.ships[var_6_5], var_6_0.ships[1])
		elseif var_6_1 == Nation.MOT then
			if var_0_0.MotClassConfig == nil then
				var_0_0.MotClassConfig = {}
			end

			local var_6_7 = var_6_0.t_level
			local var_6_8 = "mot_class_t_level_" .. var_6_7

			if var_0_0.MotClassConfig[var_6_8] == nil then
				var_0_0.MotClassConfig[var_6_8] = {}
			end

			if var_0_0.MotClassConfig[var_6_8].ships == nil then
				var_0_0.MotClassConfig[var_6_8].ships = {}
			end

			local var_6_9 = i18n(var_6_8)
			local var_6_10 = var_6_0.t_level_1

			if var_0_0.MotClassConfig[var_6_8].ships[var_6_10] == nil then
				var_0_0.MotClassConfig[var_6_8].ships[var_6_10] = {}
			end

			if var_0_0.MotClassConfig[var_6_8].indexList == nil then
				var_0_0.MotClassConfig[var_6_8].indexList = {}
			end

			if not table.contains(var_0_0.MotClassConfig[var_6_8].indexList, var_6_10) then
				table.insert(var_0_0.MotClassConfig[var_6_8].indexList, var_6_10)
			end

			local var_6_11 = var_0_0.MotClassConfig[var_6_8]

			var_6_11.id = var_6_8
			var_6_11.name = var_6_9
			var_6_11.nation = var_6_1
			var_6_11.t_level = var_6_7

			table.insert(var_6_11.ships[var_6_10], var_6_0.ships[1])
		end
	end

	if var_0_0.MetaClassConfig then
		for iter_6_2, iter_6_3 in pairs(var_0_0.MetaClassConfig) do
			local var_6_12 = iter_6_3.indexList
			local var_6_13 = {}

			for iter_6_4, iter_6_5 in ipairs(var_6_12) do
				_.each(iter_6_3.ships[iter_6_5], function(arg_7_0)
					table.insert(var_6_13, arg_7_0)
				end)
			end

			iter_6_3.ships = var_6_13
		end
	end

	if var_0_0.MotClassConfig then
		for iter_6_6, iter_6_7 in pairs(var_0_0.MotClassConfig) do
			local var_6_14 = iter_6_7.indexList
			local var_6_15 = {}

			for iter_6_8, iter_6_9 in ipairs(var_6_14) do
				_.each(iter_6_7.ships[iter_6_9], function(arg_8_0)
					table.insert(var_6_15, arg_8_0)
				end)
			end

			iter_6_7.ships = var_6_15
		end
	end
end

function var_0_0.GetOrderMetaClassList(arg_9_0)
	local var_9_0 = {}
	local var_9_1 = pg.gameset.meta_tech_sort.description
	local var_9_2 = {}

	for iter_9_0, iter_9_1 in ipairs(var_9_1) do
		for iter_9_2, iter_9_3 in pairs(var_0_0.MetaClassConfig) do
			if iter_9_1 == iter_9_3.t_level then
				table.insert(var_9_2, iter_9_3)

				break
			end
		end
	end

	for iter_9_4, iter_9_5 in ipairs(var_9_2) do
		local var_9_3 = iter_9_5.ships
		local var_9_4

		if not arg_9_0 or #arg_9_0 == 0 then
			var_9_4 = var_9_3
		else
			var_9_4 = _.select(var_9_3, function(arg_10_0)
				local var_10_0 = var_0_0.GetShipTypeByGroupID(arg_10_0)

				return table.contains(arg_9_0, var_10_0)
			end)
		end

		if #var_9_4 > 0 then
			table.insert(var_9_0, iter_9_5.id)
		end
	end

	return var_9_0
end

function var_0_0.GetOrderMotClassList(arg_11_0)
	local var_11_0 = {}
	local var_11_1 = pg.gameset.tech_sort_mot.description
	local var_11_2 = {}

	for iter_11_0, iter_11_1 in ipairs(var_11_1) do
		for iter_11_2, iter_11_3 in pairs(var_0_0.MotClassConfig) do
			if iter_11_1 == iter_11_3.t_level then
				table.insert(var_11_2, iter_11_3)

				break
			end
		end
	end

	for iter_11_4, iter_11_5 in ipairs(var_11_2) do
		local var_11_3 = iter_11_5.ships
		local var_11_4

		if not arg_11_0 or #arg_11_0 == 0 then
			var_11_4 = var_11_3
		else
			var_11_4 = _.select(var_11_3, function(arg_12_0)
				local var_12_0 = var_0_0.GetShipTypeByGroupID(arg_12_0)

				return table.contains(arg_11_0, var_12_0)
			end)
		end

		if #var_11_4 > 0 then
			table.insert(var_11_0, iter_11_5.id)
		end
	end

	return var_11_0
end

function var_0_0.GetMetaClassConfig(arg_13_0, arg_13_1)
	local var_13_0 = var_0_0.MetaClassConfig[arg_13_0]
	local var_13_1 = var_13_0.ships
	local var_13_2

	if not arg_13_1 or #arg_13_1 == 0 then
		var_13_2 = var_13_1
	else
		var_13_2 = _.select(var_13_1, function(arg_14_0)
			local var_14_0 = var_0_0.GetShipTypeByGroupID(arg_14_0)

			return table.contains(arg_13_1, var_14_0)
		end)
	end

	return {
		id = var_13_0.id,
		name = var_13_0.name,
		nation = var_13_0.nation,
		ships = var_13_2
	}
end

function var_0_0.GetMotClassConfig(arg_15_0, arg_15_1)
	local var_15_0 = var_0_0.MotClassConfig[arg_15_0]
	local var_15_1 = var_15_0.ships
	local var_15_2

	if not arg_15_1 or #arg_15_1 == 0 then
		var_15_2 = var_15_1
	else
		var_15_2 = _.select(var_15_1, function(arg_16_0)
			local var_16_0 = var_0_0.GetShipTypeByGroupID(arg_16_0)

			return table.contains(arg_15_1, var_16_0)
		end)
	end

	return {
		id = var_15_0.id,
		name = var_15_0.name,
		nation = var_15_0.nation,
		ships = var_15_2
	}
end

function var_0_0.GetShipTypeByGroupID(arg_17_0)
	return ShipGroup.getDefaultShipConfig(arg_17_0).type
end

function var_0_0.isNormalActOn()
	local var_18_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_GUIDE_TASKS)
	local var_18_1 = var_18_0 and not var_18_0:isEnd()
	local var_18_2 = false
	local var_18_3 = false

	if var_18_1 then
		local var_18_4 = var_18_0:getConfig("config_data")[1]
		local var_18_5 = getProxy(ChapterProxy):getChapterById(var_18_4)

		var_18_2 = var_18_5 and var_18_5:isClear()

		local var_18_6 = _.flatten(var_18_0:getConfig("config_data")[3])
		local var_18_7 = getProxy(TaskProxy)

		var_18_3 = _.any(var_18_6, function(arg_19_0)
			local var_19_0 = var_18_7:getTaskById(arg_19_0)

			return var_19_0 and var_19_0:isFinish() and not var_19_0:isReceive()
		end)
	end

	return var_18_1 and var_18_2, var_18_3
end

function var_0_0.isTecActOn()
	local var_20_0 = getProxy(PlayerProxy):getRawData()

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(var_20_0.level, "ShipBluePrintMediator") then
		return false
	end

	local var_20_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_FRESH_TEC_CATCHUP)

	if not (var_20_1 and not var_20_1:isEnd()) then
		return false
	end

	local var_20_2 = var_20_1:getConfig("config_data")[1]
	local var_20_3 = getProxy(ChapterProxy):getChapterById(var_20_2)

	if not (var_20_3 and var_20_3:isClear()) then
		return false
	end

	local var_20_4 = getProxy(TaskProxy)

	if var_20_1.data1 ~= 0 and var_20_1.data2 ~= 0 then
		local var_20_5 = var_20_1:getConfig("config_data")[3][var_20_1.data1]
		local var_20_6 = var_20_4:getTaskById(var_20_5[2])

		if var_20_6 and var_20_6:isReceive() and #var_20_1.data1_list + var_20_1.data2 + 1 == #var_20_1:getConfig("config_data")[3] + 1 then
			return false
		end
	end

	local var_20_7 = false

	if var_20_1.data1 == 0 then
		var_20_7 = true
	else
		local var_20_8 = var_20_1:getConfig("config_data")[3][var_20_1.data1]

		var_20_7 = underscore.any({
			function()
				return underscore.any(var_20_8[1], function(arg_22_0)
					local var_22_0 = var_20_4:getTaskVO(arg_22_0)

					return var_22_0 and var_22_0:getTaskStatus() == 1
				end)
			end,
			function()
				local var_23_0 = var_20_4:getTaskVO(var_20_8[2])

				return var_23_0 and var_23_0:getTaskStatus() == 1
			end,
			function()
				local var_24_0 = var_20_4:getTaskVO(var_20_8[2])

				if var_24_0 and var_24_0:isReceive() then
					return #var_20_1.data1_list + var_20_1.data2 + 1 < #var_20_1:getConfig("config_data")[3] + 1
				else
					return false
				end
			end
		}, function(arg_25_0)
			return arg_25_0()
		end)
	end

	return true, var_20_7
end

return var_0_0
