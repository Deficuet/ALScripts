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

		local var_3_1 = arg_2_0:GetRedDots()
		local var_3_2 = _.select(var_3_1, function(arg_4_0)
			return isa(arg_4_0, SwitcherRedDotNode)
		end)

		_.each(var_3_2, function(arg_5_0)
			arg_5_0:RefreshSelf()
		end)
	end, SFX_PANEL)
	arg_2_0:Register()
end

function var_0_0.Register(arg_6_0)
	return
end

function var_0_0.PlayEnterAnimation(arg_7_0, arg_7_1, arg_7_2)
	arg_7_0.bannerView:Init()
	arg_7_0.actBtnView:Init()
	arg_7_0.dftAniEvent:SetStartEvent(nil)
	arg_7_0.dftAniEvent:SetStartEvent(function()
		arg_7_0.dftAniEvent:SetStartEvent(nil)

		arg_7_0.mainCG.alpha = 1
	end)
	arg_7_0.animationPlayer:Play("anim_newmain_open")
	onDelayTick(arg_7_2, 0.51)
end

function var_0_0.Refresh(arg_9_0, arg_9_1)
	var_0_0.super.Refresh(arg_9_0, arg_9_1)
	arg_9_0.animationPlayer:Play("anim_newmain_open")
end

function var_0_0.OnFoldPanels(arg_10_0, arg_10_1)
	if arg_10_1 then
		arg_10_0.animationPlayer:Play("anim_newmain_hide")
	else
		arg_10_0.animationPlayer:Play("anim_newmain_show")
	end
end

function var_0_0.Disable(arg_11_0)
	var_0_0.super.Disable(arg_11_0)
	arg_11_0.dftAniEvent:SetStartEvent(nil)
	triggerToggle(arg_11_0.switcher, false)
end

function var_0_0.OnDestroy(arg_12_0)
	var_0_0.super.OnDestroy(arg_12_0)
	arg_12_0.dftAniEvent:SetStartEvent(nil)
end

function var_0_0.SetEffectPanelVisible(arg_13_0, arg_13_1)
	for iter_13_0, iter_13_1 in ipairs(arg_13_0.panels) do
		if isa(iter_13_1, MainRightPanel4Mellow) then
			iter_13_1:SetEffectVisible(arg_13_1)
		end
	end
end

function var_0_0.ApplyDefaultResUI(arg_14_0)
	return false
end

function var_0_0.GetCalibrationBG(arg_15_0)
	return "mainui_calibration_mellow"
end

function var_0_0.GetPbList(arg_16_0)
	return {
		arg_16_0._tf:Find("frame/bottom/frame")
	}
end

function var_0_0.GetPaintingOffset(arg_17_0, arg_17_1)
	local var_17_0 = pg.ship_skin_newmainui_shift[arg_17_1:getSkinId()]

	if var_17_0 then
		local var_17_1 = arg_17_0:GetConfigShift(var_17_0)

		return MainPaintingShift.New(var_17_1, Vector3(-MainPaintingView.MESH_POSITION_X_OFFSET, -10, 0))
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

