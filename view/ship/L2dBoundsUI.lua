local var_0_0 = class("L2dBoundsUI")
local var_0_1 = "l2dui"

function var_0_0.Ctor(arg_1_0)
	arg_1_0._timer = Timer.New(function()
		arg_1_0:step()
	end, 0.03333333333333333, -1)

	arg_1_0._timer:Start()

	arg_1_0._dragsUI = {}
	arg_1_0.visible = true
	var_0_1 = pg.gameset.l2d_tips_default_icon.description
end

function var_0_0.InitUI(arg_3_0, arg_3_1, arg_3_2)
	arg_3_1 = arg_3_1 or "l2dboundsui"

	PoolMgr.GetInstance():GetUI(arg_3_1, true, function(arg_4_0)
		if arg_3_0._isDispose then
			Destroy(arg_4_0)
		end

		arg_3_0:onLoaded(arg_4_0)

		if arg_3_2 then
			arg_3_2(arg_3_0)
		end
	end)
end

function var_0_0.SetData(arg_5_0, arg_5_1, arg_5_2)
	arg_5_0._bounds = arg_5_1
	arg_5_0._tipConfig = pg.ship_l2d_tips[arg_5_2]

	if not arg_5_0._tipConfig then
		return
	end

	arg_5_0._tipOffset = arg_5_0._tipConfig.tips_offset
	arg_5_0._tipsScale = arg_5_0._tipConfig.tips_scale
	arg_5_0._tipsIdleBlackList = arg_5_0._tipConfig.idle_black_list
	arg_5_0._tipsAnimWhiteList = arg_5_0._tipConfig.anim_white_list

	arg_5_0:createDrags()
end

function var_0_0.SetParent(arg_6_0, arg_6_1)
	if arg_6_0._tf then
		SetParent(arg_6_0._tf, arg_6_1)
	end
end

function var_0_0.onLoaded(arg_7_0, arg_7_1)
	arg_7_0._tf = tf(arg_7_1)
	arg_7_0._container = findTF(arg_7_0._tf, "ad")
	arg_7_0._boundsTpl = findTF(arg_7_0._tf, "ad/bounds_tpl")

	setActive(arg_7_0._boundsTpl, false)
	setActive(arg_7_0._tf, true)
end

function var_0_0.step(arg_8_0)
	if not arg_8_0._bounds or #arg_8_0._dragsUI == 0 then
		return
	end

	local var_8_0 = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	local var_8_1 = var_8_0:ScreenToWorldPoint(Vector3(0, 0, -10))
	local var_8_2 = var_8_0:ScreenToWorldPoint(Vector3(Screen.width, Screen.height, -10))
	local var_8_3 = Screen.width / (var_8_2.x - var_8_1.x)
	local var_8_4 = Screen.height / (var_8_2.y - var_8_1.y)

	for iter_8_0 = 1, #arg_8_0._bounds do
		local var_8_5 = arg_8_0._bounds[iter_8_0]
		local var_8_6 = var_8_5.name
		local var_8_7 = var_8_5.bounds.min
		local var_8_8 = var_8_5.bounds.max
		local var_8_9 = true

		if not arg_8_0.visible then
			var_8_9 = false
		elseif arg_8_0._state.isPlaying then
			if not arg_8_0:MatchPlayingList(var_8_6) then
				var_8_9 = false
			end
		elseif not arg_8_0._state.isPlaying and arg_8_0:MatchIdleBlackList(var_8_6) then
			var_8_9 = false
		elseif var_8_7.x >= var_8_2.x or var_8_7.y >= var_8_2.y or var_8_8.x <= var_8_1.x or var_8_8.y <= var_8_1.y then
			var_8_9 = false
		end

		arg_8_0:setUIVisible(arg_8_0._dragsUI[iter_8_0], var_8_9)

		if var_8_9 then
			local var_8_10 = var_8_5.bounds.min
			local var_8_11 = var_8_5.bounds.max

			var_8_10.x = var_8_10.x < var_8_1.x and var_8_1.x or var_8_10.x
			var_8_10.y = var_8_10.y < var_8_1.y and var_8_1.y or var_8_10.y
			var_8_11.x = var_8_11.x > var_8_2.x and var_8_2.x or var_8_11.x
			var_8_11.y = var_8_11.y > var_8_2.y and var_8_2.y or var_8_11.y

			local var_8_12 = var_8_11.x - var_8_10.x
			local var_8_13 = var_8_11.y - var_8_10.y

			arg_8_0._dragsUI[iter_8_0].position = Vector3(var_8_10.x + var_8_12 / 2, var_8_10.y + var_8_13 / 2, 0)
			arg_8_0._dragsUI[iter_8_0].sizeDelta = Vector2(var_8_12 * var_8_3 - 10, var_8_13 * var_8_4 - 10)
		end
	end
end

function var_0_0.setUIVisible(arg_9_0, arg_9_1, arg_9_2)
	if isActive(arg_9_1) ~= arg_9_2 then
		setActive(arg_9_1, arg_9_2)
	end
end

