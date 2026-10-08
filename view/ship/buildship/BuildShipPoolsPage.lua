local var_0_0 = class("BuildShipPoolsPage", import("...base.BaseSubView"))

function var_0_0.getResource(arg_1_0)
	local var_1_0 = {
		"ui/buildshipui_atlas"
	}

	local function var_1_1(arg_2_0)
		if noEmptyStr(arg_2_0) and not table.contains(var_1_0, arg_2_0) then
			table.insert(var_1_0, arg_2_0)
		end
	end

	local function var_1_2(arg_3_0)
		if noEmptyStr(arg_3_0) then
			table.insertto(var_1_0, ResPathSupport.GetPaintingListByPaintingName(arg_3_0))
		end
	end

	local function var_1_3(arg_4_0)
		if noEmptyStr(arg_4_0) then
			var_1_1(ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.BuildPainting, arg_4_0))
		end
	end

	local var_1_4 = getProxy(ActivityProxy)
	local var_1_5 = getProxy(BuildShipProxy):GetPools()

	for iter_1_0, iter_1_1 in ipairs(var_1_5 or {}) do
		local var_1_6 = iter_1_1:getConfigTable()
		local var_1_7 = iter_1_1:IsActivity() and var_1_4:getBuildActivityCfgByID(var_1_6.id) or var_1_4:getNoneActBuildActivityCfgByID(var_1_6.id)
		local var_1_8

		if var_1_7 then
			var_1_8 = var_1_7 and var_1_7.bg
		else
			var_1_8 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.BG.LoadingBG, "bg_" .. var_1_6.icon)
		end

		var_1_1(var_1_8)

		local var_1_9 = var_1_4:getBuildPoolActivity(iter_1_1)

		if PLATFORM_CODE == PLATFORM_CH and var_1_9 then
			var_1_3(var_1_9:getConfig("config_client").build_painting)
		end

		if iter_1_1:IsActivity() then
			local var_1_10 = pg.ship_data_create_exchange[iter_1_1:GetActivityId()]

			if var_1_10 and #var_1_10.exchange_ship_id > 0 then
				local var_1_11 = pg.ship_data_statistics[var_1_10.exchange_ship_id[1]]
				local var_1_12 = var_1_11 and pg.ship_skin_template[var_1_11.skin_id]

				var_1_2(var_1_12 and var_1_12.painting)
			end
		end
	end

	for iter_1_2, iter_1_3 in ipairs(var_1_4:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if not iter_1_3:isEnd() then
			local var_1_13 = iter_1_3:getConfig("config_client")[1]
			local var_1_14 = Drop.New({
				type = DROP_TYPE_VITEM,
				id = var_1_13,
				count = iter_1_3.data1
			})

			var_1_1(var_1_14:getConfig("icon"))
		end
	end

	local var_1_15 = arg_1_0.contextData and arg_1_0.contextData.falgShip or getProxy(BayProxy):getShipById(getProxy(PlayerProxy):getData().character)

	var_1_2(var_1_15 and var_1_15:getPainting())

	return table.insertto(var_1_0, var_0_0.super.getResource(arg_1_0))
end

function var_0_0.getUIName(arg_5_0)
	return "BuildShipPoolsPageUI"
end

function var_0_0.RefreshActivityBuildPool(arg_6_0, arg_6_1)
	local var_6_0 = underscore.detect(arg_6_0.pools, function(arg_7_0)
		return arg_7_0:IsActivity() and arg_7_0.activityId == arg_6_1.id
	end)

	if var_6_0 then
		arg_6_0:UpdateBuildPoolExchange(var_6_0)
		arg_6_0:UpdateTicket()
	end
end

function var_0_0.RefreshFreeBuildActivity(arg_8_0)
	for iter_8_0, iter_8_1 in pairs(arg_8_0.freeActTimer) do
		iter_8_1:Stop()
	end

	arg_8_0.freeActTimer = {}

	for iter_8_2, iter_8_3 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_8_3:isEnd() == false then
			arg_8_0.freeActTimer[iter_8_3.id] = Timer.New(function()
				arg_8_0:emit(BuildShipMediator.ON_UPDATE_ACT)
			end, iter_8_3.stopTime - pg.TimeMgr.GetInstance():GetServerTime())

			arg_8_0.freeActTimer[iter_8_3.id]:Start()
		end
	end
end

function var_0_0.RefreshRegularExchangeCount(arg_10_0)
	if arg_10_0.pool then
		arg_10_0:UpdateRegularBuildPoolExchange(arg_10_0.pool)
	end
end

function var_0_0.OnLoaded(arg_11_0)
	arg_11_0.quickCount = arg_11_0._tf:Find("gallery/res_items/item")
	arg_11_0.useItemTF = arg_11_0.quickCount:Find("Text")
	arg_11_0.freeCount = arg_11_0._tf:Find("gallery/res_items/ticket")
	arg_11_0.ticketTF = arg_11_0.freeCount:Find("Text")
	arg_11_0.patingTF = arg_11_0._tf:Find("painting")
	arg_11_0.poolContainer = arg_11_0._tf:Find("gallery/toggle_bg/bg/toggles")
	arg_11_0.newTpl = arg_11_0.poolContainer:Find("new")
	arg_11_0.newPoolTpls = {
		arg_11_0.newTpl
	}
	arg_11_0.specialTpl = arg_11_0.poolContainer:Find("special")
	arg_11_0.specialPoolTpls = {
		arg_11_0.specialTpl
	}
	arg_11_0.lightTpl = arg_11_0.poolContainer:Find("light")
	arg_11_0.lightPoolTpls = {
		arg_11_0.lightTpl
	}
	arg_11_0.heavyTpl = arg_11_0.poolContainer:Find("heavy")
	arg_11_0.heavyPoolTpls = {
		arg_11_0.heavyTpl
	}
	arg_11_0.maskContainer = arg_11_0._tf:Find("gallery/mask")
	arg_11_0.buildPoolExchangeTF = arg_11_0._tf:Find("gallery/exchange_bg")
	arg_11_0.buildPoolExchangeGetBtn = arg_11_0.buildPoolExchangeTF:Find("get")
	arg_11_0.buildPoolExchangeTxt = arg_11_0.buildPoolExchangeTF:Find("Text"):GetComponent(typeof(Text))
	arg_11_0.buildPoolExchangeGetBtnMark = arg_11_0.buildPoolExchangeGetBtn:Find("mark")
	arg_11_0.buildPoolExchangeGetTxt = arg_11_0.buildPoolExchangeGetBtn:Find("Text"):GetComponent(typeof(Text))
	arg_11_0.buildPoolExchangeName = arg_11_0.buildPoolExchangeTF:Find("name"):GetComponent(typeof(Text))
	arg_11_0.rtRegularExchange = arg_11_0._tf:Find("gallery/exchange_ur_bg")

	setText(arg_11_0.rtRegularExchange:Find("name/Text"), i18n("Normalbuild_URexchange_text1"))
	onButton(arg_11_0, arg_11_0.rtRegularExchange:Find("name/icon"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("Normalbuild_URexchange_help")
		})
	end, SFX_PANEL)
	setText(arg_11_0.rtRegularExchange:Find("count/name"), i18n("Normalbuild_URexchange_text2") .. ":")
	setText(arg_11_0.rtRegularExchange:Find("show/Text"), i18n("Normalbuild_URexchange_text3"))
	setText(arg_11_0.rtRegularExchange:Find("get/Text"), i18n("Normalbuild_URexchange_text4"))

	for iter_11_0, iter_11_1 in ipairs({
		arg_11_0.rtRegularExchange:Find("show"),
		arg_11_0.rtRegularExchange:Find("get")
	}) do
		onButton(arg_11_0, iter_11_1, function()
			arg_11_0:emit(BuildShipMediator.ON_BUILDPOOL_UR_EXCHANGE)
		end, SFX_PANEL)
	end

	arg_11_0.tipSTxt = arg_11_0._tf:Find("gallery/bg/type_intro/mask/title"):GetComponent("ScrollText")
	arg_11_0.tipTime = arg_11_0._tf:Find("gallery/bg/time_text")
	arg_11_0.helpBtn = arg_11_0._tf:Find("gallery/help_btn")
	arg_11_0.testBtn = arg_11_0._tf:Find("gallery/test_btn")
	arg_11_0.prevArr = arg_11_0._tf:Find("gallery/prev_arr")
	arg_11_0.nextArr = arg_11_0._tf:Find("gallery/next_arr")
	arg_11_0.activityTimer = {}
	arg_11_0.freeActTimer = {}
