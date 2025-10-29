local var_0_0 = class("HarborBackHillScene", import("..TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "HarborBackHillUI"
end

var_0_0.edge2area = {
	default = "_SDPlace"
}

function var_0_0.init(arg_2_0)
	var_0_0.super.init(arg_2_0)

	arg_2_0.top = arg_2_0._tf:Find("top")
	arg_2_0._bg = arg_2_0._tf:Find("BG")
	arg_2_0._map = arg_2_0._tf:Find("map")

	for iter_2_0 = 0, arg_2_0._map.childCount - 1 do
		local var_2_0 = arg_2_0._map:GetChild(iter_2_0)
		local var_2_1 = go(var_2_0).name

		arg_2_0["map_" .. var_2_1] = var_2_0
	end

	arg_2_0._upper = arg_2_0._tf:Find("upper")

	for iter_2_1 = 0, arg_2_0._upper.childCount - 1 do
		local var_2_2 = arg_2_0._upper:GetChild(iter_2_1)
		local var_2_3 = go(var_2_2).name

		arg_2_0["upper_" .. var_2_3] = var_2_2
	end

	arg_2_0._SDPlace = arg_2_0._tf:Find("SDPlace")
	arg_2_0.containers = {
		arg_2_0._SDPlace
	}
	arg_2_0._shipTpl = arg_2_0._map:Find("ship")
	arg_2_0.graphPath = GraphPath.New(import("GameCfg.BackHillGraphs.HarborBackHillGraph"))
end

function var_0_0.didEnter(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/Back"), function()
		arg_3_0:onBackPressed()
	end, SFX_CANCEL)
	onButton(arg_3_0, arg_3_0._tf:Find("top/Home"), function()
		arg_3_0:quickExitFunc()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("top/Help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.harbor_backhill_help.tip
		})
	end, SFX_PANEL)

	local var_3_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.MINIGAME_PIRATE_ID)

	arg_3_0:InitStudents(var_3_0 and var_3_0.id, 2, 3)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "xuanshangban", function()
		if var_0_0.XuanShangBanFirstTip() then
			local var_7_0 = getProxy(PlayerProxy):getData().id

			PlayerPrefs.SetInt("FIRST_INTO_ACT_" .. ActivityConst.PIRATE_MEDAL_ACT_ID .. "_" .. var_7_0, 1)
		end

		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.TEMPESTA_MEDAL_COLLECTION)
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "mimichuanchang", function()
		if arg_3_0:IsMiniGameEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

			return
		end

		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SECRET_SHIPYARD)
	end)
	arg_3_0:BindItemActivityShop()
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "huanzhuangshangdian", function()
		if arg_3_0:IsMiniGameEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

			return
		end

		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.SKINSHOP)
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "xianshijianzao", function()
		if arg_3_0:IsMiniGameEnd() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("challenge_end_tip"))

			return
		end

		local var_10_0
		local var_10_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1)
		local var_10_2 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILD)

		if var_10_1 and not var_10_1:isEnd() then
			var_10_0 = BuildShipScene.PROJECTS.ACTIVITY
		elseif var_10_2 and not var_10_2:isEnd() then
			var_10_0 = ({
				BuildShipScene.PROJECTS.SPECIAL,
				BuildShipScene.PROJECTS.LIGHT,
				BuildShipScene.PROJECTS.HEAVY
			})[var_10_2:getConfig("config_client").id]
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_3_0:emit(BackHillMediatorTemplate.GO_SCENE, SCENE.GETBOAT, ctx or {
			page = BuildShipScene.PAGE_BUILD,
			projectName = var_10_0
		})
	end)
	arg_3_0:UpdateView()
end

function var_0_0.XuanShangBanFirstTip()
	local var_11_0 = getProxy(PlayerProxy):getData().id

	return PlayerPrefs.GetInt("FIRST_INTO_ACT_" .. ActivityConst.PIRATE_MEDAL_ACT_ID .. "_" .. var_11_0) == 0
end

function var_0_0.XuanShangBanTip()
	local var_12_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.PIRATE_MEDAL_ACT_ID)

	return var_0_0.XuanShangBanFirstTip() or Activity.IsActivityReady(var_12_0)
end

function var_0_0.IsFinishAllActTask()
	local var_13_0 = getProxy(TaskProxy)
	local var_13_1 = pg.activity_template[ActivityConst.BOAT_QIAN_SHAO_ZHAN].config_data
	local var_13_2 = var_13_1[#var_13_1]

	return underscore.all(var_13_2, function(arg_14_0)
		return var_13_0:getFinishTaskById(arg_14_0)
	end)
end

function var_0_0.MiMiChuanChangTip()
	if not var_0_0.IsFinishAllActTask() then
		local var_15_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.BOAT_QIAN_SHAO_ZHAN)

		return Activity.IsActivityReady(var_15_0)
	else
		return BackHillTemplate.IsMiniActNeedTip(ActivityConst.MINIGAME_PIRATE_ID)
	end
end

function var_0_0.UpdateView(arg_16_0)
	setActive(arg_16_0.upper_mimichuanchang:Find("Tip"), var_0_0.MiMiChuanChangTip())
	setActive(arg_16_0.upper_xuanshangban:Find("Tip"), var_0_0.XuanShangBanTip())
end

function var_0_0.IsMiniGameEnd(arg_17_0)
	local var_17_0 = getProxy(ActivityProxy):getActivityById(ActivityConst.MINIGAME_PIRATE_ID)

	return not var_17_0 or var_17_0:isEnd()
end

function var_0_0.willExit(arg_18_0)
	arg_18_0:clearStudents()
	var_0_0.super.willExit(arg_18_0)
end

function var_0_0.IsShowMainTip(arg_19_0)
	if arg_19_0 and not arg_19_0:isEnd() then
		return var_0_0.XuanShangBanTip() or var_0_0.MiMiChuanChangTip()
	else
		return var_0_0.XuanShangBanTip()
	end
end

return var_0_0
