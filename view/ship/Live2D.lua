local var_0_0 = class("Live2D")

var_0_0.STATE_LOADING = 0
var_0_0.STATE_INITED = 1
var_0_0.STATE_DISPOSE = 2

local var_0_1
local var_0_2 = 5
local var_0_3 = 3
local var_0_4 = 0.3

var_0_0.DRAG_TIME_ACTION = 1
var_0_0.DRAG_CLICK_ACTION = 2
var_0_0.DRAG_DOWN_ACTION = 3
var_0_0.DRAG_RELATION_XY = 4
var_0_0.DRAG_RELATION_IDLE = 5
var_0_0.DRAG_CLICK_MANY = 6
var_0_0.DRAG_LISTENER_EVENT = 7
var_0_0.DRAG_DOWN_TOUCH = 8
var_0_0.DRAG_CLICK_PARAMETER = 9
var_0_0.DRAG_ANIMATION_PLAY = 10
var_0_0.DRAG_CLICK_RANGE = 11
var_0_0.DRAG_EXTEND_ACTION_RULE = 12
var_0_0.ON_ACTION_PLAY = 1
var_0_0.ON_ACTION_DRAG_CLICK = 2
var_0_0.ON_ACTION_CHANGE_IDLE = 3
var_0_0.ON_ACTION_PARAMETER = 4
var_0_0.ON_ACTION_DOWN = 5
var_0_0.ON_ACTION_XY_TRIGGER = 6
var_0_0.ON_ACTION_DRAG_TRIGGER = 7
var_0_0.NOTICE_ACTION_LIST = {
	var_0_0.ON_ACTION_PLAY,
	var_0_0.ON_ACTION_DRAG_CLICK,
	var_0_0.ON_ACTION_CHANGE_IDLE,
	var_0_0.ON_ACTION_PARAMETER,
	var_0_0.ON_ACTION_DOWN,
	var_0_0.ON_ACTION_XY_TRIGGER,
	var_0_0.ON_ACTION_DRAG_TRIGGER
}

local var_0_5 = {
	[var_0_0.ON_ACTION_PLAY] = "动作播放 1",
	[var_0_0.ON_ACTION_DRAG_CLICK] = "动作点击 2",
	[var_0_0.ON_ACTION_CHANGE_IDLE] = "改变idle 3",
	[var_0_0.ON_ACTION_PARAMETER] = "参数变化 4",
	[var_0_0.ON_ACTION_DOWN] = "按下触发 5",
	[var_0_0.ON_ACTION_XY_TRIGGER] = "xy联动触发 6",
	[var_0_0.ON_ACTION_DRAG_TRIGGER] = "拖拽到达目标值触发 7"
}

var_0_0.EVENT_ACTION_APPLY = "event action apply"
var_0_0.EVENT_ACTION_ABLE = "event action able"
var_0_0.EVENT_ADD_PARAMETER_COM = "event add parameter com "
var_0_0.EVENT_REMOVE_PARAMETER_COM = "event remove parameter com "
var_0_0.EVENT_CHANGE_IDLE_INDEX = "event change idle index"
var_0_0.EVENT_GET_PARAMETER = "event get parameter num"
var_0_0.EVENT_GET_WORLD_POSITION = "event get world position"
var_0_0.EVENT_GET_DRAG_PARAMETER = "event get drag parameter"
var_0_0.relation_type_drag_x = 101
var_0_0.relation_type_drag_y = 102
var_0_0.relation_type_action_index = 103
var_0_0.relation_type_idle = 104

local var_0_6 = {
	CubismParameterBlendMode.Override,
	CubismParameterBlendMode.Additive,
	CubismParameterBlendMode.Multiply
}

function var_0_0.GenerateData(arg_1_0)
	local var_1_0 = {
		SetData = function(arg_2_0, arg_2_1)
			arg_2_0.ship = arg_2_1.ship
			arg_2_0.parent = arg_2_1.parent
			arg_2_0.scale = arg_2_1.scale

			local var_2_0 = arg_2_0:GetShipSkinConfig().live2d_offset

			arg_2_0.gyro = arg_2_0:GetShipSkinConfig().gyro or 0
			arg_2_0.shipL2dId = arg_2_0:GetShipSkinConfig().ship_l2d_id
			arg_2_0.skinId = arg_2_0:GetShipSkinConfig().id
			arg_2_0.spineUseLive2d = false

			if arg_2_0.skinId then
				arg_2_0.spineUseLive2d = pg.ship_skin_template[arg_2_0.skinId].spine_use_live2d == 1
			end

			arg_2_0.position = arg_2_1.position + BuildVector3(var_2_0)
			arg_2_0.l2dDragRate = arg_2_0:GetShipSkinConfig().l2d_drag_rate
			arg_2_0.loadPrefs = arg_2_1.loadPrefs
		end,
		GetShipName = function(arg_3_0)
			return arg_3_0.ship:getPainting()
		end,
		GetShipSkinConfig = function(arg_4_0)
			return arg_4_0.ship:GetSkinConfig()
		end,
		isEmpty = function(arg_5_0)
			return arg_5_0.ship == nil
		end,
		Clear = function(arg_6_0)
			arg_6_0.ship = nil
			arg_6_0.parent = nil
			arg_6_0.scale = nil
			arg_6_0.position = nil
		end
	}

	var_1_0:SetData(arg_1_0)

	return var_1_0
end

local function var_0_7(arg_7_0)
	local var_7_0 = arg_7_0.live2dData:GetShipSkinConfig()
	local var_7_1 = var_7_0.lip_sync_gain
	local var_7_2 = var_7_0.lip_smoothing

	if var_7_1 and var_7_1 ~= 0 then
		arg_7_0._go:GetComponent("CubismCriSrcMouthInput").Gain = var_7_1
	end

	if var_7_2 and var_7_2 ~= 0 then
		arg_7_0._go:GetComponent("CubismCriSrcMouthInput").Smoothing = var_7_2
	end