end

function var_0_0.OnInit(arg_14_0)
	onButton(arg_14_0, arg_14_0.quickCount, function()
		local var_15_0 = 61008
		local var_15_1 = ShopConst.GetShopConfig(var_15_0)

		shoppingBatch(var_15_0, {
			id = var_15_1.effect_args[1]
		}, 9, "build_ship_quickly_buy_stone")
	end)
	onButton(arg_14_0, arg_14_0.helpBtn, function()
		local var_16_0 = arg_14_0.pool
		local var_16_1 = var_16_0:getConfigTable()

		arg_14_0.contextData.helpWindow:ExecuteAction("Show", var_16_1, nil, var_16_0:IsActivity())
	end, SFX_CANCEL)
end

function var_0_0.Flush(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = getProxy(ActivityProxy)

	arg_17_0.pools = underscore.filter(arg_17_1, function(arg_18_0)
		local var_18_0 = var_17_0:getBuildPoolActivity(arg_18_0)

		return tobool(arg_17_2) == (var_18_0 and var_18_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD or false)
	end)

	if #arg_17_0.pools > 4 then
		arg_17_0:AdjustToggleContainer()
	end

	local var_17_1 = {}
	local var_17_2 = arg_17_0:ActivePool()
	local var_17_3 = BuildShipScene.buildShipActPoolId

	arg_17_0:RemoveAllTimer()
	eachChild(arg_17_0.poolContainer, function(arg_19_0)
		setActive(arg_19_0, false)
	end)

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.pools) do
		local var_17_4 = iter_17_1:GetMark()
		local var_17_5 = arg_17_0:GetPoolTpl(var_17_4)

		setActive(var_17_5, true)

		if iter_17_1:IsActivity() then
			arg_17_0:AddActivityTimer(iter_17_1)
		end

		local var_17_6 = var_17_5:Find("frame")

		removeOnToggle(var_17_6)
		triggerToggle(var_17_6, false)
		onToggle(arg_17_0, var_17_6, function(arg_20_0)
			if arg_20_0 then
				arg_17_0:SwitchPool(iter_17_1)
			end
		end, SFX_PANEL)

		var_17_1[iter_17_1:GetPoolId()] = var_17_5
	end

	table.sort(arg_17_0.pools, function(arg_21_0, arg_21_1)
		local var_21_0 = arg_21_0:GetSortCode()
		local var_21_1 = arg_21_1:GetSortCode()

		if var_21_0 == var_21_1 then
			return arg_21_0:GetPoolId() > arg_21_1:GetPoolId()
		else
			return var_21_1 < var_21_0
		end
	end)

	for iter_17_2, iter_17_3 in ipairs(arg_17_0.pools) do
		var_17_1[iter_17_3:GetPoolId()]:SetAsFirstSibling()
	end

	local var_17_7 = arg_17_0:GetActivePool(var_17_2, var_17_3)

	triggerToggle(var_17_1[var_17_7:GetPoolId()]:Find("frame"), true)

	local var_17_8
	local var_17_9

	arg_17_0.contextData.projectName = nil

	scrollTo(arg_17_0.poolContainer.parent, 0, 1)
	arg_17_0:RefreshFreeBuildActivity()
	arg_17_0:UpdateItem(arg_17_0.contextData.itemVO.count)
	onNextTick(function()
		arg_17_0:UpdateArr(#arg_17_0.pools)
	end)
end

local function var_0_1(arg_23_0)
	local var_23_0 = _.select(arg_23_0.pools, function(arg_24_0)
		return arg_24_0:GetMark() == BuildShipPool.BUILD_POOL_MARK_NEW
	end)

	table.sort(var_23_0, function(arg_25_0, arg_25_1)
		return arg_25_0:GetPoolId() < arg_25_1:GetPoolId()
	end)

	return var_23_0[1]
end

function var_0_0.GetActivePool(arg_26_0, arg_26_1, arg_26_2)
	if not arg_26_1 then
		return nil
	end

	local var_26_0

	if arg_26_1 == BuildShipPool.BUILD_POOL_MARK_NEW then
		var_26_0 = _.detect(arg_26_0.pools, function(arg_27_0)
			return arg_27_0:GetPoolId() == arg_26_2
		end) or var_0_1(arg_26_0)
	else
		var_26_0 = _.detect(arg_26_0.pools, function(arg_28_0)
			return arg_28_0:GetMark() == arg_26_1
		end)
	end

	return var_26_0 or arg_26_0.pools[1]
end

function var_0_0.AdjustToggleContainer(arg_29_0)
	if not arg_29_0.isInit then
		local var_29_0 = arg_29_0.poolContainer.parent

		SetParent(var_29_0, arg_29_0.maskContainer)

		local var_29_1 = 0.85

		var_29_0.sizeDelta, var_29_0.localScale = var_29_0.sizeDelta * (1 + (1 - var_29_1)), Vector3(var_29_1, var_29_1, 1)

		local var_29_2 = arg_29_0.poolContainer:GetComponent(typeof(HorizontalLayoutGroup))

		var_29_2.padding.left = 60
		var_29_2.padding.right = 60
		var_29_2.padding.top = 0
		arg_29_0.isInit = true
	end
end

function var_0_0.UpdateArr(arg_30_0, arg_30_1)
	if arg_30_1 <= 4 then
		setActive(arg_30_0.prevArr, false)
		setActive(arg_30_0.nextArr, false)

		return
	end

	local var_30_0 = getBounds(arg_30_0.maskContainer)
	local var_30_1 = arg_30_0.poolContainer:GetChild(0)
	local var_30_2 = arg_30_0.poolContainer:GetChild(arg_30_0.poolContainer.childCount - 1)

	onScroll(arg_30_0, arg_30_0.poolContainer.parent, function(arg_31_0)
		local var_31_0 = getBounds(var_30_1)
		local var_31_1 = getBounds(var_30_2)

		setActive(arg_30_0.prevArr, arg_31_0.x > 0.01)
		setActive(arg_30_0.nextArr, arg_31_0.x < 0.99)
	end)
	onButton(arg_30_0, arg_30_0.prevArr, function()
		scrollTo(arg_30_0.poolContainer.parent, 0, 1)
	end, SFX_PANEL)
	onButton(arg_30_0, arg_30_0.nextArr, function()
		scrollTo(arg_30_0.poolContainer.parent, 1, 1)
	end, SFX_PANEL)
end

function var_0_0.GetPoolTpl(arg_34_0, arg_34_1)
	assert(arg_34_0[arg_34_1 .. "PoolTpls"])

	local var_34_0 = arg_34_0[arg_34_1 .. "PoolTpls"]

	if #var_34_0 <= 0 then
		local var_34_1 = arg_34_0[arg_34_1 .. "Tpl"]
		local var_34_2 = var_34_1:GetSiblingIndex()
		local var_34_3 = Object.Instantiate(var_34_1, arg_34_0.poolContainer).transform

		var_34_3:SetSiblingIndex(var_34_2 + 1)

		return var_34_3
	else
		return table.remove(var_34_0, 1)
	end
end

function var_0_0.ActivePool(arg_35_0)
	local var_35_0 = _.any(arg_35_0.pools, function(arg_36_0)
		return arg_36_0:IsActivity()
	end)
	local var_35_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILD)

	if arg_35_0.contextData.activity and arg_35_0.contextData.activity > 0 then
		arg_35_0.contextData.projectName = BuildShipPool.BUILD_POOL_MARK_NEW

		local var_35_2 = getProxy(ActivityProxy):getActivityById(arg_35_0.contextData.activity)

		if var_35_2 and not var_35_2:isEnd() then
			BuildShipScene.buildShipActPoolId = var_35_2:getConfig("config_id")
		end
	end

	local var_35_3

	if arg_35_0.contextData.projectName then
		var_35_3 = arg_35_0.contextData.projectName
	elseif BuildShipScene.projectName then
		if BuildShipScene.projectName == BuildShipPool.BUILD_POOL_MARK_NEW and not var_35_0 then
			var_35_3 = BuildShipPool.BUILD_POOL_MARK_HEAVY
		else
			var_35_3 = BuildShipScene.projectName
		end
	elseif var_35_0 then
		var_35_3 = BuildShipPool.BUILD_POOL_MARK_NEW
	elseif var_35_1 and not var_35_1:isEnd() then
		local var_35_4 = var_35_1:getConfig("config_client").id
		local var_35_5 = _.detect(arg_35_0.pools, function(arg_37_0)
			return arg_37_0.id == var_35_4
		end)

		var_35_3 = var_35_5 and var_35_5:GetMark() or BuildShipPool.BUILD_POOL_MARK_HEAVY
	else
		var_35_3 = arg_35_0.contextData.projectName or BuildShipScene.projectName or BuildShipPool.BUILD_POOL_MARK_HEAVY
	end

	if not underscore.any(arg_35_0.pools, function(arg_38_0)
		return arg_38_0:GetMark() == var_35_3
	end) then
		return arg_35_0.pools[1]:GetMark()
	else
		return var_35_3
	end
