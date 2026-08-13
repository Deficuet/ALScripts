local var_0_0 = class("StarsCityMainPage", import("view.activity.CorePage.CoreActivityPage"))

function var_0_0.OnInit(arg_1_0)
	arg_1_0.AD = arg_1_0._tf:Find("AD")
	arg_1_0.btnManual = arg_1_0.AD:Find("TopPage/top/manual")
	arg_1_0.Txtmanual = arg_1_0.btnManual:Find("Text")
	arg_1_0.redMalPoint = arg_1_0.btnManual:Find("tip")
	arg_1_0.btnGroup = arg_1_0.AD:Find("btn_list")
	arg_1_0.btnBuild = arg_1_0.btnGroup:Find("build")
	arg_1_0.btnFight = arg_1_0.btnGroup:Find("fight")
	arg_1_0.btnShop = arg_1_0.btnGroup:Find("shop")
	arg_1_0.resTimeBuild = arg_1_0.btnBuild:Find("resTime/Text")
	arg_1_0.resTimeShop = arg_1_0.btnShop:Find("resTime/Text")
end

function var_0_0.OnFirstFlush(arg_2_0)
	local var_2_0 = arg_2_0.activity:getConfig("config_client")

	var_2_0 = type(var_2_0) == "table" and var_2_0 or {}

	local function var_2_1(arg_3_0)
		if not arg_3_0 then
			return false
		end

		local var_3_0 = getProxy(ActivityProxy):getActivityById(arg_3_0)

		return not var_3_0 or var_3_0:isEnd()
	end

	onButton(arg_2_0, arg_2_0.btnBuild, function()
		if var_2_1(var_2_0.buildLinkActID) then
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

		if var_5_0 and var_2_1(var_5_0) then
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
		local var_6_0 = var_2_0.shopLinkActID

		if var_6_0 and var_2_1(var_6_0) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

			return
		end

		if var_6_0 then
			arg_2_0:emit(ActivityMediator.GO_SHOPS_LAYER, {
				warp = NewShopsScene.TYPE_ACTIVITY,
				actId = var_6_0
			})
		else
			arg_2_0:emit(ActivityMediator.GO_CHANGE_SHOP)
		end
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.btnManual, function()
		local var_7_0 = Context.New({
			mediator = MedalAlbumTemplateMediator,
			viewComponent = StarsCityMedalAlbumView
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

	local function var_8_2(arg_9_0, arg_9_1)
		if not arg_9_0 then
			return
		end

		local var_9_0 = arg_9_1 and getProxy(ActivityProxy):getActivityById(arg_9_1) or nil

		if var_9_0 and not var_9_0:isEnd() and var_9_0.stopTime and var_9_0.stopTime > var_8_1 then
			local var_9_1 = var_9_0.stopTime - var_8_1
			local var_9_2 = math.floor(var_9_1 / 86400)
			local var_9_3 = math.floor(var_9_1 % 86400 / 3600)

			setActive(arg_9_0.parent, true)

			if var_9_3 >= 2 then
				setText(arg_9_0, i18n("StarsCityMainPage_res_day_time", var_9_2, var_9_3))
			else
				setText(arg_9_0, i18n("StarsCityMainPage_no_time"))
			end
		else
			setActive(arg_9_0.parent, false)
			setText(arg_9_0, "")
		end
	end

	var_8_2(arg_8_0.resTimeBuild, var_8_0.buildLinkActID)
	var_8_2(arg_8_0.resTimeShop, var_8_0.shopLinkActID)
end

function var_0_0.OnUpdateFlush(arg_10_0)
	arg_10_0:refreshRed()
	arg_10_0:refreshBtnResTime()
end

function var_0_0.refreshRed(arg_11_0)
	local var_11_0, var_11_1 = var_0_0.GetFujinBayMedalTaskCount()

	setActive(arg_11_0.redMalPoint, var_11_1 > 0)
end

function var_0_0.IsShowReminder(arg_12_0)
	return var_0_0.IsTip()
end

function var_0_0.IsTip()
	return var_0_0.IsFujinBayMedalTaskTip()
end

function var_0_0.IsFujinBayMedalTaskTip()
	local var_14_0, var_14_1 = var_0_0.GetFujinBayMedalTaskCount()

	return var_14_1 > 0
end

function var_0_0.GetFujinBayMedalTaskCount()
	local var_15_0 = StarsCityMedalAlbumView.GROUP_ID
	local var_15_1 = pg.activity_medal_group[var_15_0]
	local var_15_2 = var_15_1 and var_15_1.activity_link or {}
	local var_15_3

	for iter_15_0, iter_15_1 in ipairs(var_15_2) do
		local var_15_4 = iter_15_1[2]
		local var_15_5 = getProxy(ActivityProxy):getActivityById(var_15_4)

		if var_15_5 and not var_15_5:isEnd() then
			var_15_3 = iter_15_1[3]

			break
		end
	end

	if not var_15_3 then
		return 0, 0, 0
	end

	local var_15_6 = getProxy(TaskProxy)
	local var_15_7 = 0
	local var_15_8 = 0
	local var_15_9 = #var_15_3

	for iter_15_2, iter_15_3 in ipairs(var_15_3) do
		local var_15_10 = var_15_6:getTaskById(iter_15_3) or var_15_6:getFinishTaskById(iter_15_3)

		if var_15_10 then
			local var_15_11 = var_15_10:getTaskStatus()

			if var_15_11 == 1 then
				var_15_8 = var_15_8 + 1
				var_15_7 = var_15_7 + 1
			elseif var_15_11 == 2 then
				var_15_7 = var_15_7 + 1
			end
		end
	end

	return var_15_7, var_15_8, var_15_9
end

return var_0_0