end

local function var_0_8(arg_8_0)
	local var_8_0 = arg_8_0.live2dData:GetShipSkinConfig().l2d_para_range

	if var_8_0 ~= nil and type(var_8_0) == "table" then
		for iter_8_0, iter_8_1 in pairs(var_8_0) do
			arg_8_0.liveCom:SetParaRange(iter_8_0, iter_8_1)
		end
	end
end

local function var_0_9(arg_9_0)
	return not arg_9_0._readlyToStop
end

local function var_0_10(arg_10_0, arg_10_1)
	if not arg_10_1 or arg_10_1 == "" then
		return false
	end

	if arg_10_1 == "idle" then
		return true
	end

	if arg_10_0.drags then
		for iter_10_0, iter_10_1 in ipairs(arg_10_0.drags) do
			if iter_10_1:getExtendAction() then
				local var_10_0, var_10_1 = iter_10_1:checkActionInExtendFlag(arg_10_1)

				if var_10_0 then
					return false
				elseif var_10_1 then
					return true
				end
			end
		end
	end

	if arg_10_0.enablePlayActions and #arg_10_0.enablePlayActions > 0 and not table.contains(arg_10_0.enablePlayActions, arg_10_1) then
		print(tostring(arg_10_1) .. "不在白名单中,不播放该动作")

		return false
	end

	if arg_10_0.ignorePlayActions and #arg_10_0.ignorePlayActions > 0 and table.contains(arg_10_0.ignorePlayActions, arg_10_1) then
		print(tostring(arg_10_1) .. "在黑名单中，不播放该动作")

		return false
	end

	if not var_0_9(arg_10_0) then
		return false
	end

	return true
end

local function var_0_11(arg_11_0, arg_11_1, arg_11_2)
	if not var_0_10(arg_11_0, arg_11_1) then
		return false
	end

	if arg_11_0.updateAtom then
		arg_11_0:AtomSouceFresh()
	end

	if arg_11_0.animationClipNames then
		local var_11_0 = arg_11_0:checkActionExist(arg_11_1)

		if (not var_11_0 or var_11_0 == false) and string.find(arg_11_1, "main_") then
			arg_11_1 = "main_3"
		end
	end

	if not arg_11_0.isPlaying or arg_11_2 then
		local var_11_1 = var_0_1.action2Id[arg_11_1]

		if var_11_1 then
			arg_11_0.playActionName = arg_11_1

			arg_11_0.liveCom:SetAction(var_11_1)

			if arg_11_1 == "idle" then
				arg_11_0:live2dActionChange(false)
			else
				arg_11_0:live2dActionChange(true)
			end

			return true
		else
			print(tostring(arg_11_1) .. " action is not exist")
		end
	end

	return false
end

local function var_0_12(arg_12_0, arg_12_1)
	arg_12_0.liveCom:SetCenterPart("Drawables/TouchHead", Vector3.zero)

	arg_12_0.liveCom.DampingTime = 0.3
end

local function var_0_13(arg_13_0, arg_13_1, arg_13_2)
	if table.contains(Live2D.NOTICE_ACTION_LIST, arg_13_1) then
		arg_13_0:onListenerHandle(arg_13_1, arg_13_2)
	end
end

