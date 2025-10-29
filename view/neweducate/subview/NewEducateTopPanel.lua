local var_0_0 = class("NewEducateTopPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "NewEducateTopPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.animCom = arg_2_0._tf:GetComponent(typeof(Animation))

	local var_2_0 = arg_2_0._tf:Find("progress")

	arg_2_0.progressEndingTF = var_2_0:Find("ending")

	setText(arg_2_0.progressEndingTF:Find("Text"), i18n("child2_ending_stage"))

	arg_2_0.progressResetTF = var_2_0:Find("reset")

	setText(arg_2_0.progressResetTF:Find("Text"), i18n("child2_reset_stage"))

	arg_2_0.progressInfoTF = var_2_0:Find("info")
	arg_2_0.progressDetailTF = var_2_0:Find("detail")

	setActive(arg_2_0.progressDetailTF, true)
	setActive(arg_2_0.progressInfoTF, false)

	arg_2_0.roundTF = arg_2_0.progressDetailTF:Find("round/Text")
	arg_2_0.assessRoundTF = arg_2_0.progressDetailTF:Find("round/assess")
	arg_2_0.targetTF = arg_2_0.progressDetailTF:Find("target/content/value")

	if arg_2_0.contextData.showBack then
		arg_2_0:ShowBack()
	else
		arg_2_0:ShowDetail()
	end

	arg_2_0.resTF = arg_2_0._tf:Find("res")
	arg_2_0.resTF:GetComponent(typeof(Image)).enabled = not arg_2_0.contextData.hideBlurBg
	arg_2_0.toolbarTF = arg_2_0._tf:Find("toolbar")

	setActive(arg_2_0.toolbarTF:Find("btns/home"), not arg_2_0.contextData.hideHome)
	setActive(arg_2_0.toolbarTF:Find("btns/help/line"), not arg_2_0.contextData.hideHome)
	setAnchoredPosition(arg_2_0.resTF, {
		y = -30,
		x = arg_2_0.contextData.hideHome and -437 or -565
	})
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("progress/back"), function()
		arg_3_0:emit(NewEducateBaseUI.ON_BACK)
	end, SFX_PANEL)

	arg_3_0.resUIList = UIItemList.New(arg_3_0.resTF, arg_3_0.resTF:Find("tpl"))

	arg_3_0.resUIList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_3_0:OnInitRes(arg_5_1, arg_5_2)
		elseif arg_5_0 == UIItemList.EventUpdate then
			arg_3_0:OnUpdateRes(arg_5_1, arg_5_2)
		end
	end)

	arg_3_0.resIds = arg_3_0.contextData.char:GetResPanelIds()

	onButton(arg_3_0, arg_3_0.toolbarTF:Find("btns/collect"), function()
		arg_3_0:emit(NewEducateBaseUI.GO_SUBLAYER, Context.New({
			mediator = NewEducateCollectEntranceMediator,
			viewComponent = NewEducateCollectEntranceLayer,
			data = {
				id = arg_3_0.contextData.char.id
			}
		}))
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.toolbarTF:Find("btns/refresh"), function()
		arg_3_0:emit(NewEducateBaseUI.ON_BOX, {
			content = i18n("child_refresh_sure_tip"),
			onYes = function()
				pg.m02:sendNotification(GAME.NEW_EDUCATE_REFRESH, {
					id = arg_3_0.contextData.char.id
				})
			end
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.toolbarTF:Find("btns/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.child2_main_help.tip
		})
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.toolbarTF:Find("btns/home"), function()
		NewEducateHelper.TrackExitTime()
		arg_3_0:emit(NewEducateBaseUI.ON_HOME)
	end, SFX_PANEL)
	arg_3_0:OverlayPanel(arg_3_0._tf, {
		pbList = {
			arg_3_0.resTF
		}
	})
	arg_3_0:Flush()
end

function var_0_0.Flush(arg_11_0, arg_11_1)
	arg_11_0:FlushProgress(arg_11_1)
	arg_11_0:FlushRes()
end

function var_0_0.ShowDetail(arg_12_0)
	arg_12_0:Show()

	arg_12_0.detailShowing = true
end

function var_0_0.ShowBack(arg_13_0)
	arg_13_0:Show()

	arg_13_0.detailShowing = false
end

function var_0_0.FlushProgress(arg_14_0, arg_14_1)
	local var_14_0 = (arg_14_1 or arg_14_0.contextData.char:GetFSM():GetStystemNo()) ~= NewEducateFSM.STYSTEM.ENDING

	setActive(arg_14_0.progressDetailTF, var_14_0)
	setActive(arg_14_0.progressEndingTF, not var_14_0)
	setActive(arg_14_0.progressResetTF, not var_14_0)

	if var_14_0 then
		local var_14_1, var_14_2, var_14_3 = arg_14_0.contextData.char:GetRoundData():GetProgressInfo()

		setText(arg_14_0.progressInfoTF:Find("Text"), i18n("child2_cur_round", var_14_1))
		setText(arg_14_0.roundTF, i18n("child2_cur_round", var_14_1))

		local var_14_4 = var_14_2 > 0 and "39bfff" or "ff6767"

		setText(arg_14_0.assessRoundTF, i18n("child2_assess_round", var_14_2))
		setTextColor(arg_14_0.assessRoundTF, Color.NewHex(var_14_4))

		local var_14_5 = arg_14_0.contextData.char:GetAttrSum()

		setText(arg_14_0.targetTF, i18n("child2_assess_target", var_14_5, var_14_3))

		local var_14_6 = var_14_3 <= var_14_5 and "39bfff" or "848498"

		setTextColor(arg_14_0.targetTF, Color.NewHex(var_14_6))
	else
		local var_14_7 = arg_14_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.ENDING)
		local var_14_8 = var_14_7 and var_14_7:IsFinish()

		setActive(arg_14_0.progressEndingTF, not var_14_8)
		setActive(arg_14_0.progressResetTF, var_14_8)
	end
