local var_0_0 = class("Dorm3dIKView", import("view.dorm3d.Game.Dorm3dGameBaseSubView"))

var_0_0.SET_CONTROL_ACTIVE = "Dorm3dIKView.SET_CONTROL_ACTIVE"
var_0_0.SET_CAMERA_BUTTON_ACTIVE = "Dorm3dIKView.SET_CAMERA_BUTTON_ACTIVE"
var_0_0.RESET_ENTRY_MENU = "Dorm3dIKView.RESET_ENTRY_MENU"
var_0_0.SET_BACK_BUTTON_ACTIVE = "Dorm3dIKView.SET_BACK_BUTTON_ACTIVE"
var_0_0.UPDATE_TEXT_TIPS = "Dorm3dIKView.UPDATE_TEXT_TIPS"
var_0_0.UPDATE_TIPS = "Dorm3dIKView.UPDATE_TIPS"
var_0_0.SET_TIPS_ACTIVE = "Dorm3dIKView.SET_TIPS_ACTIVE"
var_0_0.SET_HAND_POSITION = "Dorm3dIKView.SET_HAND_POSITION"
var_0_0.PLAY_HAND_BEGIN = "Dorm3dIKView.PLAY_HAND_BEGIN"
var_0_0.PLAY_HAND_END = "Dorm3dIKView.PLAY_HAND_END"
var_0_0.UPDATE_HOLD_PROGRESS = "Dorm3dIKView.UPDATE_HOLD_PROGRESS"

function var_0_0.Init(arg_1_0)
	arg_1_0.uiContainer = arg_1_0._tf:Find("UI")
	arg_1_0.rtIKUI = arg_1_0.uiContainer:Find("ik")
	arg_1_0.ikControlUI = arg_1_0._tf:Find("IKControl")
	arg_1_0.controlLayer = arg_1_0.ikControlUI:Find("ControlLayer")

	arg_1_0:InitIKControlRoots()
	arg_1_0:InitButtons()
	arg_1_0:InitDragEvent()
	arg_1_0:InitEvents()
end

function var_0_0.InitIKControlRoots(arg_2_0)
	arg_2_0.ikTipsRoot = arg_2_0.ikControlUI:Find("Tips")

	setActive(arg_2_0.ikTipsRoot, false)

	arg_2_0.ikTouchTipsRoot = arg_2_0.ikControlUI:Find("TouchTips")

	assert(not IsNil(arg_2_0.ikTouchTipsRoot), "Missing IKControl/TouchTips")
	setActive(arg_2_0.ikTouchTipsRoot, false)

	arg_2_0.ikTouchTipTpl = arg_2_0.ikTouchTipsRoot:Find("tpl")

	assert(not IsNil(arg_2_0.ikTouchTipTpl), "Missing IKControl/TouchTips/tpl")
	assert(not IsNil(arg_2_0.ikTouchTipTpl:Find("Click")) and not IsNil(arg_2_0.ikTouchTipTpl:Find("Hold")), "TouchTips/tpl missing Click or Hold")
	setActive(arg_2_0.ikTouchTipTpl, false)

	arg_2_0.holdProgressRoot = arg_2_0.ikControlUI:Find("HoldProgress")

	assert(not IsNil(arg_2_0.holdProgressRoot), "Missing IKControl/HoldProgress")

	arg_2_0.holdProgressTpl = arg_2_0.holdProgressRoot:Find("tpl")

	assert(not IsNil(arg_2_0.holdProgressTpl), "Missing IKControl/HoldProgress/tpl")
	setActive(arg_2_0.holdProgressRoot, false)
	setActive(arg_2_0.holdProgressTpl, false)

	arg_2_0.ikHand = arg_2_0.ikControlUI:Find("Handler")

	setActive(arg_2_0.ikHand, false)
	eachChild(arg_2_0.ikHand, function(arg_3_0)
		setActive(arg_3_0, false)
	end)

	arg_2_0.ikTextTipsRoot = arg_2_0.ikControlUI:Find("TextTips")

	setActive(arg_2_0.ikTextTipsRoot, false)
	eachChild(arg_2_0.ikTextTipsRoot, function(arg_4_0)
		setActive(arg_4_0, false)
	end)
	setActive(arg_2_0.ikControlUI, false)
end