end

function var_0_0.UpdateItem(arg_39_0, arg_39_1)
	setText(arg_39_0.useItemTF, arg_39_1)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.UpdateTicket(arg_40_0)
	local var_40_0 = getProxy(ActivityProxy)
	local var_40_1 = var_40_0:getBuildFreeActivityByBuildId(arg_40_0.pool.id)

	if var_40_1 and not var_40_1:isEnd() then
		local var_40_2 = Drop.New({
			type = DROP_TYPE_VITEM,
			id = var_40_1:getConfig("config_client")[1],
			count = var_40_1.data1
		})
		local var_40_3 = var_40_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200

		setActive(arg_40_0.freeCount:Find("tip"), var_40_3 and var_40_2.count > 0)
		LoadImageSpriteAtlasAsync(var_40_2:getConfig("icon"), "", arg_40_0.freeCount:Find("icon"))
		setText(arg_40_0.ticketTF, var_40_1.data1)
		onButton(arg_40_0, arg_40_0.freeCount, function()
			arg_40_0:emit(BaseUI.ON_DROP, var_40_2)
		end, SFX_PANEL)

		local var_40_4 = arg_40_0._tf:Find("gallery/item_bg/ticket")

		LoadImageSpriteAtlasAsync(var_40_2:getConfig("icon"), "", var_40_4:Find("icon"))
		setText(var_40_4:Find("name"), var_40_2:getConfig("name"))
		setText(var_40_4:Find("tip"), i18n("build_ticket_description"))
	end

	local var_40_5 = checkExist(var_40_0:getBuildPoolActivity(arg_40_0.pool), {
		"getConfig",
		{
			"type"
		}
	}) == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD

	setText(arg_40_0._tf:Find("gallery/prints/intro/text"), var_40_5 and i18n("newserver_build_tip") or i18n("build_pools_intro"))
	setActive(arg_40_0.freeCount, tobool(var_40_1))
	setActive(arg_40_0.quickCount, not var_40_5)

	arg_40_0.useTicket = var_40_5 or var_40_1 and var_40_1.data1 > 0

	setActive(arg_40_0._tf:Find("gallery/item_bg/item"), not arg_40_0.useTicket)
	setActive(arg_40_0._tf:Find("gallery/item_bg/gold"), not arg_40_0.useTicket)
	setActive(arg_40_0._tf:Find("gallery/item_bg/ticket"), arg_40_0.useTicket)
