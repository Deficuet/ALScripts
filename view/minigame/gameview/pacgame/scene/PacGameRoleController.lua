local var_0_0 = class("PacGameRoleController")

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2, arg_1_3)
	arg_1_0._sceneMask = arg_1_1
	arg_1_0._event = arg_1_2
	arg_1_0._runningData = arg_1_3
	arg_1_0._content = findTF(arg_1_0._sceneMask, "sceneContainer/scene/content/map")
end

function var_0_0.SetParent(arg_2_0)
	return
end

function var_0_0.SetPosition(arg_3_0)
	return
end

function var_0_0.SetScale(arg_4_0)
	return
end

function var_0_0.Prepare(arg_5_0)
	local var_5_0 = arg_5_0._runningData:GetConfig("player")
	local var_5_1 = arg_5_0._runningData:GetConfig("enemy")

	arg_5_0._player = arg_5_0:createRole(var_5_0, false)
	arg_5_0._enemys = arg_5_0:createRoles(var_5_1, true)

	arg_5_0._player:SetPlayer(true)
	arg_5_0._runningData:SetPlayer(arg_5_0._player)
	arg_5_0._runningData:SetEnemys(arg_5_0._enemys)

	local var_5_2 = arg_5_0._runningData:GetMapConfig("player_start")
	local var_5_3 = arg_5_0._runningData:GetMapConfig("enemy_start")

	arg_5_0:setRolePosWithIndex(arg_5_0._player, var_5_2, true)
	arg_5_0:setRolesPosWithIndex(arg_5_0._enemys, var_5_3, true)
end

function var_0_0.Start(arg_6_0)
	return
end

function var_0_0.Step(arg_7_0, arg_7_1)
	arg_7_0._player:Step(arg_7_1)

	for iter_7_0, iter_7_1 in ipairs(arg_7_0._enemys) do
		iter_7_1:Step(arg_7_1)
	end

	arg_7_0:updatePlayerDirect()
end

function var_0_0.Clear(arg_8_0)
	if arg_8_0._player then
		arg_8_0._player:Dispose()

		arg_8_0._player = nil
	end

	if arg_8_0._enemys then
		for iter_8_0, iter_8_1 in ipairs(arg_8_0._enemys) do
			iter_8_1:Dispose()
		end

		arg_8_0._enemys = {}
	end

	arg_8_0._runningData:SetPlayer(nil)
	arg_8_0._runningData:SetEnemys({})
end

function var_0_0.Stop(arg_9_0)
	return
end

function var_0_0.Resume(arg_10_0)
	return
end

function var_0_0.Dispose(arg_11_0)
	return
end

function var_0_0.updatePlayerDirect(arg_12_0)
	local var_12_0 = arg_12_0._runningData:GetJoyData()
	local var_12_1 = var_12_0.x
	local var_12_2 = var_12_0.y

	if math.abs(var_12_1) - math.abs(var_12_2) >= 0.3 then
		var_12_2 = 0
	elseif math.abs(var_12_1) - math.abs(var_12_2) <= -0.3 then
		var_12_1 = 0
	end

	local var_12_3 = math.sign(var_12_1)
	local var_12_4 = math.sign(var_12_2)

	arg_12_0._player:SetDirect({
		var_12_3,
		var_12_4
	})
end

function var_0_0.setRolePosWithIndex(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_0._runningData:GetPosByIndex(arg_13_2)

	arg_13_1:SetPosition(var_13_0)
	arg_13_1:SetActive(arg_13_3)
	arg_13_1:SetGridIndex(arg_13_2)
	arg_13_1:SetStartIndex(arg_13_2)
end

function var_0_0.setRolesPosWithIndex(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	for iter_14_0 = 1, #arg_14_1 do
		arg_14_0:setRolePosWithIndex(arg_14_1[iter_14_0], arg_14_2[iter_14_0], arg_14_3)
	end
end

function var_0_0.createRole(arg_15_0, arg_15_1)
	local var_15_0 = PacGameConst.role_data[arg_15_1]
	local var_15_1 = var_15_0.prefab
	local var_15_2 = arg_15_0._runningData:GetTplItemFromPool(var_15_1, arg_15_0._content)

	return (PacGameRole.New(var_15_2, var_15_0))
end

function var_0_0.createRoles(arg_16_0, arg_16_1)
	local var_16_0 = {}

	for iter_16_0 = 1, #arg_16_1 do
		local var_16_1 = arg_16_0:createRole(arg_16_1[iter_16_0])

		table.insert(var_16_0, var_16_1)
	end

	return var_16_0
end

return var_0_0
