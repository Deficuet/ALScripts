ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleFormulas
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = Vector3.zero
local var_0_4 = var_0_2.OXY_STATE
local var_0_5 = var_0_2.BulletType
local var_0_6 = var_0_0.Battle.BattleAttr
local var_0_7 = class("BattleCldSystem")

var_0_0.Battle.BattleCldSystem = var_0_7
var_0_7.__name = "BattleCldSystem"

function var_0_7.Ctor(arg_1_0, arg_1_1)
	arg_1_0._proxy = arg_1_1

	arg_1_0:InitCldTree()

	arg_1_0._friendlyCode = arg_1_1:GetFriendlyCode()
	arg_1_0._foeCode = arg_1_1:GetFoeCode()
end

function var_0_7.Dispose(arg_2_0)
	arg_2_0._proxy = nil
	arg_2_0._shipTree = nil
	arg_2_0._foeShipTree = nil
	arg_2_0._aircraftTree = nil
	arg_2_0._surfaceBulletTree = nil
	arg_2_0._airBulletTree = nil
	arg_2_0._bulletTreeList = nil
	arg_2_0._foeSurafceBulletTree = nil
	arg_2_0._foeAirbulletTree = nil
	arg_2_0._foeBulleetTreeList = nil
	arg_2_0._surfaceAOETree = nil
	arg_2_0._airAOETree = nil
	arg_2_0._AOETreeList = nil
	arg_2_0._wallTree = nil
end

function var_0_7.InitCldTree(arg_3_0)
	local var_3_0, var_3_1, var_3_2, var_3_3 = arg_3_0._proxy:GetTotalBounds()
	local var_3_4 = Vector3(var_3_2, 0, var_3_1)
	local var_3_5 = Vector3(var_3_3, 0, var_3_0)

	arg_3_0._shipTree = pg.ColliderTree.New("shipTree", var_3_4, var_3_5, 2)
	arg_3_0._foeShipTree = pg.ColliderTree.New("foeShipTree", var_3_4, var_3_5, 2)
	arg_3_0._aircraftTree = pg.ColliderTree.New("aircraftTree", var_3_4, var_3_5, 2)
	arg_3_0._surfaceBulletTree = pg.ColliderTree.New("surfaceBullets", var_3_4, var_3_5, 4)
	arg_3_0._airBulletTree = pg.ColliderTree.New("airBullets", var_3_4, var_3_5, 3)
	arg_3_0._bulletTreeList = {}
	arg_3_0._bulletTreeList[var_0_2.BulletField.SURFACE] = arg_3_0._surfaceBulletTree
	arg_3_0._bulletTreeList[var_0_2.BulletField.AIR] = arg_3_0._airBulletTree
	arg_3_0._foeSurafceBulletTree = pg.ColliderTree.New("foeSurfaceBullets", var_3_4, var_3_5, 3)
	arg_3_0._foeAirbulletTree = pg.ColliderTree.New("foeAirBullets", var_3_4, var_3_5, 3)
	arg_3_0._foeBulleetTreeList = {}
	arg_3_0._foeBulleetTreeList[var_0_2.BulletField.SURFACE] = arg_3_0._foeSurafceBulletTree
	arg_3_0._foeBulleetTreeList[var_0_2.BulletField.AIR] = arg_3_0._foeAirbulletTree
	arg_3_0._surfaceAOETree = pg.ColliderTree.New("surfaceAOE", var_3_4, var_3_5, 2)
	arg_3_0._airAOETree = pg.ColliderTree.New("airAOE", var_3_4, var_3_5, 2)
	arg_3_0._bulletAOETree = pg.ColliderTree.New("bulletAOE", var_3_4, var_3_5, 2)
	arg_3_0._AOETreeList = {}
	arg_3_0._AOETreeList[var_0_2.AOEField.SURFACE] = arg_3_0._surfaceAOETree
	arg_3_0._AOETreeList[var_0_2.AOEField.AIR] = arg_3_0._airAOETree
	arg_3_0._AOETreeList[var_0_2.AOEField.BULLET] = arg_3_0._bulletAOETree
	arg_3_0._wallTree = pg.ColliderTree.New("wall", var_3_4, var_3_5, 2)
