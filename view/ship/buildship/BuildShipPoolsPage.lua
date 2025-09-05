local var_0_0 = class("BuildShipPoolsPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "BuildShipPoolsPageUI"
end

function var_0_0.RefreshActivityBuildPool(arg_2_0, arg_2_1)
	local var_2_0 = underscore.detect(arg_2_0.pools, function(arg_3_0)
		return arg_3_0:IsActivity() and arg_3_0.activityId == arg_2_1.id
	end)

	if var_2_0 then
		arg_2_0:UpdateBuildPoolExchange(var_2_0)
		arg_2_0:UpdateTicket()
	end
end

function var_0_0.RefreshFreeBuildActivity(arg_4_0)
	for iter_4_0, iter_4_1 in pairs(arg_4_0.freeActTimer) do
		iter_4_1:Stop()
	end

	arg_4_0.freeActTimer = {}

	for iter_4_2, iter_4_3 in ipairs(getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_BUILD_FREE)) do
		if iter_4_3:isEnd() == false then
			arg_4_0.freeActTimer[iter_4_3.id] = Timer.New(function()
				arg_4_0:emit(BuildShipMediator.ON_UPDATE_ACT)
			end, iter_4_3.stopTime - pg.TimeMgr.GetInstance():GetServerTime())

			arg_4_0.freeActTimer[iter_4_3.id]:Start()
		end
	end
end

function var_0_0.RefreshRegularExchangeCount(arg_6_0)
	if arg_6_0.pool then
		arg_6_0:UpdateRegularBuildPoolExchange(arg_6_0.pool)
	end
end

function var_0_0.OnLoaded(arg_7_0)
	arg_7_0.quickCount = arg_7_0:findTF("gallery/res_items/item")
	arg_7_0.useItemTF = arg_7_0:findTF("Text", arg_7_0.quickCount)
	arg_7_0.freeCount = arg_7_0:findTF("gallery/res_items/ticket")
	arg_7_0.ticketTF = arg_7_0:findTF("Text", arg_7_0.freeCount)
	arg_7_0.patingTF = arg_7_0:findTF("painting")
	arg_7_0.poolContainer = arg_7_0:findTF("gallery/toggle_bg/bg/toggles")
	arg_7_0.newTpl = arg_7_0.poolContainer:Find("new")
	arg_7_0.newPoolTpls = {
		arg_7_0.newTpl
	}
	arg_7_0.specialTpl = arg_7_0.poolContainer:Find("special")
	arg_7_0.specialPoolTpls = {
		arg_7_0.specialTpl
	}
	arg_7_0.lightTpl = arg_7_0.poolContainer:Find("light")
	arg_7_0.lightPoolTpls = {
		arg_7_0.lightTpl
	}
	arg_7_0.heavyTpl = arg_7_0.poolContainer:Find("heavy")
	arg_7_0.heavyPoolTpls = {
		arg_7_0.heavyTpl
	}
	arg_7_0.maskContainer = arg_7_0:findTF("gallery/mask")
	arg_7_0.buildPoolExchangeTF = arg_7_0:findTF("gallery/exchange_bg")
	arg_7_0.buildPoolExchangeGetBtn = arg_7_0.buildPoolExchangeTF:Find("get")
	arg_7_0.buildPoolExchangeTxt = arg_7_0.buildPoolExchangeTF:Find("Text"):GetComponent(typeof(Text))
	arg_7_0.buildPoolExchangeGetBtnMark = arg_7_0.buildPoolExchangeGetBtn:Find("mark")
	arg_7_0.buildPoolExchangeGetTxt = arg_7_0.buildPoolExchangeGetBtn:Find("Text"):GetComponent(typeof(Text))
	arg_7_0.buildPoolExchangeName = arg_7_0.buildPoolExchangeTF:Find("name"):GetComponent(typeof(Text))
	arg_7_0.rtRegularExchange = arg_7_0._tf:Find("gallery/exchange_ur_bg")

	setText(arg_7_0.rtRegularExchange:Find("name/Text"), i18n("Normalbuild_URexchange_text1"))
	onButton(arg_7_0, arg_7_0.rtRegularExchange:Find("name/icon"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("Normalbuild_URexchange_help")
		})
	end, SFX_PANEL)
	setText(arg_7_0.rtRegularExchange:Find("count/name"), i18n("Normalbuild_URexchange_text2") .. ":")
	setText(arg_7_0.rtRegularExchange:Find("show/Text"), i18n("Normalbuild_URexchange_text3"))
	setText(arg_7_0.rtRegularExchange:Find("get/Text"), i18n("Normalbuild_URexchange_text4"))

	for iter_7_0, iter_7_1 in ipairs({
		arg_7_0.rtRegularExchange:Find("show"),
		arg_7_0.rtRegularExchange:Find("get")
	}) do
		onButton(arg_7_0, iter_7_1, function()
			arg_7_0:emit(BuildShipMediator.ON_BUILDPOOL_UR_EXCHANGE)
		end, SFX_PANEL)
	end

	arg_7_0.tipSTxt = arg_7_0:findTF("gallery/bg/type_intro/mask/title"):GetComponent("ScrollText")
	arg_7_0.tipTime = arg_7_0._tf:Find("gallery/bg/time_text")
	arg_7_0.helpBtn = arg_7_0:findTF("gallery/help_btn")
	arg_7_0.testBtn = arg_7_0:findTF("gallery/test_btn")
	arg_7_0.prevArr = arg_7_0:findTF("gallery/prev_arr")
	arg_7_0.nextArr = arg_7_0:findTF("gallery/next_arr")
	arg_7_0.activityTimer = {}
	arg_7_0.freeActTimer = {}