function var_0_0.InitButtons(arg_5_0)
	onButton(arg_5_0, arg_5_0.rtIKUI:Find("btn_back/help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("roll_gametip")
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.rtIKUI:Find("Right/btn_camera"), function()
		arg_5_0:emit(RoomIKSystem.CYCLE_IK_CAMERA_GROUP)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.rtIKUI:Find("Right/MenuSmall"), function()
		setActive(arg_5_0.rtIKUI:Find("Right/MenuSmall"), false)
		setActive(arg_5_0.rtIKUI:Find("Right/Menu"), true)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.rtIKUI:Find("Right/Menu/Collapse"), function()
		setActive(arg_5_0.rtIKUI:Find("Right/Menu"), false)
		setActive(arg_5_0.rtIKUI:Find("Right/MenuSmall"), true)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0.rtIKUI:Find("Right/Menu"), function()
		setActive(arg_5_0.rtIKUI:Find("Right"), false)
		arg_5_0:emit(Dorm3dRoomMediator.OPEN_SKIN_SELECT_LAYER, arg_5_0.contextData.GetApartment():GetConfigID(), arg_5_0.contextData.GetCurrentLadyEnv(), function(arg_11_0, arg_11_1, arg_11_2)
			arg_5_0:emit(RoomIKSystem.SWITCH_IK_SKIN, arg_11_0, arg_11_1, arg_11_2)
		end, function()
			setActive(arg_5_0.rtIKUI:Find("Right"), true)
		end, true)
	end, SFX_PANEL)
end

function var_0_0.InitDragEvent(arg_13_0)
	local var_13_0 = arg_13_0.controlLayer:GetComponent(typeof(SlideController))

	if var_13_0 and not IsNil(var_13_0) then
		var_13_0:ClearEvents()

		var_13_0.enabled = false
	end

	local var_13_1 = GetOrAddComponent(arg_13_0.controlLayer, typeof(SlideControllerHotfix))

	var_13_1:ClearEvents()

	arg_13_0.ikSlideController = var_13_1

	var_13_1:AddPointDownFunc(function(arg_14_0, arg_14_1)
		arg_13_0:emit(RoomIKSystem.ON_CONTROL_POINTER_DOWN, arg_14_1.position)
	end)
	var_13_1:AddPointUpFunc(function(arg_15_0, arg_15_1)
		arg_13_0:emit(RoomIKSystem.ON_CONTROL_POINTER_UP, arg_15_1.position)
	end)
	var_13_1:AddBeginDragFunc(function(arg_16_0, arg_16_1)
		arg_13_0:emit(RoomIKSystem.ON_CONTROL_BEGIN_DRAG, arg_16_1.position)
	end)
	var_13_1:AddDragFunc(function(arg_17_0, arg_17_1)
		arg_13_0:emit(RoomIKSystem.ON_CONTROL_DRAG, arg_17_1.position, arg_17_1.delta)
	end)
	var_13_1:AddDragEndFunc(function(arg_18_0, arg_18_1)
		arg_13_0:emit(RoomIKSystem.ON_CONTROL_END_DRAG, arg_18_1.position)
	end)
end

function var_0_0.InitEvents(arg_19_0)
	arg_19_0:bind(var_0_0.SET_CONTROL_ACTIVE, function(arg_20_0, arg_20_1)
		setActive(arg_19_0.ikControlUI, arg_20_1)

		if not arg_20_1 then
			arg_19_0:ResetHand()
			arg_19_0:ResetHoldProgress()
		end
	end)
	arg_19_0:bind(var_0_0.SET_CAMERA_BUTTON_ACTIVE, function(arg_21_0, arg_21_1)
		setActive(arg_19_0.rtIKUI:Find("Right/btn_camera"), arg_21_1)
	end)
	arg_19_0:bind(var_0_0.RESET_ENTRY_MENU, function(arg_22_0, arg_22_1)
		setActive(arg_19_0.rtIKUI:Find("Right/MenuSmall"), arg_22_1)
		setActive(arg_19_0.rtIKUI:Find("Right/Menu"), false)
	end)
	arg_19_0:bind(var_0_0.SET_BACK_BUTTON_ACTIVE, function(arg_23_0, arg_23_1)
		setActive(arg_19_0.rtIKUI:Find("btn_back"), arg_23_1)
	end)
	arg_19_0:bind(var_0_0.UPDATE_TEXT_TIPS, function(arg_24_0, arg_24_1)
		arg_19_0:UpdateTextTips(arg_24_1)
	end)
	arg_19_0:bind(var_0_0.UPDATE_TIPS, function(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
		arg_19_0:UpdateTips(arg_25_1, arg_25_2, arg_25_3)
	end)
	arg_19_0:bind(var_0_0.SET_TIPS_ACTIVE, function(arg_26_0, arg_26_1)
		arg_19_0:SetTipsActive(arg_26_1)
	end)
	arg_19_0:bind(var_0_0.SET_HAND_POSITION, function(arg_27_0, arg_27_1)
		setAnchoredPosition(arg_19_0.ikHand, arg_27_1)
	end)
	arg_19_0:bind(var_0_0.PLAY_HAND_BEGIN, function()
		arg_19_0:PlayHandBegin()
	end)
	arg_19_0:bind(var_0_0.PLAY_HAND_END, function()
		arg_19_0:PlayHandEnd()
	end)
	arg_19_0:bind(var_0_0.UPDATE_HOLD_PROGRESS, function(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
		arg_19_0:UpdateHoldProgress(arg_30_1, arg_30_2, arg_30_3)
	end)
end

function var_0_0.UpdateTextTips(arg_31_0, arg_31_1)
	eachChild(arg_31_0.ikTextTipsRoot, function(arg_32_0)
		setActive(arg_32_0, false)
	end)
	_.each(arg_31_1 or {}, function(arg_33_0)
		local var_33_0 = arg_31_0.ikTextTipsRoot:Find(arg_33_0)

		if not IsNil(var_33_0) then
			setActive(var_33_0, true)
		end
	end)
end

function var_0_0.SetTipsActive(arg_34_0, arg_34_1)
	if arg_34_1 and arg_34_0.holdProgressActive then
		arg_34_1 = false
	end

	setActive(arg_34_0.ikTipsRoot, arg_34_1)
	setActive(arg_34_0.ikTouchTipsRoot, arg_34_1)
	setActive(arg_34_0.ikTextTipsRoot, arg_34_1)
end

function var_0_0.UpdateHoldProgress(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	if not arg_35_1 then
		arg_35_0:ResetHoldProgress()

		return
	end

	arg_35_0.holdProgressActive = true

	arg_35_0:SetTipsActive(false)
	setActive(arg_35_0.holdProgressRoot, true)
	setActive(arg_35_0.holdProgressTpl, true)
	setLocalPosition(arg_35_0.holdProgressTpl, LuaHelper.ScreenToLocal(arg_35_0.holdProgressRoot, arg_35_2, pg.UIMgr.GetInstance().uiCameraComp))

	local var_35_0 = arg_35_0.holdProgressTpl:Find("Progress")

	if IsNil(var_35_0) then
		var_35_0 = arg_35_0.holdProgressTpl
	end

	local var_35_1 = GetComponent(var_35_0, typeof(Image))

	if not IsNil(var_35_1) then
		var_35_1.fillAmount = math.clamp(arg_35_3 or 0, 0, 1)
	end
end

function var_0_0.ResetHoldProgress(arg_36_0)
	arg_36_0.holdProgressActive = nil

	setActive(arg_36_0.holdProgressTpl, false)
	setActive(arg_36_0.holdProgressRoot, false)
end

function var_0_0.SetTouchTipType(arg_37_0, arg_37_1, arg_37_2)
	local var_37_0 = arg_37_1:Find("Click")
	local var_37_1 = arg_37_1:Find("Hold")

	assert(not IsNil(var_37_0) and not IsNil(var_37_1), "TouchTips/tpl item missing Click or Hold")
	setActive(var_37_0, arg_37_2 == RoomTouchSystem.TRIGGER_CLICK)
	setActive(var_37_1, arg_37_2 == RoomTouchSystem.TRIGGER_LONG_PRESS)
end

function var_0_0.GetTipLocalPosition(arg_38_0, arg_38_1, arg_38_2)
	if not arg_38_2.active then
		return Vector2.zero
	end

	assert(arg_38_2.screenPosition, "Missing active IK tip screen position")

	return LuaHelper.ScreenToLocal(arg_38_1, arg_38_2.screenPosition, pg.UIMgr.GetInstance().uiCameraComp) + (arg_38_2.offset or Vector2.zero)
end

function var_0_0.GetIKTipRotation(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_1:PointToNormalized(Vector2.zero)
	local var_39_1 = Vector2.zero

	if var_39_0.x < 0.5 and var_39_0.y < 0.5 then
		var_39_1 = arg_39_1.max
	elseif var_39_0.x >= 0.5 and var_39_0.y < 0.5 then
		var_39_1 = Vector2.New(arg_39_1.xMin, arg_39_1.yMax)
	elseif var_39_0.x < 0.5 and var_39_0.y >= 0.5 then
		var_39_1 = Vector2.New(arg_39_1.xMax, arg_39_1.yMin)
	elseif var_39_0.x >= 0.5 and var_39_0.y >= 0.5 then
		var_39_1 = arg_39_1.min
	end

	if var_39_0.x == 0.5 then
		if arg_39_2.x < 0 then
			var_39_1.x = arg_39_1.xMax
		else
			var_39_1.x = arg_39_1.xMin
		end
	end

	if var_39_0.y == 0.5 then
		if arg_39_2.y < 0 then
			var_39_1.y = arg_39_1.yMax
		else
			var_39_1.y = arg_39_1.yMin
		end
	end

	local var_39_2 = var_39_1 - arg_39_1.center

	return Quaternion.LookRotation(Vector3.forward, Vector3.New(var_39_2.x, var_39_2.y, 0))
end

function var_0_0.UpdateTouchTips(arg_40_0, arg_40_1)
	UIItemList.StaticAlign(arg_40_0.ikTouchTipsRoot, arg_40_0.ikTouchTipTpl, #(arg_40_1 or {}), function(arg_41_0, arg_41_1, arg_41_2)
		if arg_41_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_41_1 = arg_41_1 + 1

		local var_41_0 = arg_40_1[arg_41_1]

		arg_40_0:SetTouchTipType(arg_41_2, var_41_0.triggerType)
		setLocalPosition(arg_41_2, arg_40_0:GetTipLocalPosition(arg_40_0.ikTouchTipsRoot, var_41_0))
		setActive(arg_41_2, var_41_0.active)
	end)
end

function var_0_0.UpdateIKTips(arg_42_0, arg_42_1)
	UIItemList.StaticAlign(arg_42_0.ikTipsRoot, arg_42_0.ikTipsRoot:GetChild(0), #(arg_42_1 or {}), function(arg_43_0, arg_43_1, arg_43_2)
		if arg_43_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_43_1 = arg_43_1 + 1

		local var_43_0 = arg_42_1[arg_43_1]
		local var_43_1 = arg_42_0:GetTipLocalPosition(arg_42_0.ikTipsRoot, var_43_0)
		local var_43_2 = var_43_0.active and arg_42_0:GetIKTipRotation(var_43_0.triggerRect, var_43_1) or Quaternion.identity

		setLocalPosition(arg_43_2, var_43_1)
		setLocalRotation(arg_43_2, var_43_2)
		setActive(arg_43_2, var_43_0.active)
	end)
end

function var_0_0.PlayHandBegin(arg_44_0)
	setActive(arg_44_0.ikHand, true)
	eachChild(arg_44_0.ikHand, function(arg_45_0)
		setActive(arg_45_0, false)
	end)
	arg_44_0:StopHandTimer()
	setActive(arg_44_0.ikHand:Find("Begin"), true)

	arg_44_0.handTimer = Timer.New(function()
		setActive(arg_44_0.ikHand:Find("Begin"), false)
		setActive(arg_44_0.ikHand:Find("Normal"), true)
	end, 0.5, 1)

	arg_44_0.handTimer:Start()
end

function var_0_0.ResetHand(arg_47_0)
	arg_47_0:StopHandTimer()
	eachChild(arg_47_0.ikHand, function(arg_48_0)
		setActive(arg_48_0, false)
	end)
	setActive(arg_47_0.ikHand, false)
end

function var_0_0.PlayHandEnd(arg_49_0)
	arg_49_0:StopHandTimer()
	setActive(arg_49_0.ikHand:Find("Begin"), false)
	setActive(arg_49_0.ikHand:Find("Normal"), false)
	setActive(arg_49_0.ikHand:Find("End"), true)

	arg_49_0.handTimer = Timer.New(function()
		setActive(arg_49_0.ikHand:Find("End"), false)
		setActive(arg_49_0.ikHand, false)
	end, 0.5, 1)

	arg_49_0.handTimer:Start()
end

function var_0_0.StopHandTimer(arg_51_0)
	if not arg_51_0.handTimer then
		return
	end

	arg_51_0.handTimer:Stop()

	arg_51_0.handTimer = nil
end

function var_0_0.UpdateTips(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	if arg_52_1 then
		arg_52_0:UpdateIKTips(arg_52_2 or {})
		arg_52_0:UpdateTouchTips(arg_52_3 or {})
	end

	arg_52_0:SetTipsActive(arg_52_1)
end

function var_0_0.Dispose(arg_53_0)
	if arg_53_0.ikSlideController then
		arg_53_0.ikSlideController:ClearEvents()

		arg_53_0.ikSlideController = nil
	end

	arg_53_0:ResetHand()
	arg_53_0:ResetHoldProgress()
	var_0_0.super.Dispose(arg_53_0)
end

return var_0_0