end

function var_0_0.SwitchPool(arg_42_0, arg_42_1)
	arg_42_0.pool = arg_42_1
	arg_42_0.buildPainting = nil

	local var_42_0 = getProxy(ActivityProxy)
	local var_42_1 = var_42_0:getBuildPoolActivity(arg_42_1)

	if PLATFORM_CODE == PLATFORM_CH and var_42_1 then
		arg_42_0.buildPainting = var_42_1:getConfig("config_client").build_painting
	end

	setActive(arg_42_0.tipTime, var_42_1 and var_42_1:isVariableTime())

	if isActive(arg_42_0.tipTime) then
		local var_42_2 = pg.TimeMgr.GetInstance()
		local var_42_3 = var_42_1:getStartTime()
		local var_42_4 = var_42_1.stopTime

		setText(arg_42_0.tipTime, var_42_2:STimeDescC(var_42_3, "%Y.%m.%d") .. " - " .. var_42_2:STimeDescC(var_42_4, "%m.%d %H:%M"))
	end

	local var_42_5 = arg_42_1:GetMark()
	local var_42_6 = GetSpriteFromAtlas("ui/BuildShipUI_atlas", "sub_title_" .. var_42_5)

	arg_42_0._tf:Find("gallery/bg/type"):GetComponent(typeof(Image)).sprite = var_42_6

	local var_42_7 = arg_42_1:getConfigTable()
	local var_42_8
	local var_42_9

	if arg_42_1:IsActivity() then
		var_42_8 = var_42_0:getBuildActivityCfgByID(var_42_7.id)
	else
		var_42_8 = var_42_0:getNoneActBuildActivityCfgByID(var_42_7.id)
	end

	local var_42_10 = HXSet.HxPath(var_42_8 and var_42_8.bg or "loadingbg/bg_" .. var_42_7.icon)
	local var_42_11 = LoadSprite(var_42_10)
	local var_42_12 = var_42_8 and var_42_8.buildship_tip

	arg_42_0.tipSTxt:SetText(var_42_12 and HXSet.hxLan(var_42_12) or i18n("buildship_" .. var_42_5 .. "_tip"))

	arg_42_0._tf:Find("gallery/bg"):GetComponent(typeof(Image)).sprite = var_42_11

	local var_42_13 = arg_42_0._tf:Find("gallery/item_bg/item/Text")
	local var_42_14 = arg_42_0._tf:Find("gallery/item_bg/gold/Text")

	setText(var_42_13, var_42_7.number_1)
	setText(var_42_14, var_42_7.use_gold)
	arg_42_0:UpdateBuildPoolExchange(arg_42_1)
	arg_42_0:UpdateRegularBuildPoolExchange(arg_42_1)
	arg_42_0:UpdateTicket()
	arg_42_0:UpdateTestBtn(arg_42_1)
	arg_42_0:UpdateBuildPoolPaiting(arg_42_1)

	local var_42_15 = {}

	if arg_42_1:getConfig("exchange_count") > 0 then
		table.insert(var_42_15, function(arg_43_0)
			if getProxy(BuildShipProxy):getRegularExchangeCount() < pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID].exchange_request or PlayerPrefs.GetString("REGULAR_BUILD_MAX_TIP", "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") then
				arg_43_0()
			else
				local var_43_0 = pg.MsgboxMgr.GetInstance()

				local function var_43_1(arg_44_0)
					PlayerPrefs.SetString("REGULAR_BUILD_MAX_TIP", arg_44_0 and pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") or "")
				end

				var_43_0:ShowMsgBox({
					showStopRemind = true,
					content = i18n("Normalbuild_URexchange_warning3"),
					stopRamindContent = i18n("dont_remind_today"),
					onYes = function()
						var_43_1(var_43_0.stopRemindToggle.isOn)
						arg_43_0()
					end,
					onNo = function()
						var_43_1(var_43_0.stopRemindToggle.isOn)
					end
				})
			end
		end)
	end

	onButton(arg_42_0, arg_42_0._tf:Find("gallery/start_btn"), function()
		seriesAsync(var_42_15, function()
			local var_48_0 = arg_42_0.useTicket and var_42_0:getBuildFreeActivityByBuildId(arg_42_0.pool.id) or nil

			if arg_42_0.useTicket and (not var_48_0 or var_48_0:isEnd()) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			arg_42_0.contextData.msgbox:ExecuteAction("Show", arg_42_0.useTicket and {
				buildType = "ticket",
				itemVO = Item.New({
					id = var_48_0:getConfig("config_client")[1],
					count = var_48_0.data1
				}),
				buildPool = var_42_7,
				max = MAX_BUILD_WORK_COUNT - arg_42_0.contextData.startCount,
				onConfirm = function(arg_49_0)
					if arg_42_1:IsActivity() then
						arg_42_0:emit(BuildShipMediator.ACT_ON_BUILD, arg_42_1:GetActivityId(), var_42_7.id, arg_49_0, true)
					else
						arg_42_0:emit(BuildShipMediator.ON_BUILD, var_42_7.id, arg_49_0, true)
					end
				end
			} or {
				buildType = "base",
				player = arg_42_0.contextData.player,
				itemVO = arg_42_0.contextData.itemVO,
				buildPool = var_42_7,
				max = MAX_BUILD_WORK_COUNT - arg_42_0.contextData.startCount,
				onConfirm = function(arg_50_0)
					if arg_42_1:IsActivity() then
						arg_42_0:emit(BuildShipMediator.ACT_ON_BUILD, arg_42_1:GetActivityId(), var_42_7.id, arg_50_0)
					else
						arg_42_0:emit(BuildShipMediator.ON_BUILD, var_42_7.id, arg_50_0)
					end
				end
			})
		end)
	end, SFX_UI_BUILDING_STARTBUILDING)

	BuildShipScene.projectName = var_42_5

	if arg_42_1:IsActivity() then
		BuildShipScene.buildShipActPoolId = arg_42_1:GetPoolId()
	end
