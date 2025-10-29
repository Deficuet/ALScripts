local var_0_0 = class("Live2D")

var_0_0.STATE_LOADING = 0
var_0_0.STATE_INITED = 1
var_0_0.STATE_DISPOSE = 2

local var_0_1 = {
	"button",
	"vocal",
	"interaction"
}
local var_0_2 = {
	"button",
	"interaction"
}
local var_0_3 = {
	button = {
		sheet_name = "se-SkinButton"
	},
	vocal = {
		sheet_name = "",
		cv_voice = true
	},
	interaction = {
		sheet_name = "se-SkinInteractive"
	}
}

var_0_0.COMMON_XIAQI_RESULT = "xiaqi_result"

local var_0_4
local var_0_5 = 5
local var_0_6 = 3
local var_0_7 = 0.3

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
var_0_0.DRAG_WITH_PARAMETER_MOVE = 13
var_0_0.DRAG_MOVE_DOWN_UP = 14
var_0_0.DRAG_GAME_XIAQI = 15
var_0_0.DRAG_GAME_XIAQI_RESULT = 16
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

local var_0_8 = {
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
var_0_0.EVENT_GAME_XIAQI = "event game xiaqi"
var_0_0.relation_type_drag_x = 101
var_0_0.relation_type_drag_y = 102
var_0_0.relation_type_action_index = 103
var_0_0.relation_type_idle = 104

local var_0_9 = {
	CubismParameterBlendMode.Override,
	CubismParameterBlendMode.Additive,
	CubismParameterBlendMode.Multiply
}

function var_0_0.GenerateData(arg_1_0)
	local var_1_0 = {
		SetData = function(arg_2_0, arg_2_1)
			arg_2_0.ship = arg_2_1.ship
			arg_2_0.parent = arg_2_1.parent

			local var_2_0 = arg_2_1.offset
			local var_2_1 = arg_2_0:GetShipSkinConfig().live2d_offset
			local var_2_2

			if var_2_0 and #var_2_0 >= 4 then
				var_2_2 = Vector3(var_2_0[4], var_2_0[4], var_2_0[4])
			elseif var_2_1 and #var_2_1 >= 4 then
				var_2_2 = Vector3(var_2_1[4], var_2_1[4], var_2_1[4])
			else
				var_2_2 = Vector3(52, 52, 52)
			end

			local var_2_3

			if var_2_0 and #var_2_0 >= 3 then
				if var_2_0[1] and var_2_0[2] and var_2_0[3] then
					var_2_3 = {
						var_2_0[1],
						var_2_0[2],
						var_2_0[3]
					}
				else
					var_2_3 = arg_2_0:GetShipSkinConfig().live2d_offset
				end
			else
				var_2_3 = arg_2_0:GetShipSkinConfig().live2d_offset
			end

			local var_2_4

			if arg_2_1.position then
				var_2_4 = arg_2_1.position
			else
				var_2_4 = Vector3(0, 0, 0)
			end

			arg_2_0.scale = var_2_2
			arg_2_0.gyro = arg_2_0:GetShipSkinConfig().gyro or 0
			arg_2_0.shipL2dId = arg_2_0:GetShipSkinConfig().ship_l2d_id
			arg_2_0.skinId = arg_2_0:GetShipSkinConfig().id
			arg_2_0.spineUseLive2d = false

			if arg_2_0.skinId then
				arg_2_0.spineUseLive2d = pg.ship_skin_template[arg_2_0.skinId].spine_use_live2d == 1
			end

			arg_2_0.position = var_2_4 + BuildVector3(var_2_3)
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

local function var_0_10(arg_7_0)
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

local function var_0_11(arg_8_0)
	local var_8_0 = arg_8_0.live2dData:GetShipSkinConfig().l2d_para_range

	if var_8_0 ~= nil and type(var_8_0) == "table" then
		for iter_8_0, iter_8_1 in pairs(var_8_0) do
			arg_8_0.liveCom:SetParaRange(iter_8_0, iter_8_1)
		end
	end
end

local function var_0_12(arg_9_0)
	return not arg_9_0._readlyToStop
end

local function var_0_13(arg_10_0, arg_10_1)
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

	if not var_0_12(arg_10_0) then
		return false
	end

	return true
end

local function var_0_14(arg_11_0, arg_11_1, arg_11_2)
	if not var_0_13(arg_11_0, arg_11_1) then
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
		local var_11_1 = var_0_4.action2Id[arg_11_1]

		if var_11_1 then
			arg_11_0.playActionName = arg_11_1

			arg_11_0.liveCom:SetAction(var_11_1)

			if arg_11_1 == "idle" then
				arg_11_0:live2dActionChange(false)
			else
				if arg_11_0._animator.speed ~= 1 then
					arg_11_0:resumeSpeed()
				end

				arg_11_0:live2dActionChange(true)
			end

			return true
		else
			print(tostring(arg_11_1) .. " action is not exist")
		end
	end

	return false
end

local function var_0_15(arg_12_0, arg_12_1)
	arg_12_0.liveCom:SetCenterPart("Drawables/TouchHead", Vector3.zero)

	arg_12_0.liveCom.DampingTime = 0.3
end

local function var_0_16(arg_13_0, arg_13_1, arg_13_2)
	if table.contains(Live2D.NOTICE_ACTION_LIST, arg_13_1) then
		arg_13_0:onListenerHandle(arg_13_1, arg_13_2)
	end
end

local function var_0_17(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_1 == Live2D.EVENT_ACTION_APPLY then
		local var_14_0 = arg_14_2.id
		local var_14_1 = arg_14_2.action
		local var_14_2 = arg_14_2.callback
		local var_14_3 = arg_14_2.finishCall
		local var_14_4 = arg_14_2.activeData
		local var_14_5 = arg_14_2.focus
		local var_14_6 = arg_14_2.react
		local var_14_7 = var_14_4.idle_focus
		local var_14_8 = var_0_12(arg_14_0)
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

			var_14_9 = var_0_14(arg_14_0, var_14_1, var_14_5 or false)

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
		arg_14_0.liveCom:AddParameterValue(arg_14_2.com, arg_14_2.start, var_0_9[arg_14_2.mode])
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
	elseif arg_14_1 == Live2D.EVENT_GAME_XIAQI then
		if arg_14_0.xiaqiLimitTime and Time.realtimeSinceStartup - arg_14_0.xiaqiLimitTime <= 1 then
			return
		end

		arg_14_0.xiaqiLimitTime = Time.realtimeSinceStartup

		if Live2DExtend.CheckXiaQiFirst(arg_14_0) and arg_14_2.parameter_value == 0 and arg_14_2.callback then
			arg_14_2.callback({
				target = 1
			})
		end

		local var_14_15, var_14_16 = Live2DExtend.CheckXiaQiFinish(arg_14_0)

		if var_14_15 then
			onDelayTick(function()
				arg_14_0:setDragCommonData(var_0_0.COMMON_XIAQI_RESULT, var_14_16)
			end, 0.5)

			return
		end

		if Live2DExtend.CheckXiaQiLast(arg_14_0) then
			local var_14_17 = Live2DExtend.GetXiaQiLastDrag(arg_14_0)

			if var_14_17 then
				var_14_17:setTargetValueDelay(-1, 0.2)
			end
		end

		local var_14_18, var_14_19 = Live2DExtend.CheckXiaQiFinish(arg_14_0)

		if var_14_18 then
			onDelayTick(function()
				arg_14_0:setDragCommonData(var_0_0.COMMON_XIAQI_RESULT, var_14_19)
			end, 0.5)

			return
		end
	end
end

function var_0_0.setDragCommonData(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0.dragCommonData[arg_17_1] = arg_17_2
end

function var_0_0.getDragCommonData(arg_18_0, arg_18_1)
	return
end

local function var_0_18(arg_19_0, arg_19_1)
	if not arg_19_0._l2dCharEnable then
		return
	end

	if arg_19_0._readlyToStop and not arg_19_1 then
		return
	end

	arg_19_0._listenerParametersValue = {}

	if arg_19_0._listenerStepIndex and arg_19_0._listenerStepIndex == 0 then
		arg_19_0._listenerStepIndex = 3

		for iter_19_0, iter_19_1 in ipairs(arg_19_0._listenerParameters) do
			arg_19_0._listenerParametersValue[iter_19_1.name] = iter_19_1.Value
		end
	else
		arg_19_0._listenerStepIndex = arg_19_0._listenerStepIndex - 1
	end

	local var_19_0 = false
	local var_19_1 = arg_19_0.liveCom.reactPos
	local var_19_2 = arg_19_0._animator:GetCurrentAnimatorStateInfo(0)
	local var_19_3 = {
		reactPos = var_19_1,
		normalTime = var_19_2.normalizedTime,
		stateInfo = var_19_2
	}

	for iter_19_2 = 1, #arg_19_0.drags do
		arg_19_0.drags[iter_19_2]:stepParameter(var_19_3)

		local var_19_4 = arg_19_0.drags[iter_19_2]:getParameToTargetFlag()
		local var_19_5 = arg_19_0.drags[iter_19_2]:getActive()

		if (var_19_4 or var_19_5) and arg_19_0.drags[iter_19_2]:getIgnoreReact() then
			var_19_0 = true
		elseif arg_19_0.drags[iter_19_2]:getReactCondition() then
			var_19_0 = true
		end

		local var_19_6 = arg_19_0.drags[iter_19_2]:getParameter()
		local var_19_7 = arg_19_0.drags[iter_19_2]:getParameterUpdateFlag()

		if var_19_6 and var_19_7 then
			local var_19_8 = arg_19_0.drags[iter_19_2]:getParameterCom()

			if var_19_8 then
				arg_19_0.liveCom:ChangeParameterData(var_19_8, var_19_6)
			end
		end

		local var_19_9 = arg_19_0.drags[iter_19_2]:getRelationParameterList()

		for iter_19_3, iter_19_4 in ipairs(var_19_9) do
			if iter_19_4.enable then
				arg_19_0.liveCom:ChangeParameterData(iter_19_4.com, iter_19_4.value)
			end
		end
	end

	if var_19_0 == arg_19_0.ignoreReact or not var_19_0 and (arg_19_0.mouseInputDown or arg_19_0.isPlaying) then
		-- block empty
	else
		arg_19_0:setReactPos(var_19_0)
	end

	if arg_19_0.foldAble and arg_19_0.foldAble > 0 then
		arg_19_0.foldAble = arg_19_0.foldAble - Time.deltaTime

		if arg_19_0.foldAble <= 0 then
			arg_19_0.foldAble = nil

			pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, false)
		end
	end
end

local function var_0_19(arg_20_0)
	arg_20_0.drags = {}
	arg_20_0.dragParts = {}
	arg_20_0.dragCommonData = {}

	for iter_20_0 = 1, #var_0_4.assistantTouchParts do
		table.insert(arg_20_0.dragParts, var_0_4.assistantTouchParts[iter_20_0])
	end

	arg_20_0._l2dCharEnable = true
	arg_20_0._shopPreView = arg_20_0.live2dData.shopPreView
	arg_20_0._listenerParameters = {}
	arg_20_0._listenerStepIndex = 0

	local var_20_0 = "live2D初始化id列表："

	for iter_20_1, iter_20_2 in ipairs(arg_20_0.live2dData.shipL2dId) do
		local var_20_1 = pg.ship_l2d[iter_20_2]

		if var_20_1 and arg_20_0:getDragEnable(var_20_1) then
			var_20_0 = var_20_0 .. var_20_1.id .. ","

			local var_20_2 = Live2dDrag.New(var_20_1, arg_20_0.live2dData, arg_20_0.dragCommonData)
			local var_20_3 = arg_20_0.liveCom:GetCubismParameter(var_20_1.parameter)

			var_20_2:setParameterCom(var_20_3)
			var_20_2:setEventCallback(function(arg_21_0, arg_21_1)
				var_0_17(arg_20_0, arg_21_0, arg_21_1)
				var_0_16(arg_20_0, arg_21_0, arg_21_1)
			end)
			arg_20_0.liveCom:AddParameterValue(var_20_2.parameterName, var_20_2.startValue, var_0_9[var_20_2.mode])

			if var_20_1.relation_parameter and var_20_1.relation_parameter.list then
				local var_20_4 = var_20_1.relation_parameter.list

				for iter_20_3, iter_20_4 in ipairs(var_20_4) do
					local var_20_5 = arg_20_0.liveCom:GetCubismParameter(iter_20_4.name)

					if var_20_5 then
						var_20_2:addRelationComData(var_20_5, iter_20_4)

						local var_20_6 = iter_20_4.mode or var_20_1.mode

						arg_20_0.liveCom:AddParameterValue(iter_20_4.name, iter_20_4.start or var_20_2.startValue or 0, var_0_9[var_20_6])
					end
				end
			end

			table.insert(arg_20_0.drags, var_20_2)

			if not table.contains(arg_20_0._listenerParameters, var_20_3) then
				table.insert(arg_20_0._listenerParameters, var_20_3)
			end

			if var_20_2.drawAbleName and var_20_2.drawAbleName ~= "" and not table.contains(arg_20_0.dragParts, var_20_2.drawAbleName) then
				table.insert(arg_20_0.dragParts, var_20_2.drawAbleName)
			end
		end
	end

	print(var_20_0)
	arg_20_0.liveCom:SetDragParts(arg_20_0.dragParts)

	arg_20_0.eventTrigger = GetOrAddComponent(arg_20_0.liveCom.transform.parent, typeof(EventTriggerListener))

	arg_20_0.eventTrigger:AddPointDownFunc(function(arg_22_0, arg_22_1)
		if arg_20_0.useEventTriggerFlag then
			arg_20_0:onPointDown(arg_22_1)
		end
	end)
	arg_20_0.eventTrigger:AddPointUpFunc(function(arg_23_0, arg_23_1)
		if arg_20_0.useEventTriggerFlag then
			arg_20_0:onPointUp(arg_23_1)
		end
	end)
	arg_20_0.eventTrigger:AddDragFunc(function(arg_24_0, arg_24_1)
		if arg_20_0.useEventTriggerFlag then
			arg_20_0:onPointDrag(arg_24_1)
		end
	end)
	arg_20_0.liveCom:SetMouseInputActions(System.Action(function()
		if not arg_20_0.useEventTriggerFlag then
			arg_20_0:onPointDown()
		end
	end), System.Action(function()
		if not arg_20_0.useEventTriggerFlag then
			arg_20_0:onPointUp()
		end
	end))

	arg_20_0.paraRanges = arg_20_0.liveCom.paraRanges
	arg_20_0.destinations = ReflectionHelp.RefGetProperty(typeof(Live2dChar), "Destinations", arg_20_0.liveCom):ToTable()
end

function var_0_0.checkActionExist(arg_27_0, arg_27_1)
	return (table.indexof(arg_27_0.animationClipNames, arg_27_1))
end

function var_0_0.onListenerHandle(arg_28_0, arg_28_1, arg_28_2)
	if not arg_28_0.drags or #arg_28_0.drags == 0 then
		return
	end

	for iter_28_0 = 1, #arg_28_0.drags do
		arg_28_0.drags[iter_28_0]:onListenerEvent(arg_28_1, arg_28_2)
	end
end

function var_0_0.onPointDown(arg_29_0, arg_29_1)
	if not arg_29_0._l2dCharEnable then
		return
	end

	arg_29_0.mouseInputDown = true

	if #arg_29_0.drags > 0 and arg_29_0.liveCom:GetDragPart() > 0 then
		local var_29_0 = arg_29_0.liveCom:GetDragPart()
		local var_29_1 = arg_29_0.dragParts[var_29_0]

		if var_29_0 > 0 and var_29_1 then
			for iter_29_0, iter_29_1 in ipairs(arg_29_0.drags) do
				if iter_29_1.drawAbleName == var_29_1 then
					iter_29_1:startDrag(arg_29_1)
				end
			end
		end
	end
end

function var_0_0.onPointUp(arg_30_0, arg_30_1)
	if not arg_30_0._l2dCharEnable then
		return
	end

	arg_30_0.mouseInputDown = false

	if arg_30_0.drags and #arg_30_0.drags > 0 then
		local var_30_0 = arg_30_0.liveCom:GetDragPart()

		if var_30_0 > 0 then
			local var_30_1 = arg_30_0.dragParts[var_30_0]
		end

		for iter_30_0 = 1, #arg_30_0.drags do
			arg_30_0.drags[iter_30_0]:stopDrag(arg_30_1)
		end
	end
end

function var_0_0.onPointDrag(arg_31_0, arg_31_1)
	if not arg_31_0._l2dCharEnable then
		return
	end

	if arg_31_0.drags and #arg_31_0.drags > 0 then
		for iter_31_0 = 1, #arg_31_0.drags do
			arg_31_0.drags[iter_31_0]:onDrag(arg_31_1)
		end
	end
end

function var_0_0.changeTriggerFlag(arg_32_0, arg_32_1)
	arg_32_0.useEventTriggerFlag = arg_32_1
end

local function var_0_20(arg_33_0, arg_33_1)
	arg_33_0._go = arg_33_1
	arg_33_0._tf = tf(arg_33_1)

	HotfixHelper.SetLayerRecursively(arg_33_0._go, LayerMask.NameToLayer("UI"))
	arg_33_0._tf:SetParent(arg_33_0.live2dData.parent, true)

	arg_33_0._tf.localScale = arg_33_0.live2dData.scale
	arg_33_0._tf.localPosition = arg_33_0.live2dData.position
	arg_33_0.liveCom = arg_33_1:GetComponent(typeof(Live2dChar))
	arg_33_0._animator = arg_33_1:GetComponent(typeof(Animator))
	arg_33_0.loadSheets = {}
	arg_33_0.playingSheetInfo = {}
	arg_33_0.cubismModelCom = arg_33_1:GetComponent("Live2D.Cubism.Core.CubismModel")
	arg_33_0.animationClipNames = {}

	if arg_33_0._animator and arg_33_0._animator.runtimeAnimatorController then
		local var_33_0 = arg_33_0._animator.runtimeAnimatorController.animationClips:ToTable()

		for iter_33_0, iter_33_1 in ipairs(var_33_0) do
			table.insert(arg_33_0.animationClipNames, iter_33_1.name)
		end
	end

	local var_33_1 = var_0_4.action2Id.idle

	arg_33_0.liveCom:SetReactMotions(var_0_4.idleActions)

	function arg_33_0.liveCom.FinishAction(arg_34_0)
		arg_33_0:live2dActionChange(false)

		if arg_33_0.finishActionCB then
			arg_33_0.finishActionCB()

			arg_33_0.finishActionCB = nil
		end

		arg_33_0:changeActionIdle()

		if arg_33_0.foldAble then
			pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, false)
		end
	end

	function arg_33_0.liveCom.EventAction(arg_35_0)
		if arg_33_0.animEventCB then
			arg_33_0.animEventCB(arg_35_0)

			arg_33_0.animEventCB = nil
		end
	end

	arg_33_0.dftCom = GetOrAddComponent(arg_33_0._tf, typeof(DftAniEvent))

	arg_33_0.dftCom:SetCommonEvent(function(arg_36_0)
		local var_36_0 = string.split(arg_36_0.stringParameter, "_")

		if table.contains(var_0_1, var_36_0[1]) then
			local var_36_1 = arg_33_0.live2dData.ship:getSkinId()
			local var_36_2
			local var_36_3
			local var_36_4 = var_0_3[var_36_0[1]]

			if var_36_4.cv_voice then
				var_36_2 = pg.CriMgr.GetCVBankName(ShipWordHelper.RawGetCVKey(var_36_1))

				local var_36_5 = pg.ship_skin_template[var_36_1].group_index

				var_36_3 = "vocal_" .. var_36_0[2] .. "_" .. var_36_5
			else
				var_36_2 = var_36_4.sheet_name
				var_36_3 = var_36_1 .. "_" .. var_36_0[2]
			end

			if var_36_4.cv_voice then
				local var_36_6 = table.contains(var_0_2, var_36_0[1])

				arg_33_0:playL2dVoice(var_36_2, var_36_3, var_36_6)
			end
		end
	end)
	arg_33_0.liveCom:SetTouchParts(var_0_4.assistantTouchParts)

	if arg_33_0.live2dData and arg_33_0.live2dData.ship and arg_33_0.live2dData.ship.propose then
		arg_33_0:changeParamaterValue("Paramring", 1)
	else
		arg_33_0:changeParamaterValue("Paramring", 0)
	end

	if not arg_33_0._physics then
		arg_33_0._physics = GetComponent(arg_33_0._tf, "CubismPhysicsController")
	end

	if arg_33_0._physics then
		arg_33_0._physics.enabled = false
		arg_33_0._physics.enabled = true
	end

	if arg_33_0.live2dData.l2dDragRate and #arg_33_0.live2dData.l2dDragRate > 0 then
		arg_33_0.liveCom.DragRateX = arg_33_0.live2dData.l2dDragRate[1] * var_0_5
		arg_33_0.liveCom.DragRateY = arg_33_0.live2dData.l2dDragRate[2] * var_0_6
		arg_33_0.liveCom.DampingTime = arg_33_0.live2dData.l2dDragRate[3] * var_0_7
	end

	var_0_10(arg_33_0)
	var_0_11(arg_33_0)
	var_0_15(arg_33_0)
	arg_33_0:setEnableActions({})
	arg_33_0:setIgnoreActions({})
	arg_33_0:changeIdleIndex(0)

	if arg_33_0.live2dData.shipL2dId and #arg_33_0.live2dData.shipL2dId > 0 then
		var_0_19(arg_33_0)
		arg_33_0:loadLive2dData()

		arg_33_0.timer = Timer.New(function()
			var_0_18(arg_33_0)
		end, 0.03333333333333333, -1)

		arg_33_0.timer:Start()
		var_0_18(arg_33_0)
	end

	arg_33_0.state = var_0_0.STATE_INITED

	if arg_33_0.delayChangeParamater and #arg_33_0.delayChangeParamater > 0 then
		for iter_33_2 = 1, #arg_33_0.delayChangeParamater do
			local var_33_2 = arg_33_0.delayChangeParamater[iter_33_2]

			arg_33_0:changeParamaterValue(var_33_2[1], var_33_2[2])
		end

		arg_33_0.delayChangeParamater = nil
	end

	arg_33_0:offsetL2dPositonDelay(0.6, 6)
	var_0_14(arg_33_0, "idle", true)
end

function var_0_0.Ctor(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0.state = var_0_0.STATE_LOADING
	arg_38_0.live2dData = arg_38_1
	var_0_4 = pg.AssistantInfo

	assert(not arg_38_0.live2dData:isEmpty())

	arg_38_0.modelName = arg_38_0.live2dData:GetShipName()

	local function var_38_0(arg_39_0)
		var_0_20(arg_38_0, arg_39_0)

		if arg_38_2 then
			arg_38_2(arg_38_0)
		end
	end

	arg_38_0.live2dRequestId = pg.Live2DMgr.GetInstance():GetLive2DModelAsync(arg_38_0.modelName, var_38_0)
	Input.gyro.enabled = arg_38_0.live2dData.gyro == 1 and PlayerPrefs.GetInt(GYRO_ENABLE, 1) == 1
	arg_38_0.useEventTriggerFlag = true
end

function var_0_0.SetVisible(arg_40_0, arg_40_1)
	if not arg_40_0:IsLoaded() then
		return
	end

	if arg_40_1 then
		arg_40_0._readlyToStop = false

		if arg_40_0._physics then
			arg_40_0._physics.enabled = false
			arg_40_0._physics.enabled = true
		end

		arg_40_0:setReactPos(false)
		var_0_18(arg_40_0, true)

		if Live2dConst.GetLive2dDirty(arg_40_0.live2dData.ship:getSkinId(), arg_40_0.live2dData.ship.id, true) then
			arg_40_0:resetL2dData()
		end

		if arg_40_0._tf and isActive(arg_40_0._tf) then
			setActive(arg_40_0._tf, false)
		end

		onNextTick(function()
			setActive(arg_40_0._tf, true)
			arg_40_0:loadLive2dData()
			arg_40_0:offsetL2dPositonDelay(0.6, 5, function()
				return
			end)
			var_0_14(arg_40_0, "idle", true)
		end)
	else
		arg_40_0:stopVoice()
		arg_40_0:setReactPos(true)
		arg_40_0:saveLive2dData()
		arg_40_0:changeIdleIndex(0)
		var_0_14(arg_40_0, "idle", true)

		arg_40_0._readlyToStop = true
	end
end

function var_0_0.loadL2dLinkData(arg_43_0)
	if ChangeSkinLink.L2D_PARAMETER_DIC and ChangeSkinLink.L2D_PARAMETER_DIC[arg_43_0.live2dData.ship.id] and arg_43_0.drags then
		local var_43_0 = ChangeSkinLink.L2D_PARAMETER_DIC[arg_43_0.live2dData.ship.id]
		local var_43_1 = ChangeSkinLink.L2D_LINK_PARAMETER[arg_43_0.live2dData.skinId]

		for iter_43_0 = 1, #arg_43_0.drags do
			local var_43_2 = arg_43_0.drags[iter_43_0]

			if table.contains(var_43_1, var_43_2.parameterName) and var_43_2.parameterName and var_43_0[var_43_2.parameterName] then
				var_43_2:setTargetValue(var_43_0[var_43_2.parameterName])
			end
		end
	end
end

function var_0_0.loadLive2dData(arg_44_0)
	if not arg_44_0.live2dData.loadPrefs then
		return
	end

	if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and not arg_44_0.live2dData.spineUseLive2d then
		if arg_44_0.drags then
			for iter_44_0 = 1, #arg_44_0.drags do
				arg_44_0.drags[iter_44_0]:clearData()
				arg_44_0.drags[iter_44_0]:loadL2dFinal()
			end
		end

		arg_44_0:changeIdleIndex(0)

		arg_44_0.saveActionAbleId = nil

		arg_44_0:loadL2dLinkData()
	else
		local var_44_0, var_44_1 = Live2dConst.GetL2dSaveData(arg_44_0.live2dData:GetShipSkinConfig().id, arg_44_0.live2dData.ship.id)
		local var_44_2 = Live2dConst.GetDragActionIndex(var_44_1, arg_44_0.live2dData:GetShipSkinConfig().id, arg_44_0.live2dData.ship.id) or 1

		if var_44_0 then
			arg_44_0:changeIdleIndex(var_44_0)
		end

		arg_44_0.saveActionAbleId = var_44_1

		if var_44_1 and var_44_1 > 0 then
			if pg.ship_l2d[var_44_1] then
				local var_44_3 = pg.ship_l2d[var_44_1].action_trigger_active

				if var_44_0 and var_44_3.idle_enable and #var_44_3.idle_enable > 0 then
					for iter_44_1, iter_44_2 in ipairs(var_44_3.idle_enable) do
						if iter_44_2[1] == var_44_0 then
							arg_44_0:setEnableActions(iter_44_2[2])
						end
					end
				elseif var_44_2 and var_44_2 >= 1 and var_44_3.active_list then
					arg_44_0:setEnableActions(var_44_3.active_list[var_44_2].enable and var_44_3.active_list[var_44_2].enable or {})
				else
					arg_44_0:setEnableActions(var_44_3.enable and var_44_3.enable or {})
				end

				if var_44_0 and var_44_3.idle_ignore and #var_44_3.idle_ignore > 0 then
					for iter_44_3, iter_44_4 in ipairs(var_44_3.idle_ignore) do
						if iter_44_4[1] == var_44_0 then
							arg_44_0:setIgnoreActions(iter_44_4[2])
						end
					end
				elseif var_44_2 and var_44_2 >= 1 and var_44_3.active_list then
					arg_44_0:setIgnoreActions(var_44_3.active_list[var_44_2].ignore and var_44_3.active_list[var_44_2].ignore or {})
				else
					arg_44_0:setIgnoreActions(var_44_3.ignore and var_44_3.ignore or {})
				end
			end
		else
			arg_44_0:setEnableActions({})
			arg_44_0:setIgnoreActions({})
		end

		if arg_44_0.drags then
			for iter_44_5 = 1, #arg_44_0.drags do
				arg_44_0.drags[iter_44_5]:loadData()
				arg_44_0.drags[iter_44_5]:loadL2dFinal()
			end
		end
	end
end

function var_0_0.saveLive2dData(arg_45_0)
	if not arg_45_0.live2dData.loadPrefs then
		return
	end

	if PlayerPrefs.GetInt(LIVE2D_STATUS_SAVE, 1) ~= 1 and not arg_45_0.live2dData.spineUseLive2d then
		return
	end

	local var_45_0 = arg_45_0.live2dData.skinId

	if arg_45_0.idleIndex then
		Live2dConst.SaveL2dIdle(var_45_0, arg_45_0.live2dData.ship.id, arg_45_0.idleIndex)
	end

	if arg_45_0.saveActionAbleId then
		if arg_45_0.idleIndex == 0 then
			Live2dConst.SaveL2dAction(var_45_0, arg_45_0.live2dData.ship.id, 0)
		else
			Live2dConst.SaveL2dAction(var_45_0, arg_45_0.live2dData.ship.id, arg_45_0.saveActionAbleId)
		end
	end

	if arg_45_0.drags then
		for iter_45_0 = 1, #arg_45_0.drags do
			arg_45_0.drags[iter_45_0]:saveData()
		end
	end
end

function var_0_0.changeActionIdle(arg_46_0)
	local var_46_0 = var_0_4.idleActions[math.ceil(math.random(#var_0_4.idleActions))]

	var_0_14(arg_46_0, "idle", true)
end

function var_0_0.enablePlayAction(arg_47_0, arg_47_1)
	return var_0_13(arg_47_0, arg_47_1)
end

function var_0_0.IgonreReactPos(arg_48_0, arg_48_1)
	arg_48_0:setReactPos(arg_48_1)
end

function var_0_0.setReactPos(arg_49_0, arg_49_1)
	if arg_49_0.liveCom then
		arg_49_0.ignoreReact = arg_49_1

		arg_49_0.liveCom:IgonreReactPos(arg_49_1)

		if arg_49_1 then
			arg_49_0.liveCom.inDrag = false
		end

		arg_49_0.liveCom.reactPos = Vector3(0, 0, 0)

		arg_49_0:updateDragsSateData()
	end
end

function var_0_0.l2dCharEnable(arg_50_0, arg_50_1)
	arg_50_0._l2dCharEnable = arg_50_1
end

function var_0_0.inShopPreView(arg_51_0, arg_51_1)
	arg_51_0._shopPreView = arg_51_1

	if arg_51_1 then
		arg_51_0:changeParamaterValue("shop_hx", 1)
	end
end

function var_0_0.getDragEnable(arg_52_0, arg_52_1)
	if arg_52_0._shopPreView and arg_52_1.shop_action == 0 then
		return false
	end

	return true
end

function var_0_0.updateShip(arg_53_0, arg_53_1)
	if arg_53_1 and arg_53_0.live2dData and arg_53_0.live2dData.ship then
		arg_53_0.live2dData.ship = arg_53_1

		if arg_53_0.live2dData and arg_53_0.live2dData.ship and arg_53_0.live2dData.ship.propose then
			arg_53_0:changeParamaterValue("Paramring", 1)
		else
			arg_53_0:changeParamaterValue("Paramring", 0)
		end
	end
end

function var_0_0.getDragByTriggerType(arg_54_0, arg_54_1)
	for iter_54_0 = 1, #arg_54_0.drags do
		local var_54_0 = arg_54_0.drags[iter_54_0]

		if var_54_0:getActionTriggerType() == arg_54_1 then
			return var_54_0
		end
	end

	return nil
end

function var_0_0.IsLoaded(arg_55_0)
	return arg_55_0.state == var_0_0.STATE_INITED
end

function var_0_0.GetTouchPart(arg_56_0)
	return arg_56_0.liveCom:GetTouchPart()
end

function var_0_0.TriggerAction(arg_57_0, arg_57_1, arg_57_2, arg_57_3, arg_57_4)
	arg_57_0:CheckStopDrag()

	local var_57_0 = var_0_14(arg_57_0, arg_57_1, arg_57_3)

	if var_57_0 then
		arg_57_0.finishActionCB = arg_57_2
		arg_57_0.animEventCB = arg_57_4
	end

	return var_57_0
end

function var_0_0.ResetL2dData(arg_58_0)
	arg_58_0:live2dActionChange(false)
	arg_58_0:setEnableActions({})
	arg_58_0:setIgnoreActions({})

	arg_58_0.ableFlag = nil
end

function var_0_0.setPurchaseOffset(arg_59_0, arg_59_1)
	local var_59_0 = arg_59_0.live2dData.ship:GetSkinConfig().purchase_offset

	if not var_59_0 or #var_59_0 < 3 then
		return
	end

	if arg_59_1 then
		if var_59_0 and #var_59_0 >= 3 then
			arg_59_0._tf.localPosition = Vector3(var_59_0[1], var_59_0[2], var_59_0[3])
		end

		if var_59_0 and #var_59_0 >= 4 then
			arg_59_0._tf.localScale = Vector3(var_59_0[4], var_59_0[4], var_59_0[4])
		end
	else
		arg_59_0._tf.localScale = arg_59_0.live2dData.scale
		arg_59_0._tf.localPosition = arg_59_0.live2dData.position
	end
end

function var_0_0.offsetL2dPositonDelay(arg_60_0, arg_60_1, arg_60_2, arg_60_3)
	if arg_60_0._tf and LeanTween.isTweening(go(arg_60_0._tf)) then
		LeanTween.cancel(go(arg_60_0._tf))
	end

	arg_60_0._tf.localPosition = Vector3(30000, 0, 0)
	arg_60_0._animator.speed = arg_60_2

	LeanTween.delayedCall(go(arg_60_0._tf), arg_60_1, System.Action(function()
		if arg_60_0._tf then
			arg_60_0:resetPosition()

			arg_60_0._animator.speed = 1
		end

		if arg_60_3 then
			arg_60_3()
		end
	end))
end

function var_0_0.resumeSpeed(arg_62_0)
	if arg_62_0._animator then
		arg_62_0._animator.speed = 1
	end
end

function var_0_0.resetL2dData(arg_63_0)
	if not arg_63_0._tf then
		return
	end

	if LeanTween.isTweening(go(arg_63_0._tf)) then
		return
	end

	arg_63_0:offsetL2dPositonDelay(0.3, 5)
	Live2dConst.ClearLive2dSave(arg_63_0.live2dData.ship:getSkinId(), arg_63_0.live2dData.ship.id)
	arg_63_0:ResetL2dData()
	arg_63_0:changeIdleIndex(0)
	arg_63_0:loadLive2dData()
	var_0_14(arg_63_0, "idle", true)
end

function var_0_0.applyActiveData(arg_64_0, arg_64_1)
	if not arg_64_1 then
		return
	end

	local var_64_0 = arg_64_1.activeData
	local var_64_1 = var_64_0.enable
	local var_64_2 = var_64_0.idle_enable
	local var_64_3 = var_64_0.idle_ignore
	local var_64_4 = var_64_0.ignore
	local var_64_5 = var_64_0.idle and var_64_0.idle or arg_64_1.idle
	local var_64_6 = var_64_0.repeatFlag
	local var_64_7

	if var_64_0.fold ~= nil then
		var_64_7 = var_64_0.fold == 1 and true or false
	end

	if var_64_1 and #var_64_1 >= 0 then
		arg_64_0:setEnableActions(var_64_1)
	elseif var_64_2 and #var_64_2 > 0 then
		for iter_64_0, iter_64_1 in ipairs(var_64_2) do
			if iter_64_1[1] == var_64_5 then
				arg_64_0:setEnableActions(iter_64_1[2])
			end
		end
	end

	if var_64_4 and #var_64_4 >= 0 then
		arg_64_0:setIgnoreActions(var_64_4)
	elseif var_64_3 and #var_64_3 > 0 then
		for iter_64_2, iter_64_3 in ipairs(var_64_3) do
			if iter_64_3[1] == var_64_5 then
				arg_64_0:setIgnoreActions(iter_64_3[2])
			end
		end
	end

	if var_64_5 and var_64_5 ~= arg_64_0.indexIndex then
		arg_64_0.saveActionAbleId = arg_64_1.id
	end

	if var_64_5 then
		local var_64_8

		if type(var_64_5) == "number" and var_64_5 >= 0 then
			var_64_8 = var_64_5
		elseif type(var_64_5) == "table" then
			local var_64_9 = {}

			for iter_64_4, iter_64_5 in ipairs(var_64_5) do
				if iter_64_5 == arg_64_0.idleIndex then
					if var_64_6 then
						table.insert(var_64_9, iter_64_5)
					end
				else
					table.insert(var_64_9, iter_64_5)
				end
			end

			var_64_8 = var_64_9[math.random(1, #var_64_9)]
		end

		if var_64_8 then
			arg_64_0:changeIdleIndex(var_64_8)
		end

		arg_64_0:saveLive2dData()
	end

	if var_64_7 ~= nil then
		arg_64_0.foldAble = true

		pg.m02:sendNotification(NewMainMediator.HIDE_PANEL, var_64_7)
	end
end

function var_0_0.setIgnoreActions(arg_65_0, arg_65_1)
	arg_65_0.ignorePlayActions = arg_65_1 and arg_65_1 or {}
end

function var_0_0.setEnableActions(arg_66_0, arg_66_1)
	arg_66_0.enablePlayActions = arg_66_1 and arg_66_1 or {}
end

function var_0_0.changeIdleIndex(arg_67_0, arg_67_1)
	local var_67_0 = false

	if arg_67_0.idleIndex ~= arg_67_1 then
		local var_67_1 = arg_67_0._animator:GetInteger("idle")

		if var_67_1 and var_67_1 >= 0 then
			arg_67_0._animator:SetInteger("idle", arg_67_1)

			var_67_0 = true
		end
	end

	arg_67_0:onListenerHandle(Live2D.ON_ACTION_CHANGE_IDLE, {
		idle = arg_67_0.idleIndex,
		idle_change = var_67_0
	})
	print("live2d 待机动作设置为 = " .. arg_67_1)

	arg_67_0.idleIndex = arg_67_1

	arg_67_0:updateDragsSateData()
end

function var_0_0.live2dActionChange(arg_68_0, arg_68_1)
	arg_68_0.isPlaying = arg_68_1

	arg_68_0:updateDragsSateData()
end

function var_0_0.setPosition(arg_69_0, arg_69_1)
	arg_69_0._tf.localPosition = arg_69_1
end

function var_0_0.resetPosition(arg_70_0)
	arg_70_0._tf.localPosition = arg_70_0.live2dData.position
end

function var_0_0.updateDragsSateData(arg_71_0)
	local var_71_0 = {
		idleIndex = arg_71_0.idleIndex,
		isPlaying = arg_71_0.isPlaying,
		ignoreReact = arg_71_0.ignoreReact,
		actionName = arg_71_0.playActionName
	}

	if arg_71_0.drags then
		for iter_71_0 = 1, #arg_71_0.drags do
			arg_71_0.drags[iter_71_0]:updateStateData(var_71_0)
		end
	end
end

function var_0_0.CheckStopDrag(arg_72_0)
	local var_72_0 = arg_72_0.live2dData:GetShipSkinConfig()

	if var_72_0.l2d_ignore_drag and var_72_0.l2d_ignore_drag == 1 then
		arg_72_0.liveCom.ResponseClick = false
		arg_72_0.liveCom.inDrag = false
	end
end

function var_0_0.changeParamaterValue(arg_73_0, arg_73_1, arg_73_2)
	if arg_73_0:IsLoaded() then
		if not arg_73_1 or string.len(arg_73_1) == 0 then
			return
		end

		local var_73_0 = arg_73_0.liveCom:GetCubismParameter(arg_73_1)

		if not var_73_0 then
			return
		end

		arg_73_0.liveCom:AddParameterValue(var_73_0, arg_73_2, var_0_9[1])
	else
		if not arg_73_0.delayChangeParamater then
			arg_73_0.delayChangeParamater = {}
		end

		table.insert(arg_73_0.delayChangeParamater, {
			arg_73_1,
			arg_73_2
		})
	end
end

function var_0_0.changeDragParameter(arg_74_0, arg_74_1, arg_74_2)
	if arg_74_0:IsLoaded() and arg_74_0.drags then
		for iter_74_0 = 1, #arg_74_0.drags do
			if arg_74_0.drags[iter_74_0].parameterName and arg_74_0.drags[iter_74_0].parameterName == arg_74_1 then
				arg_74_0.drags[iter_74_0]:setTargetValue(arg_74_2)
			end
		end
	end
end

function var_0_0.setSortingLayer(arg_75_0, arg_75_1)
	arg_75_1 = arg_75_1 or LayerWeightConst.L2D_DEFAULT_LAYER

	arg_75_0:updateL2dSortMode()

	local var_75_0 = arg_75_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_75_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_75_1, "SortingOrder", var_75_0, arg_75_1)
end

function var_0_0.updateL2dSortMode(arg_76_0)
	local var_76_0 = arg_76_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_76_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_76_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder", nil)

	ReflectionHelp.RefSetProperty(var_76_1, "SortingMode", var_76_0, var_76_2)
end

function var_0_0.setSortingModeFrontZ(arg_77_0)
	local var_77_0 = arg_77_0._go:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_77_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_77_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontZ", nil)

	ReflectionHelp.RefSetProperty(var_77_1, "SortingMode", var_77_0, var_77_2)
end

function var_0_0.Dispose(arg_78_0)
	if arg_78_0.state == var_0_0.STATE_DISPOSE then
		return
	end

	if table.contains(ChangeSkinLink.L2D_SAVE_TEMPLATE_DISPOSE, arg_78_0.live2dData.skinId) then
		local var_78_0 = arg_78_0:getParameterDic()

		if arg_78_0.live2dData.ship and arg_78_0.live2dData.ship.id and arg_78_0.live2dData.ship.id > 0 then
			ChangeSkinLink.L2D_PARAMETER_DIC[arg_78_0.live2dData.ship.id] = var_78_0
		end
	end

	if arg_78_0.state == var_0_0.STATE_INITED then
		arg_78_0.liveCom.FinishAction = nil
		arg_78_0.liveCom.EventAction = nil

		arg_78_0.liveCom:SetMouseInputActions(nil, nil)
	end

	if arg_78_0.dftCom then
		arg_78_0.dftCom:SetCommonEvent(nil)
	end

	arg_78_0:stopVoice()
	arg_78_0:unloadCueSheet()

	if arg_78_0._tf and LeanTween.isTweening(go(arg_78_0._tf)) then
		LeanTween.cancel(go(arg_78_0._tf))
	end

	arg_78_0:saveLive2dData()

	arg_78_0._readlyToStop = false

	if arg_78_0.live2dRequestId then
		pg.Live2DMgr.GetInstance():StopLoadingLive2d(arg_78_0.live2dRequestId)

		arg_78_0.live2dRequestId = nil
	end

	if arg_78_0.drags then
		for iter_78_0 = 1, #arg_78_0.drags do
			arg_78_0.drags[iter_78_0]:dispose()
		end

		arg_78_0.drags = {}
	end

	if arg_78_0.live2dData and arg_78_0.live2dData.gyro == 1 then
		Input.gyro.enabled = false
	end

	if arg_78_0.live2dData then
		arg_78_0.live2dData:Clear()

		arg_78_0.live2dData = nil
	end

	if arg_78_0.timer then
		arg_78_0.timer:Stop()

		arg_78_0.timer = nil
	end

	if arg_78_0._go and arg_78_0.state == var_0_0.STATE_INITED then
		pg.Live2DMgr.GetInstance():ReturnLive2DModel(arg_78_0.modelName, arg_78_0._go)

		arg_78_0.modelName = nil
		arg_78_0._go = nil
	end

	arg_78_0.state = var_0_0.STATE_DISPOSE
end

function var_0_0.settempOffsetPosTime(arg_79_0, arg_79_1)
	arg_79_0.tempOffsetPosTime = arg_79_1
end

function var_0_0.getParameterDic(arg_80_0)
	local var_80_0 = {}

	if arg_80_0.drags and #arg_80_0.drags > 0 then
		for iter_80_0, iter_80_1 in ipairs(arg_80_0.drags) do
			local var_80_1 = iter_80_1:getParameterName()
			local var_80_2 = iter_80_1:getParameter()

			if var_80_1 and #var_80_1 > 0 and var_80_2 then
				var_80_0[var_80_1] = var_80_2
			end
		end
	end

	return var_80_0
end

function var_0_0.unloadCueSheet(arg_81_0)
	if not arg_81_0.loadSheets then
		return
	end

	for iter_81_0, iter_81_1 in ipairs(arg_81_0.loadSheets) do
		pg.CriMgr.GetInstance():UnloadCueSheet(iter_81_1)
	end

	arg_81_0.loadSheets = {}
end

function var_0_0.stopVoice(arg_82_0)
	if not arg_82_0.playingSheetInfo then
		return
	end

	for iter_82_0, iter_82_1 in ipairs(arg_82_0.playingSheetInfo) do
		if iter_82_1 then
			iter_82_1:PlaybackStop()
		end
	end

	arg_82_0.playingSheetInfo = {}
end

function var_0_0.playL2dVoice(arg_83_0, arg_83_1, arg_83_2, arg_83_3)
	if not table.contains(arg_83_0.loadSheets, arg_83_1) then
		table.insert(arg_83_0.loadSheets, arg_83_1)
	end

	pg.CriMgr.GetInstance():playCueSheetVoice(arg_83_1, arg_83_2, arg_83_3, function(arg_84_0)
		if arg_84_0 then
			print("播放的语音长度为 = " .. arg_84_0:GetLength())
			table.insert(arg_83_0.playingSheetInfo, arg_84_0)
		end
	end)
end

function var_0_0.UpdateAtomSource(arg_85_0)
	arg_85_0.updateAtom = true
end

function var_0_0.AtomSouceFresh(arg_86_0)
	local var_86_0 = pg.CriMgr.GetInstance():getAtomSource(pg.CriMgr.C_VOICE)
	local var_86_1 = arg_86_0._go:GetComponent("CubismCriSrcMouthInput").Analyzer

	var_86_0:AttachToAnalyzer(var_86_1)

	if arg_86_0.updateAtom then
		arg_86_0.updateAtom = false
	end
end

function var_0_0.SetL2dSortingLayer(arg_87_0, arg_87_1)
	var_0_0.UpdateL2dSortMode(arg_87_0)

	local var_87_0 = arg_87_0:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_87_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")

	ReflectionHelp.RefSetProperty(var_87_1, "SortingOrder", var_87_0, arg_87_1)
end

function var_0_0.UpdateL2dSortMode(arg_88_0)
	local var_88_0 = arg_88_0:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_88_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_88_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontOrder", nil)

	ReflectionHelp.RefSetProperty(var_88_1, "SortingMode", var_88_0, var_88_2)
end

function var_0_0.SetSortingModeFrontZ(arg_89_0)
	local var_89_0 = arg_89_0:GetComponent("Live2D.Cubism.Rendering.CubismRenderController")
	local var_89_1 = typeof("Live2D.Cubism.Rendering.CubismRenderController")
	local var_89_2 = ReflectionHelp.RefGetField(typeof("Live2D.Cubism.Rendering.CubismSortingMode"), "BackToFrontZ", nil)

	ReflectionHelp.RefSetProperty(var_89_1, "SortingMode", var_89_0, var_89_2)
end

return var_0_0
