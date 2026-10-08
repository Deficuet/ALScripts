local var_0_0 = class("CommissionInfoLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	if getProxy(SettingsProxy):IsMellowStyle() then
		return "CommissionInfoUI4Mellow"
	else
		return "CommissionInfoUI"
	end
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/commissioninfoui4mellow",
		"ui/commissioninfoui",
		"ui/CommissionInfoUI4Mellow_atlas",
		"ui/commissioninfoui_atlas"
	}

	local function var_2_1(arg_3_0, arg_3_1)
		if noEmptyStr(arg_3_1) and not table.contains(arg_3_0, arg_3_1) then
			table.insert(arg_3_0, arg_3_1)
		end
	end

	local function var_2_2()
		local var_4_0 = {}
		local var_4_1 = getProxy(NavalAcademyProxy):GetClassVO():GetResourceType()
		local var_4_2 = Item.getConfigData(var_4_1)

		table.insert(var_4_0, var_4_2.icon)

		return var_4_0
	end

	local function var_2_3()
		local var_5_0 = {}
		local var_5_1 = {}

		local function var_5_2(arg_6_0)
			var_2_1(var_5_0, arg_6_0)
		end

		local function var_5_3(arg_7_0)
			for iter_7_0, iter_7_1 in ipairs(arg_7_0 or {}) do
				var_5_2(iter_7_1)
			end
		end

		local function var_5_4(arg_8_0)
			var_5_3(ResPathSupport.GetPaintingSquareIconListByPaintingName(arg_8_0:getPainting()))
			var_5_3(ResPathSupport.GetPaintingShipYardIconListByPaintingName(arg_8_0:getPainting()))
			var_5_2(string.format(ResPathSupport.ConstPath.BG.ShipCard, arg_8_0:rarity2bgPrint()))

			local var_8_0, var_8_1 = arg_8_0:GetFrameAndEffect()

			var_5_2(ResPathSupport.CombinePath(ResPathSupport.ConstPath.UI.Effect, var_8_1))
		end

		local function var_5_5(arg_9_0)
			Drop.Change(arg_9_0)

			if arg_9_0.type == DROP_TYPE_SHIP then
				var_5_4(Ship.New({
					configId = arg_9_0.id,
					skin_id = arg_9_0.skinId,
					propose = arg_9_0.propose
				}))
			else
				var_5_2(arg_9_0:getIcon())
			end
		end

		local function var_5_6(arg_10_0)
			local var_10_0 = arg_10_0.template

			var_5_2("eventtype/" .. var_10_0.icon)

			for iter_10_0, iter_10_1 in ipairs(var_10_0.ship_type or {}) do
				var_5_1[iter_10_1] = true
			end

			for iter_10_2, iter_10_3 in ipairs(var_10_0.drop_display or {}) do
				var_5_5({
					type = iter_10_3.type,
					id = iter_10_3.id,
					count = iter_10_3.nums
				})
			end

			if var_10_0.special_drop and var_10_0.special_drop.type then
				var_5_5({
					type = var_10_0.special_drop.type,
					id = var_10_0.special_drop.id,
					count = var_10_0.special_drop.nums
				})
			end

			for iter_10_4, iter_10_5 in ipairs(arg_10_0:getShipList() or {}) do
				var_5_4(iter_10_5)
			end
		end

		var_5_2("ui/EventUI")
		var_5_2("ui/eventui_atlas")
		var_5_2("ui/ShipExpUI")
		var_5_2("ui/proposeshipcard")
		var_5_2("battlescore/grade_label_task_complete")

		local var_5_7 = getProxy(EventProxy)

		for iter_5_0, iter_5_1 in ipairs(var_5_7:getEventList() or {}) do
			var_5_6(iter_5_1)
		end

		local var_5_8 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_COLLECTION_EVENT)

		if var_5_8 and not var_5_8:isEnd() then
			var_5_6(var_5_7:GetEventByActivityId(var_5_8.id))
		end

		local var_5_9 = getProxy(BayProxy)

		for iter_5_2, iter_5_3 in pairs(var_5_9:getRawData() or {}) do
			if var_5_1[iter_5_3:getShipType()] and not iter_5_3:isActivityNpc() then
				var_5_4(iter_5_3)
			end
		end

		return var_5_0
	end

	local var_2_4 = var_2_2()
	local var_2_5 = var_2_3()

	return ResPathSupport.MergeLuaArr(var_2_0, var_2_4, var_2_5)