local function var_0_14(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_1 == Live2D.EVENT_ACTION_APPLY then
		local var_14_0 = arg_14_2.id
		local var_14_1 = arg_14_2.action
		local var_14_2 = arg_14_2.callback
		local var_14_3 = arg_14_2.finishCall
		local var_14_4 = arg_14_2.activeData
		local var_14_5 = arg_14_2.focus
		local var_14_6 = arg_14_2.react
		local var_14_7 = var_14_4.idle_focus
		local var_14_8 = var_0_9(arg_14_0)
		local var_14_9
		local var_14_10 = false

		if not var_14_1 or var_14_1 == "" then
			var_14_10 = true
		end

		if var_14_8 then
			if var_14_6 ~= nil then
				arg_14_0:setReactPos(tobool(var_14_6))
			end

			if var_14_7 and var_14_7 == 1 and (not var_14_1 or var_14_1 == "") then
				var_14_1 = "idle"

				arg_14_0:changeIdleIndex(var_14_4.idle and var_14_4.idle or 0)
			end

			var_14_9 = var_0_11(arg_14_0, var_14_1, var_14_5 or false)

			if var_14_9 then
				print("id = " .. var_14_0 .. " 触发成功")
				arg_14_0:onListenerHandle(Live2D.ON_ACTION_PLAY, {
					action = var_14_1
				})
				arg_14_0:applyActiveData(arg_14_2)
			elseif var_14_10 then
				print("id = " .. var_14_0 .. " 空触发成功")
				arg_14_0:applyActiveData(arg_14_2)
			end

			if var_14_7 and var_14_7 == 1 then
				arg_14_0:live2dActionChange(false)
			elseif var_14_1 == "idle" then
				arg_14_0:live2dActionChange(false)
			end
		end

		if var_14_2 then
			var_14_2(var_14_9)
		end
	elseif arg_14_1 == Live2D.EVENT_ACTION_ABLE then
		if arg_14_0.ableFlag ~= arg_14_2.ableFlag then
			arg_14_0.ableFlag = arg_14_2.ableFlag

			if arg_14_2.ableFlag then
				arg_14_0.tempEnable = arg_14_0.enablePlayActions

				arg_14_0:setEnableActions({
					"none action apply"
				})
			else
				arg_14_0:setEnableActions(arg_14_0.tempEnable or {})
			end
		end

		if arg_14_2.callback then
			arg_14_2.callback()
		end
	elseif arg_14_1 == Live2D.EVENT_ADD_PARAMETER_COM then
		arg_14_0.liveCom:AddParameterValue(arg_14_2.com, arg_14_2.start, var_0_6[arg_14_2.mode])
	elseif arg_14_1 == Live2D.EVENT_REMOVE_PARAMETER_COM then
		arg_14_0.liveCom:removeParameterValue(arg_14_2.com)
	elseif arg_14_1 == Live2D.EVENT_CHANGE_IDLE_INDEX then
		arg_14_0:applyActiveData(arg_14_2)
	elseif arg_14_1 == Live2D.EVENT_GET_PARAMETER then
		local var_14_11 = 0
		local var_14_12 = arg_14_0.liveCom:GetCubismParameter(arg_14_2.name)

		if var_14_12 then
			var_14_11 = var_14_12.Value
		end

		if arg_14_2.callback then
			arg_14_2.callback(var_14_11)
		end
	elseif arg_14_1 == Live2D.EVENT_GET_WORLD_POSITION then
		local var_14_13 = arg_14_0._tf:TransformPoint(Vector3(arg_14_2.pos[1], arg_14_2.pos[2], arg_14_2.pos[3]))

		if arg_14_2.callback then
			arg_14_2.callback(var_14_13)
		end
	elseif arg_14_1 == Live2D.EVENT_GET_DRAG_PARAMETER then
		local var_14_14 = 0

		for iter_14_0, iter_14_1 in ipairs(arg_14_0.drags) do
			if iter_14_1.parameterName == arg_14_2.name then
				var_14_14 = iter_14_1.parameterValue
			end
		end

		if arg_14_2.callback then
			arg_14_2.callback(var_14_14)
		end
	end
end

local function var_0_15(arg_15_0, arg_15_1)
	if not arg_15_0._l2dCharEnable then
		return
	end

	if arg_15_0._readlyToStop and not arg_15_1 then
		return
	end

	arg_15_0._listenerParametersValue = {}

	if arg_15_0._listenerStepIndex and arg_15_0._listenerStepIndex == 0 then
		arg_15_0._listenerStepIndex = 3

		for iter_15_0, iter_15_1 in ipairs(arg_15_0._listenerParameters) do
			arg_15_0._listenerParametersValue[iter_15_1.name] = iter_15_1.Value
		end
	else
		arg_15_0._listenerStepIndex = arg_15_0._listenerStepIndex - 1
	end

	local var_15_0 = false
	local var_15_1 = arg_15_0.liveCom.reactPos
	local var_15_2 = arg_15_0._animator:GetCurrentAnimatorStateInfo(0)
	local var_15_3 = {
		reactPos = var_15_1,
		normalTime = var_15_2.normalizedTime,
		stateInfo = var_15_2
	}

	for iter_15_2 = 1, #arg_15_0.drags do
		arg_15_0.drags[iter_15_2]:stepParameter(var_15_3)

		local var_15_4 = arg_15_0.drags[iter_15_2]:getParameToTargetFlag()
		local var_15_5 = arg_15_0.drags[iter_15_2]:getActive()

		if (var_15_4 or var_15_5) and arg_15_0.drags[iter_15_2]:getIgnoreReact() then
			var_15_0 = true
		elseif arg_15_0.drags[iter_15_2]:getReactCondition() then
			var_15_0 = true
		end

		local var_15_6 = arg_15_0.drags[iter_15_2]:getParameter()
		local var_15_7 = arg_15_0.drags[iter_15_2]:getParameterUpdateFlag()

		if var_15_6 and var_15_7 then
			local var_15_8 = arg_15_0.drags[iter_15_2]:getParameterCom()

			if var_15_8 then
				arg_15_0.liveCom:ChangeParameterData(var_15_8, var_15_6)
			end
		end

		local var_15_9 = arg_15_0.drags[iter_15_2]:getRelationParameterList()

		for iter_15_3, iter_15_4 in ipairs(var_15_9) do
			if iter_15_4.enable then
				arg_15_0.liveCom:ChangeParameterData(iter_15_4.com, iter_15_4.value)
			end
		end
	end

	if var_15_0 == arg_15_0.ignoreReact or not var_15_0 and (arg_15_0.mouseInputDown or arg_15_0.isPlaying) then
		-- block empty
	else
		arg_15_0:setReactPos(var_15_0)
	end
end

local function var_0_16(arg_16_0)
	arg_16_0.drags = {}
	arg_16_0.dragParts = {}

	for iter_16_0 = 1, #var_0_1.assistantTouchParts do
		table.insert(arg_16_0.dragParts, var_0_1.assistantTouchParts[iter_16_0])
	end

	arg_16_0._l2dCharEnable = true
	arg_16_0._shopPreView = arg_16_0.live2dData.shopPreView
	arg_16_0._listenerParameters = {}
	arg_16_0._listenerStepIndex = 0

	local var_16_0 = "live2D初始化id列表："

	for iter_16_1, iter_16_2 in ipairs(arg_16_0.live2dData.shipL2dId) do
		local var_16_1 = pg.ship_l2d[iter_16_2]

		if var_16_1 and arg_16_0:getDragEnable(var_16_1) then
			var_16_0 = var_16_0 .. var_16_1.id .. ","

			local var_16_2 = Live2dDrag.New(var_16_1, arg_16_0.live2dData)
			local var_16_3 = arg_16_0.liveCom:GetCubismParameter(var_16_1.parameter)

			var_16_2:setParameterCom(var_16_3)
			var_16_2:setEventCallback(function(arg_17_0, arg_17_1)
				var_0_14(arg_16_0, arg_17_0, arg_17_1)
				var_0_13(arg_16_0, arg_17_0, arg_17_1)
			end)
			arg_16_0.liveCom:AddParameterValue(var_16_2.parameterName, var_16_2.startValue, var_0_6[var_16_2.mode])

			if var_16_1.relation_parameter and var_16_1.relation_parameter.list then
				local var_16_4 = var_16_1.relation_parameter.list

				for iter_16_3, iter_16_4 in ipairs(var_16_4) do
					local var_16_5 = arg_16_0.liveCom:GetCubismParameter(iter_16_4.name)

					if var_16_5 then
						var_16_2:addRelationComData(var_16_5, iter_16_4)

						local var_16_6 = iter_16_4.mode or var_16_1.mode

						arg_16_0.liveCom:AddParameterValue(iter_16_4.name, iter_16_4.start or var_16_2.startValue or 0, var_0_6[var_16_6])
					end
				end
			end

			table.insert(arg_16_0.drags, var_16_2)

			if not table.contains(arg_16_0._listenerParameters, var_16_3) then
				table.insert(arg_16_0._listenerParameters, var_16_3)
			end

			if var_16_2.drawAbleName and var_16_2.drawAbleName ~= "" and not table.contains(arg_16_0.dragParts, var_16_2.drawAbleName) then
				table.insert(arg_16_0.dragParts, var_16_2.drawAbleName)
			end
		end
	end

	print(var_16_0)
	arg_16_0.liveCom:SetDragParts(arg_16_0.dragParts)

	arg_16_0.eventTrigger = GetOrAddComponent(arg_16_0.liveCom.transform.parent, typeof(EventTriggerListener))

	arg_16_0.eventTrigger:AddPointDownFunc(function(arg_18_0, arg_18_1)
		if arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointDown(arg_18_1)
		end
	end)
	arg_16_0.eventTrigger:AddPointUpFunc(function(arg_19_0, arg_19_1)
		if arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointUp(arg_19_1)
		end
	end)
	arg_16_0.eventTrigger:AddDragFunc(function(arg_20_0, arg_20_1)
		if arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointDrag(arg_20_1)
		end
	end)
	arg_16_0.liveCom:SetMouseInputActions(System.Action(function()
		if not arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointDown()
		end
	end), System.Action(function()
		if not arg_16_0.useEventTriggerFlag then
			arg_16_0:onPointUp()
		end
	end))

	arg_16_0.paraRanges = arg_16_0.liveCom.paraRanges
	arg_16_0.destinations = ReflectionHelp.RefGetProperty(typeof(Live2dChar), "Destinations", arg_16_0.liveCom):ToTable()
end

function var_0_0.checkActionExist(arg_23_0, arg_23_1)
	return (table.indexof(arg_23_0.animationClipNames, arg_23_1))
end

function var_0_0.onListenerHandle(arg_24_0, arg_24_1, arg_24_2)
	if not arg_24_0.drags or #arg_24_0.drags == 0 then
		return
	end

	if arg_24_1 ~= Live2D.ON_ACTION_PARAMETER then
		-- block empty
	end

	for iter_24_0 = 1, #arg_24_0.drags do
		arg_24_0.drags[iter_24_0]:onListenerEvent(arg_24_1, arg_24_2)
	end
end

function var_0_0.onPointDown(arg_25_0, arg_25_1)
	if not arg_25_0._l2dCharEnable then
		return
	end

	arg_25_0.mouseInputDown = true

	if #arg_25_0.drags > 0 and arg_25_0.liveCom:GetDragPart() > 0 then
		local var_25_0 = arg_25_0.liveCom:GetDragPart()
		local var_25_1 = arg_25_0.dragParts[var_25_0]

		if var_25_0 > 0 and var_25_1 then
			for iter_25_0, iter_25_1 in ipairs(arg_25_0.drags) do
				if iter_25_1.drawAbleName == var_25_1 then
					iter_25_1:startDrag(arg_25_1)
				end
			end
		end
	end
end

function var_0_0.onPointUp(arg_26_0, arg_26_1)
	if not arg_26_0._l2dCharEnable then
		return
	end

	arg_26_0.mouseInputDown = false

	if arg_26_0.drags and #arg_26_0.drags > 0 then
		local var_26_0 = arg_26_0.liveCom:GetDragPart()

		if var_26_0 > 0 then
			local var_26_1 = arg_26_0.dragParts[var_26_0]
		end

		for iter_26_0 = 1, #arg_26_0.drags do
			arg_26_0.drags[iter_26_0]:stopDrag(arg_26_1)
		end
	end
end

function var_0_0.onPointDrag(arg_27_0, arg_27_1)
	if not arg_27_0._l2dCharEnable then
		return
	end

	if arg_27_0.drags and #arg_27_0.drags > 0 then
		for iter_27_0 = 1, #arg_27_0.drags do
			arg_27_0.drags[iter_27_0]:onDrag(arg_27_1)
		end
	end
end

function var_0_0.changeTriggerFlag(arg_28_0, arg_28_1)
	arg_28_0.useEventTriggerFlag = arg_28_1
end

local function var_0_17(arg_29_0, arg_29_1)
	arg_29_0._go = arg_29_1
	arg_29_0._tf = tf(arg_29_1)

	UIUtil.SetLayerRecursively(arg_29_0._go, LayerMask.NameToLayer("UI"))
	arg_29_0._tf:SetParent(arg_29_0.live2dData.parent, true)

	arg_29_0._tf.localScale = arg_29_0.live2dData.scale
	arg_29_0._tf.localPosition = arg_29_0.live2dData.position
	arg_29_0.liveCom = arg_29_1:GetComponent(typeof(Live2dChar))
	arg_29_0._animator = arg_29_1:GetComponent(typeof(Animator))
	arg_29_0.cubismModelCom = arg_29_1:GetComponent("Live2D.Cubism.Core.CubismModel")
	arg_29_0.animationClipNames = {}

	if arg_29_0._animator and arg_29_0._animator.runtimeAnimatorController then
		local var_29_0 = arg_29_0._animator.runtimeAnimatorController.animationClips:ToTable()

		for iter_29_0, iter_29_1 in ipairs(var_29_0) do
			table.insert(arg_29_0.animationClipNames, iter_29_1.name)
		end
	end

	local var_29_1 = var_0_1.action2Id.idle

	arg_29_0.liveCom:SetReactMotions(var_0_1.idleActions)

	function arg_29_0.liveCom.FinishAction(arg_30_0)
		arg_29_0:live2dActionChange(false)

		if arg_29_0.finishActionCB then
			arg_29_0.finishActionCB()

			arg_29_0.finishActionCB = nil
		end

		arg_29_0:changeActionIdle()
	end

	function arg_29_0.liveCom.EventAction(arg_31_0)
		if arg_29_0.animEventCB then
			arg_29_0.animEventCB(arg_31_0)

			arg_29_0.animEventCB = nil
		end
	end

	arg_29_0.liveCom:SetTouchParts(var_0_1.assistantTouchParts)

	if arg_29_0.live2dData and arg_29_0.live2dData.ship and arg_29_0.live2dData.ship.propose then
		arg_29_0:changeParamaterValue("Paramring", 1)
	else
		arg_29_0:changeParamaterValue("Paramring", 0)
	end

	if not arg_29_0._physics then
		arg_29_0._physics = GetComponent(arg_29_0._tf, "CubismPhysicsController")
	end

	if arg_29_0._physics then
		arg_29_0._physics.enabled = false
		arg_29_0._physics.enabled = true
	end

	if arg_29_0.live2dData.l2dDragRate and #arg_29_0.live2dData.l2dDragRate > 0 then
		arg_29_0.liveCom.DragRateX = arg_29_0.live2dData.l2dDragRate[1] * var_0_2
		arg_29_0.liveCom.DragRateY = arg_29_0.live2dData.l2dDragRate[2] * var_0_3
		arg_29_0.liveCom.DampingTime = arg_29_0.live2dData.l2dDragRate[3] * var_0_4
	end

	var_0_7(arg_29_0)
	var_0_8(arg_29_0)
	var_0_12(arg_29_0)
	arg_29_0:setEnableActions({})
	arg_29_0:setIgnoreActions({})
	arg_29_0:changeIdleIndex(0)

	if arg_29_0.live2dData.shipL2dId and #arg_29_0.live2dData.shipL2dId > 0 then
		var_0_16(arg_29_0)
		arg_29_0:loadLive2dData()

		arg_29_0.timer = Timer.New(function()
			var_0_15(arg_29_0)
		end, 0.03333333333333333, -1)

		arg_29_0.timer:Start()
		var_0_15(arg_29_0)
	end

	arg_29_0:addKeyBoard()

	arg_29_0.state = var_0_0.STATE_INITED

	if arg_29_0.delayChangeParamater and #arg_29_0.delayChangeParamater > 0 then
		for iter_29_2 = 1, #arg_29_0.delayChangeParamater do
			local var_29_2 = arg_29_0.delayChangeParamater[iter_29_2]

			arg_29_0:changeParamaterValue(var_29_2[1], var_29_2[2])
		end

		arg_29_0.delayChangeParamater = nil
	end

	var_0_11(arg_29_0, "idle", true)
	arg_29_0:offsetL2dPositonDelay(0.3, 5)
end

function var_0_0.Ctor(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0.state = var_0_0.STATE_LOADING
	arg_33_0.live2dData = arg_33_1
	var_0_1 = pg.AssistantInfo

	assert(not arg_33_0.live2dData:isEmpty())

	local var_33_0 = arg_33_0.live2dData:GetShipName()

	local function var_33_1(arg_34_0)
		var_0_17(arg_33_0, arg_34_0)

		if arg_33_2 then
			arg_33_2(arg_33_0)
		end
	end

	arg_33_0.live2dRequestId = pg.Live2DMgr.GetInstance():GetLive2DModelAsync(var_33_0, var_33_1)
	Input.gyro.enabled = arg_33_0.live2dData.gyro == 1 and PlayerPrefs.GetInt(GYRO_ENABLE, 1) == 1
	arg_33_0.useEventTriggerFlag = true
end

function var_0_0.setStopCallback(arg_35_0, arg_35_1)
	arg_35_0._stopCallback = arg_35_1
end

function var_0_0.SetVisible(arg_36_0, arg_36_1)
	if not arg_36_0:IsLoaded() then
		return
	end

	Input.gyro.enabled = PlayerPrefs.GetInt(GYRO_ENABLE, 1) == 1

	arg_36_0:setReactPos(true)
	arg_36_0:Reset()

	if arg_36_1 then
		arg_36_0._readlyToStop = false

		if arg_36_0._physics then
			arg_36_0._physics.enabled = false
			arg_36_0._physics.enabled = true
		end

		arg_36_0:setReactPos(false)
		arg_36_0:loadLive2dData()

		arg_36_0._animator.speed = 1

		var_0_15(arg_36_0, true)
	else
		arg_36_0:saveLive2dData()

		if arg_36_0._stopCallback then
			arg_36_0._stopCallback()
		end

		arg_36_0._readlyToStop = true

		var_0_11(arg_36_0, "idle", true)
		arg_36_0:offsetL2dPositonDelay(0.3, 5, function()
			if arg_36_0._readlyToStop then
				arg_36_0._animator.speed = 0
			end
		end)
	end
end

function var_0_0.loadLive2dData(arg_38_0)
	if not arg_38_0.live2dData.loadPrefs then
		return
	end

	if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and not arg_38_0.live2dData.spineUseLive2d then
		if arg_38_0.drags then
			for iter_38_0 = 1, #arg_38_0.drags do
				arg_38_0.drags[iter_38_0]:clearData()
				arg_38_0.drags[iter_38_0]:loadL2dFinal()
			end
		end

		arg_38_0:changeIdleIndex(0)

		arg_38_0.saveActionAbleId = nil
	else
		local var_38_0, var_38_1 = Live2dConst.GetL2dSaveData(arg_38_0.live2dData:GetShipSkinConfig().id, arg_38_0.live2dData.ship.id)
		local var_38_2 = Live2dConst.GetDragActionIndex(var_38_1, arg_38_0.live2dData:GetShipSkinConfig().id, arg_38_0.live2dData.ship.id) or 1

		if var_38_0 then
			arg_38_0:changeIdleIndex(var_38_0)
		end

		arg_38_0.saveActionAbleId = var_38_1

		if var_38_1 and var_38_1 > 0 then
			if pg.ship_l2d[var_38_1] then
				local var_38_3 = pg.ship_l2d[var_38_1].action_trigger_active

				if var_38_0 and var_38_3.idle_enable and #var_38_3.idle_enable > 0 then
					for iter_38_1, iter_38_2 in ipairs(var_38_3.idle_enable) do
						if iter_38_2[1] == var_38_0 then
							arg_38_0:setEnableActions(iter_38_2[2])
						end
					end
				elseif var_38_2 and var_38_2 >= 1 and var_38_3.active_list then
					arg_38_0:setEnableActions(var_38_3.active_list[var_38_2].enable and var_38_3.active_list[var_38_2].enable or {})
				else
					arg_38_0:setEnableActions(var_38_3.enable and var_38_3.enable or {})
				end

				if var_38_0 and var_38_3.idle_ignore and #var_38_3.idle_ignore > 0 then
					for iter_38_3, iter_38_4 in ipairs(var_38_3.idle_ignore) do
						if iter_38_4[1] == var_38_0 then
							arg_38_0:setIgnoreActions(iter_38_4[2])
						end
					end
				elseif var_38_2 and var_38_2 >= 1 and var_38_3.active_list then
					arg_38_0:setIgnoreActions(var_38_3.active_list[var_38_2].ignore and var_38_3.active_list[var_38_2].ignore or {})
				else
					arg_38_0:setIgnoreActions(var_38_3.ignore and var_38_3.ignore or {})
				end
			end
		else
			arg_38_0:setEnableActions({})
			arg_38_0:setIgnoreActions({})
		end

		if arg_38_0.drags then
			for iter_38_5 = 1, #arg_38_0.drags do
				arg_38_0.drags[iter_38_5]:loadData()
				arg_38_0.drags[iter_38_5]:loadL2dFinal()
			end
		end
	end
end

function var_0_0.saveLive2dData(arg_39_0)
	if not arg_39_0.live2dData.loadPrefs then
		return
	end

	if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and not arg_39_0.live2dData.spineUseLive2d then
		return
	end

	if arg_39_0.idleIndex then
		Live2dConst.SaveL2dIdle(arg_39_0.live2dData:GetShipSkinConfig().id, arg_39_0.live2dData.ship.id, arg_39_0.idleIndex)
	end

	if arg_39_0.saveActionAbleId then
		if arg_39_0.idleIndex == 0 then
			Live2dConst.SaveL2dAction(arg_39_0.live2dData:GetShipSkinConfig().id, arg_39_0.live2dData.ship.id, 0)
		else
			Live2dConst.SaveL2dAction(arg_39_0.live2dData:GetShipSkinConfig().id, arg_39_0.live2dData.ship.id, arg_39_0.saveActionAbleId)
		end
	end

	if arg_39_0.drags then
		for iter_39_0 = 1, #arg_39_0.drags do
			arg_39_0.drags[iter_39_0]:saveData()
		end
	end
end

function var_0_0.changeActionIdle(arg_40_0)
	local var_40_0 = var_0_1.idleActions[math.ceil(math.random(#var_0_1.idleActions))]

	var_0_11(arg_40_0, "idle", true)
end

function var_0_0.enablePlayAction(arg_41_0, arg_41_1)
	return var_0_10(arg_41_0, arg_41_1)
end

function var_0_0.IgonreReactPos(arg_42_0, arg_42_1)
	arg_42_0:setReactPos(arg_42_1)
end

function var_0_0.setReactPos(arg_43_0, arg_43_1)
	if arg_43_0.liveCom then
		arg_43_0.ignoreReact = arg_43_1

		arg_43_0.liveCom:IgonreReactPos(arg_43_1)

		if arg_43_1 then
			arg_43_0.liveCom.inDrag = false
		end

		arg_43_0.liveCom.reactPos = Vector3(0, 0, 0)

		arg_43_0:updateDragsSateData()
	end
end

function var_0_0.l2dCharEnable(arg_44_0, arg_44_1)
	arg_44_0._l2dCharEnable = arg_44_1
end

function var_0_0.inShopPreView(arg_45_0, arg_45_1)
	arg_45_0._shopPreView = arg_45_1
end

function var_0_0.getDragEnable(arg_46_0, arg_46_1)
	if arg_46_0._shopPreView and arg_46_1.shop_action == 0 then
		return false
	end

	return true
end

function var_0_0.updateShip(arg_47_0, arg_47_1)
	if arg_47_1 and arg_47_0.live2dData and arg_47_0.live2dData.ship then
		arg_47_0.live2dData.ship = arg_47_1

		if arg_47_0.live2dData and arg_47_0.live2dData.ship and arg_47_0.live2dData.ship.propose then
			arg_47_0:changeParamaterValue("Paramring", 1)
		else
			arg_47_0:changeParamaterValue("Paramring", 0)
		end
	end
end

function var_0_0.IsLoaded(arg_48_0)
	return arg_48_0.state == var_0_0.STATE_INITED
end

function var_0_0.GetTouchPart(arg_49_0)
	return arg_49_0.liveCom:GetTouchPart()
end

function var_0_0.TriggerAction(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
	arg_50_0:CheckStopDrag()

	local var_50_0 = var_0_11(arg_50_0, arg_50_1, arg_50_3)

	if var_50_0 then
		arg_50_0.finishActionCB = arg_50_2
		arg_50_0.animEventCB = arg_50_4
	end

	return var_50_0
end

function var_0_0.Reset(arg_51_0)
	arg_51_0:live2dActionChange(false)
	arg_51_0:setEnableActions({})
	arg_51_0:setIgnoreActions({})

	arg_51_0.ableFlag = nil
end

function var_0_0.offsetL2dPositonDelay(arg_52_0, arg_52_1, arg_52_2, arg_52_3)
	if arg_52_0._tf and LeanTween.isTweening(go(arg_52_0._tf)) then
		return
	end

	arg_52_0._l2dPosition = arg_52_0._tf.position
	arg_52_0._tf.position = Vector3(arg_52_0._l2dPosition.x + 100, 0, 0)
	arg_52_0._animator.speed = arg_52_2

	LeanTween.delayedCall(go(arg_52_0._tf), arg_52_1, System.Action(function()
		if arg_52_0._tf then
			arg_52_0._tf.position = arg_52_0._l2dPosition
			arg_52_0._animator.speed = 1
		end

		if arg_52_3 then
			arg_52_3()
		end
	end))
end

function var_0_0.resetL2dData(arg_54_0)
	if not arg_54_0._tf then
		return
	end

	if LeanTween.isTweening(go(arg_54_0._tf)) then
		return
	end

	arg_54_0:offsetL2dPositonDelay(0.3, 5)
	Live2dConst.ClearLive2dSave(arg_54_0.live2dData.ship:getSkinId(), arg_54_0.live2dData.ship.id)
	arg_54_0:Reset()
	arg_54_0:changeIdleIndex(0)
	arg_54_0:loadLive2dData()
	var_0_11(arg_54_0, "idle", true)
end

function var_0_0.applyActiveData(arg_55_0, arg_55_1)
	if not arg_55_1 then
		return
	end

	local var_55_0 = arg_55_1.activeData
	local var_55_1 = var_55_0.enable
	local var_55_2 = var_55_0.idle_enable
	local var_55_3 = var_55_0.idle_ignore
	local var_55_4 = var_55_0.ignore
	local var_55_5 = var_55_0.idle and var_55_0.idle or arg_55_1.idle
	local var_55_6 = var_55_0.repeatFlag

	if var_55_1 and #var_55_1 >= 0 then
		arg_55_0:setEnableActions(var_55_1)
	elseif var_55_2 and #var_55_2 > 0 then
		for iter_55_0, iter_55_1 in ipairs(var_55_2) do
			if iter_55_1[1] == var_55_5 then
				arg_55_0:setEnableActions(iter_55_1[2])
			end
		end
	end

	if var_55_4 and #var_55_4 >= 0 then
		arg_55_0:setIgnoreActions(var_55_4)
	elseif var_55_3 and #var_55_3 > 0 then
		for iter_55_2, iter_55_3 in ipairs(var_55_3) do
			if iter_55_3[1] == var_55_5 then
				arg_55_0:setIgnoreActions(iter_55_3[2])
			end
		end
	end

	if var_55_5 and var_55_5 ~= arg_55_0.indexIndex then
		arg_55_0.saveActionAbleId = arg_55_1.id
	end

	if var_55_5 then
		local var_55_7

		if type(var_55_5) == "number" and var_55_5 >= 0 then
			var_55_7 = var_55_5
		elseif type(var_55_5) == "table" then
			local var_55_8 = {}

			for iter_55_4, iter_55_5 in ipairs(var_55_5) do
				if iter_55_5 == arg_55_0.idleIndex then
					if var_55_6 then
						table.insert(var_55_8, iter_55_5)
					end
				else
					table.insert(var_55_8, iter_55_5)
				end
			end

			var_55_7 = var_55_8[math.random(1, #var_55_8)]
		end

		if var_55_7 then
			arg_55_0:changeIdleIndex(var_55_7)
		end

		arg_55_0:saveLive2dData()
	end
end

function var_0_0.setIgnoreActions(arg_56_0, arg_56_1)
	arg_56_0.ignorePlayActions = arg_56_1 and arg_56_1 or {}
end

function var_0_0.setEnableActions(arg_57_0, arg_57_1)
	arg_57_0.enablePlayActions = arg_57_1 and arg_57_1 or {}
end

function var_0_0.changeIdleIndex(arg_58_0, arg_58_1)
	local var_58_0 = false

	if arg_58_0.idleIndex ~= arg_58_1 then
		local var_58_1 = arg_58_0._animator:GetInteger("idle")

		if var_58_1 and var_58_1 >= 0 then
			arg_58_0._animator:SetInteger("idle", arg_58_1)

			var_58_0 = true
		end
	end

	arg_58_0:onListenerHandle(Live2D.ON_ACTION_CHANGE_IDLE, {
		idle = arg_58_0.idleIndex,
		idle_change = var_58_0
	})
	print("live2d 待机动作设置为 = " .. arg_58_1)

	arg_58_0.idleIndex = arg_58_1

	arg_58_0:updateDragsSateData()
end

function var_0_0.live2dActionChange(arg_59_0, arg_59_1)
	arg_59_0.isPlaying = arg_59_1

	arg_59_0:updateDragsSateData()
end

function var_0_0.setPosition(arg_60_0, arg_60_1)
	arg_60_0._tf.localPosition = arg_60_1
end

function var_0_0.updateDragsSateData(arg_61_0)
	local var_61_0 = {
		idleIndex = arg_61_0.idleIndex,
		isPlaying = arg_61_0.isPlaying,
		ignoreReact = arg_61_0.ignoreReact,
		actionName = arg_61_0.playActionName
	}

	if arg_61_0.drags then
		for iter_61_0 = 1, #arg_61_0.drags do
			arg_61_0.drags[iter_61_0]:updateStateData(var_61_0)
		end
	end
end

function var_0_0.CheckStopDrag(arg_62_0)
	local var_62_0 = arg_62_0.live2dData:GetShipSkinConfig()

	if var_62_0.l2d_ignore_drag and var_62_0.l2d_ignore_drag == 1 then
		arg_62_0.liveCom.ResponseClick = false
		arg_62_0.liveCom.inDrag = false
	end
end

function var_0_0.changeParamaterValue(arg_63_0, arg_63_1, arg_63_2)
	if arg_63_0:IsLoaded() then
		if not arg_63_1 or string.len(arg_63_1) == 0 then
			return
		end

		local var_63_0 = arg_63_0.liveCom:GetCubismParameter(arg_63_1)

		if not var_63_0 then
			return
		end

		arg_63_0.liveCom:AddParameterValue(var_63_0, arg_63_2, var_0_6[1])
	else
		if not arg_63_0.delayChangeParamater then
			arg_63_0.delayChangeParamater = {}
		end

		table.insert(arg_63_0.delayChangeParamater, {
			arg_63_1,
			arg_63_2
		})
	end
end

function var_0_0.changeDragParameter(arg_64_0, arg_64_1, arg_64_2)
	if arg_64_0:IsLoaded() and arg_64_0.drags then
		for iter_64_0 = 1, #arg_64_0.drags do
			if arg_64_0.drags[iter_64_0].parameterName and arg_64_0.drags[iter_64_0].parameterName == arg_64_1 then
				arg_64_0.drags[iter_64_0]:setTargetValue(arg_64_2)
			end
		end
	end
end

function var_0_0.setSortingLayer(arg_65_0, arg_65_1)
	arg_65_0:updateL2dSortMode()

	local var_65_0 = arg_65_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_65_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_65_1, "SortingOrder", var_65_0, arg_65_1)
end

function var_0_0.updateL2dSortMode(arg_66_0)
	local var_66_0 = arg_66_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_66_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_66_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder", nil)

	ReflectionHelp.RefSetProperty(var_66_1, "SortingMode", var_66_0, var_66_2)
end

function var_0_0.Dispose(arg_67_0)
	if arg_67_0.state == var_0_0.STATE_INITED then
		arg_67_0.liveCom.FinishAction = nil
		arg_67_0.liveCom.EventAction = nil

		arg_67_0.liveCom:SetMouseInputActions(nil, nil)
	end

	if arg_67_0._tf and LeanTween.isTweening(go(arg_67_0._tf)) then
		LeanTween.cancel(go(arg_67_0._tf))
	end

	arg_67_0:saveLive2dData()

	arg_67_0._readlyToStop = false

	if arg_67_0.live2dRequestId then
		pg.Live2DMgr.GetInstance():StopLoadingLive2d(arg_67_0.live2dRequestId)

		arg_67_0.live2dRequestId = nil
	end

	if arg_67_0.drags then
		for iter_67_0 = 1, #arg_67_0.drags do
			arg_67_0.drags[iter_67_0]:dispose()
		end

		arg_67_0.drags = {}
	end

	if arg_67_0.live2dData and arg_67_0.live2dData.gyro == 1 then
		Input.gyro.enabled = false
	end

	if arg_67_0.live2dData then
		arg_67_0.live2dData:Clear()

		arg_67_0.live2dData = nil
	end

	if arg_67_0.timer then
		arg_67_0.timer:Stop()

		arg_67_0.timer = nil
	end

	if arg_67_0._go and arg_67_0.state == var_0_0.STATE_INITED then
		Destroy(arg_67_0._go)
	end

	arg_67_0.state = var_0_0.STATE_DISPOSE
end

function var_0_0.UpdateAtomSource(arg_68_0)
	arg_68_0.updateAtom = true
end

function var_0_0.AtomSouceFresh(arg_69_0)
	local var_69_0 = pg.CriMgr.GetInstance():getAtomSource(pg.CriMgr.C_VOICE)
	local var_69_1 = arg_69_0._go:GetComponent("CubismCriSrcMouthInput").Analyzer

	var_69_0:AttachToAnalyzer(var_69_1)

	if arg_69_0.updateAtom then
		arg_69_0.updateAtom = false
	end
end

function var_0_0.addKeyBoard(arg_70_0)
	return
end

function var_0_0.SetL2dSortingLayer(arg_71_0, arg_71_1)
	var_0_0.UpdateL2dSortMode(arg_71_0)

	local var_71_0 = arg_71_0:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_71_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_71_1, "SortingOrder", var_71_0, arg_71_1)
end

function var_0_0.UpdateL2dSortMode(arg_72_0)
	local var_72_0 = arg_72_0:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_72_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_72_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder", nil)

	ReflectionHelp.RefSetProperty(var_72_1, "SortingMode", var_72_0, var_72_2)
end

return var_0_0
