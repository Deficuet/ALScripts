local var_0_0 = class("ReversePacmanRoleControl")
local var_0_1 = 0.12
local var_0_2 = 0.05
local var_0_3 = 1
local var_0_4 = 0.15
local var_0_5 = 1.4
local var_0_6 = 0.9
local var_0_7 = 0.2
local var_0_8 = 0.04
local var_0_9 = 1
local var_0_10 = 1

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.binder = arg_1_1
	arg_1_0._tf = arg_1_2
	arg_1_0._tpls = arg_1_0._tf:Find("tpls")
	arg_1_0.container = arg_1_0._tf:Find("map/roles")
end

function var_0_0.SetUp(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	arg_2_0.shipIds = arg_2_1
	arg_2_0.map = arg_2_2
	arg_2_0.gameEnded = false
	arg_2_0.gameTime = 0
	arg_2_0.graphVersion = 0
	arg_2_0.monsterVersion = 0
	arg_2_0.shipMoveVersion = 0
	arg_2_0.monsterMoveVersion = 0
	arg_2_0.nearestTargetCache = {}
	arg_2_0.monsterThreatFieldCache = nil
	arg_2_0.shipTriggerStates = {}
	arg_2_0.aliveMonsterCacheVersion = -1
	arg_2_0.aliveMonsterCache = nil
	arg_2_0.lastShipPerformanceEmitTime = nil
	arg_2_0.eduBuffCnt = arg_2_3

	local var_2_0 = pg.activity_chasing_skill[ReversePacmanConst.BUFF_EDU].param

	arg_2_0.eduBuffMul = math.pow(tonumber(var_2_0), arg_2_0.eduBuffCnt)
	arg_2_0.ships = {}

	for iter_2_0, iter_2_1 in ipairs(arg_2_0.map:GetDeployPoints()) do
		local var_2_1 = arg_2_0.shipIds[iter_2_0]

		if var_2_1 and var_2_1 ~= 0 then
			local var_2_2 = cloneTplTo(arg_2_0._tpls:Find("ship"), arg_2_0.container, "ship_" .. iter_2_0 .. "_" .. var_2_1)

			setLocalPosition(var_2_2, arg_2_0.map:GetLocalPosInMap(iter_2_1.x, iter_2_1.y))

			local var_2_3 = ReversePacmanRole.New(arg_2_0.binder, var_2_2, {
				type = ReversePacmanConst.ROLE.SHIP,
				id = var_2_1,
				nodeId = arg_2_0.map:GetNodeIdByPos(iter_2_1.x, iter_2_1.y),
				eduBuffMul = arg_2_0.eduBuffMul
			})

			table.insert(arg_2_0.ships, var_2_3)
		end
	end

	arg_2_0.monsters = {}

	for iter_2_2, iter_2_3 in ipairs(arg_2_0.map:GetSpawnPoints()) do
		local var_2_4 = iter_2_3.monsterConfigId
		local var_2_5 = cloneTplTo(arg_2_0._tpls:Find("monster"), arg_2_0.container, "monister_" .. iter_2_2 .. "_" .. var_2_4)

		setLocalPosition(var_2_5, arg_2_0.map:GetLocalPosInMap(iter_2_3.x, iter_2_3.y))

		local var_2_6 = ReversePacmanRole.New(arg_2_0.binder, var_2_5, {
			type = ReversePacmanConst.ROLE.MONSTER,
			id = var_2_4,
			nodeId = arg_2_0.map:GetNodeIdByPos(iter_2_3.x, iter_2_3.y)
		})

		table.insert(arg_2_0.monsters, var_2_6)
	end

	if not arg_2_0._graphChangedListenerAdded then
		arg_2_0._graphChangedListenerAdded = true

		arg_2_0.binder:bind(ReversePacmanConst.EVENT.GRAPH_CHANGED, function()
			arg_2_0.graphVersion = (arg_2_0.graphVersion or 0) + 1
			arg_2_0.aliveMonsterCacheVersion = -1
			arg_2_0.aliveMonsterCache = nil
			arg_2_0.monsterThreatFieldCache = nil

			for iter_3_0, iter_3_1 in ipairs(arg_2_0.ships) do
				iter_3_1:RequestReplan()
			end

			for iter_3_2, iter_3_3 in ipairs(arg_2_0.monsters) do
				iter_3_3:RequestReplan()
			end
		end)
	end
end

function var_0_0.SetGameEnded(arg_4_0, arg_4_1)
	arg_4_0.gameEnded = arg_4_1 and true or false
end

function var_0_0.GetShipTriggerState(arg_5_0, arg_5_1)
	arg_5_0.shipTriggerStates = arg_5_0.shipTriggerStates or {}
	arg_5_0.shipTriggerStates[arg_5_1] = arg_5_0.shipTriggerStates[arg_5_1] or {}

	return arg_5_0.shipTriggerStates[arg_5_1]
end

function var_0_0.GetAliveMonsters(arg_6_0)
	if arg_6_0.aliveMonsterCacheVersion == arg_6_0.monsterVersion and arg_6_0.aliveMonsterCache then
		return arg_6_0.aliveMonsterCache
	end

	local var_6_0 = {}

	for iter_6_0, iter_6_1 in ipairs(arg_6_0.monsters) do
		if iter_6_1:IsAlive() then
			var_6_0[#var_6_0 + 1] = iter_6_1
		end
	end

	arg_6_0.aliveMonsterCacheVersion = arg_6_0.monsterVersion
	arg_6_0.aliveMonsterCache = var_6_0

	return var_6_0
end

function var_0_0.FindNearestTarget(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4, arg_7_5)
	local var_7_0 = arg_7_0.nearestTargetCache[arg_7_1]

	if var_7_0 and var_7_0.nodeId == arg_7_1.nodeId and var_7_0.graphVersion == (arg_7_3 or 0) and var_7_0.targetMoveVersion == (arg_7_4 or 0) and var_7_0.targetDeathVersion == (arg_7_5 or 0) and var_7_0.target and var_7_0.target:IsAlive() and var_7_0.target.nodeId then
		return var_7_0.target
	end

	local var_7_1 = arg_7_0.map and arg_7_0.map:GetRouteGraph()

	if not var_7_1 then
		return nil
	end

	local var_7_2 = arg_7_1.nodeId
	local var_7_3 = var_7_1:GetDistanceField(var_7_2)
	local var_7_4
	local var_7_5

	for iter_7_0, iter_7_1 in ipairs(arg_7_2) do
		if iter_7_1:IsAlive() then
			local var_7_6 = iter_7_1.nodeId

			if var_7_6 then
				local var_7_7 = var_7_3[var_7_6]

				if var_7_7 and (not var_7_5 or var_7_7 < var_7_5) then
					var_7_5 = var_7_7
					var_7_4 = iter_7_1
				end
			end
		end
	end

	arg_7_0.nearestTargetCache[arg_7_1] = {
		nodeId = arg_7_1.nodeId,
		graphVersion = arg_7_3 or 0,
		targetMoveVersion = arg_7_4 or 0,
		targetDeathVersion = arg_7_5 or 0,
		target = var_7_4
	}

	return var_7_4
end

function var_0_0.Update(arg_8_0, arg_8_1)
	if not arg_8_0.map or arg_8_0.gameEnded then
		return
	end

	arg_8_0.gameTime = (arg_8_0.gameTime or 0) + arg_8_1

	local var_8_0 = arg_8_0:GetAliveMonsters()
	local var_8_1 = arg_8_0.map:GetCanPickBuffs()

	for iter_8_0, iter_8_1 in ipairs(arg_8_0.monsters) do
		if arg_8_0.gameEnded then
			return
		end

		if iter_8_1:IsAlive() then
			iter_8_1:Update(arg_8_1)

			local var_8_2 = iter_8_1.nodeId

			if iter_8_1:NeedResetPath() or arg_8_0:IsMonsterNextStepClaimed(iter_8_1) then
				local var_8_3 = arg_8_0:GetScoreMaxPath(iter_8_1)

				iter_8_1:SetPath(var_8_3)
			end

			iter_8_1:MoveAlongPath(arg_8_1, arg_8_0.map)

			if iter_8_1.nodeId ~= var_8_2 then
				arg_8_0.monsterMoveVersion = (arg_8_0.monsterMoveVersion or 0) + 1
			end
		end
	end

	for iter_8_2, iter_8_3 in ipairs(arg_8_0.ships) do
		if arg_8_0.gameEnded then
			return
		end

		if iter_8_3:IsAlive() then
			iter_8_3:Update(arg_8_1)

			local var_8_4 = iter_8_3.nodeId

			if iter_8_3:NeedResetPath() then
				local var_8_5 = arg_8_0:FindNearestTarget(iter_8_3, var_8_0, arg_8_0.graphVersion, arg_8_0.monsterMoveVersion, arg_8_0.monsterVersion)

				if var_8_5 then
					local var_8_6 = arg_8_0:GetScoreMaxPath(iter_8_3, var_8_5)

					iter_8_3:SetPath(var_8_6)
				end
			end

			iter_8_3:MoveAlongPath(arg_8_1, arg_8_0.map)

			if iter_8_3.nodeId ~= var_8_4 then
				arg_8_0.shipMoveVersion = (arg_8_0.shipMoveVersion or 0) + 1
			end

			if arg_8_0.gameEnded then
				return
			end

			arg_8_0:UpdateShipPerformanceTriggers(iter_8_3, var_8_0)

			if arg_8_0.gameEnded then
				return
			end

			for iter_8_4, iter_8_5 in ipairs(var_8_0) do
				if arg_8_0.gameEnded then
					return
				end

				if iter_8_5:IsAlive() and arg_8_0:IsCatchable(iter_8_3, iter_8_5) then
					iter_8_5:Kill()

					arg_8_0.monsterVersion = (arg_8_0.monsterVersion or 0) + 1
					arg_8_0.aliveMonsterCacheVersion = -1
					arg_8_0.aliveMonsterCache = nil

					arg_8_0:EmitShipPerformance(iter_8_3, iter_8_5, ReversePacmanConst.SHIP_PERFORMANCE_TYPE.CAPTURE)
					arg_8_0.binder:emit(ReversePacmanConst.EVENT.CAPTURE, {
						ship = iter_8_3,
						monster = iter_8_5
					})

					if arg_8_0.gameEnded then
						return
					end
				end
			end

			for iter_8_6, iter_8_7 in ipairs(var_8_1) do
				if arg_8_0.gameEnded then
					return
				end

				if arg_8_0:IsPickBuff(iter_8_3, iter_8_7) then
					iter_8_3:AddBuff(iter_8_7.id)
					arg_8_0.binder:emit(ReversePacmanConst.EVENT.PICK, {
						ship = iter_8_3,
						buff = iter_8_7
					})

					if arg_8_0.gameEnded then
						return
					end
				end
			end
		end
	end
end

function var_0_0.UpdateShipPerformanceTriggers(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_0:GetShipTriggerState(arg_9_1)
	local var_9_1 = var_9_0.cachedPerformanceTarget
	local var_9_2
	local var_9_3

	if var_9_1 and var_9_1.nodeId == arg_9_1.nodeId and var_9_1.pathIndex == arg_9_1.pathIndex and var_9_1.graphVersion == arg_9_0.graphVersion and var_9_1.monsterMoveVersion == arg_9_0.monsterMoveVersion and var_9_1.monsterDeathVersion == arg_9_0.monsterVersion and var_9_1.target and var_9_1.target:IsAlive() then
		var_9_2 = var_9_1.target
		var_9_3 = var_9_1.dist
	else
		var_9_2, var_9_3 = arg_9_0:FindNearestAliveMonsterByDistance(arg_9_1, arg_9_2)
	end

	if not var_9_2 then
		var_9_0.nearMonster = nil
		var_9_0.farMonster = nil

		return
	end

	if var_9_3 <= arg_9_1:GetPerformanceRange(ReversePacmanConst.SHIP_PERFORMANCE_TYPE.NEAR) then
		if var_9_0.nearMonster ~= var_9_2 then
			var_9_0.nearMonster = var_9_2

			if arg_9_0:CanEmitShipPerformance(var_9_0, ReversePacmanConst.SHIP_PERFORMANCE_TYPE.NEAR) then
				var_9_0.lastEmitTime = var_9_0.lastEmitTime or {}
				var_9_0.lastEmitTime[ReversePacmanConst.SHIP_PERFORMANCE_TYPE.NEAR] = arg_9_0.gameTime

				arg_9_0:EmitShipPerformance(arg_9_1, var_9_2, ReversePacmanConst.SHIP_PERFORMANCE_TYPE.NEAR)
			end
		end
	else
		var_9_0.nearMonster = nil
	end

	if var_9_3 >= arg_9_1:GetPerformanceRange(ReversePacmanConst.SHIP_PERFORMANCE_TYPE.FAR) then
		if var_9_0.farMonster ~= var_9_2 then
			var_9_0.farMonster = var_9_2

			if arg_9_0:CanEmitShipPerformance(var_9_0, ReversePacmanConst.SHIP_PERFORMANCE_TYPE.FAR) then
				var_9_0.lastEmitTime = var_9_0.lastEmitTime or {}
				var_9_0.lastEmitTime[ReversePacmanConst.SHIP_PERFORMANCE_TYPE.FAR] = arg_9_0.gameTime

				arg_9_0:EmitShipPerformance(arg_9_1, var_9_2, ReversePacmanConst.SHIP_PERFORMANCE_TYPE.FAR)
			end
		end
	else
		var_9_0.farMonster = nil
	end

	var_9_0.cachedPerformanceTarget = {
		nodeId = arg_9_1.nodeId,
		pathIndex = arg_9_1.pathIndex,
		graphVersion = arg_9_0.graphVersion,
		monsterMoveVersion = arg_9_0.monsterMoveVersion,
		monsterDeathVersion = arg_9_0.monsterVersion,
		target = var_9_2,
		dist = var_9_3
	}
end

function var_0_0.CanEmitShipPerformance(arg_10_0, arg_10_1, arg_10_2)
	arg_10_1.lastEmitTime = arg_10_1.lastEmitTime or {}

	local var_10_0 = arg_10_1.lastEmitTime[arg_10_2]
	local var_10_1 = arg_10_0.lastShipPerformanceEmitTime

	if not var_10_0 then
		return not var_10_1 or arg_10_0.gameTime - var_10_1 >= ReversePacmanConst.SHIP_PERFORMANCE_GLOBAL_COOLDOWN
	end

	if arg_10_0.gameTime - var_10_0 < ReversePacmanConst.SHIP_PERFORMANCE_COOLDOWN then
		return false
	end

	return not var_10_1 or arg_10_0.gameTime - var_10_1 >= ReversePacmanConst.SHIP_PERFORMANCE_GLOBAL_COOLDOWN
end

function var_0_0.FindNearestAliveMonsterByDistance(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0
	local var_11_1
	local var_11_2 = arg_11_2 or arg_11_0.monsters

	for iter_11_0, iter_11_1 in ipairs(var_11_2) do
		if iter_11_1:IsAlive() then
			local var_11_3 = arg_11_0:GetDistance(arg_11_1, iter_11_1)

			if not var_11_1 or var_11_3 < var_11_1 then
				var_11_1 = var_11_3
				var_11_0 = iter_11_1
			end
		end
	end

	return var_11_0, var_11_1
end

function var_0_0.EmitShipPerformance(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	arg_12_0.lastShipPerformanceEmitTime = arg_12_0.gameTime

	arg_12_0.binder:emit(ReversePacmanConst.EVENT.SHIP_PERFORMANCE, {
		type = arg_12_3,
		ship = arg_12_1,
		monster = arg_12_2,
		shipId = arg_12_1.id,
		monsterId = arg_12_2 and arg_12_2.id or nil,
		distance = arg_12_2 and arg_12_0:GetDistance(arg_12_1, arg_12_2) or nil
	})
end

function var_0_0.CheckGameEnd(arg_13_0)
	local var_13_0 = arg_13_0.map and arg_13_0.map:GetRouteGraph()

	return underscore.all(arg_13_0.monsters, function(arg_14_0)
		return not arg_14_0:IsAlive() or arg_13_0:IsMonsterTrapped(arg_14_0, var_13_0)
	end)
end

function var_0_0.GetAliveMonsterCnt(arg_15_0)
	local var_15_0 = 0

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.monsters) do
		if iter_15_1:IsAlive() then
			var_15_0 = var_15_0 + 1
		end
	end

	return var_15_0
end

function var_0_0.GetCapturedMonsterCnt(arg_16_0)
	return #arg_16_0.monsters - arg_16_0:GetAliveMonsterCnt()
end

function var_0_0.GetMonsterCnt(arg_17_0)
	return #arg_17_0.monsters
end

function var_0_0.GetShipCnt(arg_18_0)
	return #arg_18_0.ships
end

function var_0_0.GetAliveShipCnt(arg_19_0)
	local var_19_0 = 0

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.ships) do
		if iter_19_1:IsAlive() then
			var_19_0 = var_19_0 + 1
		end
	end

	return var_19_0
end

function var_0_0.IsCellOccupied(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0.map:GetNodeIdByPos(arg_20_1.x, arg_20_1.y)

	if not var_20_0 then
		return false
	end

	return arg_20_0:IsNodeOccupied(var_20_0)
end

function var_0_0.IsNodeOccupied(arg_21_0, arg_21_1)
	for iter_21_0, iter_21_1 in ipairs(arg_21_0.ships) do
		if iter_21_1:IsAlive() and iter_21_1:IsOccupyingNode(arg_21_1) then
			return true
		end
	end

	for iter_21_2, iter_21_3 in ipairs(arg_21_0.monsters) do
		if iter_21_3:IsAlive() and iter_21_3:IsOccupyingNode(arg_21_1) then
			return true
		end
	end

	return false
end

function var_0_0.CheckAllMonstersTrapped(arg_22_0)
	local var_22_0 = arg_22_0.map and arg_22_0.map:GetRouteGraph()

	if not var_22_0 or arg_22_0:GetAliveMonsterCnt() <= 0 or arg_22_0:GetAliveShipCnt() <= 0 then
		return false
	end

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.monsters) do
		if iter_22_1:IsAlive() and not arg_22_0:IsMonsterTrapped(iter_22_1, var_22_0) then
			return false
		end
	end

	return true
end

function var_0_0.IsMonsterTrapped(arg_23_0, arg_23_1, arg_23_2)
	if not arg_23_1 or not arg_23_1.nodeId or not arg_23_2 then
		return false
	end

	local var_23_0 = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.ships) do
		if iter_23_1:IsAlive() and iter_23_1.nodeId then
			var_23_0[iter_23_1.nodeId] = true
		end
	end

	local var_23_1 = {}
	local var_23_2 = {
		arg_23_1.nodeId
	}
	local var_23_3 = 1

	var_23_1[arg_23_1.nodeId] = true

	local var_23_4 = 0

	while var_23_2[var_23_3] do
		local var_23_5 = var_23_2[var_23_3]

		var_23_3 = var_23_3 + 1
		var_23_4 = var_23_4 + 1

		if var_23_0[var_23_5] then
			return false
		end

		for iter_23_2, iter_23_3 in ipairs(arg_23_2:GetNeighbors(var_23_5)) do
			if not var_23_1[iter_23_3] then
				var_23_1[iter_23_3] = true
				var_23_2[#var_23_2 + 1] = iter_23_3
			end
		end
	end

	local var_23_6 = #(arg_23_2.nodes or {})

	return var_23_4 <= math.max(ReversePacmanConst.MONSTER_TRAP_MIN_COMPONENT_NODES, math.ceil(var_23_6 * ReversePacmanConst.MONSTER_TRAP_COMPONENT_RATIO))
end

function var_0_0.GetScoreMaxPath(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.map:GetRouteGraph()

	if not var_24_0 or not arg_24_1 or not arg_24_1.nodeId then
		return {
			arg_24_1 and arg_24_1.nodeId
		}
	end

	local var_24_1 = var_24_0:GetNodeById(arg_24_1.nodeId)

	if not var_24_1 then
		return {
			arg_24_1.nodeId
		}
	end

	if arg_24_0:IsEscapeMode(arg_24_1) then
		return arg_24_0:BuildEscapePath(var_24_0, arg_24_1.nodeId, arg_24_1) or {
			arg_24_1.nodeId
		}
	end

	if not arg_24_2 or not arg_24_2.nodeId then
		return {
			arg_24_1.nodeId
		}
	end

	local var_24_2 = var_24_0:GetNodeById(arg_24_2.nodeId)

	if not var_24_2 then
		return {
			arg_24_1.nodeId
		}
	end

	local var_24_3 = arg_24_1._prevNodeId
	local var_24_4 = {}

	for iter_24_0, iter_24_1 in ipairs(var_24_1.neighbors) do
		if iter_24_1 ~= var_24_3 then
			var_24_4[#var_24_4 + 1] = iter_24_1
		end
	end

	if #var_24_4 == 0 then
		var_24_4 = var_24_1.neighbors
	end

	local var_24_5
	local var_24_6 = -math.huge

	for iter_24_2, iter_24_3 in ipairs(var_24_4) do
		local var_24_7, var_24_8 = arg_24_0:GetScore(iter_24_3, arg_24_1, arg_24_2, var_24_0)
		local var_24_9 = var_24_7 - var_24_8

		if var_24_6 < var_24_9 then
			var_24_6 = var_24_9
			var_24_5 = iter_24_3
		end
	end

	if not var_24_5 then
		return {
			arg_24_1.nodeId
		}
	end

	return var_24_0:FindPath(var_24_5, var_24_2.id) or {
		arg_24_1.nodeId
	}
end

function var_0_0.IsEscapeMode(arg_25_0, arg_25_1)
	return (arg_25_1:GetConfig("ai_target_weight") or 0) < 0
end

local function var_0_11(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	if not arg_26_2 or arg_26_1[arg_26_2] or not arg_26_3:GetNodeById(arg_26_2) or arg_26_3:IsBuffBlockById(arg_26_2) then
		return
	end

	arg_26_1[arg_26_2] = true
	arg_26_0[#arg_26_0 + 1] = arg_26_2
end

function var_0_0.GetMonsterThreatDistanceField(arg_27_0, arg_27_1)
	local var_27_0 = {}
	local var_27_1 = {}

	for iter_27_0, iter_27_1 in ipairs(arg_27_0.ships) do
		if iter_27_1:IsAlive() then
			var_0_11(var_27_0, var_27_1, iter_27_1.nodeId, arg_27_1)

			local var_27_2 = iter_27_1.path and iter_27_1.path[iter_27_1.pathIndex]

			var_0_11(var_27_0, var_27_1, var_27_2, arg_27_1)
		end
	end

	local var_27_3 = (arg_27_0.graphVersion or 0) .. ":" .. table.concat(var_27_0, ",")
	local var_27_4 = arg_27_0.monsterThreatFieldCache

	if var_27_4 and var_27_4.signature == var_27_3 then
		return var_27_4.dist
	end

	local var_27_5 = {}
	local var_27_6 = {}

	for iter_27_2, iter_27_3 in ipairs(var_27_0) do
		var_27_5[iter_27_3] = 0
		var_27_6[#var_27_6 + 1] = iter_27_3
	end

	local var_27_7 = 1

	while var_27_6[var_27_7] do
		local var_27_8 = var_27_6[var_27_7]

		var_27_7 = var_27_7 + 1

		local var_27_9 = var_27_5[var_27_8] + 1

		for iter_27_4, iter_27_5 in ipairs(arg_27_1:GetNeighbors(var_27_8)) do
			if var_27_5[iter_27_5] == nil then
				var_27_5[iter_27_5] = var_27_9
				var_27_6[#var_27_6 + 1] = iter_27_5
			end
		end
	end

	arg_27_0.monsterThreatFieldCache = {
		signature = var_27_3,
		dist = var_27_5
	}

	return var_27_5
end

function var_0_0.IsMonsterNextStepClaimed(arg_28_0, arg_28_1)
	if not arg_28_1 or not arg_28_1.path then
		return false
	end

	local var_28_0 = arg_28_1.path[arg_28_1.pathIndex]

	if not var_28_0 or var_28_0 == arg_28_1.nodeId then
		return false
	end

	local var_28_1 = arg_28_0.map and arg_28_0.map:GetRouteGraph()

	if not var_28_1 then
		return false
	end

	return arg_28_0:GetMonsterThreatDistanceField(var_28_1)[var_28_0] == 0
end

function var_0_0.AnalyzeMonsterEscapeBranch(arg_29_0, arg_29_1, arg_29_2, arg_29_3)
	local var_29_0 = {
		[arg_29_2] = true,
		[arg_29_3] = true
	}
	local var_29_1 = {
		[arg_29_3] = arg_29_2
	}
	local var_29_2 = {
		arg_29_3
	}
	local var_29_3 = 1
	local var_29_4 = 0
	local var_29_5 = false

	while var_29_2[var_29_3] do
		local var_29_6 = var_29_2[var_29_3]

		var_29_3 = var_29_3 + 1
		var_29_4 = var_29_4 + 1

		for iter_29_0, iter_29_1 in ipairs(arg_29_1:GetNeighbors(var_29_6)) do
			if iter_29_1 == arg_29_2 then
				if var_29_6 ~= arg_29_3 then
					var_29_5 = true
				end
			elseif not var_29_0[iter_29_1] then
				var_29_0[iter_29_1] = true
				var_29_1[iter_29_1] = var_29_6
				var_29_2[#var_29_2 + 1] = iter_29_1
			elseif var_29_1[var_29_6] ~= iter_29_1 then
				var_29_5 = true
			end
		end
	end

	return var_29_4, var_29_5
end

function var_0_0.GetMonsterTerrainScore(arg_30_0, arg_30_1, arg_30_2)
	if not arg_30_2 then
		return 0
	end

	local var_30_0 = 0

	if arg_30_2.tag == ReversePacmanConst.TAG.CORRIDOR then
		var_30_0 = arg_30_1:GetConfig("ai_terrain2_weight") or 0
	elseif arg_30_2.tag == ReversePacmanConst.TAG.CORNER then
		var_30_0 = arg_30_1:GetConfig("ai_terrain3_weight") or 0
	elseif arg_30_2.tag == ReversePacmanConst.TAG.JUNCTION then
		var_30_0 = arg_30_1:GetConfig("ai_terrain1_weight") or 0
	end

	return var_30_0 * var_0_1
end

function var_0_0.GetMonsterRandomScore(arg_31_0, arg_31_1)
	local var_31_0 = arg_31_1:GetConfig("ai_random_weight")

	if not var_31_0 or var_31_0[1] == nil or var_31_0[2] == nil or var_31_0[1] > var_31_0[2] then
		return 0
	end

	local var_31_1 = math.ceil(var_31_0[1])
	local var_31_2 = math.floor(var_31_0[2])

	if var_31_2 < var_31_1 then
		return 0
	end

	return math.random(var_31_1, var_31_2) * var_0_2
end

local function var_0_12(arg_32_0, arg_32_1)
	arg_32_0[#arg_32_0 + 1] = arg_32_1

	local var_32_0 = #arg_32_0

	while var_32_0 > 1 do
		local var_32_1 = math.floor(var_32_0 / 2)
		local var_32_2 = arg_32_0[var_32_1]

		if not (arg_32_1.bottleneck > var_32_2.bottleneck or arg_32_1.bottleneck == var_32_2.bottleneck and arg_32_1.length < var_32_2.length) then
			break
		end

		arg_32_0[var_32_0] = var_32_2
		var_32_0 = var_32_1
	end

	arg_32_0[var_32_0] = arg_32_1
end

local function var_0_13(arg_33_0)
	local var_33_0 = arg_33_0[1]
	local var_33_1 = table.remove(arg_33_0)

	if #arg_33_0 == 0 then
		return var_33_0
	end

	local var_33_2 = 1

	while true do
		local var_33_3 = var_33_2 * 2

		if var_33_3 > #arg_33_0 then
			break
		end

		local var_33_4 = var_33_3 + 1
		local var_33_5 = var_33_3

		if var_33_4 <= #arg_33_0 then
			local var_33_6 = arg_33_0[var_33_3]
			local var_33_7 = arg_33_0[var_33_4]

			if var_33_7.bottleneck > var_33_6.bottleneck or var_33_7.bottleneck == var_33_6.bottleneck and var_33_7.length < var_33_6.length then
				var_33_5 = var_33_4
			end
		end

		local var_33_8 = arg_33_0[var_33_5]

		if var_33_1.bottleneck > var_33_8.bottleneck or var_33_1.bottleneck == var_33_8.bottleneck and var_33_1.length <= var_33_8.length then
			break
		end

		arg_33_0[var_33_2] = var_33_8
		var_33_2 = var_33_5
	end

	arg_33_0[var_33_2] = var_33_1

	return var_33_0
end

function var_0_0.GetMonsterFirstStepScore(arg_34_0, arg_34_1, arg_34_2, arg_34_3, arg_34_4)
	local var_34_0 = (arg_34_4:GetConfig("ai_deadend_weight") or 0) * var_0_4
	local var_34_1, var_34_2 = arg_34_0:AnalyzeMonsterEscapeBranch(arg_34_1, arg_34_2, arg_34_3)
	local var_34_3 = math.min(var_34_1, 32) / 32 * var_0_9

	if not var_34_2 then
		var_34_3 = var_34_3 - var_34_0 * (1 + 8 / math.max(3, var_34_1 + 2))
	end

	local var_34_4 = var_34_3 + arg_34_0:GetMonsterTerrainScore(arg_34_4, arg_34_1:GetNodeById(arg_34_3)) + arg_34_0:GetMonsterRandomScore(arg_34_4)

	if arg_34_3 == arg_34_4._prevNodeId then
		var_34_4 = var_34_4 - var_0_3
	end

	return var_34_4
end

function var_0_0.BuildEscapePath(arg_35_0, arg_35_1, arg_35_2, arg_35_3)
	local var_35_0 = arg_35_1:GetNeighbors(arg_35_2)

	if #var_35_0 == 0 then
		return {
			arg_35_2
		}
	end

	local var_35_1 = math.max(1, arg_35_1.height * arg_35_1.width)
	local var_35_2 = arg_35_0:GetMonsterThreatDistanceField(arg_35_1)

	local function var_35_3(arg_36_0)
		return var_35_2[arg_36_0] or var_35_1
	end

	local var_35_4 = {}

	for iter_35_0, iter_35_1 in ipairs(var_35_0) do
		var_35_4[iter_35_1] = arg_35_0:GetMonsterFirstStepScore(arg_35_1, arg_35_2, iter_35_1, arg_35_3)
	end

	local var_35_5 = {
		[arg_35_2] = var_35_3(arg_35_2)
	}
	local var_35_6 = {
		[arg_35_2] = 0
	}
	local var_35_7 = {}
	local var_35_8 = {}
	local var_35_9 = {}

	var_0_12(var_35_9, {
		length = 0,
		nodeId = arg_35_2,
		bottleneck = var_35_5[arg_35_2]
	})

	while #var_35_9 > 0 do
		local var_35_10 = var_0_13(var_35_9)
		local var_35_11 = var_35_10.nodeId

		if var_35_10.bottleneck == var_35_5[var_35_11] and var_35_10.length == var_35_6[var_35_11] then
			for iter_35_2, iter_35_3 in ipairs(arg_35_1:GetNeighbors(var_35_11)) do
				local var_35_12 = var_35_3(iter_35_3)

				if var_35_12 > 0 then
					local var_35_13 = math.min(var_35_10.bottleneck, var_35_12)
					local var_35_14 = var_35_10.length + 1
					local var_35_15 = var_35_5[iter_35_3]
					local var_35_16 = var_35_6[iter_35_3]

					if var_35_15 == nil or var_35_15 < var_35_13 or var_35_13 == var_35_15 and var_35_14 < var_35_16 then
						var_35_5[iter_35_3] = var_35_13
						var_35_6[iter_35_3] = var_35_14
						var_35_7[iter_35_3] = var_35_11
						var_35_8[iter_35_3] = var_35_11 == arg_35_2 and iter_35_3 or var_35_8[var_35_11]

						var_0_12(var_35_9, {
							nodeId = iter_35_3,
							bottleneck = var_35_13,
							length = var_35_14
						})
					end
				end
			end
		end
	end

	local var_35_17 = math.abs(arg_35_3:GetConfig("ai_target_weight") or 0)
	local var_35_18 = 1 + math.min(1, var_35_17 / 10)
	local var_35_19 = (arg_35_3:GetConfig("ai_deadend_weight") or 0) * var_0_4
	local var_35_20
	local var_35_21

	for iter_35_4, iter_35_5 in pairs(var_35_5) do
		if iter_35_4 ~= arg_35_2 then
			local var_35_22 = arg_35_1:GetNodeById(iter_35_4)
			local var_35_23 = var_35_8[iter_35_4]
			local var_35_24 = iter_35_5 * var_35_18 * var_0_5 + var_35_3(iter_35_4) * var_0_6 + (var_35_22 and var_35_22.degree or 0) * var_0_7 + (var_35_4[var_35_23] or 0) - var_35_6[iter_35_4] * var_0_8

			if var_35_22 and var_35_22.degree <= 1 then
				var_35_24 = var_35_24 - var_35_19
			end

			if iter_35_4 == arg_35_3._escapeDestinationNodeId then
				var_35_24 = var_35_24 + var_0_10
			end

			if not var_35_21 or var_35_21 < var_35_24 then
				var_35_21 = var_35_24
				var_35_20 = iter_35_4
			end
		end
	end

	if not var_35_20 then
		local var_35_25
		local var_35_26

		for iter_35_6, iter_35_7 in ipairs(var_35_0) do
			local var_35_27 = var_35_3(iter_35_7) * 100 + (var_35_4[iter_35_7] or 0)

			if not var_35_26 or var_35_26 < var_35_27 then
				var_35_26 = var_35_27
				var_35_25 = iter_35_7
			end
		end

		return var_35_25 and {
			arg_35_2,
			var_35_25
		} or {
			arg_35_2
		}
	end

	local var_35_28 = {}
	local var_35_29 = var_35_20

	while var_35_29 do
		table.insert(var_35_28, 1, var_35_29)

		if var_35_29 == arg_35_2 then
			break
		end

		var_35_29 = var_35_7[var_35_29]
	end

	if var_35_28[1] ~= arg_35_2 or #var_35_28 < 2 then
		return {
			arg_35_2,
			var_35_0[1]
		}
	end

	arg_35_3._escapeDestinationNodeId = var_35_20

	return var_35_28
end

function var_0_0.GetProximityValue(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	if not arg_37_3 then
		return 0
	end

	local var_37_0 = arg_37_1.height * arg_37_1.width
	local var_37_1 = arg_37_1:GetDistanceById(arg_37_2, arg_37_3)

	if not var_37_1 then
		return 0
	end

	return 1 - (var_37_1 + 1) / var_37_0
end

function var_0_0.GetProximityScore(arg_38_0, arg_38_1, arg_38_2, arg_38_3, arg_38_4)
	if not arg_38_4 or arg_38_4 == 0 then
		return 0
	end

	return arg_38_0:GetProximityValue(arg_38_1, arg_38_2, arg_38_3) * arg_38_4
end

function var_0_0.GetScore(arg_39_0, arg_39_1, arg_39_2, arg_39_3, arg_39_4)
	local var_39_0 = 0
	local var_39_1 = 0

	local function var_39_2(arg_40_0, arg_40_1)
		if not arg_40_1 or arg_40_1 == 0 then
			return
		end

		local var_40_0 = arg_39_0:GetProximityValue(arg_39_4, arg_39_1, arg_40_0)

		if arg_40_1 >= 0 then
			var_39_0 = var_39_0 + var_40_0 * arg_40_1
		else
			var_39_1 = var_39_1 + var_40_0 * -arg_40_1
		end
	end

	local function var_39_3(arg_41_0, arg_41_1)
		if not arg_41_1 or arg_41_1 == 0 then
			return
		end

		if arg_41_1 >= 0 then
			if arg_41_0 then
				var_39_0 = var_39_0 + arg_41_1
			end
		elseif arg_41_0 then
			var_39_1 = var_39_1 + -arg_41_1
		end
	end

	var_39_2(arg_39_3.nodeId, arg_39_2:GetConfig("ai_target_weight"))

	local var_39_4 = arg_39_2:GetConfig("predict_offset") or 0

	var_39_2(arg_39_3:GetPredictNodeId(var_39_4), arg_39_2:GetConfig("ai_predict_weight"))
	var_39_2(arg_39_3:GetInterceptNodeId(var_39_4), arg_39_2:GetConfig("ai_intercept_weight"))

	local var_39_5 = arg_39_4:IsReachable(arg_39_1, arg_39_3.nodeId)

	var_39_3(var_39_5, arg_39_2:GetConfig("ai_deadend_weight"))
	var_39_2(arg_39_0:FindNearestBuff(arg_39_1), arg_39_2:GetConfig("ai_pickup_weight"))

	local var_39_6 = arg_39_4:GetNodeById(arg_39_1).tag

	var_39_3(var_39_6 == ReversePacmanConst.TAG.CORRIDOR, arg_39_2:GetConfig("ai_terrain2_weight"))
	var_39_3(var_39_6 == ReversePacmanConst.TAG.CORNER, arg_39_2:GetConfig("ai_terrain3_weight"))
	var_39_3(var_39_6 == ReversePacmanConst.TAG.JUNCTION, arg_39_2:GetConfig("ai_terrain1_weight"))

	local var_39_7 = arg_39_2:GetConfig("ai_random_weight")
	local var_39_8 = 0

	if var_39_7 and var_39_7[1] and var_39_7[2] and var_39_7[1] <= var_39_7[2] then
		var_39_8 = math.random(var_39_7[1], var_39_7[2]) * 0.1
	end

	return var_39_0 + var_39_8, var_39_1
end

function var_0_0.FindNearestBuff(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.map and arg_42_0.map:GetRouteGraph()

	if not var_42_0 then
		return nil
	end

	local var_42_1 = var_42_0:GetDistanceField(arg_42_1)
	local var_42_2
	local var_42_3

	for iter_42_0, iter_42_1 in ipairs(arg_42_0.map:GetCanPickBuffs()) do
		local var_42_4 = var_42_0:GetNodeByPos(iter_42_1.cell.x, iter_42_1.cell.y)

		if var_42_4 then
			local var_42_5 = var_42_1[var_42_4.id]

			if var_42_5 and (not var_42_3 or var_42_5 < var_42_3) then
				var_42_3 = var_42_5
				var_42_2 = var_42_4.id
			end
		end
	end

	return var_42_2
end

function var_0_0.IsCatchable(arg_43_0, arg_43_1, arg_43_2)
	return arg_43_0:GetDistance(arg_43_1, arg_43_2) <= arg_43_1:GetCaptureRadius() + arg_43_2:GetCaptureRadius()
end

function var_0_0.GetDistance(arg_44_0, arg_44_1, arg_44_2)
	local var_44_0 = arg_44_1.x - arg_44_2.x
	local var_44_1 = arg_44_1.y - arg_44_2.y

	return math.sqrt(var_44_0 * var_44_0 + var_44_1 * var_44_1)
end

function var_0_0.IsPickBuff(arg_45_0, arg_45_1, arg_45_2)
	return arg_45_0:GetDistance(arg_45_1, arg_45_2) <= arg_45_1:GetCaptureRadius() + ReversePacmanConst.GRID_SIZE.x / 2
end

function var_0_0.Hide(arg_46_0)
	for iter_46_0, iter_46_1 in ipairs(arg_46_0.ships) do
		iter_46_1:Hide()
	end

	for iter_46_2, iter_46_3 in ipairs(arg_46_0.monsters) do
		iter_46_3:Hide()
	end
end

function var_0_0.Dispose(arg_47_0)
	for iter_47_0, iter_47_1 in ipairs(arg_47_0.ships) do
		iter_47_1:Dispose()
	end

	for iter_47_2, iter_47_3 in ipairs(arg_47_0.monsters) do
		iter_47_3:Dispose()
	end

	arg_47_0.nearestTargetCache = nil
	arg_47_0.shipTriggerStates = nil
	arg_47_0.aliveMonsterCache = nil
	arg_47_0.aliveMonsterCacheVersion = nil
end

return var_0_0
