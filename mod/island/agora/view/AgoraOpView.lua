local var_0_0 = class("AgoraOpView", import("Mod.Island.Core.View.IslandOpView"))

function var_0_0.GetUIName(arg_1_0)
	return "IslandAgoraOpUI"
end

function var_0_0.OnInit(arg_2_0, arg_2_1)
	var_0_0.super.OnInit(arg_2_0, arg_2_1)

	arg_2_0.agoraPanel = arg_2_0._tf:Find("agora_op_btns")
	arg_2_0.lookBtn = arg_2_0._tf:Find("look")
	arg_2_0.moveBtn = arg_2_0._tf:Find("move")
	arg_2_0.agoraMoveBtn = arg_2_0.agoraPanel:Find("move")
	arg_2_0.agoraMoveDirTr = arg_2_0._tf:Find("agora_op_btns/move/Area/dir")
	arg_2_0.dragBtn = arg_2_0.agoraPanel:Find("drag")
	arg_2_0.confirmBtn = arg_2_0.dragBtn:Find("ok")
	arg_2_0.removeBtn = arg_2_0.dragBtn:Find("cancel")
	arg_2_0.rotationBtn = arg_2_0.dragBtn:Find("rotation")
	arg_2_0.signInTip = arg_2_0._tf:Find("adapt/signIn_tip")
	arg_2_0.isDraging = false
	arg_2_0.animator = arg_2_0.agoraPanel:GetComponent(typeof(Animation))
	arg_2_0.dftAniEvent = arg_2_0.agoraPanel:GetComponent(typeof(DftAniEvent))

	setText(arg_2_0.signInTip:Find("Text"), i18n("island_agora_signIn_tip"))
	arg_2_0:UpdateSignInTip()
end

function var_0_0.DisablePlayerOp(arg_3_0)
	var_0_0.super.DisablePlayerOp(arg_3_0)
	setActive(arg_3_0.signInTip, false)
end

function var_0_0.EnablePlayerOp(arg_4_0)
	var_0_0.super.EnablePlayerOp(arg_4_0)
	arg_4_0:UpdateSignInTip()
end

function var_0_0.OnUpdate(arg_5_0)
	var_0_0.super.OnUpdate(arg_5_0)

	if arg_5_0.activeMould and not arg_5_0.isDraging then
		arg_5_0:UpdateDragPosition(arg_5_0.activeMould)
	end
end

function var_0_0.UpdateSignInTip(arg_6_0)
	if not arg_6_0:GetView():IsSelfIsland() then
		setActive(arg_6_0.signInTip, false)
	else
		local var_6_0 = arg_6_0:GetView():GetIsland()

		setActive(arg_6_0.signInTip, var_6_0:GetSignInAgency():CanSignIn())
	end
end

function var_0_0.ActiveDragBtn(arg_7_0, arg_7_1)
	arg_7_0.dftAniEvent:SetEndEvent(nil)
	arg_7_0:UpdateDragPosition(arg_7_1)

	arg_7_0.activeMould = arg_7_1

	arg_7_0.animator:Stop()
	arg_7_0.dftAniEvent:SetEndEvent(function()
		arg_7_0.dftAniEvent:SetEndEvent(nil)
		arg_7_0:AddDraglistener(arg_7_1)
	end)
	arg_7_0.animator:Play("anim_IslandAgoraOpUI_Agora_In")
end

function var_0_0.InActiveDragBtn(arg_9_0)
	arg_9_0.activeMould = nil
	arg_9_0.isDraging = false

	arg_9_0.animator:Stop()
	arg_9_0.dftAniEvent:SetEndEvent(nil)
	arg_9_0.dftAniEvent:SetEndEvent(function()
		arg_9_0.dftAniEvent:SetEndEvent(nil)
		arg_9_0:RemoveDraglistener()

		arg_9_0.dragBtn.localPosition = Vector3(10000, 10000, 0)
	end)
	arg_9_0.animator:Play("anim_IslandAgoraOpUI_Agora_Out")
end

