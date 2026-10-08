local var_0_0 = class("CarWashMainPage", import("view.dorm3d.Game.Dorm3dGameBaseSubView"))

var_0_0.SHOW_BLACK_SCREEN = "CarWashMainPage.SHOW_BLACK_SCREEN"
var_0_0.SHOW_HELP_BOX = "CarWashMainPage.SHOW_HELP_BOX"
var_0_0.SHOW_EXPRESSION_HUD = "CarWashMainPage.SHOW_EXPRESSION_HUD"
var_0_0.ENABLE_BLOCK = "CarWashMainPage.ENABLE_BLOCK"
var_0_0.EXPRESSION_TYPE = {
	LIKE = "LIKE",
	HATE = "HATE"
}

function var_0_0.Init(arg_1_0)
	arg_1_0:InitUI()
	arg_1_0:BindEvent()
end

function var_0_0.InitUI(arg_2_0)
	onButton(arg_2_0, arg_2_0._tf:Find("btn_back"), function()
		arg_2_0:emit(BaseUI.ON_BACK)
	end)
	onButton(arg_2_0, arg_2_0._tf:Find("btn_help"), function()
		arg_2_0:ShowHelpBox()
	end)

	arg_2_0.expressionRoot = arg_2_0._tf:Find("expression_root")
	arg_2_0.expressionLike = arg_2_0.expressionRoot:Find("vfx_car_aixin01")
	arg_2_0.expressionHate = arg_2_0.expressionRoot:Find("vfx_car_xixian01")

	setActive(arg_2_0.expressionLike, false)
	setActive(arg_2_0.expressionHate, false)

	arg_2_0.blockLayer = arg_2_0._tf:Find("block")

	arg_2_0:EnableBlock(false)

	arg_2_0.blackLayer = arg_2_0._tf:Find("BlackScreen")
	arg_2_0.povLayer = arg_2_0._tf:Find("POVControl")

	arg_2_0:UpdatePOV()
end

function var_0_0.BindEvent(arg_5_0)
	arg_5_0:bind(var_0_0.SHOW_BLACK_SCREEN, arg_5_0.ShowBlackScreen)
	arg_5_0:bind(var_0_0.SHOW_HELP_BOX, function(arg_6_0, arg_6_1)
		arg_5_0:ShowHelpBox(arg_6_1)
	end)
	arg_5_0:bind(CarWashLadySystem.UPDATE_EXPRESSION_HUD_POSITION, function(arg_7_0, arg_7_1)
		arg_5_0:UpdateExpressionHUDPosition(arg_7_1)
	end)
	arg_5_0:bind(var_0_0.SHOW_EXPRESSION_HUD, function(arg_8_0, arg_8_1)
		local var_8_0 = switch(arg_8_1, {
			[var_0_0.EXPRESSION_TYPE.LIKE] = function()
				return arg_5_0.expressionLike
			end,
			[var_0_0.EXPRESSION_TYPE.HATE] = function()
				return arg_5_0.expressionHate
			end
		}, function()
			assert(false, "CarWashMainPage: unknown expression type: " .. tostring(arg_8_1))

			return nil
		end)

		setActive(var_8_0, false)
		setActive(var_8_0, true)
	end)
	arg_5_0:bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_BEGIN, function(arg_12_0, arg_12_1)
		if arg_12_1 and arg_12_1.data and arg_12_1.data.hideUI == false then
			return
		end

		arg_5_0:SetTimelineUIVisible(false)
	end)
	arg_5_0:bind(CarWashTimelineSystem.TIMELINE_SEQUENCE_END, function(arg_13_0, arg_13_1)
		if arg_13_1 and arg_13_1.data and arg_13_1.data.hideUI == false then
			return
		end

		arg_5_0:SetTimelineUIVisible(true)
	end)
	arg_5_0:bind(CarWashTimelineSystem.TRANSITION_BEGIN, function()
		arg_5_0:EnableBlock(true)
	end)
	arg_5_0:bind(CarWashTimelineSystem.TRANSITION_END, function()
		arg_5_0:EnableBlock(false)
	end)
end