end

function var_0_0.OnInit(arg_10_0)
	onButton(arg_10_0, arg_10_0.quickCount, function()
		local var_11_0 = pg.shop_template[61008]

		shoppingBatch(61008, {
			id = var_11_0.effect_args[1]
		}, 9, "build_ship_quickly_buy_stone")
	end)
	onButton(arg_10_0, arg_10_0.helpBtn, function()
		local var_12_0 = arg_10_0.pool
		local var_12_1 = var_12_0:getConfigTable()

		arg_10_0.contextData.helpWindow:ExecuteAction("Show", var_12_1, nil, var_12_0:IsActivity())
	end, SFX_CANCEL)
end

function var_0_0.Flush(arg_13_0, arg_13_1, arg_13_2)
	local var_13_0 = getProxy(ActivityProxy)

	arg_13_0.pools = underscore.filter(arg_13_1, function(arg_14_0)
		local var_14_0 = var_13_0:getBuildPoolActivity(arg_14_0)

		return tobool(arg_13_2) == (var_14_0 and var_14_0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD or false)
	end)

	if #arg_13_0.pools > 4 then
		arg_13_0:AdjustToggleContainer()
	end

	local var_13_1 = {}
	local var_13_2 = arg_13_0:ActivePool()
	local var_13_3 = BuildShipScene.buildShipActPoolId

	arg_13_0:RemoveAllTimer()
	eachChild(arg_13_0.poolContainer, function(arg_15_0)
		setActive(arg_15_0, false)
	end)

	for iter_13_0, iter_13_1 in ipairs(arg_13_0.pools) do
		local var_13_4 = iter_13_1:GetMark()
		local var_13_5 = arg_13_0:GetPoolTpl(var_13_4)

		setActive(var_13_5, true)

		if iter_13_1:IsActivity() then
			arg_13_0:AddActivityTimer(iter_13_1)
		end

		local var_13_6 = var_13_5:Find("frame")

		removeOnToggle(var_13_6)
		triggerToggle(var_13_6, false)
		onToggle(arg_13_0, var_13_6, function(arg_16_0)
			if arg_16_0 then
				arg_13_0:SwitchPool(iter_13_1)
			end
		end, SFX_PANEL)

		var_13_1[iter_13_1:GetPoolId()] = var_13_5
	end

	table.sort(arg_13_0.pools, function(arg_17_0, arg_17_1)
		local var_17_0 = arg_17_0:GetSortCode()
		local var_17_1 = arg_17_1:GetSortCode()

		if var_17_0 == var_17_1 then
			return arg_17_0:GetPoolId() > arg_17_1:GetPoolId()
		else
			return var_17_1 < var_17_0
		end
	end)

	for iter_13_2, iter_13_3 in ipairs(arg_13_0.pools) do
		var_13_1[iter_13_3:GetPoolId()]:SetAsFirstSibling()
	end

	local var_13_7 = arg_13_0:GetActivePool(var_13_2, var_13_3)

	triggerToggle(var_13_1[var_13_7:GetPoolId()]:Find("frame"), true)

	local var_13_8
	local var_13_9

	arg_13_0.contextData.projectName = nil

	scrollTo(arg_13_0.poolContainer.parent, 0, 1)
	arg_13_0:RefreshFreeBuildActivity()
	arg_13_0:UpdateItem(arg_13_0.contextData.itemVO.count)
	onNextTick(function()
		arg_13_0:UpdateArr(#arg_13_0.pools)
	end)
end

local function var_0_1(arg_19_0)
	local var_19_0 = _.select(arg_19_0.pools, function(arg_20_0)
		return arg_20_0:GetMark() == BuildShipPool.BUILD_POOL_MARK_NEW
	end)

	table.sort(var_19_0, function(arg_21_0, arg_21_1)
		return arg_21_0:GetPoolId() < arg_21_1:GetPoolId()
	end)

	return var_19_0[1]
end

function var_0_0.GetActivePool(arg_22_0, arg_22_1, arg_22_2)
	if not arg_22_1 then
		return nil
	end

	local var_22_0

	if arg_22_1 == BuildShipPool.BUILD_POOL_MARK_NEW then
		var_22_0 = _.detect(arg_22_0.pools, function(arg_23_0)
			return arg_23_0:GetPoolId() == arg_22_2
		end) or var_0_1(arg_22_0)
	else
		var_22_0 = _.detect(arg_22_0.pools, function(arg_24_0)
			return arg_24_0:GetMark() == arg_22_1
		end)
	end

	return var_22_0 or arg_22_0.pools[1]
end

function var_0_0.AdjustToggleContainer(arg_25_0)
	if not arg_25_0.isInit then
		local var_25_0 = arg_25_0.poolContainer.parent

		SetParent(var_25_0, arg_25_0.maskContainer)

		local var_25_1 = 0.85

		var_25_0.sizeDelta, var_25_0.localScale = var_25_0.sizeDelta * (1 + (1 - var_25_1)), Vector3(var_25_1, var_25_1, 1)

		local var_25_2 = arg_25_0.poolContainer:GetComponent(typeof(HorizontalLayoutGroup))

		var_25_2.padding.left = 60
		var_25_2.padding.right = 60
		var_25_2.padding.top = 0
		arg_25_0.isInit = true
	end
end

function var_0_0.UpdateArr(arg_26_0, arg_26_1)
	if arg_26_1 <= 4 then
		setActive(arg_26_0.prevArr, false)
		setActive(arg_26_0.nextArr, false)

		return
	end

	local var_26_0 = getBounds(arg_26_0.maskContainer)
	local var_26_1 = arg_26_0.poolContainer:GetChild(0)
	local var_26_2 = arg_26_0.poolContainer:GetChild(arg_26_0.poolContainer.childCount - 1)

	onScroll(arg_26_0, arg_26_0.poolContainer.parent, function(arg_27_0)
		local var_27_0 = getBounds(var_26_1)
		local var_27_1 = getBounds(var_26_2)

		setActive(arg_26_0.prevArr, arg_27_0.x > 0.01)
		setActive(arg_26_0.nextArr, arg_27_0.x < 0.99)
	end)
	onButton(arg_26_0, arg_26_0.prevArr, function()
		scrollTo(arg_26_0.poolContainer.parent, 0, 1)
	end, SFX_PANEL)
	onButton(arg_26_0, arg_26_0.nextArr, function()
		scrollTo(arg_26_0.poolContainer.parent, 1, 1)
	end, SFX_PANEL)
end

function var_0_0.GetPoolTpl(arg_30_0, arg_30_1)
	assert(arg_30_0[arg_30_1 .. "PoolTpls"])

	local var_30_0 = arg_30_0[arg_30_1 .. "PoolTpls"]

	if #var_30_0 <= 0 then
		local var_30_1 = arg_30_0[arg_30_1 .. "Tpl"]
		local var_30_2 = var_30_1:GetSiblingIndex()
		local var_30_3 = Object.Instantiate(var_30_1, arg_30_0.poolContainer).transform

		var_30_3:SetSiblingIndex(var_30_2 + 1)

		return var_30_3
	else
		return table.remove(var_30_0, 1)
	end
end

function var_0_0.ActivePool(arg_31_0)
	local var_31_0 = _.any(arg_31_0.pools, function(arg_32_0)
		return arg_32_0:IsActivity()
	end)
	local var_31_1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BUILD)

	if arg_31_0.contextData.activity and arg_31_0.contextData.activity > 0 then
		arg_31_0.contextData.projectName = BuildShipPool.BUILD_POOL_MARK_NEW

		local var_31_2 = getProxy(ActivityProxy):getActivityById(arg_31_0.contextData.activity)

		if var_31_2 and not var_31_2:isEnd() then
			BuildShipScene.buildShipActPoolId = var_31_2:getConfig("config_id")
		end
	end

	local var_31_3

	if arg_31_0.contextData.projectName then
		var_31_3 = arg_31_0.contextData.projectName
	elseif BuildShipScene.projectName then
		if BuildShipScene.projectName == BuildShipPool.BUILD_POOL_MARK_NEW and not var_31_0 then
			var_31_3 = BuildShipPool.BUILD_POOL_MARK_HEAVY
		else
			var_31_3 = BuildShipScene.projectName
		end
	elseif var_31_0 then
		var_31_3 = BuildShipPool.BUILD_POOL_MARK_NEW
	elseif var_31_1 and not var_31_1:isEnd() then
		local var_31_4 = var_31_1:getConfig("config_client").id
		local var_31_5 = _.detect(arg_31_0.pools, function(arg_33_0)
			return arg_33_0.id == var_31_4
		end)

		var_31_3 = var_31_5 and var_31_5:GetMark() or BuildShipPool.BUILD_POOL_MARK_HEAVY
	else
		var_31_3 = arg_31_0.contextData.projectName or BuildShipScene.projectName or BuildShipPool.BUILD_POOL_MARK_HEAVY
	end

	if not underscore.any(arg_31_0.pools, function(arg_34_0)
		return arg_34_0:GetMark() == var_31_3
	end) then
		return arg_31_0.pools[1]:GetMark()
	else
		return var_31_3
	end
