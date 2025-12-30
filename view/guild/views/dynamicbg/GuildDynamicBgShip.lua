local var_0_0 = class("GuildDynamicBgShip")

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.id = arg_1_1.id
	arg_1_0._go = arg_1_1.go
	arg_1_0._tf = tf(arg_1_0._go)
	arg_1_0.parent = arg_1_0._tf.parent
	arg_1_0.path = arg_1_1.path
	arg_1_0.speed = 1
	arg_1_0.stepCnt = 0
	arg_1_0.scale = arg_1_0._tf.localScale.x
	arg_1_0.furnitures = arg_1_1.furnitures
	arg_1_0.interAction = nil
	arg_1_0.interActionRatio = 10000 / GuildConst.MAX_DISPLAY_MEMBER_SHIP
	arg_1_0.name = arg_1_1.name
	arg_1_0.isCommander = arg_1_1.isCommander
	arg_1_0.spineChar = arg_1_1.char

	arg_1_0:Init(arg_1_1)
end

function var_0_0.Init(arg_2_0, arg_2_1)
	arg_2_0:SetPosition(arg_2_1.grid, true)

	arg_2_0.nameTF = arg_2_0._tf:Find("name")
	arg_2_0.nameTF.localScale = Vector3(1 / arg_2_0.scale, 1 / arg_2_0.scale, 1)
	arg_2_0.nameTF.localPosition = Vector3(0, 300, 0)

	setText(arg_2_0.nameTF, arg_2_0.name)

	if arg_2_0.isCommander then
		arg_2_0.tagTF = arg_2_0._tf:Find("tag")
		arg_2_0.tagTF.localScale = Vector3(1 / arg_2_0.scale, 1 / arg_2_0.scale, 1)
		arg_2_0.tagTF.localPosition = Vector3(0, 380, 0)
	end

	if not arg_2_1.stand then
		arg_2_0:AddRandomMove()
	end
end

function var_0_0.SetOnMoveCallBack(arg_3_0, arg_3_1)
	arg_3_0.callback = arg_3_1
end

function var_0_0.SetPosition(arg_4_0, arg_4_1, arg_4_2)
	if arg_4_0.exited then
		return
	end

	if arg_4_0.grid then
		arg_4_0.grid:UnlockAll()
	end

	arg_4_0.grid = arg_4_1

	if arg_4_2 then
		local var_4_0 = arg_4_0.grid:GetCenterPosition()

		arg_4_0._tf.localPosition = var_4_0

		arg_4_0:SetAction("stand2")
	end

	if arg_4_0.callback then
		arg_4_0.callback()
	end
end

function var_0_0.AddRandomMove(arg_5_0)
	arg_5_0.stepCnt = math.random(1, 10)

	local var_5_0 = math.random(1, 8)

	arg_5_0.timer = Timer.New(function()
		arg_5_0.timer:Stop()

		arg_5_0.timer = nil

		arg_5_0:StartMove()
	end, var_5_0, 1)

	arg_5_0.timer:Start()
end

function var_0_0.IsCanWalkPonit(arg_7_0, arg_7_1)
	if not arg_7_0.path[arg_7_1.x] then
		return false
	end

	local var_7_0 = arg_7_0.path[arg_7_1.x][arg_7_1.y]

	if var_7_0 then
		return var_7_0:CanWalk()
	else
		return false
	end
end

