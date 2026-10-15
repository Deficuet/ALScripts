local var_0_0 = class("Dorm3dAimIKView", import("view.dorm3d.Game.Dorm3dGameBaseSubView"))

var_0_0.TIP_WAIT_TIME = 5
var_0_0.BIND_DRAG_AREA = "Dorm3dAimIKView.BindDragArea"
var_0_0.SHOW_OR_HIDE = "Dorm3dAimIKView.ShowOrHide"

function var_0_0.Init(arg_1_0)
	arg_1_0.controlTF = arg_1_0._tf:Find("AimIKControl")
	arg_1_0.uiTF = arg_1_0._tf:Find("UI/aimik")

	assert(not IsNil(arg_1_0.controlTF) and not IsNil(arg_1_0.uiTF), "AimIKControl or UI/aimik missing")

	arg_1_0.tipTF = arg_1_0.controlTF:Find("Tips")
	arg_1_0.layer = arg_1_0.controlTF:Find("ControlLayer")
	arg_1_0.controller = arg_1_0.layer:GetComponent(typeof(SlideController))
	arg_1_0.backTF = arg_1_0.uiTF:Find("btn_back")

	assert(not IsNil(arg_1_0.backTF), "UI/aimik/btn_back missing")
	onButton(arg_1_0, arg_1_0.backTF, function()
		arg_1_0:emit(AimIKSystem.EXIT_TOUCH_AIMIK_STATUS)
	end, SFX_CANCEL)
	arg_1_0:InitDragEvent()
	arg_1_0:InitHint()
	arg_1_0:Hide()
	arg_1_0:bind(var_0_0.BIND_DRAG_AREA, function(arg_3_0, arg_3_1)
		arg_3_1.dragArea = arg_1_0.layer
	end)
	arg_1_0:bind(var_0_0.SHOW_OR_HIDE, function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_1 then
			arg_1_0:Show(arg_4_2)
		else
			arg_1_0:Hide()
		end
	end)
end

function var_0_0.InitDragEvent(arg_5_0)
	arg_5_0.controller:AddBeginDragFunc(function(arg_6_0, arg_6_1)
		if not arg_5_0.showing or not arg_6_1 then
			return
		end

		setActive(arg_5_0.tipTF, false)
		arg_5_0.timer:Stop()
		arg_5_0:emit(AimIKSystem.ON_BEGIN_DRAG, arg_6_0, arg_6_1)
	end)
	arg_5_0.controller:AddDragFunc(function(arg_7_0, arg_7_1)
		if not arg_5_0.showing or not arg_7_1 then
			return
		end

		arg_5_0:emit(AimIKSystem.ON_DRAG, arg_7_0, arg_7_1)
	end)
	arg_5_0.controller:AddDragEndFunc(function(arg_8_0, arg_8_1)
		if arg_5_0.showing then
			arg_5_0.timer:Start()
		end

		arg_5_0:emit(AimIKSystem.ON_END_DRAG, arg_8_0, arg_8_1)
	end)
end

function var_0_0.InitHint(arg_9_0)
	arg_9_0.time = var_0_0.TIP_WAIT_TIME
	arg_9_0.timer = Timer.New(function()
		if arg_9_0.time <= 0 then
			arg_9_0.time = var_0_0.TIP_WAIT_TIME

			if isActive(arg_9_0.tipTF) == false then
				setActive(arg_9_0.tipTF, true)
				arg_9_0:FlushHint()
			end
		else
			arg_9_0.time = arg_9_0.time - 0.1
		end
	end, 0.1, -1)
end

function var_0_0.FlushHint(arg_11_0)
	local var_11_0 = {}

	arg_11_0:emit(AimIKSystem.GET_TIP_SHOW_INFO, var_11_0)

	local var_11_1 = var_11_0[1] or {}

	UIItemList.StaticAlign(arg_11_0.tipTF, arg_11_0.tipTF:GetChild(0), #var_11_1, function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 ~= UIItemList.EventUpdate then
			return
		end

		arg_12_1 = arg_12_1 + 1

		setLocalPosition(arg_12_2, LuaHelper.ScreenToLocal(arg_11_0.tipTF, var_11_1[arg_12_1].pos, pg.UIMgr.GetInstance().uiCameraComp))
	end)
end

function var_0_0.Show(arg_13_0, arg_13_1)
	arg_13_0.showing = true

	setActive(arg_13_0.backTF, tobool(arg_13_1))
	setActive(arg_13_0.controlTF, true)
	setActive(arg_13_0.uiTF, tobool(arg_13_1))
	arg_13_0.timer:Start()
end

function var_0_0.Hide(arg_14_0)
	arg_14_0.showing = false

	setActive(arg_14_0.tipTF, false)
	setActive(arg_14_0.controlTF, false)
	setActive(arg_14_0.uiTF, false)
	arg_14_0.timer:Stop()

	arg_14_0.time = var_0_0.TIP_WAIT_TIME
end

function var_0_0.Dispose(arg_15_0)
	arg_15_0:Hide()
	var_0_0.super.Dispose(arg_15_0)
end

return var_0_0
