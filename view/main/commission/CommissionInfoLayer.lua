local var_0_0 = class("CommissionInfoLayer", import("...base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	if getProxy(SettingsProxy):IsMellowStyle() then
		return "CommissionInfoUI4Mellow"
	else
		return "CommissionInfoUI"
	end
end

function var_0_0.init(arg_2_0)
	arg_2_0.frame = arg_2_0._tf:Find("frame")
	arg_2_0.parentTr = arg_2_0._tf.parent
	arg_2_0.resourcesTF = arg_2_0.frame:Find("resources")
	arg_2_0.oilTF = arg_2_0.resourcesTF:Find("canteen/bubble/Text"):GetComponent(typeof(Text))
	arg_2_0.goldTF = arg_2_0.resourcesTF:Find("merchant/bubble/Text"):GetComponent(typeof(Text))
	arg_2_0.classTF = arg_2_0.resourcesTF:Find("class/bubble/Text"):GetComponent(typeof(Text))
	arg_2_0.classLockTF = arg_2_0.resourcesTF:Find("class/lock")
	arg_2_0.oilbubbleTF = arg_2_0.resourcesTF:Find("canteen/bubble")
	arg_2_0.goldbubbleTF = arg_2_0.resourcesTF:Find("merchant/bubble")
	arg_2_0.classbubbleTF = arg_2_0.resourcesTF:Find("class/bubble")
	arg_2_0.oilbubbleCG = GetOrAddComponent(arg_2_0.oilbubbleTF, typeof(CanvasGroup))
	arg_2_0.goldbubbleCG = GetOrAddComponent(arg_2_0.goldbubbleTF, typeof(CanvasGroup))
	arg_2_0.classbubbleCG = GetOrAddComponent(arg_2_0.classbubbleTF, typeof(CanvasGroup))

	local var_2_0 = getProxy(NavalAcademyProxy):GetClassVO():GetResourceType()
	local var_2_1 = Item.getConfigData(var_2_0).icon

	arg_2_0.classbubbleTF:Find("icon"):GetComponent(typeof(Image)).sprite = LoadSprite(var_2_1)
	arg_2_0.projectContainer = arg_2_0.frame:Find("main/content")
	arg_2_0.items = {
		CommissionInfoEventItem.New(arg_2_0._tf:Find("frame/main/content/event"), arg_2_0),
		CommissionInfoClassItem.New(arg_2_0._tf:Find("frame/main/content/class"), arg_2_0),
		CommissionInfoTechnologyItem.New(arg_2_0._tf:Find("frame/main/content/technology"), arg_2_0)
	}

	arg_2_0:BlurPanel()

	arg_2_0.linkBtnPanel = arg_2_0._tf:Find("frame/link_btns/btns")
	arg_2_0.activityInsBtn = arg_2_0._tf:Find("frame/link_btns/btns/ins")
	arg_2_0.activtyUrExchangeBtn = arg_2_0._tf:Find("frame/link_btns/btns/urEx")
	arg_2_0.activtyUrExchangeTxt = arg_2_0._tf:Find("frame/link_btns/btns/urEx/Text"):GetComponent(typeof(Text))
	arg_2_0.activtyUrExchangeCG = arg_2_0.activtyUrExchangeBtn:GetComponent(typeof(CanvasGroup))
	arg_2_0.activtyUrExchangeTip = arg_2_0._tf:Find("frame/link_btns/btns/urEx/tip")
	arg_2_0.activityCrusingBtn = arg_2_0._tf:Find("frame/link_btns/btns/crusing")
	arg_2_0.metaBossBtn = CommissionMetaBossBtn.New(arg_2_0._tf:Find("frame/link_btns/btns/meta_boss"), arg_2_0.event)
end

function var_0_0.BlurPanel(arg_3_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.UnBlurPanel(arg_4_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_4_0._tf, arg_4_0.parentTr)
end

function var_0_0.UpdataClassUnlock(arg_5_0)
	local var_5_0 = pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_5_0.playerVO.level, "ClassMediator")

	setActive(arg_5_0.classLockTF, not var_5_0)
end

function var_0_0.UpdateUrItemEntrance(arg_6_0)
	if pg.SystemOpenMgr.GetInstance():isOpenSystem(arg_6_0.playerVO.level, "FragmentShop") and not LOCK_UR_SHIP then
		local var_6_0 = pg.gameset.urpt_chapter_max.description
		local var_6_1 = var_6_0[1]
		local var_6_2 = var_6_0[2]
		local var_6_3 = getProxy(BagProxy):GetLimitCntById(var_6_1)

		arg_6_0.activtyUrExchangeTxt.text = var_6_3 .. "/" .. var_6_2

		local var_6_4 = var_6_3 == var_6_2

		arg_6_0.activtyUrExchangeCG.alpha = var_6_4 and 0.6 or 1

		setActive(arg_6_0.activtyUrExchangeTip, NotifyTipHelper.ShouldShowUrTip())
		onButton(arg_6_0, arg_6_0.activtyUrExchangeBtn, function()
			arg_6_0:emit(CommissionInfoMediator.ON_UR_ACTIVITY)
		end, SFX_PANEL)
	else
		setActive(arg_6_0.activtyUrExchangeBtn, false)
	end
end

function var_0_0.updateCrusingEntrance(arg_8_0)
	local var_8_0 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	if var_8_0 and not var_8_0:isEnd() then
		setActive(arg_8_0.activityCrusingBtn, true)

		local var_8_1 = var_8_0:GetCrusingInfo()

		setText(arg_8_0.activityCrusingBtn:Find("Text"), var_8_1.phase .. "/" .. #var_8_1.awardList)
		setActive(arg_8_0.activityCrusingBtn:Find("tip"), #var_8_0:GetCrusingUnreceiveAward() > 0)
	else
		setActive(arg_8_0.activityCrusingBtn, false)
	end

	onButton(arg_8_0, arg_8_0.activityCrusingBtn, function()
		arg_8_0:emit(CommissionInfoMediator.ON_CRUSING)
	end, SFX_PANEL)
end

function var_0_0.NotifyIns(arg_10_0)
	setActive(arg_10_0.activityInsBtn, false)
end

function var_0_0.UpdateLinkPanel(arg_11_0)
	local var_11_0 = false

	for iter_11_0 = 1, arg_11_0.linkBtnPanel.childCount do
		if isActive(arg_11_0.linkBtnPanel:GetChild(iter_11_0 - 1)) then
			var_11_0 = true

			break
		end
	end

	setActive(arg_11_0.linkBtnPanel.parent, var_11_0)
end

function var_0_0.didEnter(arg_12_0)
	onButton(arg_12_0, arg_12_0.oilbubbleTF, function()
		if not getProxy(PlayerProxy):getRawData():CanGetResource(PlayerConst.ResOil) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_12_0:PlayGetResAnimation(arg_12_0.oilbubbleTF, function()
			arg_12_0:emit(CommissionInfoMediator.GET_OIL_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.goldbubbleTF, function()
		if not getProxy(PlayerProxy):getRawData():CanGetResource(PlayerConst.ResGold) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_12_0:PlayGetResAnimation(arg_12_0.goldbubbleTF, function()
			arg_12_0:emit(CommissionInfoMediator.GET_GOLD_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.classbubbleTF, function()
		if not getProxy(NavalAcademyProxy):GetClassVO():CanGetRes() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("player_harvestResource_error_fullBag"))

			return
		end

		arg_12_0:PlayGetResAnimation(arg_12_0.classbubbleTF, function()
			arg_12_0:emit(CommissionInfoMediator.GET_CLASS_RES)
		end)
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0._tf, function()
		if arg_12_0.contextData.inFinished then
			return
		end

		arg_12_0.isPaying = true

		arg_12_0:PlayUIAnimation(arg_12_0._tf, "exit", function()
			arg_12_0:emit(var_0_0.ON_CLOSE)

			arg_12_0.isPaying = false
		end)
	end, SOUND_BACK)
	onButton(arg_12_0, arg_12_0.classLockTF, function()
		local var_21_0 = pg.open_systems_limited[9]

		pg.TipsMgr.GetInstance():ShowTips(i18n("no_open_system_tip", var_21_0.name, var_21_0.level))
	end, SFX_PANEL)
	arg_12_0:InitItems()
	arg_12_0:UpdataClassUnlock()
	arg_12_0:UpdateUrItemEntrance()
	arg_12_0:updateCrusingEntrance()
	arg_12_0.metaBossBtn:Flush()
end

function var_0_0.PlayGetResAnimation(arg_22_0, arg_22_1, arg_22_2)
	arg_22_0.isPaying = true

	local var_22_0 = arg_22_1:GetComponent(typeof(Animation))
	local var_22_1 = arg_22_1:GetComponent(typeof(DftAniEvent))

	var_22_1:SetEndEvent(nil)
	var_22_1:SetEndEvent(function()
		var_22_1:SetEndEvent(nil)
		arg_22_2()

		arg_22_0.isPaying = false
	end)
	var_22_0:Play("anim_commission_bubble_get")
end

function var_0_0.InitItems(arg_24_0)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.items) do
		iter_24_1:Init()
	end
end

function var_0_0.OnUpdateEventInfo(arg_25_0)
	arg_25_0.items[1]:Update()
end

function var_0_0.OnUpdateClass(arg_26_0)
	arg_26_0.items[2]:Update()
end

function var_0_0.OnUpdateTechnology(arg_27_0)
	arg_27_0.items[3]:Update()
end

function var_0_0.setPlayer(arg_28_0, arg_28_1)
	arg_28_0.playerVO = arg_28_1

	arg_28_0:UpdateOilRes(arg_28_1)
	arg_28_0:UpdateGoldRes(arg_28_1)
	arg_28_0:UpdateClassRes()
end

function var_0_0.OnPlayerUpdate(arg_29_0, arg_29_1)
	local var_29_0 = arg_29_0.playerVO
	local var_29_1 = arg_29_1

	if var_29_1.oilField ~= var_29_0.oilField then
		arg_29_0:UpdateOilRes(var_29_1)
	end

	if var_29_1.goldField ~= var_29_0.goldField then
		arg_29_0:UpdateGoldRes(var_29_1)
	end

	if var_29_1.expField ~= var_29_0.expField then
		arg_29_0:UpdateClassRes()
	end

	arg_29_0.playerVO = var_29_1
end

function var_0_0.UpdateOilRes(arg_30_0, arg_30_1)
	arg_30_0.oilbubbleCG.alpha = 1
	arg_30_0.oilbubbleTF.localScale = Vector3.one

	setActive(arg_30_0.oilbubbleTF, arg_30_1.oilField ~= 0)

	arg_30_0.oilTF.text = arg_30_1.oilField
end

function var_0_0.UpdateGoldRes(arg_31_0, arg_31_1)
	arg_31_0.goldbubbleCG.alpha = 1
	arg_31_0.goldbubbleTF.localScale = Vector3.one

	setActive(arg_31_0.goldbubbleTF, arg_31_1.goldField ~= 0)

	arg_31_0.goldTF.text = arg_31_1.goldField
end

function var_0_0.UpdateClassRes(arg_32_0)
	local var_32_0 = getProxy(NavalAcademyProxy):GetClassVO():GetGenResCnt()

	arg_32_0.classbubbleCG.alpha = 1
	arg_32_0.classbubbleTF.localScale = Vector3.one

	setActive(arg_32_0.classbubbleTF, var_32_0 > 0)

	arg_32_0.classTF.text = var_32_0
end

function var_0_0.onBackPressed(arg_33_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_33_0._tf)
end

function var_0_0.willExit(arg_34_0)
	arg_34_0:UnBlurPanel()

	for iter_34_0, iter_34_1 in ipairs(arg_34_0.items) do
		iter_34_1:Dispose()
	end

	arg_34_0.items = nil

	arg_34_0.metaBossBtn:Dispose()

	arg_34_0.metaBossBtn = nil
end

return var_0_0