end

function var_0_0.init(arg_11_0)
	arg_11_0.frame = arg_11_0._tf:Find("frame")
	arg_11_0.parentTr = arg_11_0._tf.parent
	arg_11_0.resourcesTF = arg_11_0.frame:Find("resources")
	arg_11_0.oilTF = arg_11_0.resourcesTF:Find("canteen/bubble/Text"):GetComponent(typeof(Text))
	arg_11_0.goldTF = arg_11_0.resourcesTF:Find("merchant/bubble/Text"):GetComponent(typeof(Text))
	arg_11_0.classTF = arg_11_0.resourcesTF:Find("class/bubble/Text"):GetComponent(typeof(Text))
	arg_11_0.classLockTF = arg_11_0.resourcesTF:Find("class/lock")
	arg_11_0.oilbubbleTF = arg_11_0.resourcesTF:Find("canteen/bubble")
	arg_11_0.goldbubbleTF = arg_11_0.resourcesTF:Find("merchant/bubble")
	arg_11_0.classbubbleTF = arg_11_0.resourcesTF:Find("class/bubble")
	arg_11_0.oilbubbleCG = GetOrAddComponent(arg_11_0.oilbubbleTF, typeof(CanvasGroup))
	arg_11_0.goldbubbleCG = GetOrAddComponent(arg_11_0.goldbubbleTF, typeof(CanvasGroup))
	arg_11_0.classbubbleCG = GetOrAddComponent(arg_11_0.classbubbleTF, typeof(CanvasGroup))

	local var_11_0 = getProxy(NavalAcademyProxy):GetClassVO():GetResourceType()
	local var_11_1 = Item.getConfigData(var_11_0).icon

	arg_11_0.classbubbleTF:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite(var_11_1)
	arg_11_0.projectContainer = arg_11_0.frame:Find("main/content")
	arg_11_0.items = {
		CommissionInfoEventItem.New(arg_11_0._tf:Find("frame/main/content/event"), arg_11_0),
		CommissionInfoClassItem.New(arg_11_0._tf:Find("frame/main/content/class"), arg_11_0),
		CommissionInfoTechnologyItem.New(arg_11_0._tf:Find("frame/main/content/technology"), arg_11_0),
		CommissionInfoChapterAutoItem.New(arg_11_0._tf:Find("frame/main/content/chapterauto"), arg_11_0)
	}

	arg_11_0:BlurPanel()

	arg_11_0.linkBtnPanel = arg_11_0._tf:Find("frame/link_btns/btns")
	arg_11_0.activityInsBtn = arg_11_0._tf:Find("frame/link_btns/btns/ins")
	arg_11_0.activtyUrExchangeBtn = arg_11_0._tf:Find("frame/link_btns/btns/urEx")
	arg_11_0.activtyUrExchangeTxt = arg_11_0._tf:Find("frame/link_btns/btns/urEx/Text"):GetComponent(typeof(Text))
	arg_11_0.activtyUrExchangeCG = arg_11_0.activtyUrExchangeBtn:GetComponent(typeof(CanvasGroup))
	arg_11_0.activtyUrExchangeTip = arg_11_0._tf:Find("frame/link_btns/btns/urEx/tip")
	arg_11_0.activityCrusingBtn = arg_11_0._tf:Find("frame/link_btns/btns/crusing")
	arg_11_0.metaBossBtn = CommissionMetaBossBtn.New(arg_11_0._tf:Find("frame/link_btns/btns/meta_boss"), arg_11_0.event)
end

function var_0_0.BlurPanel(arg_12_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
end

function var_0_0.UnBlurPanel(arg_13_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf, arg_13_0.parentTr)
end

function var_0_0.UpdataClassUnlock(arg_14_0)
	local var_14_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_14_0.playerVO.level, "ClassMediator")

	setActive(arg_14_0.classLockTF, not var_14_0)
end