function var_0_0.SetTimelineUIVisible(arg_16_0, arg_16_1)
	if arg_16_1 then
		for iter_16_0, iter_16_1 in ipairs(arg_16_0.timelineUIGroups or {}) do
			iter_16_1.group.alpha = iter_16_1.alpha
			iter_16_1.group.interactable = iter_16_1.interactable
			iter_16_1.group.blocksRaycasts = iter_16_1.blocksRaycasts
		end

		arg_16_0.timelineUIGroups = nil

		return
	end

	if arg_16_0.timelineUIGroups then
		return
	end

	arg_16_0.timelineUIGroups = {}

	eachChild(arg_16_0._tf, function(arg_17_0)
		if arg_17_0.name == "HolyLightRoot" or arg_17_0.name == "block" then
			return
		end

		local var_17_0 = GetOrAddComponent(arg_17_0, typeof(CanvasGroup))

		table.insert(arg_16_0.timelineUIGroups, {
			group = var_17_0,
			alpha = var_17_0.alpha,
			interactable = var_17_0.interactable,
			blocksRaycasts = var_17_0.blocksRaycasts
		})

		var_17_0.alpha = 0
		var_17_0.interactable = false
		var_17_0.blocksRaycasts = false
	end)
end

function var_0_0.UpdatePOV(arg_18_0)
	local var_18_0 = arg_18_0.povLayer:Find("Move"):GetComponent(typeof(SlideController))

	var_18_0:AddBeginDragFunc(function(arg_19_0, arg_19_1)
		arg_18_0:emit(CarWashPovControlSystem.ON_STICK_MOVE_BEGIN, arg_19_1)
	end)
	var_18_0:SetStickFunc(function(arg_20_0)
		arg_18_0:emit(CarWashPovControlSystem.ON_STICK_MOVE, arg_20_0)
	end)
	var_18_0:AddDragEndFunc(function(arg_21_0, arg_21_1)
		arg_18_0:emit(CarWashPovControlSystem.ON_STICK_MOVE_END, arg_21_1)
	end)
	arg_18_0.povLayer:Find("View"):GetComponent(typeof(SlideController)):SetStickFunc(function(arg_22_0)
		arg_18_0:emit(CarWashPovControlSystem.ON_STICK_VIEW, arg_22_0)
	end)
end

function var_0_0.Flush(arg_23_0)
	return
end

function var_0_0.UpdateExpressionHUDPosition(arg_24_0, arg_24_1)
	if not arg_24_1 then
		return
	end

	setActive(arg_24_0.expressionRoot, arg_24_1.visible)

	if arg_24_1.visible then
		setLocalPosition(arg_24_0.expressionRoot, LuaHelper.ScreenToLocal(arg_24_0.expressionRoot.parent, arg_24_1.screenPosition, pg.UIMgr.GetInstance().uiCameraComp))
	end
end

function var_0_0.ShowHelpBox(arg_25_0, arg_25_1)
	pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_MSGBOX, {
		title = i18n("dorm3d_carwash_title"),
		contentText = i18n("dorm3d_carwash_tiiiiiip"),
		onConfirm = function()
			existCall(arg_25_1)
		end,
		onClose = function()
			existCall(arg_25_1)
		end
	})
end

function var_0_0.EnableBlock(arg_28_0, arg_28_1)
	setActive(arg_28_0.blockLayer, arg_28_1)
end

function var_0_0.ShowBlackScreen(arg_29_0, arg_29_1, arg_29_2)
	local var_29_0 = {
		color = "#000000",
		time = 0.3,
		delay = arg_29_1 and 0 or 0.3
	}

	setImageColor(arg_29_0.blackLayer, Color.NewHex(var_29_0.color))
	setActive(arg_29_0.blackLayer, true)
	setCanvasGroupAlpha(arg_29_0.blackLayer, arg_29_1 and 0 or 1)
	arg_29_0:managedTween(LeanTween.alphaCanvas, function()
		if not arg_29_1 then
			setActive(arg_29_0.blackLayer, false)
		end

		existCall(arg_29_2)
	end, GetComponent(arg_29_0.blackLayer, typeof(CanvasGroup)), arg_29_1 and 1 or 0, var_29_0.time):setDelay(var_29_0.delay)
end

return var_0_0
