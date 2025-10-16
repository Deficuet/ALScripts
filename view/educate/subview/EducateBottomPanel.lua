local var_0_0 = class("EducateBottomPanel", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "EducateBottomPanel"
end

function var_0_0.OnInit(arg_2_0)
	arg_2_0.contentTF = arg_2_0._tf:Find("content")
	arg_2_0.planBtn = arg_2_0.contentTF:Find("btns/schedule")
	arg_2_0.mapBtn = arg_2_0.contentTF:Find("btns/map")

	setText(arg_2_0.mapBtn:Find("tips/limit/Text"), i18n("child_option_limit"))

	arg_2_0.schoolBtn = arg_2_0.contentTF:Find("btns/enter_school")
	arg_2_0.upgradeBtn = arg_2_0.contentTF:Find("btns/system_upgrade")
	arg_2_0.targetSetBtn = arg_2_0.contentTF:Find("btns/target_set")
	arg_2_0.endingBtn = arg_2_0.contentTF:Find("btns/ending")
	arg_2_0.resetBtn = arg_2_0.contentTF:Find("btns/reset")

	arg_2_0:addListener()

	arg_2_0.targetSetDays = getProxy(EducateProxy):GetTaskProxy():GetTargetSetDays()

	arg_2_0:Flush()
end

function var_0_0.addListener(arg_3_0)
	onButton(arg_3_0, arg_3_0.planBtn, function()
		arg_3_0:emit(EducateBaseUI.EDUCATE_GO_SCENE, SCENE.EDUCATE_SCHEDULE)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.mapBtn, function()
		if isActive(arg_3_0.mapBtn:Find("lock")) then
			return
		end

		arg_3_0:emit(EducateBaseUI.EDUCATE_GO_SCENE, SCENE.EDUCATE_MAP)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.schoolBtn, function()
		arg_3_0:emit(EducateBaseUI.EDUCATE_ON_MSG_TIP, {
			content = i18n("child_school_sure_tip"),
			onYes = function()
				setActive(arg_3_0.schoolBtn, false)
				arg_3_0:updateTargetSetBtn()

				local var_7_0 = EducateConst.ENTER_NEW_STAGE_PERFORMS[2]

				if var_7_0 then
					pg.PerformMgr.GetInstance():PlayOne(var_7_0, function()
						arg_3_0:playGuide("tb_9_1")
						arg_3_0:onEnterVirtualStage()
					end)
				else
					arg_3_0:playGuide("tb_9_1")
					arg_3_0:onEnterVirtualStage()
				end

				getProxy(EducateProxy):GetPlanProxy():ClearLocalPlansData()
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.upgradeBtn, function()
		arg_3_0:emit(EducateBaseUI.EDUCATE_ON_MSG_TIP, {
			content = i18n("child_upgrade_sure_tip"),
			onYes = function()
				setActive(arg_3_0.upgradeBtn, false)
				arg_3_0:updateTargetSetBtn()

				local var_10_0 = getProxy(EducateProxy):GetCharData():GetStage()
				local var_10_1 = EducateConst.ENTER_NEW_STAGE_PERFORMS[var_10_0 + 1]

				if var_10_1 then
					pg.PerformMgr.GetInstance():PlayOne(var_10_1, function()
						arg_3_0:onEnterVirtualStage()
					end)
				else
					arg_3_0:onEnterVirtualStage()
				end

				getProxy(EducateProxy):GetPlanProxy():ClearLocalPlansData()
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.targetSetBtn, function()
		arg_3_0:emit(EducateBaseUI.EDUCATE_GO_SUBLAYER, Context.New({
			mediator = EducateTargetSetMediator,
			viewComponent = EducateTargetSetLayer
		}))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.endingBtn, function()
		arg_3_0:emit(EducateBaseUI.EDUCATE_ON_MSG_TIP, {
			content = i18n("child_end_sure_tip"),
			onYes = function()
				pg.PerformMgr.GetInstance():PlayOne(EducateConst.FIRST_ENTER_END_PERFORM, function()
					arg_3_0:emit(EducateMediator.ON_ENDING_TRIGGER)
				end)
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.resetBtn, function()
		arg_3_0:emit(EducateBaseUI.EDUCATE_ON_MSG_TIP, {
			content = i18n("child_reset_sure_tip"),
			onYes = function()
				arg_3_0:emit(EducateMediator.ON_GAME_RESET)
			end
		})
	end, SFX_PANEL)

	local var_3_0 = "anim_educate_bottom_show"

	if arg_3_0.contextData and arg_3_0.contextData.isMainEnter then
		var_3_0 = "anim_educate_bottom_in"
	end

	arg_3_0._tf:GetComponent(typeof(Animation)):Play(var_3_0)
end

function var_0_0.playGuide(arg_18_0, arg_18_1)
	if not pg.NewStoryMgr.GetInstance():IsPlayed(arg_18_1) then
		pg.NewGuideMgr.GetInstance():Play(arg_18_1)
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = arg_18_1
		})
	end
end

function var_0_0.onEnterVirtualStage(arg_19_0)
	getProxy(EducateProxy):SetVirtualStage(true)
	arg_19_0:emit(EducateMediator.ENTER_VIRTUAL_STAGE)
end

function var_0_0.Flush(arg_20_0)
	if not arg_20_0:GetLoaded() then
		return
	end

	arg_20_0.curTime = getProxy(EducateProxy):GetCurTime()
	arg_20_0.status = getProxy(EducateProxy):GetGameStatus()

	local var_20_0 = EducateHelper.IsSystemUnlock(EducateConst.SYSTEM_GO_OUT)
	local var_20_1 = getProxy(EducateProxy):InVirtualStage()

	setActive(arg_20_0.mapBtn:Find("lock"), not var_20_0 or var_20_1)
	setActive(arg_20_0.planBtn, arg_20_0.status ~= EducateConst.STATUES_ENDING and arg_20_0.status ~= EducateConst.STATUES_RESET)
	setActive(arg_20_0.mapBtn, arg_20_0.status ~= EducateConst.STATUES_ENDING and arg_20_0.status ~= EducateConst.STATUES_RESET)
	arg_20_0:updateMapBtnTips()
	setActive(arg_20_0.schoolBtn, arg_20_0:isSchoolBtnShow() and not var_20_1)
	setActive(arg_20_0.upgradeBtn, arg_20_0:isUpgradeBtnShow() and not var_20_1)
	arg_20_0:updateTargetSetBtn()
	setActive(arg_20_0.endingBtn, arg_20_0.status == EducateConst.STATUES_ENDING)
	setActive(arg_20_0.resetBtn, arg_20_0.status == EducateConst.STATUES_RESET)

	if isActive(arg_20_0.schoolBtn) or isActive(arg_20_0.upgradeBtn) or isActive(arg_20_0.targetSetBtn) then
		setActive(arg_20_0.planBtn, false)
	end
end

function var_0_0.isSchoolBtnShow(arg_21_0)
	return arg_21_0.status == EducateConst.STATUES_PREPARE and EducateHelper.IsSameDay(arg_21_0.curTime, arg_21_0.targetSetDays[2])
end

function var_0_0.isUpgradeBtnShow(arg_22_0)
	return arg_22_0.status == EducateConst.STATUES_PREPARE and (EducateHelper.IsSameDay(arg_22_0.curTime, arg_22_0.targetSetDays[3]) or EducateHelper.IsSameDay(arg_22_0.curTime, arg_22_0.targetSetDays[4]))
end

function var_0_0.isTargetSetBtnShow(arg_23_0)
	return arg_23_0.status == EducateConst.STATUES_PREPARE and not isActive(arg_23_0.schoolBtn) and not isActive(arg_23_0.upgradeBtn)
end

function var_0_0.updateTargetSetBtn(arg_24_0)
	local var_24_0 = arg_24_0:isTargetSetBtnShow()

	setActive(arg_24_0.targetSetBtn, var_24_0)

	if var_24_0 then
		setActive(arg_24_0.mapBtn:Find("lock"), true)
	end
end

function var_0_0.updateMapBtnTips(arg_25_0)
	EducateTipHelper.GetSiteUnlockTipIds()

	local var_25_0 = getProxy(EducateProxy):GetShowSiteIds()
	local var_25_1 = underscore.any(var_25_0, function(arg_26_0)
		return EducateTipHelper.IsShowNewTip(EducateTipHelper.NEW_SITE, arg_26_0)
	end)
	local var_25_2 = underscore.any(var_25_0, function(arg_27_0)
		local var_27_0 = getProxy(EducateProxy):GetOptionsBySiteId(arg_27_0)

		return underscore.any(var_27_0, function(arg_28_0)
			return arg_28_0:IsShowLimit()
		end)
	end)

	setActive(arg_25_0.mapBtn:Find("tips/new"), var_25_1)
	setActive(arg_25_0.mapBtn:Find("tips/limit"), var_25_2)
end

function var_0_0.OnDestroy(arg_29_0)
	return
end

return var_0_0