end

function var_0_0.UpdateItem(arg_35_0, arg_35_1)
	setText(arg_35_0.useItemTF, arg_35_1)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.UpdateTicket(arg_36_0)
	local var_36_0 = getProxy(ActivityProxy)
	local var_36_1 = var_36_0:getBuildFreeActivityByBuildId(arg_36_0.pool.id)

	if var_36_1 and not var_36_1:isEnd() then
		local var_36_2 = Drop.New({
			type = DROP_TYPE_VITEM,
			id = var_36_1:getConfig("config_client")[1],
			count = var_36_1.data1
		})
		local var_36_3 = var_36_1.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 259200

		setActive(arg_36_0.freeCount:Find("tip"), var_36_3 and var_36_2.count > 0)
		LoadImageSpriteAtlasAsync(var_36_2:getConfig("icon"), "", arg_36_0.freeCount:Find("icon"))
		setText(arg_36_0.ticketTF, var_36_1.data1)
		onButton(arg_36_0, arg_36_0.freeCount, function()
			arg_36_0:emit(BaseUI.ON_DROP, var_36_2)
		end, SFX_PANEL)

		local var_36_4 = arg_36_0:findTF("gallery/item_bg/ticket")

		LoadImageSpriteAtlasAsync(var_36_2:getConfig("icon"), "", var_36_4:Find("icon"))
		setText(var_36_4:Find("name"), var_36_2:getConfig("name"))
		setText(var_36_4:Find("tip"), i18n("build_ticket_description"))
	end

	local var_36_5 = checkExist(var_36_0:getBuildPoolActivity(arg_36_0.pool), {
		"getConfig",
		{
			"type"
		}
	}) == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD

	setText(arg_36_0:findTF("gallery/prints/intro/text"), var_36_5 and i18n("newserver_build_tip") or i18n("build_pools_intro"))
	setActive(arg_36_0.freeCount, tobool(var_36_1))
	setActive(arg_36_0.quickCount, not var_36_5)

	arg_36_0.useTicket = var_36_5 or var_36_1 and var_36_1.data1 > 0

	setActive(arg_36_0:findTF("gallery/item_bg/item"), not arg_36_0.useTicket)
	setActive(arg_36_0:findTF("gallery/item_bg/gold"), not arg_36_0.useTicket)
	setActive(arg_36_0:findTF("gallery/item_bg/ticket"), arg_36_0.useTicket)