function var_0_0.createDrags(arg_10_0)
	arg_10_0:clearDrags()

	for iter_10_0 = 1, #arg_10_0._bounds do
		local var_10_0 = arg_10_0._bounds[iter_10_0]
		local var_10_1 = Instantiate(arg_10_0._boundsTpl)

		GetOrAddComponent(var_10_1, typeof(EventTriggerListener))
		SetParent(var_10_1, arg_10_0._container)
		table.insert(arg_10_0._dragsUI, tf(var_10_1))

		var_10_1.name = var_10_0.name

		setText(findTF(var_10_1, "ad/text"), var_10_0.name)
		setActive(findTF(var_10_1, "ad/text"), false)

		local var_10_2 = var_10_0.name

		arg_10_0:getDragBoundUI(var_10_2, function(arg_11_0)
			if arg_10_0._tf then
				local var_11_0 = tf(arg_11_0)

				arg_11_0.name = var_10_2

				local var_11_1 = findTF(var_10_1, "ad")

				SetParent(var_11_0, var_11_1)

				local var_11_2 = arg_10_0:GetOffset(var_10_2)

				var_11_0.localScale, var_11_0.anchoredPosition = arg_10_0:GetScale(var_10_2), var_11_2

				setActive(var_11_0, true)
				setText(findTF(var_11_0, "Image/Text"), tostring(iter_10_0))
			else
				Destroy(arg_11_0)
			end
		end)
	end
end

function var_0_0.MatchIdleBlackList(arg_12_0, arg_12_1)
	local var_12_0 = arg_12_0._state.idleIndex

	if arg_12_0._tipsIdleBlackList and #arg_12_0._tipsIdleBlackList >= 0 then
		for iter_12_0, iter_12_1 in ipairs(arg_12_0._tipsIdleBlackList) do
			local var_12_1 = iter_12_1.drawable
			local var_12_2 = iter_12_1.idle

			if table.contains(var_12_1, arg_12_1) and table.contains(var_12_2, var_12_0) then
				return true
			end
		end
	end

	return false
end

function var_0_0.MatchPlayingList(arg_13_0, arg_13_1)
	if not arg_13_0._state.isPlaying then
		return false
	end

	local var_13_0 = arg_13_0._state.actionName

	if arg_13_0._tipsAnimWhiteList and #arg_13_0._tipsAnimWhiteList >= 0 then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0._tipsAnimWhiteList) do
			local var_13_1 = iter_13_1.drawable
			local var_13_2 = iter_13_1.white_list

			if table.contains(var_13_1, arg_13_1) and table.contains(var_13_2, var_13_0) then
				return true
			end
		end
	end

	return false
end

function var_0_0.GetScale(arg_14_0, arg_14_1)
	local var_14_0 = Vector3(1, 1, 1)

	if arg_14_0._tipsScale and #arg_14_0._tipsScale > 0 then
		for iter_14_0, iter_14_1 in ipairs(arg_14_0._tipsScale) do
			local var_14_1 = iter_14_1.drawable
			local var_14_2 = iter_14_1.scale

			if table.contains(var_14_1, arg_14_1) then
				var_14_0.x = var_14_2[1]
				var_14_0.y = var_14_2[2]
				var_14_0.z = var_14_2[3]
			end
		end
	end

	return var_14_0
end

function var_0_0.GetOffset(arg_15_0, arg_15_1)
	local var_15_0 = Vector2(0, 0)

	if arg_15_0._tipOffset and #arg_15_0._tipOffset > 0 then
		for iter_15_0, iter_15_1 in ipairs(arg_15_0._tipOffset) do
			local var_15_1 = iter_15_1.drawable
			local var_15_2 = iter_15_1.offset

			if table.contains(var_15_1, arg_15_1) then
				var_15_0.x = var_15_2[1]
				var_15_0.y = var_15_2[2]
			end
		end
	end

	return var_15_0
end

function var_0_0.getDragBoundUI(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0._tipConfig.tips_icon
	local var_16_1 = var_0_1

	if var_16_0 and #var_16_0 > 0 then
		for iter_16_0, iter_16_1 in ipairs(var_16_0) do
			local var_16_2 = iter_16_1.drawable
			local var_16_3 = iter_16_1.icon

			if table.contains(var_16_2, arg_16_1) then
				var_16_1 = iter_16_1.icon
			end
		end
	end

	PoolMgr.GetInstance():GetPrefab("ui/" .. var_16_1, nil, true, function(arg_17_0)
		if arg_16_2 then
			arg_16_2(arg_17_0)
		end
	end)
end

function var_0_0.GetDragsCount(arg_18_0)
	if arg_18_0._dragsUI then
		return #arg_18_0._dragsUI
	end

	return 0
end

function var_0_0.ActionChange(arg_19_0, arg_19_1)
	arg_19_0._state = arg_19_1
end

function var_0_0.SetVisible(arg_20_0, arg_20_1)
	arg_20_0.visible = arg_20_1
end

function var_0_0.clearDrags(arg_21_0)
	if arg_21_0._dragsUI and #arg_21_0._dragsUI > 0 then
		for iter_21_0 = 1, #arg_21_0._dragsUI do
			ClearEventTrigger(GetComponent(arg_21_0._dragsUI[iter_21_0], typeof(EventTriggerListener)))
			Destroy(arg_21_0._dragsUI[iter_21_0])
		end

		arg_21_0._dragsUI = {}
	end
end

function var_0_0.Dispose(arg_22_0)
	arg_22_0._isDispose = true

	if arg_22_0._timer then
		arg_22_0._timer:Stop()

		arg_22_0._timer = nil
	end

	if arg_22_0._bounds then
		arg_22_0._bounds = nil
	end

	if arg_22_0._tf then
		Destroy(arg_22_0._tf)

		arg_22_0._tf = nil
	end

	arg_22_0:clearDrags()
end

return var_0_0