end

local function var_0_2(arg_51_0)
	if not arg_51_0:IsActivity() then
		return false
	end

	local var_51_0 = pg.ship_data_create_exchange[arg_51_0:GetActivityId()]

	return var_51_0 and #var_51_0.exchange_ship_id > 0
end

function var_0_0.UpdateBuildPoolPaiting(arg_52_0, arg_52_1)
	local var_52_0

	if arg_52_0.buildPainting then
		var_52_0 = arg_52_0.buildPainting
	elseif var_0_2(arg_52_1) then
		local var_52_1 = pg.ship_data_create_exchange[arg_52_1:GetActivityId()].exchange_ship_id[1]
		local var_52_2 = pg.ship_data_statistics[var_52_1]

		assert(var_52_2)

		var_52_0 = pg.ship_skin_template[var_52_2.skin_id].painting
	else
		var_52_0 = arg_52_0.contextData.falgShip:getPainting()
	end

	if arg_52_0.painting ~= var_52_0 then
		local function var_52_3()
			arg_52_0.painting = var_52_0

			arg_52_0:Hx4Channel()
		end

		arg_52_0:RevertHxChannel()

		if arg_52_0.buildPainting then
			setBuildPaintingPrefabAsync(arg_52_0.patingTF, var_52_0, "build", var_52_3)
		else
			setPaintingPrefabAsync(arg_52_0.patingTF, var_52_0, "build", var_52_3)
		end
	end