end

function var_0_0.SwitchPool(arg_38_0, arg_38_1)
	arg_38_0.pool = arg_38_1
	arg_38_0.buildPainting = nil

	local var_38_0 = getProxy(ActivityProxy)
	local var_38_1 = var_38_0:getBuildPoolActivity(arg_38_1)

	if PLATFORM_CODE == PLATFORM_CH and var_38_1 then
		arg_38_0.buildPainting = var_38_1:getConfig("config_client").build_painting
	end

	setActive(arg_38_0.tipTime, var_38_1 and var_38_1:isVariableTime())

	if isActive(arg_38_0.tipTime) then
		local var_38_2 = pg.TimeMgr.GetInstance()
		local var_38_3 = var_38_1:getStartTime()
		local var_38_4 = var_38_1.stopTime

		setText(arg_38_0.tipTime, var_38_2:STimeDescC(var_38_3, "%Y.%m.%d") .. " - " .. var_38_2:STimeDescC(var_38_4, "%m.%d %H:%M"))
	end

	local var_38_5 = arg_38_1:GetMark()
	local var_38_6 = GetSpriteFromAtlas("ui/BuildShipUI_atlas", "sub_title_" .. var_38_5)

	arg_38_0:findTF("gallery/bg/type"):GetComponent(typeof(Image)).sprite = var_38_6

	local var_38_7 = arg_38_1:getConfigTable()
	local var_38_8
	local var_38_9

	if arg_38_1:IsActivity() then
		var_38_8 = var_38_0:getBuildActivityCfgByID(var_38_7.id)
	else
		var_38_8 = var_38_0:getNoneActBuildActivityCfgByID(var_38_7.id)
	end

	local var_38_10 = LoadSprite(var_38_8 and var_38_8.bg or "loadingbg/bg_" .. var_38_7.icon)
	local var_38_11 = var_38_8 and var_38_8.buildship_tip

	arg_38_0.tipSTxt:SetText(var_38_11 and HXSet.hxLan(var_38_11) or i18n("buildship_" .. var_38_5 .. "_tip"))

	arg_38_0:findTF("gallery/bg"):GetComponent(typeof(Image)).sprite = var_38_10

	local var_38_12 = arg_38_0:findTF("gallery/item_bg/item/Text")
	local var_38_13 = arg_38_0:findTF("gallery/item_bg/gold/Text")

	setText(var_38_12, var_38_7.number_1)
	setText(var_38_13, var_38_7.use_gold)
	arg_38_0:UpdateBuildPoolExchange(arg_38_1)
	arg_38_0:UpdateRegularBuildPoolExchange(arg_38_1)
	arg_38_0:UpdateTicket()
	arg_38_0:UpdateTestBtn(arg_38_1)
	arg_38_0:UpdateBuildPoolPaiting(arg_38_1)

	local var_38_14 = {}

	if arg_38_1:getConfig("exchange_count") > 0 then
		table.insert(var_38_14, function(arg_39_0)
			if getProxy(BuildShipProxy):getRegularExchangeCount() < pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID].exchange_request or PlayerPrefs.GetString("REGULAR_BUILD_MAX_TIP", "") == pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") then
				arg_39_0()
			else
				local var_39_0 = pg.MsgboxMgr.GetInstance()

				local function var_39_1(arg_40_0)
					PlayerPrefs.SetString("REGULAR_BUILD_MAX_TIP", arg_40_0 and pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d") or "")
				end

				var_39_0:ShowMsgBox({
					showStopRemind = true,
					content = i18n("Normalbuild_URexchange_warning3"),
					stopRamindContent = i18n("dont_remind_today"),
					onYes = function()
						var_39_1(var_39_0.stopRemindToggle.isOn)
						arg_39_0()
					end,
					onNo = function()
						var_39_1(var_39_0.stopRemindToggle.isOn)
					end
				})
			end
		end)
	end

	onButton(arg_38_0, arg_38_0:findTF("gallery/start_btn"), function()
		seriesAsync(var_38_14, function()
			local var_44_0 = arg_38_0.useTicket and var_38_0:getBuildFreeActivityByBuildId(arg_38_0.pool.id) or nil

			if arg_38_0.useTicket and (not var_44_0 or var_44_0:isEnd()) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_activity_end"))

				return
			end

			arg_38_0.contextData.msgbox:ExecuteAction("Show", arg_38_0.useTicket and {
				buildType = "ticket",
				itemVO = Item.New({
					id = var_44_0:getConfig("config_client")[1],
					count = var_44_0.data1
				}),
				buildPool = var_38_7,
				max = MAX_BUILD_WORK_COUNT - arg_38_0.contextData.startCount,
				onConfirm = function(arg_45_0)
					if arg_38_1:IsActivity() then
						arg_38_0:emit(BuildShipMediator.ACT_ON_BUILD, arg_38_1:GetActivityId(), var_38_7.id, arg_45_0, true)
					else
						arg_38_0:emit(BuildShipMediator.ON_BUILD, var_38_7.id, arg_45_0, true)
					end
				end
			} or {
				buildType = "base",
				player = arg_38_0.contextData.player,
				itemVO = arg_38_0.contextData.itemVO,
				buildPool = var_38_7,
				max = MAX_BUILD_WORK_COUNT - arg_38_0.contextData.startCount,
				onConfirm = function(arg_46_0)
					if arg_38_1:IsActivity() then
						arg_38_0:emit(BuildShipMediator.ACT_ON_BUILD, arg_38_1:GetActivityId(), var_38_7.id, arg_46_0)
					else
						arg_38_0:emit(BuildShipMediator.ON_BUILD, var_38_7.id, arg_46_0)
					end
				end
			})
		end)
	end, SFX_UI_BUILDING_STARTBUILDING)

	BuildShipScene.projectName = var_38_5

	if arg_38_1:IsActivity() then
		BuildShipScene.buildShipActPoolId = arg_38_1:GetPoolId()
	end