function var_0_0.StartMove(arg_8_0)
	local var_8_0 = arg_8_0.grid:GetAroundGrids()
	local var_8_1 = _.select(var_8_0, function(arg_9_0)
		return arg_8_0:IsCanWalkPonit(arg_9_0)
	end)

	if not var_8_1 or #var_8_1 == 0 then
		arg_8_0:AddRandomMove()
	else
		arg_8_0.stepCnt = arg_8_0.stepCnt - 1

		local var_8_2 = var_8_1[math.random(1, #var_8_1)]
		local var_8_3 = arg_8_0.path[var_8_2.x][var_8_2.y]

		arg_8_0:MoveToGrid(var_8_3)
	end
end

function var_0_0.MoveToGrid(arg_10_0, arg_10_1)
	local function var_10_0()
		arg_10_0:SetAction("stand2")

		local var_11_0 = math.random(3, 8)

		arg_10_0.idleTimer = Timer.New(function()
			arg_10_0.idleTimer:Stop()

			arg_10_0.idleTimer = nil

			arg_10_0:AddRandomMove()
		end, var_11_0, 1)

		arg_10_0.idleTimer:Start()
	end

	local function var_10_1()
		if arg_10_0.stepCnt ~= 0 then
			arg_10_0:StartMove()

			return
		end

		local var_13_0, var_13_1 = arg_10_0:CanInterAction(arg_10_0.interActionRatio)

		if var_13_0 then
			arg_10_0:MoveToFurniture(var_13_1)
		else
			var_10_0()
		end
	end

	arg_10_0:MoveNext(arg_10_1, false, var_10_1)
end

function var_0_0.MoveNext(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	if not arg_14_2 and not arg_14_1:CanWalk() then
		return
	end

	if arg_14_0.exited then
		return
	end

	arg_14_1:Lock()
	arg_14_0:SetAction("walk")

	local var_14_0 = arg_14_1.position.x < arg_14_0.grid.position.x and -1 or 1

	arg_14_0:UpdateShipDir(var_14_0)

	local var_14_1 = arg_14_1:GetCenterPosition()

	LeanTween.moveLocal(arg_14_0._go, Vector3(var_14_1.x, var_14_1.y, 0), 1 / arg_14_0.speed):setOnComplete(System.Action(function()
		if arg_14_0.exited then
			return
		end

		arg_14_0:SetPosition(arg_14_1)
		arg_14_3()
	end))
end

function var_0_0.MoveLeft(arg_16_0)
	local var_16_0 = arg_16_0.grid.position
	local var_16_1 = Vector2(var_16_0.x - 1, var_16_0.y)
	local var_16_2 = arg_16_0.path[var_16_1.x] and arg_16_0.path[var_16_1.x][var_16_1.y]

	if var_16_2 then
		arg_16_0:MoveNext(var_16_2, false, function()
			arg_16_0:SetAction("stand2")
		end)
	end
end

function var_0_0.MoveRight(arg_18_0)
	local var_18_0 = arg_18_0.grid.position
	local var_18_1 = Vector2(var_18_0.x + 1, var_18_0.y)
	local var_18_2 = arg_18_0.path[var_18_1.x] and arg_18_0.path[var_18_1.x][var_18_1.y]

	if var_18_2 then
		arg_18_0:MoveNext(var_18_2, false, function()
			arg_18_0:SetAction("stand2")
		end)
	end
end

function var_0_0.MoveDown(arg_20_0)
	local var_20_0 = arg_20_0.grid.position
	local var_20_1 = Vector2(var_20_0.x, var_20_0.y - 1)
	local var_20_2 = arg_20_0.path[var_20_1.x] and arg_20_0.path[var_20_1.x][var_20_1.y]

	if var_20_2 then
		arg_20_0:MoveNext(var_20_2, false, function()
			arg_20_0:SetAction("stand2")
		end)
	end
end

function var_0_0.MoveUp(arg_22_0)
	local var_22_0 = arg_22_0.grid.position
	local var_22_1 = Vector2(var_22_0.x, var_22_0.y + 1)
	local var_22_2 = arg_22_0.path[var_22_1.x] and arg_22_0.path[var_22_1.x][var_22_1.y]

	if var_22_2 then
		arg_22_0:MoveNext(var_22_2, false, function()
			arg_22_0:SetAction("stand2")
		end)
	end
end

function var_0_0.SetAction(arg_24_0, arg_24_1)
	if arg_24_0.actionName == arg_24_1 then
		return
	end

	arg_24_0.actionName = arg_24_1

	arg_24_0.spineChar:SetAction(arg_24_1, 0)
end

function var_0_0.SetAsLastSibling(arg_25_0)
	arg_25_0._tf:SetAsLastSibling()
end

function var_0_0.MoveToFurniture(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1[1]
	local var_26_1 = arg_26_1[2]

	var_26_0:Lock()

	for iter_26_0, iter_26_1 in ipairs(var_26_1) do
		arg_26_0.path[iter_26_1.x][iter_26_1.y]:Lock()
	end

	arg_26_0:MoveByPath(var_26_1, function()
		arg_26_0:InterActionFurniture(var_26_0)
	end)
end

function var_0_0.UpdateShipDir(arg_28_0, arg_28_1)
	arg_28_0._tf.localScale = Vector3(arg_28_1 * arg_28_0.scale, arg_28_0.scale, arg_28_0.scale)

	local var_28_0 = 1 / arg_28_0.scale * arg_28_1

	arg_28_0.nameTF.localScale = Vector3(var_28_0, arg_28_0.nameTF.localScale.y, 1)

	if arg_28_0.isCommander then
		arg_28_0.tagTF.localScale = Vector3(var_28_0, arg_28_0.tagTF.localScale.y, 1)
	end
end

function var_0_0.InterActionFurniture(arg_29_0, arg_29_1)
	setParent(arg_29_0._tf, arg_29_1._tf)

	local var_29_0 = arg_29_1:GetInteractionDir()

	arg_29_0:UpdateShipDir(var_29_0)

	local var_29_1 = arg_29_1:GetInterActionPos()

	arg_29_0._tf.anchoredPosition = var_29_1

	local var_29_2 = arg_29_1:GetInterActionMode()
	local var_29_3

	if GuildDynamicFurniture.INTERACTION_MODE_SIT == var_29_2 then
		var_29_3 = "sit"
	end

	assert(var_29_3)
	arg_29_0:SetAction(var_29_3)
	arg_29_0:CancelInterAction(arg_29_1)
end

function var_0_0.CancelInterAction(arg_30_0, arg_30_1)
	local var_30_0 = math.random(15, 30)

	arg_30_0.interActionTimer = Timer.New(function()
		arg_30_0.interActionTimer:Stop()

		arg_30_0.interActionTimer = nil

		arg_30_1:Unlock()
		setParent(arg_30_0._tf, arg_30_0.parent)
		assert(arg_30_0.grid)
		arg_30_0:SetPosition(arg_30_0.grid, true)
		arg_30_0:AddRandomMove()
	end, var_30_0, 1)

	arg_30_0.interActionTimer:Start()
end

function var_0_0.MoveByPath(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = {}

	for iter_32_0, iter_32_1 in ipairs(arg_32_1) do
		table.insert(var_32_0, function(arg_33_0)
			if arg_32_0.exited then
				return
			end

			local var_33_0 = arg_32_0.path[iter_32_1.x][iter_32_1.y]

			arg_32_0:MoveNext(var_33_0, true, arg_33_0)
		end)
	end

	seriesAsync(var_32_0, arg_32_2)
end

function var_0_0.SearchPoint(arg_34_0, arg_34_1, arg_34_2)
	local function var_34_0(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
		if _.any(arg_35_0, function(arg_36_0)
			return arg_35_2 == arg_36_0.point
		end) or _.any(arg_35_1, function(arg_37_0)
			return arg_35_2 == arg_37_0
		end) then
			return false
		end

		if arg_34_0.path[arg_35_2.x] then
			local var_35_0 = arg_34_0.path[arg_35_2.x][arg_35_2.y]

			return var_35_0 and var_35_0:CanWalk()
		end

		return false
	end

	local function var_34_1(arg_38_0)
		local var_38_0 = {}

		table.insert(var_38_0, Vector2(arg_38_0.x + 1, arg_38_0.y))
		table.insert(var_38_0, Vector2(arg_38_0.x - 1, arg_38_0.y))
		table.insert(var_38_0, Vector2(arg_38_0.x, arg_38_0.y + 1))
		table.insert(var_38_0, Vector2(arg_38_0.x, arg_38_0.y - 1))

		return var_38_0
	end

	local function var_34_2(arg_39_0, arg_39_1, arg_39_2)
		return math.abs(arg_39_2.x - arg_39_0.x) + math.abs(arg_39_2.y - arg_39_0.y) < math.abs(arg_39_2.x - arg_39_1.x) + math.abs(arg_39_2.y - arg_39_1.y)
	end

	local var_34_3 = {}
	local var_34_4 = {}
	local var_34_5 = {}
	local var_34_6

	table.insert(var_34_3, {
		parent = 0,
		point = arg_34_1
	})

	while #var_34_3 > 0 do
		local var_34_7 = table.remove(var_34_3, 1)
		local var_34_8 = var_34_7.point

		if var_34_8 == arg_34_2 then
			var_34_6 = var_34_7

			break
		end

		table.insert(var_34_4, var_34_8)

		for iter_34_0, iter_34_1 in ipairs(var_34_1(var_34_8)) do
			if var_34_0(var_34_3, var_34_4, iter_34_1, arg_34_2) then
				table.insert(var_34_3, {
					point = iter_34_1,
					parent = var_34_7
				})
			else
				if iter_34_1 == arg_34_2 then
					var_34_6 = var_34_7

					break
				end

				table.insert(var_34_4, iter_34_1)
			end
		end

		table.sort(var_34_3, function(arg_40_0, arg_40_1)
			return var_34_2(arg_40_0.point, arg_40_1.point, arg_34_2)
		end)
	end

	if var_34_6 then
		while var_34_6.parent ~= 0 do
			table.insert(var_34_5, 1, var_34_6.point)

			var_34_6 = var_34_6.parent
		end
	end

	return var_34_5
end

function var_0_0.CanInterAction(arg_41_0, arg_41_1)
	if arg_41_1 < math.random(1, 10000) then
		return false
	end

	local var_41_0 = {}

	for iter_41_0, iter_41_1 in ipairs(arg_41_0.furnitures) do
		if not iter_41_1:BeLock() then
			table.insert(var_41_0, iter_41_1)
		end
	end

	if #var_41_0 == 0 then
		return false
	end

	local var_41_1 = var_41_0[math.random(1, #var_41_0)]
	local var_41_2 = var_41_1:GetOccupyGrid()
	local var_41_3 = 999999
	local var_41_4
	local var_41_5 = arg_41_0.grid.position

	for iter_41_2, iter_41_3 in ipairs(var_41_2) do
		local var_41_6 = iter_41_3.position
		local var_41_7 = math.abs(var_41_5.x - var_41_6.x) + math.abs(var_41_5.y - var_41_6.y)

		if var_41_7 < var_41_3 then
			var_41_3 = var_41_7
			var_41_4 = var_41_6
		end
	end

	local var_41_8 = arg_41_0:SearchPoint(arg_41_0.grid.position, var_41_4)

	if not var_41_8 or #var_41_8 == 0 then
		return false
	end

	return true, {
		var_41_1,
		var_41_8
	}
end

function var_0_0.Dispose(arg_42_0)
	if arg_42_0.timer then
		arg_42_0.timer:Stop()

		arg_42_0.timer = nil
	end

	if arg_42_0.idleTimer then
		arg_42_0.idleTimer:Stop()

		arg_42_0.idleTimer = nil
	end

	if arg_42_0.interActionTimer then
		arg_42_0.interActionTimer:Stop()

		arg_42_0.interActionTimer = nil
	end

	if not IsNil(arg_42_0._go) and LeanTween.isTweening(arg_42_0._go) then
		LeanTween.cancel(arg_42_0._go)
	end

	if arg_42_0.spineChar then
		arg_42_0.spineChar:Dispose()

		arg_42_0.spineChar = nil
	end

	Destroy(arg_42_0.nameTF)

	if arg_42_0.isCommander then
		Destroy(arg_42_0.tagTF)
	end

	arg_42_0.actionName = nil

	arg_42_0:SetOnMoveCallBack()

	arg_42_0.exited = true
end

return var_0_0
