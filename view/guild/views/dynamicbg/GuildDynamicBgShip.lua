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

function var_0_0.GetMoveDir(arg_8_0, arg_8_1)
	if arg_8_1.position.x < arg_8_0.grid.position.x then
		return -1
	elseif arg_8_1.position.x > arg_8_0.grid.position.x then
		return 1
	end

	return arg_8_0._tf.localScale.x < 0 and -1 or 1
end

function var_0_0.StartMove(arg_9_0)
	local var_9_0 = arg_9_0.grid:GetAroundGrids()
	local var_9_1 = _.select(var_9_0, function(arg_10_0)
		return arg_9_0:IsCanWalkPonit(arg_10_0)
	end)

	if not var_9_1 or #var_9_1 == 0 then
		arg_9_0:AddRandomMove()
	else
		arg_9_0.stepCnt = arg_9_0.stepCnt - 1

		local var_9_2 = var_9_1[math.random(1, #var_9_1)]
		local var_9_3 = arg_9_0.path[var_9_2.x][var_9_2.y]
		local var_9_4 = arg_9_0:GetMoveDir(var_9_3)

		arg_9_0:UpdateShipDir(var_9_4)
		arg_9_0:MoveToGrid(var_9_3)
	end
end

function var_0_0.MoveToGrid(arg_11_0, arg_11_1)
	local function var_11_0()
		arg_11_0:SetAction("stand2")

		local var_12_0 = math.random(3, 8)

		arg_11_0.idleTimer = Timer.New(function()
			arg_11_0.idleTimer:Stop()

			arg_11_0.idleTimer = nil

			arg_11_0:AddRandomMove()
		end, var_12_0, 1)

		arg_11_0.idleTimer:Start()
	end

	local function var_11_1()
		if arg_11_0.stepCnt ~= 0 then
			arg_11_0:StartMove()

			return
		end

		local var_14_0, var_14_1 = arg_11_0:CanInterAction(arg_11_0.interActionRatio)

		if var_14_0 then
			arg_11_0:MoveToFurniture(var_14_1)
		else
			var_11_0()
		end
	end

	arg_11_0:MoveNext(arg_11_1, false, var_11_1)
end

function var_0_0.MoveNext(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	if not arg_15_2 and not arg_15_1:CanWalk() then
		return
	end

	if arg_15_0.exited then
		return
	end

	arg_15_1:Lock()
	arg_15_0:SetAction("walk")

	local var_15_0 = arg_15_0:GetMoveDir(arg_15_1)

	arg_15_0:UpdateShipDir(var_15_0)

	local var_15_1 = arg_15_1:GetCenterPosition()

	LeanTween.moveLocal(arg_15_0._go, Vector3(var_15_1.x, var_15_1.y, 0), 1 / arg_15_0.speed):setOnComplete(System.Action(function()
		if arg_15_0.exited then
			return
		end

		arg_15_0:SetPosition(arg_15_1)
		arg_15_3()
	end))
end

function var_0_0.MoveLeft(arg_17_0)
	local var_17_0 = arg_17_0.grid.position
	local var_17_1 = Vector2(var_17_0.x - 1, var_17_0.y)
	local var_17_2 = arg_17_0.path[var_17_1.x] and arg_17_0.path[var_17_1.x][var_17_1.y]

	if var_17_2 then
		arg_17_0:MoveNext(var_17_2, false, function()
			arg_17_0:SetAction("stand2")
		end)
	end
end

function var_0_0.MoveRight(arg_19_0)
	local var_19_0 = arg_19_0.grid.position
	local var_19_1 = Vector2(var_19_0.x + 1, var_19_0.y)
	local var_19_2 = arg_19_0.path[var_19_1.x] and arg_19_0.path[var_19_1.x][var_19_1.y]

	if var_19_2 then
		arg_19_0:MoveNext(var_19_2, false, function()
			arg_19_0:SetAction("stand2")
		end)
	end
end

function var_0_0.MoveDown(arg_21_0)
	local var_21_0 = arg_21_0.grid.position
	local var_21_1 = Vector2(var_21_0.x, var_21_0.y - 1)
	local var_21_2 = arg_21_0.path[var_21_1.x] and arg_21_0.path[var_21_1.x][var_21_1.y]

	if var_21_2 then
		arg_21_0:MoveNext(var_21_2, false, function()
			arg_21_0:SetAction("stand2")
		end)
	end
end

function var_0_0.MoveUp(arg_23_0)
	local var_23_0 = arg_23_0.grid.position
	local var_23_1 = Vector2(var_23_0.x, var_23_0.y + 1)
	local var_23_2 = arg_23_0.path[var_23_1.x] and arg_23_0.path[var_23_1.x][var_23_1.y]

	if var_23_2 then
		arg_23_0:MoveNext(var_23_2, false, function()
			arg_23_0:SetAction("stand2")
		end)
	end
end

function var_0_0.SetAction(arg_25_0, arg_25_1)
	if arg_25_0.actionName == arg_25_1 then
		return
	end

	arg_25_0.actionName = arg_25_1

	arg_25_0.spineChar:SetAction(arg_25_1, 0)
	arg_25_0:NorDirByFather()
end

function var_0_0.SetAsLastSibling(arg_26_0)
	arg_26_0._tf:SetAsLastSibling()
end

function var_0_0.MoveToFurniture(arg_27_0, arg_27_1)
	local var_27_0 = arg_27_1[1]
	local var_27_1 = arg_27_1[2]

	var_27_0:Lock()

	for iter_27_0, iter_27_1 in ipairs(var_27_1) do
		arg_27_0.path[iter_27_1.x][iter_27_1.y]:Lock()
	end

	arg_27_0:MoveByPath(var_27_1, function()
		arg_27_0:InterActionFurniture(var_27_0)
	end)
end

function var_0_0.UpdateNameAndTagDir(arg_29_0, arg_29_1)
	local var_29_0 = 1 / arg_29_0.scale * arg_29_1

	if arg_29_0.nameTF then
		arg_29_0.nameTF.localScale = Vector3(var_29_0, 1 / arg_29_0.scale, 1)
	end

	if arg_29_0.isCommander and arg_29_0.tagTF then
		arg_29_0.tagTF.localScale = Vector3(var_29_0, 1 / arg_29_0.scale, 1)
	end
end

function var_0_0.UpdateShipDir(arg_30_0, arg_30_1)
	arg_30_0._tf.localScale = Vector3(arg_30_1 * arg_30_0.scale, arg_30_0.scale, arg_30_0.scale)

	arg_30_0:UpdateNameAndTagDir(arg_30_1)
end

function var_0_0.NorDirByFather(arg_31_0)
	local var_31_0 = arg_31_0._tf.localScale.x < 0 and -1 or 1

	arg_31_0:UpdateNameAndTagDir(var_31_0)
end

function var_0_0.InterActionFurniture(arg_32_0, arg_32_1)
	setParent(arg_32_0._tf, arg_32_1._tf)

	local var_32_0 = arg_32_1:GetInteractionDir()

	arg_32_0:UpdateShipDir(var_32_0)

	local var_32_1 = arg_32_1:GetInterActionPos()

	arg_32_0._tf.anchoredPosition = var_32_1

	local var_32_2 = arg_32_1:GetInterActionMode()
	local var_32_3

	if GuildDynamicFurniture.INTERACTION_MODE_SIT == var_32_2 then
		var_32_3 = "sit"
	end

	assert(var_32_3)
	arg_32_0:SetAction(var_32_3)
	arg_32_0:UpdateShipDir(var_32_0)
	arg_32_0:CancelInterAction(arg_32_1)
end

function var_0_0.CancelInterAction(arg_33_0, arg_33_1)
	local var_33_0 = math.random(15, 30)

	arg_33_0.interActionTimer = Timer.New(function()
		arg_33_0.interActionTimer:Stop()

		arg_33_0.interActionTimer = nil

		arg_33_1:Unlock()
		setParent(arg_33_0._tf, arg_33_0.parent)
		assert(arg_33_0.grid)
		arg_33_0:SetPosition(arg_33_0.grid, true)
		arg_33_0:NorDirByFather()
		arg_33_0:AddRandomMove()
	end, var_33_0, 1)

	arg_33_0.interActionTimer:Start()
end

function var_0_0.MoveByPath(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = {}

	for iter_35_0, iter_35_1 in ipairs(arg_35_1) do
		table.insert(var_35_0, function(arg_36_0)
			if arg_35_0.exited then
				return
			end

			local var_36_0 = arg_35_0.path[iter_35_1.x][iter_35_1.y]

			arg_35_0:MoveNext(var_36_0, true, arg_36_0)
		end)
	end

	seriesAsync(var_35_0, arg_35_2)
end

function var_0_0.SearchPoint(arg_37_0, arg_37_1, arg_37_2)
	local function var_37_0(arg_38_0, arg_38_1, arg_38_2, arg_38_3)
		if _.any(arg_38_0, function(arg_39_0)
			return arg_38_2 == arg_39_0.point
		end) or _.any(arg_38_1, function(arg_40_0)
			return arg_38_2 == arg_40_0
		end) then
			return false
		end

		if arg_37_0.path[arg_38_2.x] then
			local var_38_0 = arg_37_0.path[arg_38_2.x][arg_38_2.y]

			return var_38_0 and var_38_0:CanWalk()
		end

		return false
	end

	local function var_37_1(arg_41_0)
		local var_41_0 = {}

		table.insert(var_41_0, Vector2(arg_41_0.x + 1, arg_41_0.y))
		table.insert(var_41_0, Vector2(arg_41_0.x - 1, arg_41_0.y))
		table.insert(var_41_0, Vector2(arg_41_0.x, arg_41_0.y + 1))
		table.insert(var_41_0, Vector2(arg_41_0.x, arg_41_0.y - 1))

		return var_41_0
	end

	local function var_37_2(arg_42_0, arg_42_1, arg_42_2)
		return math.abs(arg_42_2.x - arg_42_0.x) + math.abs(arg_42_2.y - arg_42_0.y) < math.abs(arg_42_2.x - arg_42_1.x) + math.abs(arg_42_2.y - arg_42_1.y)
	end

	local var_37_3 = {}
	local var_37_4 = {}
	local var_37_5 = {}
	local var_37_6

	table.insert(var_37_3, {
		parent = 0,
		point = arg_37_1
	})

	while #var_37_3 > 0 do
		local var_37_7 = table.remove(var_37_3, 1)
		local var_37_8 = var_37_7.point

		if var_37_8 == arg_37_2 then
			var_37_6 = var_37_7

			break
		end

		table.insert(var_37_4, var_37_8)

		for iter_37_0, iter_37_1 in ipairs(var_37_1(var_37_8)) do
			if var_37_0(var_37_3, var_37_4, iter_37_1, arg_37_2) then
				table.insert(var_37_3, {
					point = iter_37_1,
					parent = var_37_7
				})
			else
				if iter_37_1 == arg_37_2 then
					var_37_6 = var_37_7

					break
				end

				table.insert(var_37_4, iter_37_1)
			end
		end

		table.sort(var_37_3, function(arg_43_0, arg_43_1)
			return var_37_2(arg_43_0.point, arg_43_1.point, arg_37_2)
		end)
	end

	if var_37_6 then
		while var_37_6.parent ~= 0 do
			table.insert(var_37_5, 1, var_37_6.point)

			var_37_6 = var_37_6.parent
		end
	end

	return var_37_5
end

function var_0_0.CanInterAction(arg_44_0, arg_44_1)
	if arg_44_1 < math.random(1, 10000) then
		return false
	end

	local var_44_0 = {}

	for iter_44_0, iter_44_1 in ipairs(arg_44_0.furnitures) do
		if not iter_44_1:BeLock() then
			table.insert(var_44_0, iter_44_1)
		end
	end

	if #var_44_0 == 0 then
		return false
	end

	local var_44_1 = var_44_0[math.random(1, #var_44_0)]
	local var_44_2 = var_44_1:GetOccupyGrid()
	local var_44_3 = 999999
	local var_44_4
	local var_44_5 = arg_44_0.grid.position

	for iter_44_2, iter_44_3 in ipairs(var_44_2) do
		local var_44_6 = iter_44_3.position
		local var_44_7 = math.abs(var_44_5.x - var_44_6.x) + math.abs(var_44_5.y - var_44_6.y)

		if var_44_7 < var_44_3 then
			var_44_3 = var_44_7
			var_44_4 = var_44_6
		end
	end

	local var_44_8 = arg_44_0:SearchPoint(arg_44_0.grid.position, var_44_4)

	if not var_44_8 or #var_44_8 == 0 then
		return false
	end

	return true, {
		var_44_1,
		var_44_8
	}
end

function var_0_0.Dispose(arg_45_0)
	if arg_45_0.timer then
		arg_45_0.timer:Stop()

		arg_45_0.timer = nil
	end

	if arg_45_0.idleTimer then
		arg_45_0.idleTimer:Stop()

		arg_45_0.idleTimer = nil
	end

	if arg_45_0.interActionTimer then
		arg_45_0.interActionTimer:Stop()

		arg_45_0.interActionTimer = nil
	end

	if not IsNil(arg_45_0._go) and LeanTween.isTweening(arg_45_0._go) then
		LeanTween.cancel(arg_45_0._go)
	end

	if arg_45_0.spineChar then
		arg_45_0.spineChar:Dispose()

		arg_45_0.spineChar = nil
	end

	Destroy(arg_45_0.nameTF)

	if arg_45_0.isCommander then
		Destroy(arg_45_0.tagTF)
	end

	arg_45_0.actionName = nil

	arg_45_0:SetOnMoveCallBack()

	arg_45_0.exited = true
end

return var_0_0