end

local function var_0_2(arg_47_0)
	if not arg_47_0:IsActivity() then
		return false
	end

	local var_47_0 = pg.ship_data_create_exchange[arg_47_0:GetActivityId()]

	return var_47_0 and #var_47_0.exchange_ship_id > 0
end

function var_0_0.UpdateBuildPoolPaiting(arg_48_0, arg_48_1)
	local var_48_0

	if arg_48_0.buildPainting then
		var_48_0 = arg_48_0.buildPainting
	elseif var_0_2(arg_48_1) then
		local var_48_1 = pg.ship_data_create_exchange[arg_48_1:GetActivityId()].exchange_ship_id[1]
		local var_48_2 = pg.ship_data_statistics[var_48_1]

		assert(var_48_2)

		var_48_0 = pg.ship_skin_template[var_48_2.skin_id].painting
	else
		var_48_0 = arg_48_0.contextData.falgShip:getPainting()
	end

	if arg_48_0.painting ~= var_48_0 then
		local function var_48_3()
			arg_48_0.painting = var_48_0
		end

		if arg_48_0.buildPainting then
			setBuildPaintingPrefabAsync(arg_48_0.patingTF, var_48_0, "build", var_48_3)
		else
			setPaintingPrefabAsync(arg_48_0.patingTF, var_48_0, "build", var_48_3)
		end
	end
