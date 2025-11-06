local var_0_0 = class("IslandIllustration", import("model.vo.BaseVO"))

var_0_0.TYPES = {
	ITEM = 3,
	CHAR = 1,
	NPC = 2
}
var_0_0.STATUS = {
	CAN_UNLOCK = 2,
	LOCK = 1,
	UNLOCK = 3
}

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1
	arg_1_0.configId = arg_1_1
	arg_1_0.status = var_0_0.STATUS.LOCK
	arg_1_0.isTip = false
	arg_1_0.basePoint = 0
	arg_1_0.levelPoints = 0
	arg_1_0.levelPointGotData = {}
	arg_1_0.starPoints = 0
	arg_1_0.starPointGotData = {}
end

function var_0_0.bindConfigTable(arg_2_0)
	return pg.island_illustrated_guide
end

function var_0_0.bindLinkConfigTable(arg_3_0)
	return switch(arg_3_0:getConfig("type"), {
		[var_0_0.TYPES.CHAR] = function()
			return pg.island_chara_template
		end,
		[var_0_0.TYPES.NPC] = function()
			return pg.island_unit_character
		end,
		[var_0_0.TYPES.ITEM] = function()
			return pg.island_item_data_template
		end
	})
end

function var_0_0.GetLinkConfigID(arg_7_0)
	return arg_7_0:getConfig("unlock_id")
end

function var_0_0.getLinkConfigTable(arg_8_0)
	local var_8_0 = arg_8_0:bindLinkConfigTable()

	assert(var_8_0, "should bindLinkConfigTable() first: " .. arg_8_0.__cname)

	return var_8_0[arg_8_0:GetLinkConfigID()]
end

function var_0_0.getLinkConfig(arg_9_0, arg_9_1)
	local var_9_0 = arg_9_0:getLinkConfigTable()

	assert(var_9_0 ~= nil, "LinkConfig missed, type -" .. arg_9_0.__cname .. " configId: " .. tostring(arg_9_0.configId))

	return var_9_0[arg_9_1]
end

function var_0_0.GetName(arg_10_0)
	return switch(arg_10_0:getConfig("type"), {
		[var_0_0.TYPES.CHAR] = function()
			local var_11_0 = arg_10_0:getLinkConfig("unit_id")

			return pg.island_unit_character[var_11_0].name
		end,
		[var_0_0.TYPES.NPC] = function()
			return arg_10_0:getLinkConfig("name")
		end,
		[var_0_0.TYPES.ITEM] = function()
			return arg_10_0:getLinkConfig("name")
		end
	})
end

function var_0_0.GetEnName(arg_14_0)
	return switch(arg_14_0:getConfig("type"), {
		[var_0_0.TYPES.CHAR] = function()
			local var_15_0 = arg_14_0:getLinkConfig("unit_id")

			return pg.island_unit_character[var_15_0].english_name
		end,
		[var_0_0.TYPES.NPC] = function()
			return arg_14_0:getLinkConfig("english_name")
		end,
		[var_0_0.TYPES.ITEM] = function()
			return ""
		end
	})
end

function var_0_0.GetDesc(arg_18_0)
	return switch(arg_18_0:getConfig("type"), {
		[var_0_0.TYPES.CHAR] = function()
			local var_19_0 = arg_18_0:getLinkConfig("unit_id")

			return pg.island_unit_character[var_19_0].describe_illustrated_guid
		end,
		[var_0_0.TYPES.NPC] = function()
			return arg_18_0:getLinkConfig("describe_illustrated_guid")
		end,
		[var_0_0.TYPES.ITEM] = function()
			return arg_18_0:getLinkConfig("desc")
		end
	})
end

function var_0_0.GetIcon(arg_22_0)
	return switch(arg_22_0:getConfig("type"), {
		[var_0_0.TYPES.CHAR] = function()
			local var_23_0 = arg_22_0:GetLinkConfigID()

			return "ShipYardIcon/" .. IslandShip.StaticGetPrefab(var_23_0)
		end,
		[var_0_0.TYPES.NPC] = function()
			return "island/IslandCharIcon/" .. arg_22_0:getLinkConfig("rendering")
		end,
		[var_0_0.TYPES.ITEM] = function()
			return "island/" .. arg_22_0:getLinkConfig("icon")
		end
	})
end

function var_0_0.SetPointData(arg_26_0, arg_26_1)
	arg_26_0.basePoint = arg_26_1.base
	arg_26_0.levelPoints = 0
	arg_26_0.levelPointGotData = {}

	for iter_26_0, iter_26_1 in ipairs(arg_26_1.lv_list) do
		arg_26_0.levelPoints = arg_26_0.levelPoints + iter_26_1.value
		arg_26_0.levelPointGotData[iter_26_1.lv] = iter_26_1.value
	end

	arg_26_0.starPoints = 0
	arg_26_0.starPointGotData = {}

	for iter_26_2, iter_26_3 in ipairs(arg_26_1.star_list) do
		arg_26_0.starPoints = arg_26_0.starPoints + iter_26_3.value
		arg_26_0.starPointGotData[iter_26_3.lv] = iter_26_3.value
	end
end

function var_0_0.SetStatus(arg_27_0, arg_27_1)
	arg_27_0.status = arg_27_1

	if arg_27_0.status == var_0_0.STATUS.CAN_UNLOCK then
		arg_27_0.isTip = true
	elseif arg_27_0.status == var_0_0.STATUS.UNLOCK then
		arg_27_0.basePoint = arg_27_0:getConfig("collect_add")
	end
end

function var_0_0.GetStatus(arg_28_0)
	return arg_28_0.status
end

function var_0_0.CheckTip(arg_29_0)
	arg_29_0.isTip = arg_29_0.status == var_0_0.STATUS.CAN_UNLOCK
end

function var_0_0.IsTip(arg_30_0)
	return arg_30_0.isTip
end

function var_0_0.GetPoints(arg_31_0)
	return arg_31_0.basePoint + arg_31_0.levelPoints + arg_31_0.starPoints
end

function var_0_0.GetTypeAndLinkId(arg_32_0)
	local var_32_0 = pg.island_illustrated_guide[arg_32_0]

	return var_32_0.type, var_32_0.unlock_id
end

return var_0_0
