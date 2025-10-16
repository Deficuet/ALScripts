local var_0_0 = class("SSSSLinkAcademyScene", import("..TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "SSSSLinkAcademyUI"
end

var_0_0.edge2area = {
	default = "map_middle",
	["2_3"] = "map_front",
	["4_5"] = "map_front",
	["2_2"] = "map_front",
	["3_4"] = "map_front"
}

function var_0_0.init(arg_2_0)
	arg_2_0.top = arg_2_0._tf:Find("top")
	arg_2_0._map = arg_2_0._tf:Find("map")

	for iter_2_0 = 0, arg_2_0._map.childCount - 1 do
		local var_2_0 = arg_2_0._map:GetChild(iter_2_0)
		local var_2_1 = go(var_2_0).name

		arg_2_0["map_" .. var_2_1] = var_2_0
	end

	arg_2_0._shipTpl = arg_2_0._map:Find("ship")
	arg_2_0._upper = arg_2_0._tf:Find("upper")

	for iter_2_1 = 0, arg_2_0._upper.childCount - 1 do
		local var_2_2 = arg_2_0._upper:GetChild(iter_2_1)
		local var_2_3 = go(var_2_2).name

		arg_2_0["upper_" .. var_2_3] = var_2_2
	end

	arg_2_0.containers = {
		arg_2_0.map_front,
		arg_2_0.map_middle
	}
	arg_2_0.graphPath = GraphPath.New(import("GameCfg.BackHillGraphs.SSSSLinkAcademyGraph"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/return_btn"), function()
		arg_3_0:emit(var_0_0.ON_BACK)
	end)
	onButton(arg_3_0, arg_3_0._tf:Find("top/return_main_btn"), function()
		arg_3_0:emit(var_0_0.ON_HOME)
	end)
	onButton(arg_3_0, arg_3_0._tf:Find("top/help_btn"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.ssss_main_help.tip
		})
	end)
	arg_3_0:BindItemActivityShop()
	arg_3_0:BindItemSkinShop()
	arg_3_0:BindItemBuildShip()
	arg_3_0:BindItemBattle()

	local var_3_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)

	arg_3_0:InitStudents(var_3_0 and var_3_0.id, 3, 4)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "xiaoyouxi", function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, 55)
	end)

	local var_3_1 = getProxy(ActivityProxy):getActivityById(ActivityConst.SSSS_PT)

	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "huodongye", function()
		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.ACTIVITY, {
			id = var_3_1 and var_3_1.id
		})
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "jinianzhang", function()
		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SSSS_MEDAL_COLLECTION)
	end)
	onButton(arg_3_0, arg_3_0.upper_huoyuehuodong, function()
		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.MONOPOLY_WORLD)
	end)
	arg_3_0:UpdateView()
end

function var_0_0.UpdateView(arg_11_0)
	local var_11_0 = getProxy(ActivityProxy)
	local var_11_1
	local var_11_2 = var_11_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)
	local var_11_3 = var_0_0.IsMiniActNeedTip(var_11_2 and var_11_2.id)
	local var_11_4 = arg_11_0.upper_xiaoyouxi:Find("tip")

	setActive(var_11_4, var_11_3)

	local var_11_5 = var_11_0:getActivityById(ActivityConst.SSSS_PT)
	local var_11_6 = arg_11_0.upper_huodongye:Find("tip")
	local var_11_7 = var_11_5 and var_11_5:readyToAchieve()

	setActive(var_11_6, var_11_7)

	local var_11_8 = arg_11_0.upper_jinianzhang:Find("tip")
	local var_11_9 = var_0_0.MedalTip()

	setActive(var_11_8, var_11_9)

	local var_11_10 = var_11_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)
	local var_11_11 = arg_11_0.upper_huoyuehuodong:Find("tip")
	local var_11_12 = var_11_10 and var_11_10:readyToAchieve()

	setActive(var_11_11, var_11_12)
end

function var_0_0.willExit(arg_12_0)
	arg_12_0:clearStudents()
end

function var_0_0.MedalTip()
	local var_13_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)

	return Activity.IsActivityReady(var_13_0)
end

function var_0_0.IsShowMainTip(arg_14_0)
	local var_14_0 = getProxy(ActivityProxy)

	local function var_14_1()
		local var_15_0 = var_14_0:getActivityById(ActivityConst.SSSS_PT)

		return Activity.IsActivityReady(var_15_0)
	end

	local var_14_2 = var_0_0.MedalTip()

	local function var_14_3()
		local var_16_0 = var_14_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MINIGAME)

		return Activity.IsActivityReady(var_16_0)
	end

	local function var_14_4()
		local var_17_0 = var_14_0:getActivityByType(ActivityConst.ACTIVITY_TYPE_MONOPOLY)

		return Activity.IsActivityReady(var_17_0)
	end

	return var_14_1() or var_14_2() or var_14_3() or var_14_4()
end

return var_0_0