function var_0_0.UpdateUrItemEntrance(arg_15_0)
	if pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_15_0.playerVO.level, "FragmentShop") and not LOCK_UR_SHIP then
		local var_15_0 = pg.gameset.urpt_chapter_max.description
		local var_15_1 = var_15_0[1]
		local var_15_2 = var_15_0[2]
		local var_15_3 = getProxy(BagProxy):GetLimitCntById(var_15_1)

		arg_15_0.activtyUrExchangeTxt.text = var_15_3 .. "/" .. var_15_2

		local var_15_4 = var_15_3 == var_15_2

		arg_15_0.activtyUrExchangeCG.alpha = var_15_4 and 0.6 or 1

		setActive(arg_15_0.activtyUrExchangeTip, NotifyTipHelper.ShouldShowUrTip())
		onButton(arg_15_0, arg_15_0.activtyUrExchangeBtn, function()
			arg_15_0:emit(CommissionInfoMediator.ON_UR_ACTIVITY)
		end, SFX_PANEL)
	else
		setActive(arg_15_0.activtyUrExchangeBtn, false)
	end
end

function var_0_0.updateCrusingEntrance(arg_17_0)
	local var_17_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_17_0 and not var_17_0:isEnd() then
		setActive(arg_17_0.activityCrusingBtn, true)

		local var_17_1 = var_17_0:GetCrusingInfo()
		local var_17_2 = var_17_0.stopTime - pg.TimeMgr.GetInstance():GetServerTime()
		local var_17_3 = math.floor(var_17_2 / 86400)

		if var_17_3 <= pg.gameset.world_cruise_due_days.key_value then
			setActive(arg_17_0.activityCrusingBtn:Find("LastDay"), true)
			setText(arg_17_0.activityCrusingBtn:Find("LastDay/text"), i18n("guild_left_supply_day", var_17_3))
		else
			setActive(arg_17_0.activityCrusingBtn:Find("LastDay"), false)
		end

		setText(arg_17_0.activityCrusingBtn:Find("Text"), var_17_1.phase .. "/" .. #var_17_1.awardList)
		setActive(arg_17_0.activityCrusingBtn:Find("tip"), #var_17_0:GetCrusingUnreceiveAward() > 0)
	else
		setActive(arg_17_0.activityCrusingBtn, false)
	end

	onButton(arg_17_0, arg_17_0.activityCrusingBtn, function()
		arg_17_0:emit(CommissionInfoMediator.ON_CRUSING)
	end, SFX_PANEL)
end

function var_0_0.NotifyIns(arg_19_0)
	setActive(arg_19_0.activityInsBtn, false)
end

function var_0_0.UpdateLinkPanel(arg_20_0)
	local var_20_0 = false

	for iter_20_0 = 1, arg_20_0.linkBtnPanel.childCount do
		if isActive(arg_20_0.linkBtnPanel:GetChild(iter_20_0 - 1)) then
			var_20_0 = true

			break
		end
	end

	setActive(arg_20_0.linkBtnPanel.parent, var_20_0)
end

function var_0_0.didEnter(arg_21_0)
	onButton(arg_21_0, arg_21_0.oilbubbleTF, function()
		if not getProxy(PlayerProxy):getRawData():CanGetResource(PlayerConst.ResOil) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_21_0:PlayGetResAnimation(arg_21_0.oilbubbleTF, function()
			arg_21_0:emit(CommissionInfoMediator.GET_OIL_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.goldbubbleTF, function()
		if not getProxy(PlayerProxy):getRawData():CanGetResource(PlayerConst.ResGold) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_21_0:PlayGetResAnimation(arg_21_0.goldbubbleTF, function()
			arg_21_0:emit(CommissionInfoMediator.GET_GOLD_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0.classbubbleTF, function()
		if not getProxy(NavalAcademyProxy):GetClassVO():CanGetRes() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_21_0:PlayGetResAnimation(arg_21_0.classbubbleTF, function()
			arg_21_0:emit(CommissionInfoMediator.GET_CLASS_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_21_0, arg_21_0._tf, function()
		if arg_21_0.contextData.inFinished then
			return
		end

		arg_21_0.isPaying = true

		arg_21_0:PlayUIAnimation(arg_21_0._tf, "exit", function()
			arg_21_0:emit(var_0_0.ON_CLOSE)

			arg_21_0.isPaying = false
		end)
	end, SOUND_BACK)
	onButton(arg_21_0, arg_21_0.classLockTF, function()
		local var_30_0 = pg.open_systems_limited[9]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_30_0.name, var_30_0.level))
	end, SFX_PANEL)
	arg_21_0:InitItems()
	arg_21_0:UpdataClassUnlock()
	arg_21_0:UpdateUrItemEntrance()
	arg_21_0:updateCrusingEntrance()
	arg_21_0.metaBossBtn:Flush()
end

function var_0_0.PlayGetResAnimation(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0.isPaying = true

	local var_31_0 = arg_31_1:GetComponent(typeof(Animation))
	local var_31_1 = arg_31_1:GetComponent(typeof(DftAniEvent))

	var_31_1:SetEndEvent(nil)
	var_31_1:SetEndEvent(function()
		var_31_1:SetEndEvent(nil)
		arg_31_2()

		arg_31_0.isPaying = false
	end)
	var_31_0:Play("anim_commission_bubble_get")
end

function var_0_0.InitItems(arg_33_0)
	for iter_33_0, iter_33_1 in ipairs(arg_33_0.items) do
		iter_33_1:Init()
	end
end

function var_0_0.OnUpdateEventInfo(arg_34_0)
	arg_34_0.items[1]:Update()
end

function var_0_0.OnUpdateClass(arg_35_0)
	arg_35_0.items[2]:Update()
end

function var_0_0.OnUpdateTechnology(arg_36_0)
	arg_36_0.items[3]:Update()
end

function var_0_0.OnUpdateChapterAuto(arg_37_0)
	arg_37_0.items[4]:Update()
end

function var_0_0.setPlayer(arg_38_0, arg_38_1)
	arg_38_0.playerVO = arg_38_1

	arg_38_0:UpdateOilRes(arg_38_1)
	arg_38_0:UpdateGoldRes(arg_38_1)
	arg_38_0:UpdateClassRes()
end

function var_0_0.OnPlayerUpdate(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.playerVO
	local var_39_1 = arg_39_1

	if var_39_1.oilField ~= var_39_0.oilField then
		arg_39_0:UpdateOilRes(var_39_1)
	end

	if var_39_1.goldField ~= var_39_0.goldField then
		arg_39_0:UpdateGoldRes(var_39_1)
	end

	if var_39_1.expField ~= var_39_0.expField then
		arg_39_0:UpdateClassRes()
	end

	arg_39_0.playerVO = var_39_1
end

function var_0_0.UpdateOilRes(arg_40_0, arg_40_1)
	arg_40_0.oilbubbleCG.alpha = 1
	arg_40_0.oilbubbleTF.localScale = Vector3.one

	setActive(arg_40_0.oilbubbleTF, arg_40_1.oilField ~= 0)

	arg_40_0.oilTF.text = arg_40_1.oilField
end

function var_0_0.UpdateGoldRes(arg_41_0, arg_41_1)
	arg_41_0.goldbubbleCG.alpha = 1
	arg_41_0.goldbubbleTF.localScale = Vector3.one

	setActive(arg_41_0.goldbubbleTF, arg_41_1.goldField ~= 0)

	arg_41_0.goldTF.text = arg_41_1.goldField
end

function var_0_0.UpdateClassRes(arg_42_0)
	local var_42_0 = getProxy(NavalAcademyProxy):GetClassVO():GetGenResCnt()

	arg_42_0.classbubbleCG.alpha = 1
	arg_42_0.classbubbleTF.localScale = Vector3.one

	setActive(arg_42_0.classbubbleTF, var_42_0 > 0)

	arg_42_0.classTF.text = var_42_0
end

function var_0_0.onBackPressed(arg_43_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_43_0._tf)
end

function var_0_0.willExit(arg_44_0)
	arg_44_0:UnBlurPanel()

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.items) do
		iter_44_1:Dispose()
	end

	arg_44_0.items = nil

	arg_44_0.metaBossBtn:Dispose()

	arg_44_0.metaBossBtn = nil
end

return var_0_0
