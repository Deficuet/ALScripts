local var_0_0 = class("NewMainMellowTheme", import(".NewMainSceneBaseTheme"))

function var_0_0.getUIName(arg_1_0)
	return "NewMainMellowTheme"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.switcherAnimationPlayer = arg_2_0._tf:Find("frame/right"):GetComponent(typeof(Animation))
	arg_2_0.animationPlayer = arg_2_0._tf:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0._tf:GetComponent(typeof(DftAniEvent))
	arg_2_0.switcher = arg_2_0._tf:Find("frame/right/switch")

	onToggle(arg_2_0, arg_2_0.switcher, function(arg_3_0)
		local var_3_0 = arg_3_0 and "anim_newmain_switch_1to2" or "anim_newmain_switch_2to1"

		arg_2_0.switcherAnimationPlayer:Play(var_3_0)
		pg.EasyRedDotMgr.GetInstance():TriggerMarks("COLLECTION", "FRIEND", "MEMORY_REVIEW", "EVENT")
	end, SFX_PANEL)
	arg_2_0:Register()
end

function var_0_0.Register(arg_4_0)
	return
end

function var_0_0.PlayEnterAnimation(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0.bannerView:Init()
	arg_5_0.actBtnView:Init()
	arg_5_0.dftAniEvent:SetStartEvent(nil)
	arg_5_0.dftAniEvent:SetStartEvent(function()
		arg_5_0.dftAniEvent:SetStartEvent(nil)

		arg_5_0.mainCG.alpha = 1
	end)
	arg_5_0.animationPlayer:Play("anim_newmain_open")
	onDelayTick(arg_5_2, 0.51)
end

function var_0_0.Refresh(arg_7_0, arg_7_1)
	var_0_0.super.Refresh(arg_7_0, arg_7_1)
	originalPrint(" >>>>>>>>>> run in play open anim")
	arg_7_0.animationPlayer:Play("anim_newmain_open")
end

function var_0_0.OnFoldPanels(arg_8_0, arg_8_1)
	if arg_8_1 then
		arg_8_0.animationPlayer:Play("anim_newmain_hide")
	else
		arg_8_0.animationPlayer:Play("anim_newmain_show")
	end
end

function var_0_0.Disable(arg_9_0)
	var_0_0.super.Disable(arg_9_0)
	arg_9_0.dftAniEvent:SetStartEvent(nil)
	triggerToggle(arg_9_0.switcher, false)
end

function var_0_0.OnDestroy(arg_10_0)
	var_0_0.super.OnDestroy(arg_10_0)
	arg_10_0.dftAniEvent:SetStartEvent(nil)
end

function var_0_0.SetEffectPanelVisible(arg_11_0, arg_11_1)
	for iter_11_0, iter_11_1 in ipairs(arg_11_0.panels) do
		if isa(iter_11_1, MainRightPanel4Mellow) then
			iter_11_1:SetEffectVisible(arg_11_1)
		end
	end
end

function var_0_0.ApplyDefaultResUI(arg_12_0)
	return false
end

function var_0_0.GetCalibrationBG(arg_13_0)
	return "mainui_calibration_mellow"
end

function var_0_0.GetPbList(arg_14_0)
	return {
		arg_14_0._tf:Find("frame/bottom/frame")
	}
end

function var_0_0.GetPaintingOffset(arg_15_0, arg_15_1)
	local var_15_0 = pg.ship_skin_newmainui_shift[arg_15_1:getSkinId()]

	if var_15_0 then
		local var_15_1 = arg_15_0:GetConfigShift(var_15_0)

		return MainPaintingShift.New(var_15_1, Vector3(-MainPaintingView.MESH_POSITION_X_OFFSET, -10, 0))
	else
		return MainPaintingShift.New({
			-MainPaintingView.MESH_POSITION_X_OFFSET,
			-10,
			MainPaintingView.MESH_POSITION_X_OFFSET,
			0,
			MainPaintingView.MESH_POSITION_X_OFFSET,
			0,
			1,
			1,
			1
		})
	end
end

function var_0_0.GetConfigShift(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_1.skin_shift
	local var_16_1 = arg_16_1.l2d_shift
	local var_16_2 = var_16_1[1] - var_16_0[1]
	local var_16_3 = var_16_1[2] - var_16_0[2]
	local var_16_4 = arg_16_1.spine_shift
	local var_16_5 = var_16_4[1] - var_16_0[1]
	local var_16_6 = var_16_4[2] - var_16_0[2]

	return {
		var_16_0[1],
		var_16_0[2],
		var_16_2,
		var_16_3,
		var_16_5,
		var_16_6,
		var_16_0[4],
		var_16_1[4],
		var_16_4[4]
	}
end

function var_0_0.GetWordView(arg_17_0)
	return MainWordView4Mellow.New(arg_17_0._tf:Find("chat"), arg_17_0.event)
end

function var_0_0.GetTagView(arg_18_0)
	return MainTagsView.New(arg_18_0._tf:Find("frame/bottom/tags"), arg_18_0.event)
end

function var_0_0.GetTopPanel(arg_19_0)
	return MainTopPanel4Mellow.New(arg_19_0._tf:Find("frame/top"), arg_19_0.event, arg_19_0.contextData)
end

function var_0_0.GetRightPanel(arg_20_0)
	return MainRightPanel4Mellow.New(arg_20_0._tf:Find("frame/right"), arg_20_0.event, arg_20_0.contextData)
end

function var_0_0.GetLeftPanel(arg_21_0)
	return MainLeftPanel4Mellow.New(arg_21_0._tf:Find("frame/left"), arg_21_0.event, arg_21_0.contextData)
end

function var_0_0.GetBottomPanel(arg_22_0)
	return MainBottomPanel4Mellow.New(arg_22_0._tf:Find("frame/bottom"), arg_22_0.event, arg_22_0.contextData)
end

function var_0_0.GetIconView(arg_23_0)
	return MainIconView4Mellow.New(arg_23_0._tf:Find("frame/top/icon"), arg_23_0.event)
end

function var_0_0.GetChatRoomView(arg_24_0)
	return MainChatRoomView4Mellow.New(arg_24_0._tf:Find("frame/right/chat_room"), arg_24_0.event)
end

function var_0_0.GetBannerView(arg_25_0)
	return MainBannerView4Mellow.New(arg_25_0._tf:Find("frame/left/banner"), arg_25_0.event)
end

function var_0_0.GetActBtnView(arg_26_0)
	return MainActivityBtnView4Mellow.New(arg_26_0._tf:Find("frame"), arg_26_0.event)
end

function var_0_0.GetBuffView(arg_27_0)
	return MainBuffView4Mellow.New(arg_27_0._tf:Find("frame/top/buff_list"), arg_27_0.event)
end

function var_0_0.GetChangeSkinView(arg_28_0)
	return MainChangeSkinView.New(arg_28_0._tf:Find("frame/right/change_skin"), arg_28_0.event)
end

function var_0_0.GetAsmrChatView(arg_29_0)
	return MainAsmrChatView.New(arg_29_0._tf:Find("frame/bottom/asmr_chat"), arg_29_0.event)
end

function var_0_0.OnAsmrTurnning(arg_30_0, arg_30_1)
	var_0_0.super.OnAsmrTurnning(arg_30_0, arg_30_1)
	setActive(findTF(arg_30_0._tf, "s"), not arg_30_1)
end

function var_0_0.RegisterRedDots(arg_31_0)
	local var_31_0 = pg.EasyRedDotMgr.GetInstance()
	local var_31_1 = {}

	local function var_31_2(arg_32_0, arg_32_1, arg_32_2)
		var_31_0:RegisterRedDot(arg_32_0, arg_32_1, arg_32_2)
		table.insert(var_31_1, arg_32_0)
	end

	var_31_2(arg_31_0._tf:Find("frame/bottom/frame/task/tip"), {
		"TASK"
	}, function(arg_33_0)
		setActive(arg_33_0, getProxy(TaskProxy):getCanReceiveCount() > 0 or getProxy(AvatarFrameProxy):getCanReceiveCount() > 0)
	end)

	local var_31_3 = arg_31_0._tf:Find("frame/top/btns/mail")
	local var_31_4 = findTF(var_31_3, "tip")
	local var_31_5 = findTF(var_31_3, "Text"):GetComponent(typeof(Text))
	local var_31_6 = getProxy(MailProxy)

	if var_31_6.total >= MAIL_COUNT_LIMIT then
		pg.TipsMgr.GetInstance():ShowTips(i18n("warning_mail_max_2"))
	elseif var_31_6.total > MAIL_COUNT_LIMIT * 0.9 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("warning_mail_max_1", var_31_6.total, MAIL_COUNT_LIMIT))
	end

	var_31_2(var_31_3, {
		"MAIL"
	}, function(arg_34_0)
		local var_34_0 = getProxy(MailProxy):GetUnreadCount()
		local var_34_1 = 99

		if var_34_0 > 0 then
			SetActive(var_31_4, true)

			var_31_5.text = var_34_1 < var_34_0 and var_34_1 .. "+" or tostring(var_34_0)
		else
			SetActive(var_31_4, false)

			var_31_5.text = ""
		end
	end)
	var_31_2(arg_31_0._tf:Find("frame/bottom/frame/build/tip"), {
		"BUILD"
	}, function(arg_35_0)
		setActive(arg_35_0, getProxy(BuildShipProxy):getFinishCount() > 0 or tobool(getProxy(ActivityProxy):IsShowFreeBuildMark(true)))
	end)
	var_31_2(arg_31_0._tf:Find("frame/bottom/frame/guild/tip"), {
		"GUILD"
	}, function(arg_36_0)
		setActive(arg_36_0, getProxy(GuildProxy):ShouldShowTip())
	end)
	var_31_2(arg_31_0._tf:Find("frame/top/icon_front/tip"), {
		"ATTIRE"
	}, function(arg_37_0)
		setActive(arg_37_0, getProxy(AttireProxy):IsShowRedDot() or getProxy(SettingsProxy):ShouldEducateCharTip() or getProxy(ActivityProxy):IsTipLoveLetterMail())
	end)
	var_31_2(arg_31_0._tf:Find("frame/right/2/menor/root/tip"), {
		"MEMORY_REVIEW"
	}, function(arg_38_0)
		local var_38_0 = getProxy(PlayerProxy):getRawData()
		local var_38_1 = var_38_0 and _.any(pg.memory_group.all, function(arg_39_0)
			return PlayerPrefs.GetInt("MEMORY_GROUP_NOTIFICATION" .. var_38_0.id .. " " .. arg_39_0, 0) == 1
		end)

		if not var_38_1 and getProxy(LoveLetterProxy):getRawData() and getProxy(LoveLetterProxy):IsTipUnlockLetter() then
			var_38_1 = true
		end

		setActive(arg_38_0, tobool(var_38_1))
	end)
	var_31_2(arg_31_0._tf:Find("frame/right/2/collection/root/tip"), {
		"COLLECTION"
	}, function(arg_40_0)
		setActive(arg_40_0, getProxy(CollectionProxy):hasFinish() or getProxy(AppreciateProxy):isGalleryHaveNewRes() or getProxy(AppreciateProxy):isMusicHaveNewRes() or getProxy(AppreciateProxy):isMangaHaveNewRes())
	end)
	var_31_2(arg_31_0._tf:Find("frame/right/2/friend/root/tip"), {
		"FRIEND"
	}, function(arg_41_0)
		setActive(arg_41_0, getProxy(NotificationProxy):getRequestCount() > 0 or getProxy(FriendProxy):getNewMsgCount() > 0)
	end)
	var_31_2(arg_31_0._tf:Find("frame/left/extend/tip"), {
		"COMMISSION"
	}, function(arg_42_0)
		setActive(arg_42_0, getProxy(PlayerProxy):IsShowCommssionTip())
	end)
	var_31_2(arg_31_0._tf:Find("frame/top/btns/settings/tip"), {
		"SETTING"
	}, function(arg_43_0)
		setActive(arg_43_0, PlayerPrefs.GetInt("firstIntoOtherPanel", 0) == 0)
	end)
	var_31_2(arg_31_0._tf:Find("frame/top/btns/noti/tip"), {
		"SERVER"
	}, function(arg_44_0)
		local var_44_0 = getProxy(ServerNoticeProxy):getServerNotices(false)

		setActive(arg_44_0, #var_44_0 > 0 and getProxy(ServerNoticeProxy):hasNewNotice())
	end)
	var_31_2(arg_31_0._tf:Find("frame/bottom/frame/tech/tip"), {
		"BLUEPRINT"
	}, function(arg_45_0)
		setActive(arg_45_0, getProxy(TechnologyProxy):IsShowTip())
	end)
	var_31_2(arg_31_0._tf:Find("frame/right/1/battle/root/tip"), {
		"EVENT"
	}, function(arg_46_0)
		setActive(arg_46_0, getProxy(EventProxy):hasFinishState() or LimitChallengeConst.IsShowRedPoint())
	end)
	var_31_2(arg_31_0._tf:Find("frame/bottom/frame/live/tip"), {
		"COURTYARD",
		"SCHOOL",
		"COMMANDER",
		"DORM3D_SHOP_TIMELIMIT",
		"EDUCATE_NEW_CHILD",
		"ISLAND_3D"
	}, function(arg_47_0)
		local var_47_0 = getProxy(PlayerProxy):getRawData()
		local var_47_1 = false

		if var_47_0.level >= 40 then
			local var_47_2 = getProxy(CommanderProxy):IsFinishAllBox()

			if not LOCK_CATTERY then
				var_47_1 = var_47_2 or getProxy(CommanderProxy):AnyCatteryExistOP() or getProxy(CommanderProxy):AnyCatteryCanUse()
			else
				var_47_1 = var_47_2
			end
		end

		local var_47_3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(var_47_0.level, "SelectDorm3DMediator")

		setActive(arg_47_0, getProxy(DormProxy):IsShowRedDot() or getProxy(NavalAcademyProxy):IsShowTip() or var_47_1 or var_47_3 and Dorm3dShopUI.ShouldShowAllTip() or NewEducateHelper.IsShowNewChildTip() or getProxy(SystemTipProxy):IsIslandRedDotTip())
	end)

	local var_31_7 = arg_31_0._tf:Find("frame/right/switch")
	local var_31_8 = var_31_7:GetComponent(typeof(Toggle))
	local var_31_9 = var_31_7:Find("on")

	var_31_2(var_31_9, {
		"COLLECTION",
		"FRIEND",
		"MEMORY_REVIEW"
	}, function(arg_48_0)
		local var_48_0 = getProxy(CollectionProxy):hasFinish() or getProxy(AppreciateProxy):isGalleryHaveNewRes() or getProxy(AppreciateProxy):isMusicHaveNewRes() or getProxy(AppreciateProxy):isMangaHaveNewRes() or getProxy(NotificationProxy):getRequestCount() > 0 or getProxy(FriendProxy):getNewMsgCount() > 0 or (function()
			local var_49_0 = getProxy(PlayerProxy):getRawData()

			if var_49_0 and _.any(pg.memory_group.all, function(arg_50_0)
				return PlayerPrefs.GetInt("MEMORY_GROUP_NOTIFICATION" .. var_49_0.id .. " " .. arg_50_0, 0) == 1
			end) then
				return true
			end

			return tobool(getProxy(LoveLetterProxy):getRawData() and getProxy(LoveLetterProxy):IsTipUnlockLetter())
		end)()

		setActive(arg_48_0, var_48_0 and not var_31_8.isOn)
	end)

	local var_31_10 = var_31_7:Find("off")

	var_31_2(var_31_10, {
		"EVENT"
	}, function(arg_51_0)
		setActive(arg_51_0, (getProxy(EventProxy):hasFinishState() or LimitChallengeConst.IsShowRedPoint()) and var_31_8.isOn)
	end)

	return var_31_1
end

return var_0_0