end

local function var_0_3(arg_54_0)
	local var_54_0 = arg_54_0.patingTF:Find("fitter")

	if var_54_0.childCount <= 0 then
		return nil
	end

	local var_54_1 = var_54_0:GetChild(0)

	if IsNil(var_54_1) then
		return nil
	end

	local var_54_2 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()

	return (var_54_1:Find("build_hx_ch" .. var_54_2))
end

function var_0_0.Hx4Channel(arg_55_0)
	local var_55_0 = var_0_3(arg_55_0)

	if not IsNil(var_55_0) then
		setActive(var_55_0, HXSet.isHx())
	end
end

function var_0_0.RevertHxChannel(arg_56_0)
	local var_56_0 = var_0_3(arg_56_0)

	if not IsNil(var_56_0) then
		setActive(var_56_0, false)
	end
end

function var_0_0.UpdateBuildPoolExchange(arg_57_0, arg_57_1)
	local var_57_0
	local var_57_1
	local var_57_2

	if arg_57_1:IsActivity() then
		local var_57_3 = arg_57_1:GetActivityId()
		local var_57_4 = pg.ship_data_create_exchange[var_57_3]

		if var_57_4 then
			var_57_0 = var_57_4.exchange_request
			var_57_1 = var_57_4.exchange_available_times
			var_57_2 = var_57_4.exchange_ship_id[1]
		end
	end

	local var_57_5 = var_57_0 and var_57_0 > 0 and var_57_1 and var_57_1 > 0

	if var_57_5 then
		local var_57_6 = arg_57_1:GetActivity()
		local var_57_7 = var_57_6.data1
		local var_57_8 = var_57_6.data2
		local var_57_9 = math.min(var_57_1, var_57_8 + 1) * var_57_0

		arg_57_0.buildPoolExchangeTxt.text = i18n("build_count_tip") .. "<color=#FFDF48>" .. var_57_7 .. "</color>/" .. var_57_9

		local var_57_10 = var_57_8 < var_57_1 and var_57_9 <= var_57_7

		setActive(arg_57_0.buildPoolExchangeGetBtnMark, var_57_10)

		arg_57_0.buildPoolExchangeGetTxt.text = var_57_8 .. "/" .. var_57_1

		local var_57_11 = pg.ship_data_statistics[var_57_2].name

		arg_57_0.buildPoolExchangeName.text = SwitchSpecialChar(var_57_11, true)

		local var_57_12 = pg.ship_data_statistics[var_57_2].rarity

		eachChild(arg_57_0.buildPoolExchangeTF:Find("bg"), function(arg_58_0)
			setActive(arg_58_0, arg_58_0.name == tostring(var_57_12))
		end)
		onButton(arg_57_0, arg_57_0.buildPoolExchangeTF, function()
			if var_57_10 then
				arg_57_0:emit(BuildShipMediator.ON_BUILDPOOL_EXCHANGE, var_57_6.id)
			end
		end, SFX_PANEL)
		setGray(arg_57_0.buildPoolExchangeGetBtn, not var_57_10, true)
		setButtonEnabled(arg_57_0.buildPoolExchangeTF, var_57_10)
	else
		removeOnButton(arg_57_0.buildPoolExchangeTF)
	end

	setActive(arg_57_0.buildPoolExchangeTF, var_57_5)