end

function var_0_0.OnInitRes(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.resIds[arg_15_1 + 1]

	setActive(arg_15_2:Find("line"), arg_15_1 + 1 ~= #arg_15_0.resIds)

	local var_15_1 = pg.child2_resource[var_15_0]

	LoadImageSpriteAsync("neweducateicon/" .. var_15_1.icon, arg_15_2:Find("icon"))
	onButton(arg_15_0, arg_15_2, function()
		arg_15_0:emit(NewEducateBaseUI.ON_ITEM, {
			drop = {
				number = 1,
				type = NewEducateConst.DROP_TYPE.RES,
				id = var_15_0
			}
		})
	end, SFX_PANEL)
end

function var_0_0.OnUpdateRes(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = pg.child2_resource[arg_17_0.resIds[arg_17_1 + 1]]
	local var_17_1 = var_17_0.type ~= NewEducateChar.RES_TYPE.MONEY and "/" .. var_17_0.max_value or ""
	local var_17_2 = arg_17_0.contextData.char:GetRes(var_17_0.id)

	if var_17_0.type == NewEducateChar.RES_TYPE.MOOD then
		setText(arg_17_2:Find("value"), setColorStr(var_17_2, arg_17_0:GetMoodColor(var_17_2)) .. var_17_1)
	else
		setText(arg_17_2:Find("value"), var_17_2 .. var_17_1)
	end
end

function var_0_0.FlushRes(arg_18_0)
	arg_18_0.resUIList:align(#arg_18_0.resIds)
end

function var_0_0.PlayShow(arg_19_0)
	arg_19_0.animCom:Play("anim_educate_topui_show")
end

function var_0_0.PlayHide(arg_20_0)
	arg_20_0.animCom:Play("anim_educate_topui_hide")
end

function var_0_0.OnDestroy(arg_21_0)
	arg_21_0:UnOverlayPanel(arg_21_0._tf)
end

function var_0_0.GetMoodColor(arg_22_0, arg_22_1)
	if arg_22_1 < 20 then
		return "#ee4a4a"
	elseif arg_22_1 < 40 then
		return "#ab4734"
	elseif arg_22_1 < 60 then
		return "#393A3C"
	else
		return "#00c79b"
	end
end

return var_0_0
