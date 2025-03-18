local var_0_0 = class("NewMainClassicTheme", import(".NewMainSceneBaseTheme"))

function var_0_0.getUIName(arg_1_0)
	return "NewMainClassicTheme"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.adapterView = MainAdpterView.New(arg_2_0:findTF("top_bg"), arg_2_0:findTF("bottom_bg"), arg_2_0:findTF("bg/right"))
end

function var_0_0.PlayEnterAnimation(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0.adapterView:Init()
	var_0_0.super.PlayEnterAnimation(arg_3_0, arg_3_1, arg_3_2)
end

function var_0_0._FoldPanels(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super._FoldPanels(arg_4_0, arg_4_1, arg_4_2)
	arg_4_0.adapterView:Fold(arg_4_1, arg_4_2)
end

function var_0_0.OnDestroy(arg_5_0)
	var_0_0.super.OnDestroy(arg_5_0)

	if arg_5_0.adapterView then
		arg_5_0.adapterView:Dispose()

		arg_5_0.adapterView = nil
	end
end

function var_0_0.SetEffectPanelVisible(arg_6_0, arg_6_1)
	for iter_6_0, iter_6_1 in ipairs(arg_6_0.panels) do
		if isa(iter_6_1, MainRightPanel) then
			iter_6_1:SetVisible(arg_6_1)
		end
	end
end

function var_0_0.GetCalibrationBG(arg_7_0)
	return "mainui_calibration"
end

function var_0_0.GetPbList(arg_8_0)
	return {
		arg_8_0:findTF("frame/chatPreview"),
		arg_8_0:findTF("frame/eventPanel")
	}
end

function var_0_0.GetPaintingOffset(arg_9_0, arg_9_1)
	return MainPaintingShift.New({
		-600,
		-10,
		170,
		0,
		170,
		0,
		1,
		1,
		1
	})
end

function var_0_0.GetWordView(arg_10_0)
	return MainWordView.New(arg_10_0:findTF("chat"), arg_10_0.event)
end

function var_0_0.GetTagView(arg_11_0)
	return MainTagsView.New(arg_11_0:findTF("frame/bottom/tags"), arg_11_0.event)
end

function var_0_0.GetTopPanel(arg_12_0)
	return MainTopPanel.New(arg_12_0:findTF("frame/top"), arg_12_0.event, arg_12_0.contextData)
end

function var_0_0.GetRightPanel(arg_13_0)
	return MainRightPanel.New(arg_13_0:findTF("frame/right"), arg_13_0.event, arg_13_0.contextData)
end

function var_0_0.GetLeftPanel(arg_14_0)
	return MainLeftPanel.New(arg_14_0:findTF("frame/left"), arg_14_0.event, arg_14_0.contextData)
end

function var_0_0.GetBottomPanel(arg_15_0)
	return MainBottomPanel.New(arg_15_0:findTF("frame/bottom"), arg_15_0.event, arg_15_0.contextData)
end

function var_0_0.GetIconView(arg_16_0)
	return MainIconView.New(arg_16_0:findTF("frame/char"))
end

function var_0_0.GetChatRoomView(arg_17_0)
	return MainChatRoomView.New(arg_17_0:findTF("frame/chatPreview"), arg_17_0.event)
end

function var_0_0.GetBannerView(arg_18_0)
	return MainBannerView.New(arg_18_0:findTF("frame/eventPanel"), arg_18_0.event)
end

function var_0_0.GetActBtnView(arg_19_0)
	return MainActivityBtnView.New(arg_19_0:findTF("frame/linkBtns"), arg_19_0.event)
end

function var_0_0.GetBuffView(arg_20_0)
	return MainBuffView.New(arg_20_0:findTF("frame/buffs"), arg_20_0.event)
end

function var_0_0.GetCalibrationView(arg_21_0)
	return MainCalibrationPage.New(arg_21_0._tf, arg_21_0.event)
end

function var_0_0.GetChangeSkinView(arg_22_0)
	return MainChangeSkinView.New(arg_22_0:findTF("frame/left/change_skin"), arg_22_0.event)
end

function var_0_0.GetRedDots(arg_23_0)
	return {
		RedDotNode.New(arg_23_0._tf:Find("frame/bottom/taskButton/tip"), {
			pg.RedDotMgr.TYPES.TASK
		}),
		MailRedDotNode.New(arg_23_0._tf:Find("frame/right/mailButton")),
		RedDotNode.New(arg_23_0._tf:Find("frame/bottom/buildButton/tip"), {
			pg.RedDotMgr.TYPES.BUILD
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/bottom/guildButton/tip"), {
			pg.RedDotMgr.TYPES.GUILD
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/top/tip"), {
			pg.RedDotMgr.TYPES.ATTIRE
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/right/memoryButton/tip"), {
			pg.RedDotMgr.TYPES.MEMORY_REVIEW
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/right/collectionButton/tip"), {
			pg.RedDotMgr.TYPES.COLLECTION
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/right/friendButton/tip"), {
			pg.RedDotMgr.TYPES.FRIEND
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/left/commissionButton/tip"), {
			pg.RedDotMgr.TYPES.COMMISSION
		}),
		SettingsRedDotNode.New(arg_23_0._tf:Find("frame/right/settingButton/tip"), {
			pg.RedDotMgr.TYPES.SETTTING
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/right/noticeButton/tip"), {
			pg.RedDotMgr.TYPES.SERVER
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/bottom/technologyButton/tip"), {
			pg.RedDotMgr.TYPES.BLUEPRINT
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/right/combatBtn/tip"), {
			pg.RedDotMgr.TYPES.EVENT
		}),
		RedDotNode.New(arg_23_0._tf:Find("frame/bottom/liveButton/tip"), {
			pg.RedDotMgr.TYPES.COURTYARD,
			pg.RedDotMgr.TYPES.SCHOOL,
			pg.RedDotMgr.TYPES.COMMANDER
		})
	}
end

return var_0_0