end

function var_0_0.UpdateRegularBuildPoolExchange(arg_60_0, arg_60_1)
	local var_60_0 = arg_60_1:getConfig("exchange_count") > 0

	setActive(arg_60_0.rtRegularExchange, var_60_0)

	if var_60_0 then
		local var_60_1 = getProxy(BuildShipProxy):getRegularExchangeCount()
		local var_60_2 = pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID]

		setText(arg_60_0.rtRegularExchange:Find("count/Text"), "<color=#FFDF48>" .. var_60_1 .. "</color>/" .. var_60_2.exchange_request)
		setActive(arg_60_0.rtRegularExchange:Find("show"), var_60_1 < var_60_2.exchange_request)
		setActive(arg_60_0.rtRegularExchange:Find("get"), var_60_1 >= var_60_2.exchange_request)
	end
end

function var_0_0.UpdateTestBtn(arg_61_0, arg_61_1)
	local var_61_0 = false

	if PLATFORM_CODE ~= PLATFORM_JP and arg_61_1:IsActivity() and not arg_61_1:IsEnd() then
		local var_61_1 = arg_61_1:GetStageId()

		if var_61_1 then
			var_61_0 = true

			onButton(arg_61_0, arg_61_0.testBtn, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("juese_tiyan"),
					onYes = function()
						arg_61_0:emit(BuildShipMediator.SIMULATION_BATTLE, var_61_1)
					end
				})
			end, SFX_PANEL)
		end
	end

	setActive(arg_61_0.testBtn, var_61_0)