end

function var_0_7.UpdateShipCldTree(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetSpeed()
	local var_4_1 = arg_4_1:GetCldBox()
	local var_4_2
	local var_4_3 = not var_0_6.IsUnitCldImmune(arg_4_1)

	if arg_4_1:GetIFF() == arg_4_0._foeCode then
		if var_4_3 then
			if arg_4_1:GetCldData().FriendlyCld then
				local var_4_4 = arg_4_0._foeShipTree:GetCldList(var_4_1, var_4_0)

				arg_4_1:GetCldData().distList = {}

				if #var_4_4 > 1 then
					arg_4_0:HandleEnemyShipCld(var_4_4, arg_4_1)
				end
			end

			local var_4_5 = arg_4_0._shipTree:GetCldList(var_4_1, var_4_0)
			local var_4_6 = arg_4_0.surfaceFilterCount(arg_4_1, var_4_5)

			arg_4_0._proxy:HandleShipCrashDecelerate(arg_4_1, var_4_6)
			arg_4_0:HandlePlayerShipCld(var_4_5, arg_4_1)
		end

		var_4_2 = arg_4_0._foeShipTree
	elseif arg_4_1:GetIFF() == arg_4_0._friendlyCode then
		if var_4_3 then
			local var_4_7 = arg_4_0._foeShipTree:GetCldList(var_4_1, var_4_0)
			local var_4_8 = arg_4_0.surfaceFilterCount(arg_4_1, var_4_7)

			arg_4_0._proxy:HandleShipCrashDecelerate(arg_4_1, var_4_8)
		end

		var_4_2 = arg_4_0._shipTree
	end

	var_4_2:Update(var_4_1)
end

function var_0_7.HandlePlayerShipCld(arg_5_0, arg_5_1, arg_5_2)
	local var_5_0 = arg_5_2:GetCldData()

	if var_5_0.Active == false or var_5_0.ImmuneCLD == true then
		return
	end

	local var_5_1 = #arg_5_1
	local var_5_2 = {}

	for iter_5_0 = 1, var_5_1 do
		local var_5_3 = arg_5_1[iter_5_0].data

		if var_5_3.Active == false or var_5_3.ImmuneCLD == true then
			-- block empty
		elseif var_5_3.UID == arg_5_2:GetUniqueID() then
			-- block empty
		elseif var_5_0.IFF == var_5_3.IFF then
			-- block empty
		elseif var_5_0.Surface ~= var_5_3.Surface then
			-- block empty
		else
			var_5_2[#var_5_2 + 1] = var_5_3.UID
		end
	end

	arg_5_0._proxy:HandleShipCrashDamageList(arg_5_2, var_5_2)
end

function var_0_7.HandleEnemyShipCld(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_2:GetCldData()

	if var_6_0.Active == false or var_6_0.ImmuneCLD == true then
		return
	end

	local var_6_1 = arg_6_2:GetPosition()
	local var_6_2 = {}
	local var_6_3 = #arg_6_1

	for iter_6_0 = 1, var_6_3 do
		local var_6_4 = arg_6_1[iter_6_0].data

		if var_6_4.Active == false or var_6_4.ImmuneCLD == true then
			-- block empty
		elseif var_6_4.UID == arg_6_2:GetUniqueID() then
			-- block empty
		elseif var_6_0.IFF ~= var_6_4.IFF then
			-- block empty
		elseif not var_6_4.FriendlyCld then
			-- block empty
		elseif var_6_0.Surface ~= var_6_4.Surface then
			-- block empty
		else
			local var_6_5 = var_6_1 - arg_6_0:GetShip(var_6_4.UID):GetPosition()

			var_6_2[#var_6_2 + 1] = var_6_5
		end
	end

	var_6_0.distList = var_6_2
end

function var_0_7.surfaceFilterCount(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:GetCldData()
	local var_7_1 = 0
	local var_7_2 = #arg_7_1

	for iter_7_0 = 1, var_7_2 do
		local var_7_3 = arg_7_1[iter_7_0].data

		if var_7_3.Active == true and var_7_3.ImmuneCLD == false and var_7_3.UID ~= arg_7_0:GetUniqueID() and var_7_0.IFF ~= var_7_3.IFF and var_7_0.Surface == var_7_3.Surface then
			var_7_1 = var_7_1 + 1
		end
	end

	return var_7_1
end

function var_0_7.UpdateAircraftCld(arg_8_0, arg_8_1)
	local var_8_0 = arg_8_1:GetSpeed()
	local var_8_1 = arg_8_1:GetCldBox()
	local var_8_2

	if arg_8_1:GetIFF() == arg_8_0._foeCode then
		var_8_2 = arg_8_0:GetBulletTree(var_0_2.BulletField.AIR)
	elseif arg_8_1:GetIFF() == arg_8_0._friendlyCode then
		var_8_2 = arg_8_0:GetFoeBulletTree(var_0_2.BulletField.AIR)
	end

	local var_8_3 = var_8_2:GetCldList(var_8_1, var_8_0)

	arg_8_0:HandleBulletCldWithAircraft(var_8_3, arg_8_1)
	arg_8_0._aircraftTree:Update(arg_8_1:GetCldBox())
end

function var_0_7.HandleBulletCldWithAircraft(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = #arg_9_1

	for iter_9_0 = 1, var_9_0 do
		local var_9_1 = arg_9_1[iter_9_0].data

		if var_9_1.type == var_0_2.CldType.BULLET and var_9_1.Active == true and var_9_1.ImmuneCLD == false then
			local var_9_2 = arg_9_0:GetBullet(var_9_1.UID)

			arg_9_0._proxy:HandleBulletHit(var_9_2, arg_9_2)
		end
	end
end

function var_0_7.UpdateBulletCld(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:GetEffectField()
	local var_10_1 = arg_10_1:GetCldBox()
	local var_10_2 = arg_10_1:GetCldData().IFF
	local var_10_3
	local var_10_4

	if var_10_0 == var_0_2.BulletField.SURFACE then
		local var_10_5 = var_10_2 == arg_10_0._foeCode and arg_10_0._shipTree or arg_10_0._foeShipTree
		local var_10_6 = arg_10_0:getBulletCldShipList(arg_10_1, var_10_5)

		if arg_10_1:IsIndiscriminate() then
			local var_10_7 = var_10_5 == arg_10_0._shipTree and arg_10_0._foeShipTree or arg_10_0._shipTree
			local var_10_8 = arg_10_0:getBulletCldShipList(arg_10_1, var_10_7)

			for iter_10_0, iter_10_1 in ipairs(var_10_8) do
				table.insert(var_10_6, iter_10_1)
			end
		end

		arg_10_0:HandleBulletCldWithShip(var_10_6, arg_10_1)
	end

	if var_10_2 == arg_10_0._friendlyCode then
		var_10_3 = arg_10_0:GetBulletTree(var_10_0)
	elseif var_10_2 == arg_10_0._foeCode then
		var_10_3 = arg_10_0:GetFoeBulletTree(var_10_0)
	end

	var_10_3:Update(var_10_1)
end

function var_0_7.getBulletCldShipList(arg_11_0, arg_11_1, arg_11_2)
	local var_11_0 = arg_11_1:GetCldBox()
	local var_11_1

	if arg_11_1:GetType() == var_0_2.BulletType.SCALE then
		local var_11_2, var_11_3, var_11_4 = arg_11_1:GetRadian()

		if math.abs(var_11_3) ~= 1 then
			if arg_11_1:GetIFF() == -1 then
				var_11_2 = var_11_2 + math.pi
			end

			local var_11_5 = arg_11_1:GetBoxSize()
			local var_11_6 = var_11_5.x * 2
			local var_11_7 = var_11_5.z * 2
			local var_11_8 = arg_11_1:GetPosition()
			local var_11_9 = var_11_5.x
			local var_11_10 = var_11_9 * var_11_3
			local var_11_11 = var_11_9 * var_11_4
			local var_11_12 = Vector3(var_11_8.x + var_11_10, 1, var_11_8.z + var_11_11)

			var_11_1 = arg_11_2:GetCldListGradient(var_11_2, var_11_7, var_11_6, var_11_12)
		else
			var_11_1 = arg_11_2:GetCldList(var_11_0, var_0_3)
		end
	else
		var_11_1 = arg_11_2:GetCldList(var_11_0, var_0_3)
	end

	return var_11_1
end

function var_0_7.HandleBulletCldWithShip(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = #arg_12_1
	local var_12_1 = arg_12_2:GetType()

	for iter_12_0 = 1, var_12_0 do
		local var_12_2 = arg_12_1[iter_12_0].data

		if var_12_2.type == var_0_2.CldType.SHIP and var_12_2.Active == true and var_12_2.ImmuneCLD == false then
			local var_12_3 = arg_12_0:GetShip(var_12_2.UID)
			local var_12_4 = var_12_3:GetCurrentOxyState()
			local var_12_5 = var_12_3:IsImmuneCommonBulletCLD()

			if var_12_4 == var_0_4.DIVE and arg_12_2:GetCldData().Surface ~= var_0_2.OXY_STATE.DIVE then
				-- block empty
			elseif var_12_5 then
				-- block empty
			elseif arg_12_0._proxy:HandleBulletHit(arg_12_2, var_12_3) then
				break
			end
		end
	end
end

function var_0_7.UpdateAOECld(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:GetCldBox()
	local var_13_1 = arg_13_1:GetFieldType()
	local var_13_2 = arg_13_1:OpponentAffected()
	local var_13_3 = arg_13_1:GetCldData().IFF
	local var_13_4 = var_13_2 and var_13_3 * -1 or var_13_3
	local var_13_5

	if var_13_1 == var_0_2.AOEField.SURFACE then
		local var_13_6 = arg_13_1:GetCldData().IFF == arg_13_0._foeCode
		local var_13_7 = arg_13_1:OpponentAffected() == var_13_6 and arg_13_0._shipTree or arg_13_0._foeShipTree
		local var_13_8 = arg_13_0:getAreaCldShipList(arg_13_1, var_13_7)

		if arg_13_1:GetIndiscriminate() then
			local var_13_9 = var_13_7 == arg_13_0._shipTree and arg_13_0._foeShipTree or arg_13_0._shipTree
			local var_13_10 = arg_13_0:getAreaCldShipList(arg_13_1, var_13_9)

			for iter_13_0, iter_13_1 in ipairs(var_13_10) do
				table.insert(var_13_8, iter_13_1)
			end
		end

		arg_13_0:HandleAreaCldWithVehicle(arg_13_1, var_13_8)
	elseif var_13_1 == var_0_2.AOEField.BULLET then
		local var_13_11

		if var_13_4 == arg_13_0._foeCode then
			var_13_11 = arg_13_0._foeSurafceBulletTree
		else
			var_13_11 = arg_13_0._surfaceBulletTree
		end

		local var_13_12 = var_13_11:GetCldList(var_13_0, var_0_3)

		arg_13_1:ClearCLDList()
		arg_13_0:HandleAreaCldWithBullet(arg_13_1, var_13_12)
	else
		local var_13_13 = {}
		local var_13_14 = arg_13_0._aircraftTree:GetCldList(var_13_0, var_0_3)

		for iter_13_2, iter_13_3 in ipairs(var_13_14) do
			if iter_13_3.data.IFF == var_13_4 then
				table.insert(var_13_13, iter_13_3)
			end
		end

		arg_13_0:HandleAreaCldWithAircraft(arg_13_1, var_13_13)
	end
end

function var_0_7.getAreaCldShipList(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0

	if arg_14_1:GetAreaType() == var_0_2.AreaType.COLUMN or arg_14_1:GetAnchorPointAlignment() == Vector3.zero then
		local var_14_1 = arg_14_1:GetCldBox()

		var_14_0 = arg_14_2:GetCldList(var_14_1, var_0_3)
	else
		local var_14_2 = arg_14_1:GetCldData().IFF == arg_14_0._foeCode
		local var_14_3 = arg_14_1:GetAngle() * math.deg2Rad

		if var_14_2 then
			var_14_3 = var_14_3 + math.pi
		end

		local var_14_4 = arg_14_1:GetWidth()
		local var_14_5 = arg_14_1:GetHeight()
		local var_14_6 = arg_14_1:GetPosition()

		var_14_0 = arg_14_2:GetCldListGradient(var_14_3, var_14_5, var_14_4, var_14_6)
	end

	return var_14_0
end

function var_0_7.HandleAreaCldWithVehicle(arg_15_0, arg_15_1, arg_15_2)
	arg_15_1:ClearCLDList()

	local var_15_0 = arg_15_1:GetCldData()
	local var_15_1 = arg_15_1:OpponentAffected()
	local var_15_2 = #arg_15_2

	for iter_15_0 = 1, var_15_2 do
		local var_15_3 = arg_15_2[iter_15_0].data

		if var_15_3.Active == true and var_15_3.ImmuneCLD == false then
			local var_15_4 = arg_15_1:GetDiveFilter()
			local var_15_5 = arg_15_0:GetShip(var_15_3.UID)
			local var_15_6 = true

			if var_15_4 then
				local var_15_7 = var_15_5:GetCurrentOxyState()

				if table.contains(var_15_4, var_15_7) then
					var_15_6 = false
				end
			end

			if var_15_6 and not arg_15_1:IsOutOfAngle(var_15_5) then
				arg_15_1:AppendCldObj(var_15_3)
			end
		end
	end
end

function var_0_7.HandleAreaCldWithAircraft(arg_16_0, arg_16_1, arg_16_2)
	arg_16_1:ClearCLDList()

	local var_16_0 = arg_16_1:GetCldData()
	local var_16_1 = arg_16_1:OpponentAffected()
	local var_16_2 = #arg_16_2

	for iter_16_0 = 1, var_16_2 do
		local var_16_3 = arg_16_2[iter_16_0].data

		if var_16_1 == (var_16_3.IFF ~= var_16_0.IFF) then
			arg_16_1:AppendCldObj(var_16_3)
		end
	end
end

function var_0_7.HandleAreaCldWithBullet(arg_17_0, arg_17_1, arg_17_2)
	local var_17_0 = #arg_17_2

	for iter_17_0 = 1, var_17_0 do
		local var_17_1 = arg_17_2[iter_17_0].data

		arg_17_1:AppendCldObj(var_17_1)
	end
end

function var_0_7.UpdateWallCld(arg_18_0, arg_18_1)
	local var_18_0 = arg_18_1:GetCldBox()
	local var_18_1 = arg_18_1:GetCldObjType()

	if var_18_1 == arg_18_1.CLD_OBJ_TYPE_BULLET then
		local var_18_2

		if arg_18_1:GetIFF() == arg_18_0._friendlyCode then
			var_18_2 = arg_18_0._foeSurafceBulletTree:GetCldList(var_18_0, var_0_3)
		else
			var_18_2 = arg_18_0._surfaceBulletTree:GetCldList(var_18_0, var_0_3)
		end

		arg_18_0:HandleWallCldWithBullet(arg_18_1, var_18_2)
	elseif var_18_1 == arg_18_1.CLD_OBJ_TYPE_SHIP then
		local var_18_3

		if arg_18_1:GetIFF() == arg_18_0._friendlyCode then
			var_18_3 = arg_18_0._foeShipTree:GetCldList(var_18_0, var_0_3)
		else
			var_18_3 = arg_18_0._shipTree:GetCldList(var_18_0, var_0_3)
		end

		arg_18_0:HandleWllCldWithShip(arg_18_1, var_18_3)
	end
end

function var_0_7.HandleWallCldWithBullet(arg_19_0, arg_19_1, arg_19_2)
	local var_19_0 = #arg_19_2

	for iter_19_0 = 1, var_19_0 do
		local var_19_1 = arg_19_2[iter_19_0].data

		if var_19_1.type == var_0_2.CldType.BULLET and var_19_1.Active == true and var_19_1.ImmuneCLD == false then
			local var_19_2 = arg_19_0:GetBullet(var_19_1.UID)

			if not arg_19_0._proxy:HandleWallHitByBullet(arg_19_1, var_19_2) then
				return
			end
		end
	end
end

function var_0_7.HandleWllCldWithShip(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = #arg_20_2
	local var_20_1 = {}

	for iter_20_0 = 1, var_20_0 do
		local var_20_2 = arg_20_2[iter_20_0].data

		if var_20_2.type == var_0_2.CldType.SHIP and var_20_2.Active == true and var_20_2.ImmuneCLD == false then
			local var_20_3 = arg_20_0:GetShip(var_20_2.UID)

			if var_20_3:GetCurrentOxyState() == var_0_4.DIVE then
				-- block empty
			else
				table.insert(var_20_1, var_20_3)
			end
		end
	end

	arg_20_0._proxy:HandleWallHitByShip(arg_20_1, var_20_1)
end

function var_0_7.InsertToBulletCldTree(arg_21_0, arg_21_1, arg_21_2)
	local var_21_0
	local var_21_1 = arg_21_2:GetCldData()

	if var_21_1.IFF == arg_21_0._foeCode then
		var_21_0 = arg_21_0:GetFoeBulletTree(arg_21_1)
	elseif var_21_1.IFF == arg_21_0._friendlyCode then
		var_21_0 = arg_21_0:GetBulletTree(arg_21_1)
	end

	local var_21_2 = arg_21_2:GetCldBox()

	var_21_0:Insert(var_21_2)
end

function var_0_7.InsertToAOECldTree(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0:GetAOETree(arg_22_1)
	local var_22_1 = arg_22_2:GetCldBox()

	var_22_0:Insert(var_22_1)
end

function var_0_7.InsertToWallCldTree(arg_23_0, arg_23_1)
	local var_23_0 = arg_23_0:GetWallTree()
	local var_23_1 = arg_23_1:GetCldBox()

	var_23_0:Insert(var_23_1)
end

function var_0_7.InsertToShipCldTree(arg_24_0, arg_24_1)
	local var_24_0 = arg_24_1:GetCldData()
	local var_24_1

	if var_24_0.IFF == arg_24_0._foeCode then
		var_24_1 = arg_24_0:GetFoeShipTree()
	elseif var_24_0.IFF == arg_24_0._friendlyCode then
		var_24_1 = arg_24_0:GetShipTree()
	end

	local var_24_2 = arg_24_1:GetCldBox()

	var_24_1:Insert(var_24_2)
end

function var_0_7.InsertToAircraftCldTree(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_1:GetCldBox()

	arg_25_0._aircraftTree:Insert(var_25_0)
end

function var_0_7.GetBulletTree(arg_26_0, arg_26_1)
	return arg_26_0._bulletTreeList[arg_26_1]
end

function var_0_7.GetFoeBulletTree(arg_27_0, arg_27_1)
	return arg_27_0._foeBulleetTreeList[arg_27_1]
end

function var_0_7.GetAOETree(arg_28_0, arg_28_1)
	return arg_28_0._AOETreeList[arg_28_1]
end

function var_0_7.GetWallTree(arg_29_0, arg_29_1)
	return arg_29_0._wallTree
end

function var_0_7.GetShipTree(arg_30_0)
	return arg_30_0._shipTree
end

function var_0_7.GetFoeShipTree(arg_31_0)
	return arg_31_0._foeShipTree
end

function var_0_7.GetAircraftTree(arg_32_0)
	return arg_32_0._aircraftTree
end

function var_0_7.DeleteShipLeaf(arg_33_0, arg_33_1)
	local var_33_0 = arg_33_1:GetCldData().IFF

	if var_33_0 == arg_33_0._foeCode then
		arg_33_0.DeleteCldLeaf(arg_33_0:GetFoeShipTree(), arg_33_1)
	elseif var_33_0 == arg_33_0._friendlyCode then
		arg_33_0.DeleteCldLeaf(arg_33_0:GetShipTree(), arg_33_1)
	end
end

function var_0_7.DeleteBulletLeaf(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_1:GetCldData().IFF

	if var_34_0 == arg_34_0._foeCode then
		arg_34_0.DeleteCldLeaf(arg_34_0:GetFoeBulletTree(arg_34_1:GetEffectField()), arg_34_1)
	elseif var_34_0 == arg_34_0._friendlyCode then
		arg_34_0.DeleteCldLeaf(arg_34_0:GetBulletTree(arg_34_1:GetEffectField()), arg_34_1)
	end
end

function var_0_7.DeleteCldLeaf(arg_35_0, arg_35_1)
	local var_35_0 = arg_35_1:GetCldBox()

	arg_35_0:Remove(var_35_0)
end

function var_0_7.GetShip(arg_36_0, arg_36_1)
	return arg_36_0._proxy:GetUnitList()[arg_36_1]
end

function var_0_7.GetAircraft(arg_37_0, arg_37_1)
	return arg_37_0._proxy:GetAircraftList()[arg_37_1]
end

function var_0_7.GetBullet(arg_38_0, arg_38_1)
	return arg_38_0._proxy:GetBulletList()[arg_38_1]
end

function var_0_7.GetAOE(arg_39_0, arg_39_1)
	return arg_39_0._proxy:GetAOEList()[arg_39_1]
end

function var_0_7.InitShipCld(arg_40_0, arg_40_1)
	arg_40_0:InsertToShipCldTree(arg_40_1)
end

function var_0_7.DeleteShipCld(arg_41_0, arg_41_1)
	arg_41_1:DeactiveCldBox()
	arg_41_0:DeleteShipLeaf(arg_41_1)
end

function var_0_7.InitAircraftCld(arg_42_0, arg_42_1)
	arg_42_0:InsertToAircraftCldTree(arg_42_1)
end

function var_0_7.DeleteAircraftCld(arg_43_0, arg_43_1)
	arg_43_1:DeactiveCldBox()
	arg_43_0.DeleteCldLeaf(arg_43_0:GetAircraftTree(), arg_43_1)
end

function var_0_7.InitBulletCld(arg_44_0, arg_44_1)
	arg_44_0:InsertToBulletCldTree(arg_44_1:GetEffectField(), arg_44_1)
end

function var_0_7.DeleteBulletCld(arg_45_0, arg_45_1)
	arg_45_1:DeactiveCldBox()
	arg_45_0:DeleteBulletLeaf(arg_45_1)
end

function var_0_7.ShiftBulletCld(arg_46_0, arg_46_1)
	return
end

function var_0_7.InitAOECld(arg_47_0, arg_47_1)
	arg_47_0:InsertToAOECldTree(arg_47_1:GetFieldType(), arg_47_1)
end

function var_0_7.DeleteAOECld(arg_48_0, arg_48_1)
	arg_48_1:DeactiveCldBox()
	arg_48_0.DeleteCldLeaf(arg_48_0:GetAOETree(arg_48_1:GetFieldType()), arg_48_1)
end

function var_0_7.InitWallCld(arg_49_0, arg_49_1)
	arg_49_0:InsertToWallCldTree(arg_49_1)
end

function var_0_7.DeleteWallCld(arg_50_0, arg_50_1)
	arg_50_1:DeactiveCldBox()

	local var_50_0 = arg_50_0:GetWallTree()

	if var_50_0 then
		arg_50_0.DeleteCldLeaf(var_50_0, arg_50_1)
	end
end