function var_0_0.UpdateDragPosition(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1.root.position
	local var_11_1 = AgoraCalc.WorldPosition2ScreenPosition(var_11_0)
	local var_11_2 = AgoraCalc.ScreenPosition2LocalPosition(arg_11_0.dragBtn.parent, var_11_1)

	arg_11_0.dragBtn.localPosition = var_11_2
end

function var_0_0.AddDraglistener(arg_12_0, arg_12_1)
	local var_12_0 = GetOrAddComponent(arg_12_0.dragBtn, typeof(EventTriggerListener))

	var_12_0:AddBeginDragFunc(function(arg_13_0, arg_13_1)
		arg_12_0.isDraging = true

		arg_12_0:Op("BeginDragItem")
	end)
	var_12_0:AddDragFunc(function(arg_14_0, arg_14_1)
		local var_14_0 = AgoraCalc.ScreenPostion2MapPosition(arg_14_1.position)

		arg_12_0:Op("DragItem", var_14_0)
		arg_12_0:UpdateDragPosition(arg_12_1)
	end)
	var_12_0:AddDragEndFunc(function(arg_15_0, arg_15_1)
		local var_15_0 = AgoraCalc.ScreenPostion2MapPosition(arg_15_1.position)

		arg_12_0:Op("EndDragItem", var_15_0)
		arg_12_0:UpdateDragPosition(arg_12_1)

		arg_12_0.isDraging = false
	end)
	onButton(arg_12_0, arg_12_0.confirmBtn, function()
		arg_12_0:Op("ConfirmSelectedItem")
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.removeBtn, function()
		arg_12_0:Op("RemovePlaceItem")
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.rotationBtn, function()
		arg_12_0:Op("RotationItem")
	end, SFX_PANEL)
end

function var_0_0.RemoveDraglistener(arg_19_0)
	local var_19_0 = GetOrAddComponent(arg_19_0.dragBtn, typeof(EventTriggerListener))

	var_19_0:AddBeginDragFunc(nil)
	var_19_0:AddDragFunc(nil)
	var_19_0:AddDragEndFunc(nil)
	removeOnButton(arg_19_0.confirmBtn)
	removeOnButton(arg_19_0.removeBtn)
	removeOnButton(arg_19_0.removeBtn)
end

function var_0_0.EnterMode(arg_20_0, arg_20_1)
	if arg_20_1 == AgoraView.MODE_OVERVIEW then
		setActive(arg_20_0.moveBtn, true)
		setActive(arg_20_0.agoraMoveBtn, false)
		arg_20_0:TryEnablePlayerOp()
		arg_20_0.inputController:ActivePlayerActionMap(IslandConst.PLAYER_INPUT_INDEX)
		arg_20_0:RemoveEditModeListener()
	elseif arg_20_1 == AgoraView.MODE_EDIT then
		setActive(arg_20_0.moveBtn, false)
		setActive(arg_20_0.agoraMoveBtn, true)

		if not arg_20_0.mode or arg_20_0.mode == AgoraView.MODE_OVERVIEW then
			arg_20_0:TryDisablePlayerOp()
		end

		arg_20_0.inputController:ActivePlayerActionMap(IslandConst.AGORA_INPUT_INDEX)
		arg_20_0.inputController:EnableAgoraLook()
		arg_20_0:RemovePaveTileModeListener()
		arg_20_0:AddEditModeListener()
	elseif arg_20_1 == AgoraView.MODE_PAVE_TILE then
		arg_20_0.inputController:DisableAgoraLook()
		arg_20_0:RemoveEditModeListener()
		arg_20_0:AddPaveTileModeListener()
	end

	arg_20_0.mode = arg_20_1
end

function var_0_0.StartInteraction(arg_21_0)
	arg_21_0.super.StartInteraction(arg_21_0)
	setActive(arg_21_0.agoraPanel, false)
end

function var_0_0.EndInteraction(arg_22_0)
	arg_22_0.super.EndInteraction(arg_22_0)
	setActive(arg_22_0.agoraPanel, true)
end

function var_0_0.OnEditModeClick(arg_23_0, arg_23_1)
	local var_23_0 = AgoraCalc.ScreenPostion2MapPosition(arg_23_1)

	arg_23_0:Op("TrySelectItem", var_23_0)
end

function var_0_0.AddEditModeListener(arg_24_0)
	local var_24_0 = GetOrAddComponent(arg_24_0.lookBtn, typeof(EventTriggerListener))
	local var_24_1

	var_24_0:AddPointDownFunc(function(arg_25_0, arg_25_1)
		var_24_1 = arg_25_1.position
	end)
	var_24_0:AddPointUpFunc(function(arg_26_0, arg_26_1)
		if not var_24_1 or var_24_1 ~= arg_26_1.position then
			return
		end

		arg_24_0:OnEditModeClick(arg_26_1.position)

		var_24_1 = nil
	end)
end

function var_0_0.RemoveEditModeListener(arg_27_0)
	local var_27_0 = arg_27_0.lookBtn:GetComponent(typeof(EventTriggerListener))

	if var_27_0 then
		var_27_0:AddPointDownFunc(nil)
		var_27_0:AddPointUpFunc(nil)
	end
end

function var_0_0.AddPaveTileModeListener(arg_28_0)
	local var_28_0 = GetOrAddComponent(arg_28_0.lookBtn, typeof(EventTriggerListener))
	local var_28_1

	var_28_0:AddPointDownFunc(function(arg_29_0, arg_29_1)
		var_28_1 = arg_29_1.position
	end)
	var_28_0:AddPointUpFunc(function(arg_30_0, arg_30_1)
		if not var_28_1 or var_28_1 ~= arg_30_1.position then
			return
		end

		local var_30_0 = AgoraCalc.ScreenPostion2MapPosition(arg_30_1.position)

		arg_28_0:Op("OpLayer", var_30_0)

		local var_30_1
	end)
	var_28_0:AddBeginDragFunc(function(arg_31_0, arg_31_1)
		return
	end)
	var_28_0:AddDragFunc(function(arg_32_0, arg_32_1)
		local var_32_0 = AgoraCalc.ScreenPostion2MapPosition(arg_32_1.position)

		arg_28_0:Op("OpLayer", var_32_0)
	end)
	var_28_0:AddDragEndFunc(function(arg_33_0, arg_33_1)
		return
	end)
end

function var_0_0.RemovePaveTileModeListener(arg_34_0)
	local var_34_0 = arg_34_0.lookBtn:GetComponent(typeof(EventTriggerListener))

	if var_34_0 then
		var_34_0:AddPointDownFunc(nil)
		var_34_0:AddPointUpFunc(nil)
		var_34_0:AddBeginDragFunc(nil)
		var_34_0:AddDragFunc(nil)
		var_34_0:AddDragEndFunc(nil)
	end
end

function var_0_0.OnDestroy(arg_35_0)
	var_0_0.super.OnDestroy(arg_35_0)
	arg_35_0:RemovePaveTileModeListener()
	arg_35_0:RemoveDraglistener()
	arg_35_0.dftAniEvent:SetEndEvent(nil)
end

return var_0_0