function var_0_0.GetConfigShift(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1.skin_shift
	local var_18_1 = arg_18_1.l2d_shift
	local var_18_2 = var_18_1[1] - var_18_0[1]
	local var_18_3 = var_18_1[2] - var_18_0[2]
	local var_18_4 = arg_18_1.spine_shift
	local var_18_5 = var_18_4[1] - var_18_0[1]
	local var_18_6 = var_18_4[2] - var_18_0[2]

	return {
		var_18_0[1],
		var_18_0[2],
		var_18_2,
		var_18_3,
		var_18_5,
		var_18_6,
		var_18_0[4],
		var_18_1[4],
		var_18_4[4]
	}
end

function var_0_0.GetWordView(arg_19_0)
	return MainWordView4Mellow.New(arg_19_0._tf:Find("chat"), arg_19_0.event)
end

function var_0_0.GetTagView(arg_20_0)
	return MainTagsView.New(arg_20_0._tf:Find("frame/bottom/tags"), arg_20_0.event)
end

function var_0_0.GetTopPanel(arg_21_0)
	return MainTopPanel4Mellow.New(arg_21_0._tf:Find("frame/top"), arg_21_0.event, arg_21_0.contextData)
end

function var_0_0.GetRightPanel(arg_22_0)
	return MainRightPanel4Mellow.New(arg_22_0._tf:Find("frame/right"), arg_22_0.event, arg_22_0.contextData)
end

function var_0_0.GetLeftPanel(arg_23_0)
	return MainLeftPanel4Mellow.New(arg_23_0._tf:Find("frame/left"), arg_23_0.event, arg_23_0.contextData)
end

function var_0_0.GetBottomPanel(arg_24_0)
	return MainBottomPanel4Mellow.New(arg_24_0._tf:Find("frame/bottom"), arg_24_0.event, arg_24_0.contextData)
end

function var_0_0.GetIconView(arg_25_0)
	return MainIconView4Mellow.New(arg_25_0._tf:Find("frame/top/icon"), arg_25_0.event)
end

function var_0_0.GetChatRoomView(arg_26_0)
	return MainChatRoomView4Mellow.New(arg_26_0._tf:Find("frame/right/chat_room"), arg_26_0.event)
end

function var_0_0.GetBannerView(arg_27_0)
	return MainBannerView4Mellow.New(arg_27_0._tf:Find("frame/left/banner"), arg_27_0.event)
end

function var_0_0.GetActBtnView(arg_28_0)
	return MainActivityBtnView4Mellow.New(arg_28_0._tf:Find("frame"), arg_28_0.event)
end

function var_0_0.GetBuffView(arg_29_0)
	return MainBuffView4Mellow.New(arg_29_0._tf:Find("frame/top/buff_list"), arg_29_0.event)
end

function var_0_0.GetChangeSkinView(arg_30_0)
	return MainChangeSkinView.New(arg_30_0._tf:Find("frame/right/change_skin"), arg_30_0.event)
end

function var_0_0.GetAsmrChatView(arg_31_0)
	return MainAsmrChatView.New(arg_31_0._tf:Find("frame/bottom/asmr_chat"), arg_31_0.event)
end

function var_0_0.OnAsmrTurnning(arg_32_0, arg_32_1)
	var_0_0.super.OnAsmrTurnning(arg_32_0, arg_32_1)
	setActive(findTF(arg_32_0._tf, "s"), not arg_32_1)
end

function var_0_0.GetRedDots(arg_33_0)
	return {
		RedDotNode.New(arg_33_0._tf:Find("frame/bottom/frame/task/tip"), {
			pg.RedDotMgr.TYPES.TASK
		}),
		MailRedDotNode4Mellow.New(arg_33_0._tf:Find("frame/top/btns/mail")),
		RedDotNode.New(arg_33_0._tf:Find("frame/bottom/frame/build/tip"), {
			pg.RedDotMgr.TYPES.BUILD
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/bottom/frame/guild/tip"), {
			pg.RedDotMgr.TYPES.GUILD
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/top/icon_front/tip"), {
			pg.RedDotMgr.TYPES.ATTIRE
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/right/2/menor/root/tip"), {
			pg.RedDotMgr.TYPES.MEMORY_REVIEW
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/right/2/collection/root/tip"), {
			pg.RedDotMgr.TYPES.COLLECTION
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/right/2/friend/root/tip"), {
			pg.RedDotMgr.TYPES.FRIEND
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/left/extend/tip"), {
			pg.RedDotMgr.TYPES.COMMISSION
		}),
		SettingsRedDotNode.New(arg_33_0._tf:Find("frame/top/btns/settings/tip"), {
			pg.RedDotMgr.TYPES.SETTTING
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/top/btns/noti/tip"), {
			pg.RedDotMgr.TYPES.SERVER
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/bottom/frame/tech/tip"), {
			pg.RedDotMgr.TYPES.BLUEPRINT
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/right/1/battle/root/tip"), {
			pg.RedDotMgr.TYPES.EVENT
		}),
		RedDotNode.New(arg_33_0._tf:Find("frame/bottom/frame/live/tip"), {
			pg.RedDotMgr.TYPES.COURTYARD,
			pg.RedDotMgr.TYPES.SCHOOL,
			pg.RedDotMgr.TYPES.COMMANDER,
			pg.RedDotMgr.TYPES.DORM3D_SHOP_TIMELIMIT,
			pg.RedDotMgr.TYPES.EDUCATE_NEW_CHILD,
			pg.RedDotMgr.TYPES.ISLAND_3D
		}),
		SwitcherRedDotNode.New(arg_33_0._tf:Find("frame/right/switch"), {
			pg.RedDotMgr.TYPES.COLLECTION,
			pg.RedDotMgr.TYPES.FRIEND,
			pg.RedDotMgr.TYPES.MEMORY_REVIEW
		}, true),
		SwitcherRedDotNode.New(arg_33_0._tf:Find("frame/right/switch"), {
			pg.RedDotMgr.TYPES.EVENT
		}, false)
	}
end

return var_0_0