end

function var_0_0.UpdateBuildPoolExchange(arg_50_0, arg_50_1)
	local var_50_0
	local var_50_1
	local var_50_2

	if arg_50_1:IsActivity() then
		local var_50_3 = arg_50_1:GetActivityId()
		local var_50_4 = pg.ship_data_create_exchange[var_50_3]

		if var_50_4 then
			var_50_0 = var_50_4.exchange_request
			var_50_1 = var_50_4.exchange_available_times
			var_50_2 = var_50_4.exchange_ship_id[1]
		end
	end

	local var_50_5 = var_50_0 and var_50_0 > 0 and var_50_1 and var_50_1 > 0

	if var_50_5 then
		local var_50_6 = arg_50_1:GetActivity()
		local var_50_7 = var_50_6.data1
		local var_50_8 = var_50_6.data2
		local var_50_9 = math.min(var_50_1, var_50_8 + 1) * var_50_0

		arg_50_0.buildPoolExchangeTxt.text = i18n("build_count_tip") .. "<color=#FFDF48>" .. var_50_7 .. "</color>/" .. var_50_9

		local var_50_10 = var_50_8 < var_50_1 and var_50_9 <= var_50_7

		setActive(arg_50_0.buildPoolExchangeGetBtnMark, var_50_10)

		arg_50_0.buildPoolExchangeGetTxt.text = var_50_8 .. "/" .. var_50_1

		local var_50_11 = pg.ship_data_statistics[var_50_2].name

		arg_50_0.buildPoolExchangeName.text = SwitchSpecialChar(var_50_11, true)

		local var_50_12 = pg.ship_data_statistics[var_50_2].rarity

		eachChild(arg_50_0.buildPoolExchangeTF:Find("bg"), function(arg_51_0)
			setActive(arg_51_0, arg_51_0.name == tostring(var_50_12))
		end)
		onButton(arg_50_0, arg_50_0.buildPoolExchangeTF, function()
			if var_50_10 then
				arg_50_0:emit(BuildShipMediator.ON_BUILDPOOL_EXCHANGE, var_50_6.id)
			end
		end, SFX_PANEL)
		setGray(arg_50_0.buildPoolExchangeGetBtn, not var_50_10, true)
		setButtonEnabled(arg_50_0.buildPoolExchangeTF, var_50_10)
	else
		removeOnButton(arg_50_0.buildPoolExchangeTF)
	end

	setActive(arg_50_0.buildPoolExchangeTF, var_50_5)
