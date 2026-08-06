local var_0_0 = class("DOALinkIslandReScene", import("..TemplateMV.BackHillTemplate"))

function var_0_0.getUIName(arg_1_0)
	return "DOALinkIslandReUI"
end

var_0_0.edge2area = {
	default = "map_middle",
	["2_2"] = "map_bridge"
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
		arg_2_0.map_middle
	}
	arg_2_0.graphPath = GraphPath.New(import("GameCfg.BackHillGraphs.DOAIslandGraph"))

	local var_2_4 = arg_2_0._tf:GetComponentInParent(typeof(UnityEngine.Canvas))
	local var_2_5 = var_2_4 and var_2_4.sortingOrder

	arg_2_0._map:GetComponent(typeof(UnityEngine.Canvas)).sortingOrder = var_2_5 - 3
	arg_2_0.map_tebiezuozhan:GetComponent(typeof(UnityEngine.Canvas)).sortingOrder = var_2_5 - 1
	arg_2_0.map_bridge:GetComponent(typeof(UnityEngine.Canvas)).sortingOrder = var_2_5 - 1

	local var_2_6 = arg_2_0._map:Find("DOAhoushan_hailang")

	pg.ViewUtils.SetSortingOrder(var_2_6, var_2_5 - 2)

	arg_2_0.mgProxy = getProxy(MiniGameProxy)
	arg_2_0.loader = AutoLoader.New()
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
			helps = pg.gametip.doa_main.tip
		})
	end)
	arg_3_0:InitStudents(ActivityConst.MINIGAME_VOLLEYBALL, 2, 3)

	local var_3_0 = arg_3_0:GetDOA2MiniGameId(ActivityConst.MINIGAME_VOLLEYBALL)

	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "shatanpaiqiu", function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, var_3_0)
	end)

	local var_3_1 = arg_3_0:GetDOA2MiniGameId(ActivityConst.MINIGAME_PENGPENGDONG)

	onButton(arg_3_0, arg_3_0._upper:Find("pengpengdong"), function()
		pg.m02:sendNotification(GAME.GO_MINI_GAME, var_3_1)
	end, SFX_PANEL)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "daoyvjianshe", function()
		arg_3_0:emit(DOALinkIslandReMediator.GO_SCENE, SCENE.ACTIVITY, {
			id = ActivityConst.DOA_PT_ID
		})
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "bujishangdian", function()
		arg_3_0:emit(DOALinkIslandReMediator.GO_SCENE, SCENE.SHOP, {
			warp = NewShopsScene.TYPE_ACTIVITY
		})
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "huanzhuangshangdian", function()
		arg_3_0:emit(DOALinkIslandReMediator.GO_SCENE, SCENE.SKINSHOP)
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "xianshijianzao", function()
		arg_3_0:emit(DOALinkIslandReMediator.GO_SCENE, SCENE.GETBOAT, {
			projectName = "new",
			page = 1
		})
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "jinianzhang", function()
		arg_3_0:emit(DOALinkIslandReMediator.GO_SCENE, SCENE.DOA2_MEDAL_COLLECTION_SCENE)
	end)
	arg_3_0:InitFacilityCross(arg_3_0._map, arg_3_0._upper, "tebiezuozhan", function()
		local var_14_0 = pg.activity_template[ActivityConst.DOA_PT_ID].config_client.fightLinkActID
		local var_14_1 = getProxy(ChapterProxy)
		local var_14_2, var_14_3 = var_14_1:getLastMapForActivity(var_14_0)

		if not var_14_2 or not var_14_1:getMapById(var_14_2):isUnlock() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))
		else
			arg_3_0:emit(DOALinkIslandReMediator.GO_SCENE, SCENE.LEVEL, {
				chapterId = var_14_3,
				mapIdx = var_14_2
			})
		end
	end)
	arg_3_0:UpdateView()
end

function var_0_0.UpdateView(arg_15_0)
	local var_15_0 = getProxy(ActivityProxy)
	local var_15_1

	setActive(arg_15_0.upper_shatanpaiqiu:Find("tip"), var_0_0.IsMiniActNeedTip(ActivityConst.MINIGAME_VOLLEYBALL))
	setActive(arg_15_0.upper_pengpengdong:Find("tip"), var_0_0.IsMiniActNeedTip(ActivityConst.MINIGAME_PENGPENGDONG))

	local var_15_2 = var_15_0:getActivityById(ActivityConst.MINIGAME_VOLLEYBALL)

	assert(var_15_2)

	local var_15_3 = getProxy(MiniGameProxy):GetHubByHubId(var_15_2:getConfig("config_id"))

	assert(var_15_3)
	arg_15_0.loader:GetSpriteQuiet("ui/DOALinkIslandUI_atlas", tostring(var_15_3.usedtime or 0), arg_15_0.map_shatanpaiqiu:Find("Digit"), true)

	local var_15_4 = var_15_0:getActivityById(ActivityConst.DOA_PT_ID)

	assert(var_15_4)

	local var_15_5 = arg_15_0.upper_daoyvjianshe:Find("tip")
	local var_15_6 = var_15_4 and var_15_4:readyToAchieve()

	setActive(var_15_5, var_15_6)

	local var_15_7 = arg_15_0.upper_jinianzhang:Find("tip")
	local var_15_8 = var_0_0.MedalTip()

	setActive(var_15_7, var_15_8)
end

function var_0_0.willExit(arg_16_0)
	arg_16_0:clearStudents()
	var_0_0.super.willExit(arg_16_0)
end

function var_0_0.MedalTip()
	local var_17_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_PUZZLA)

	return Activity.IsActivityReady(var_17_0)
end

function var_0_0.IsShowMainTip(arg_18_0)
	if arg_18_0 and not arg_18_0:isEnd() then
		local var_18_0 = getProxy(ActivityProxy)

		local function var_18_1()
			local var_19_0 = var_18_0:getActivityById(ActivityConst.DOA_PT_ID)

			return var_19_0 and not var_19_0:isEnd() and var_19_0:readyToAchieve()
		end

		local var_18_2 = var_0_0.MedalTip

		local function var_18_3()
			return var_0_0.IsMiniActNeedTip(ActivityConst.MINIGAME_VOLLEYBALL)
		end

		local function var_18_4()
			return var_0_0.IsMiniActNeedTip(ActivityConst.MINIGAME_PENGPENGDONG)
		end

		return var_18_1() or var_18_2() or var_18_3() or var_18_4()
	end
end

function var_0_0.GetDOA2MiniGameId(arg_22_0, arg_22_1)
	local var_22_0 = pg.activity_template[arg_22_1]

	if not var_22_0 then
		error("未找到对应DOA活动ID")

		return nil
	end

	local var_22_1 = var_22_0.config_id

	for iter_22_0 = #pg.mini_game.all, 1, -1 do
		local var_22_2 = pg.mini_game.all[iter_22_0]
		local var_22_3 = pg.mini_game[var_22_2]

		if var_22_3 and var_22_3.hub_id == var_22_1 then
			return var_22_2
		end
	end

	error("未找到对应DOA活动的miniGameID")

	return nil
end

return var_0_0