end

function var_0_0.AddActivityTimer(arg_64_0, arg_64_1)
	arg_64_0:RemoveActivityTimer(arg_64_1)

	if arg_64_1:IsActivity() then
		local var_64_0 = arg_64_1:GetActivity()

		assert(var_64_0)

		local var_64_1 = var_64_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

		arg_64_0.activityTimer[arg_64_1.id] = Timer.New(function()
			arg_64_0:RemoveActivityTimer(arg_64_1)
			arg_64_0:emit(BuildShipMediator.ON_UPDATE_ACT)
		end, var_64_1, 1)

		arg_64_0.activityTimer[arg_64_1.id]:Start()
	end
end

function var_0_0.RemoveActivityTimer(arg_66_0, arg_66_1)
	if arg_66_0.activityTimer[arg_66_1.id] then
		arg_66_0.activityTimer[arg_66_1.id]:Stop()

		arg_66_0.activityTimer[arg_66_1.id] = nil
	end
end

function var_0_0.RemoveAllTimer(arg_67_0)
	for iter_67_0, iter_67_1 in pairs(arg_67_0.activityTimer) do
		iter_67_1:Stop()
	end

	arg_67_0.activityTimer = {}

	for iter_67_2, iter_67_3 in pairs(arg_67_0.freeActTimer) do
		iter_67_3:Stop()
	end

	arg_67_0.freeActTimer = {}
end

function var_0_0.ShowOrHide(arg_68_0, arg_68_1)
	if arg_68_1 then
		arg_68_0:Show()
	else
		arg_68_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_69_0)
	arg_69_0:RevertHxChannel()
	arg_69_0:RemoveAllTimer()

	arg_69_0.activityTimer = nil
end

return var_0_0