end

function var_0_0.UpdateRegularBuildPoolExchange(arg_53_0, arg_53_1)
	local var_53_0 = arg_53_1:getConfig("exchange_count") > 0

	setActive(arg_53_0.rtRegularExchange, true)

	if var_53_0 then
		local var_53_1 = getProxy(BuildShipProxy):getRegularExchangeCount()
		local var_53_2 = pg.ship_data_create_exchange[REGULAR_BUILD_POOL_EXCHANGE_ID]

		setText(arg_53_0.rtRegularExchange:Find("count/Text"), "<color=#FFDF48>" .. var_53_1 .. "</color>/" .. var_53_2.exchange_request)
		setActive(arg_53_0.rtRegularExchange:Find("show"), var_53_1 < var_53_2.exchange_request)
		setActive(arg_53_0.rtRegularExchange:Find("get"), var_53_1 >= var_53_2.exchange_request)
	end
end

function var_0_0.UpdateTestBtn(arg_54_0, arg_54_1)
	local var_54_0 = false

	if PLATFORM_CODE ~= PLATFORM_JP and arg_54_1:IsActivity() and not arg_54_1:IsEnd() then
		local var_54_1 = arg_54_1:GetStageId()

		if var_54_1 then
			var_54_0 = true

			onButton(arg_54_0, arg_54_0.testBtn, function()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("juese_tiyan"),
					onYes = function()
						arg_54_0:emit(BuildShipMediator.SIMULATION_BATTLE, var_54_1)
					end
				})
			end, SFX_PANEL)
		end
	end

	setActive(arg_54_0.testBtn, var_54_0)
end

function var_0_0.AddActivityTimer(arg_57_0, arg_57_1)
	arg_57_0:RemoveActivityTimer(arg_57_1)

	if arg_57_1:IsActivity() then
		local var_57_0 = arg_57_1:GetActivity()

		assert(var_57_0)

		local var_57_1 = var_57_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

		arg_57_0.activityTimer[arg_57_1.id] = Timer.New(function()
			arg_57_0:RemoveActivityTimer(arg_57_1)
			arg_57_0:emit(BuildShipMediator.ON_UPDATE_ACT)
		end, var_57_1, 1)

		arg_57_0.activityTimer[arg_57_1.id]:Start()
	end
end

function var_0_0.RemoveActivityTimer(arg_59_0, arg_59_1)
	if arg_59_0.activityTimer[arg_59_1.id] then
		arg_59_0.activityTimer[arg_59_1.id]:Stop()

		arg_59_0.activityTimer[arg_59_1.id] = nil
	end
end

function var_0_0.RemoveAllTimer(arg_60_0)
	for iter_60_0, iter_60_1 in pairs(arg_60_0.activityTimer) do
		iter_60_1:Stop()
	end

	arg_60_0.activityTimer = {}

	for iter_60_2, iter_60_3 in pairs(arg_60_0.freeActTimer) do
		iter_60_3:Stop()
	end

	arg_60_0.freeActTimer = {}
end

function var_0_0.ShowOrHide(arg_61_0, arg_61_1)
	if arg_61_1 then
		arg_61_0:Show()
	else
		arg_61_0:Hide()
	end
end

function var_0_0.OnDestroy(arg_62_0)
	arg_62_0:RemoveAllTimer()

	arg_62_0.activityTimer = nil
end

return var_0_0
