local var_0_0 = class("WindFogCorridorMainPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0._tf:Find("AD")
	arg_1_0.btnManual = arg_1_0.AD:Find("TopPage/top/manual")
	arg_1_0.Txtmanual = arg_1_0.btnManual:Find("Text")
	arg_1_0.redMalPoint = arg_1_0.btnManual:Find("tip")
	arg_1_0.btnGroup = arg_1_0.AD:Find("btn_list")
	arg_1_0.btnBuild = arg_1_0.btnGroup:Find("build")
	arg_1_0.btnFight = arg_1_0.btnGroup:Find("fight_bg/fight")
	arg_1_0.btnShop = arg_1_0.btnGroup:Find("shop")
	arg_1_0.resTimeBuild = arg_1_0.btnBuild:Find("resTime/Text")
	arg_1_0.resTimeShop = arg_1_0.btnShop:Find("resTime/Text")
end

function var_0_0.OnFirstFlush(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_client")
	local var_2_1

	if var_2_0.is_showMedal then
		var_2_1 = var_2_0.medal_group_id
	end

	var_2_0 = type(var_2_0) == "table" and var_2_0 or {}

	local function var_2_2(arg_3_0)
		if not arg_3_0 then
			return false
		end

		local var_3_0 = getProxy(ActivityProxy):getActivityById(arg_3_0)

		return not var_3_0 or var_3_0:isEnd()
	end

	onButton(arg_2_0, arg_2_0.btnBuild, function()
		if var_2_2(var_2_0.buildLinkActID) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		arg_2_0:emit(ActivityMediator.EVENT_GO_SCENE, SCENE.GETBOAT, {
			page = BuildShipScene.PAGE_BUILD,
			projectName = BuildShipScene.PROJECTS.ACTIVITY
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnFight, function()
		local var_5_0 = var_2_0.fightLinkActID

		if var_5_0 and var_2_2(var_5_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		if var_5_0 then
			arg_2_0:emit(ActivityMediator.SKIP_ACTIVITY_MAP, var_5_0)
		else
			arg_2_0:emit(ActivityMediator.BATTLE_OPERA)
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnShop, function()
		arg_2_0:emit(ActivityMediator.GO_CHANGE_SHOP)
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnManual, function()
		local var_7_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = arg_2_0:GetMedalGropClassById(var_2_1)
		})

		arg_2_0:emit(ActivityMediator.ON_ADD_SUBLAYER, var_7_0)
	end, SFX_PANEL)
	setText(arg_2_0.Txtmanual, i18n("anniversary_nine_main_page"))
	arg_2_0:refreshBtnResTime()
	arg_2_0:refreshRed()
end

function var_0_0.refreshBtnResTime(arg_8_0)
	local var_8_0 = arg_8_0.activity:getConfig("config_client")

	var_8_0 = type(var_8_0) == "table" and var_8_0 or {}

	local var_8_1 = pg.TimeMgr.GetInstance():GetServerTime()

	local function var_8_2(arg_9_0, arg_9_1, arg_9_2)
		if not arg_9_0 or not arg_9_1 then
			return
		end

		local var_9_0 = 0
		local var_9_1 = 0
		local var_9_2 = false

		if arg_9_2 == 1 then
			local var_9_3 = arg_9_1 and getProxy(ActivityProxy):getActivityById(arg_9_1) or nil

			var_9_2 = var_9_3 and not var_9_3:isEnd() and var_9_3.stopTime and var_9_3.stopTime > var_8_1

			local var_9_4 = var_9_3.stopTime - var_8_1

			var_9_1 = math.floor(var_9_4 / 3600)
		else
			local var_9_5 = pg.shop_template[arg_9_1]
			local var_9_6 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_9_5.time[2]) - var_8_1

			var_9_1 = math.floor(var_9_6 / 3600)
			var_9_2 = var_9_6 > 0
		end

		if var_9_2 and var_9_1 <= 24 then
			setActive(arg_9_0.parent, true)

			if arg_9_2 == 1 then
				setText(arg_9_0, i18n("StarsCityMainPage_no_time"))
			else
				setText(arg_9_0, i18n("StarsCityMainPage_res_day_time", var_9_1))
			end
		else
			setActive(arg_9_0.parent, false)
			setText(arg_9_0, "")
		end
	end

	var_8_2(arg_8_0.resTimeBuild, var_8_0.buildLinkActID, 1)
	var_8_2(arg_8_0.resTimeShop, var_8_0.shopItemID, 2)
end

function var_0_0.OnUpdateFlush(arg_10_0)
	arg_10_0:refreshRed()
	arg_10_0:refreshBtnResTime()
end

function var_0_0.refreshRed(arg_11_0)
	local var_11_0 = arg_11_0.activity:getConfig("config_client")

	if var_11_0.is_showMedal then
		local var_11_1 = var_11_0.medal_group_id

		setActive(arg_11_0.redMalPoint, ActivityMedalGroup.showTip(var_11_1))
	end
end

function var_0_0.GetMedalGropClassById(arg_12_0, arg_12_1)
	if arg_12_1 == nil then
		return nil
	end

	local var_12_0 = pg.activity_medal_group[arg_12_1].ui_prefab.scene

	return _G[var_12_0]
end

return var_0_0
