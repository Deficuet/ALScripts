ys = ys or {}

local var_0_0 = ys
local var_0_1 = var_0_0.Battle.BattleDataFunction
local var_0_2 = var_0_0.Battle.BattleConst
local var_0_3 = var_0_0.Battle.BattleConfig
local var_0_4 = require("Mgr/Pool/PoolUtil")
local var_0_5 = singletonClass("BattleResourceManager")

var_0_0.Battle.BattleResourceManager = var_0_5
var_0_5.__name = "BattleResourceManager"

function var_0_5.Ctor(arg_1_0)
	arg_1_0.rotateScriptMap = setmetatable({}, {
		__mode = "kv"
	})
end

function var_0_5.Init(arg_2_0)
	arg_2_0._preloadList = {}
	arg_2_0._resCacheList = {}
	arg_2_0._allPool = {}
	arg_2_0._ob2Pool = {}

	local var_2_0 = GameObject()

	var_2_0:SetActive(false)

	var_2_0.name = "PoolRoot"
	var_2_0.transform.position = Vector3(-10000, -10000, 0)
	arg_2_0._poolRoot = var_2_0
	arg_2_0._bulletContainer = GameObject("BulletContainer")
	arg_2_0._battleCVList = {}
end

function var_0_5.Clear(arg_3_0)
	for iter_3_0, iter_3_1 in pairs(arg_3_0._allPool) do
		iter_3_1:Dispose()
	end

	for iter_3_2, iter_3_3 in pairs(arg_3_0._resCacheList) do
		if string.find(iter_3_2, "Char/") then
			var_0_5.ClearCharRes(iter_3_2, iter_3_3)
		elseif string.find(iter_3_2, "painting/") then
			var_0_5.ClearPaintingRes(iter_3_2, iter_3_3)
		else
			var_0_4.Destroy(iter_3_3)
		end
	end

	arg_3_0._resCacheList = {}
	arg_3_0._ob2Pool = {}
	arg_3_0._allPool = {}

	Object.Destroy(arg_3_0._poolRoot)

	arg_3_0._poolRoot = nil

	Object.Destroy(arg_3_0._bulletContainer)

	arg_3_0._bulletContainer = nil
	arg_3_0.rotateScriptMap = setmetatable({}, {
		__mode = "kv"
	})

	for iter_3_4, iter_3_5 in pairs(arg_3_0._battleCVList) do
		pg.CriMgr.UnloadCVBank(iter_3_5)
	end

	arg_3_0._battleCVList = {}

	var_0_0.Battle.BattleDataFunction.ClearConvertedBarrage()
end

function var_0_5.GetBulletPath(arg_4_0)
	return "Item/" .. arg_4_0
end

function var_0_5.GetOrbitPath(arg_5_0)
	return "orbit/" .. arg_5_0
end

function var_0_5.GetCharacterPath(arg_6_0)
	return "Char/" .. arg_6_0
end

function var_0_5.GetCharacterGoPath(arg_7_0)
	return "chargo/" .. arg_7_0
end

function var_0_5.GetAircraftIconPath(arg_8_0)
	return "AircraftIcon/" .. arg_8_0
end

function var_0_5.GetFXPath(arg_9_0)
	return "Effect/" .. arg_9_0
end

function var_0_5.GetPaintingPath(arg_10_0)
	return "painting/" .. arg_10_0
end

function var_0_5.GetHrzIcon(arg_11_0)
	return "herohrzicon/" .. arg_11_0
end

function var_0_5.GetSquareIcon(arg_12_0)
	return "squareicon/" .. arg_12_0
end

function var_0_5.GetQIcon(arg_13_0)
	return "qicon/" .. arg_13_0
end

function var_0_5.GetCommanderHrzIconPath(arg_14_0)
	return "commanderhrz/" .. arg_14_0
end

function var_0_5.GetCommanderIconPath(arg_15_0)
	return "commandericon/" .. arg_15_0
end

function var_0_5.GetShipTypeIconPath(arg_16_0)
	return "shiptype/" .. arg_16_0
end

function var_0_5.GetMapPath(arg_17_0)
	return "Map/" .. arg_17_0
end

function var_0_5.GetUIPath(arg_18_0)
	return "UI/" .. arg_18_0
end

function var_0_5.GetResName(arg_19_0)
	local var_19_0 = arg_19_0
	local var_19_1 = string.find(var_19_0, "%/")

	while var_19_1 do
		var_19_0 = string.sub(var_19_0, var_19_1 + 1)
		var_19_1 = string.find(var_19_0, "%/")
	end

	return var_19_0
end

function var_0_5.ClearCharRes(arg_20_0, arg_20_1)
	local var_20_0 = var_0_5.GetResName(arg_20_0)
	local var_20_1 = arg_20_1:GetComponent("SkeletonRenderer").skeletonDataAsset

	if not PoolMgr.GetInstance():IsSpineSkelCached(var_20_0) then
		UIUtil.ClearSharedMaterial(arg_20_1)
	end

	var_0_4.Destroy(arg_20_1)
end

function var_0_5.ClearPaintingRes(arg_21_0, arg_21_1)
	local var_21_0 = var_0_5.GetResName(arg_21_0)

	PoolMgr.GetInstance():ReturnPainting(var_0_5.GetPaintingName(var_21_0), arg_21_1)
end

function var_0_5.DestroyOb(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_0._ob2Pool[arg_22_1]

	if var_22_0 then
		var_22_0:Recycle(arg_22_1)
	else
		var_0_4.Destroy(arg_22_1)
	end
end

function var_0_5.popPool(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_1:GetObject()

	if not arg_23_2 then
		var_23_0.transform.parent = nil
	end

	arg_23_0._ob2Pool[var_23_0] = arg_23_1

	return var_23_0
end

function var_0_5.InstCharacter(arg_24_0, arg_24_1, arg_24_2)
	local var_24_0 = arg_24_0.GetCharacterPath(arg_24_1)
	local var_24_1 = arg_24_0._allPool[var_24_0]

	if var_24_1 then
		local var_24_2 = arg_24_0:popPool(var_24_1)

		arg_24_2(var_24_2)
	elseif arg_24_0._resCacheList[var_24_0] ~= nil then
		arg_24_0:InitPool(var_24_0, arg_24_0._resCacheList[var_24_0])

		var_24_1 = arg_24_0._allPool[var_24_0]

		local var_24_3 = arg_24_0:popPool(var_24_1)

		arg_24_2(var_24_3)
	else
		arg_24_0:LoadSpineAsset(arg_24_1, function(arg_25_0)
			if not arg_24_0._poolRoot then
				var_0_5.ClearCharRes(var_24_0, arg_25_0)

				return
			end

			assert(arg_25_0, "角色资源加载失败：" .. arg_24_1)

			local var_25_0 = SpineAnim.AnimChar(arg_24_1, arg_25_0)

			var_25_0:SetActive(false)
			arg_24_0:InitPool(var_24_0, var_25_0)

			var_24_1 = arg_24_0._allPool[var_24_0]

			local var_25_1 = arg_24_0:popPool(var_24_1)

			arg_24_2(var_25_1)
		end)
	end
end

function var_0_5.LoadSpineAsset(arg_26_0, arg_26_1, arg_26_2)
	local var_26_0 = arg_26_0.GetCharacterPath(arg_26_1)

	if not PoolMgr.GetInstance():IsSpineSkelCached(arg_26_1) then
		ResourceMgr.Inst:getAssetAsync(var_26_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_27_0)
			arg_26_2(arg_27_0)
		end), true, true)
	else
		PoolMgr.GetInstance():GetSpineSkel(arg_26_1, true, arg_26_2)
	end
end

function var_0_5.InstAirCharacter(arg_28_0, arg_28_1, arg_28_2)
	local var_28_0 = arg_28_0.GetCharacterGoPath(arg_28_1)
	local var_28_1 = arg_28_0._allPool[var_28_0]

	if var_28_1 then
		local var_28_2 = arg_28_0:popPool(var_28_1)

		arg_28_2(var_28_2)
	elseif arg_28_0._resCacheList[var_28_0] ~= nil then
		arg_28_0:InitPool(var_28_0, arg_28_0._resCacheList[var_28_0])

		var_28_1 = arg_28_0._allPool[var_28_0]

		local var_28_3 = arg_28_0:popPool(var_28_1)

		arg_28_2(var_28_3)
	else
		ResourceMgr.Inst:getAssetAsync(var_28_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_29_0)
			if not arg_28_0._poolRoot then
				var_0_4.Destroy(arg_29_0)

				return
			else
				assert(arg_29_0, "飞机资源加载失败：" .. arg_28_1)
				arg_28_0:InitPool(var_28_0, arg_29_0)

				var_28_1 = arg_28_0._allPool[var_28_0]

				local var_29_0 = arg_28_0:popPool(var_28_1)

				arg_28_2(var_29_0)
			end
		end), true, true)
	end
end

function var_0_5.InstBullet(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0.GetBulletPath(arg_30_1)
	local var_30_1 = arg_30_0._allPool[var_30_0]

	if var_30_1 then
		local var_30_2 = arg_30_0:popPool(var_30_1, true)

		if string.find(arg_30_1, "_trail") then
			local var_30_3 = var_30_2:GetComponentInChildren(typeof(UnityEngine.TrailRenderer))

			if var_30_3 then
				var_30_3:Clear()
			end
		end

		arg_30_2(var_30_2)

		return true
	elseif arg_30_0._resCacheList[var_30_0] ~= nil then
		arg_30_0:InitPool(var_30_0, arg_30_0._resCacheList[var_30_0])

		var_30_1 = arg_30_0._allPool[var_30_0]

		local var_30_4 = arg_30_0:popPool(var_30_1, true)

		if string.find(arg_30_1, "_trail") then
			local var_30_5 = var_30_4:GetComponentInChildren(typeof(UnityEngine.TrailRenderer))

			if var_30_5 then
				var_30_5:Clear()
			end
		end

		arg_30_2(var_30_4)

		return true
	else
		ResourceMgr.Inst:getAssetAsync(var_30_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_31_0)
			if arg_30_0._poolRoot then
				var_0_4.Destroy(arg_31_0)

				return
			else
				assert(arg_31_0, "子弹资源加载失败：" .. arg_30_1)
				arg_30_0:InitPool(var_30_0, arg_31_0)

				var_30_1 = arg_30_0._allPool[var_30_0]

				local var_31_0 = arg_30_0:popPool(var_30_1, true)

				arg_30_2(var_31_0)
			end
		end), true, true)

		return false
	end
end

function var_0_5.InstFX(arg_32_0, arg_32_1, arg_32_2)
	local var_32_0 = arg_32_0.GetFXPath(arg_32_1)
	local var_32_1
	local var_32_2 = arg_32_0._allPool[var_32_0]

	if var_32_2 then
		var_32_1 = arg_32_0:popPool(var_32_2, arg_32_2)
	elseif arg_32_0._resCacheList[var_32_0] ~= nil then
		arg_32_0:InitPool(var_32_0, arg_32_0._resCacheList[var_32_0])

		local var_32_3 = arg_32_0._allPool[var_32_0]

		var_32_1 = arg_32_0:popPool(var_32_3, arg_32_2)
	else
		ResourceMgr.Inst:getAssetAsync(var_32_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_33_0)
			if not arg_32_0._poolRoot then
				var_0_4.Destroy(arg_33_0)

				return
			else
				assert(arg_33_0, "特效资源加载失败：" .. arg_32_1)
				arg_32_0:InitPool(var_32_0, arg_33_0)
			end
		end), true, true)

		var_32_1 = GameObject(arg_32_1 .. "临时假obj")

		var_32_1:SetActive(false)

		arg_32_0._resCacheList[var_32_0] = var_32_1
	end

	local var_32_4 = tf(var_32_1):Find("bullet")

	if var_32_4 and var_32_4:GetComponent(typeof(SpineAnim)) then
		var_32_4:GetComponent(typeof(SpineAnim)):SetAction("normal", 0, false)
	end

	return var_32_1
end

function var_0_5.InstOrbit(arg_34_0, arg_34_1)
	local var_34_0 = arg_34_0.GetOrbitPath(arg_34_1)
	local var_34_1
	local var_34_2 = arg_34_0._allPool[var_34_0]

	if var_34_2 then
		var_34_1 = arg_34_0:popPool(var_34_2)
	elseif arg_34_0._resCacheList[var_34_0] ~= nil then
		arg_34_0:InitPool(var_34_0, arg_34_0._resCacheList[var_34_0])

		local var_34_3 = arg_34_0._allPool[var_34_0]

		var_34_1 = arg_34_0:popPool(var_34_3)
	else
		ResourceMgr.Inst:getAssetAsync(var_34_0, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_35_0)
			if not arg_34_0._poolRoot then
				var_0_4.Destroy(arg_35_0)

				return
			else
				assert(arg_35_0, "特效资源加载失败：" .. arg_34_1)
				arg_34_0:InitPool(var_34_0, arg_35_0)
			end
		end), true, true)

		var_34_1 = GameObject(arg_34_1 .. "临时假obj")

		var_34_1:SetActive(false)

		arg_34_0._resCacheList[var_34_0] = var_34_1
	end

	return var_34_1
end

function var_0_5.InstSkillPaintingUI(arg_36_0)
	local var_36_0 = arg_36_0._allPool["UI/SkillPainting"]
	local var_36_1 = var_36_0:GetObject()

	arg_36_0._ob2Pool[var_36_1] = var_36_0

	return var_36_1
end

function var_0_5.InstBossWarningUI(arg_37_0)
	local var_37_0 = arg_37_0._allPool["UI/MonsterAppearUI"]
	local var_37_1 = var_37_0:GetObject()

	arg_37_0._ob2Pool[var_37_1] = var_37_0

	return var_37_1
end

function var_0_5.InstGridmanSkillUI(arg_38_0)
	local var_38_0 = arg_38_0._allPool["UI/combatgridmanskillfloat"]
	local var_38_1 = var_38_0:GetObject()

	arg_38_0._ob2Pool[var_38_1] = var_38_0

	return var_38_1
end

function var_0_5.InstPainting(arg_39_0, arg_39_1)
	local var_39_0 = arg_39_0.GetPaintingPath(arg_39_1)
	local var_39_1
	local var_39_2 = arg_39_0._allPool[var_39_0]

	if var_39_2 then
		var_39_1 = var_39_2:GetObject()
		arg_39_0._ob2Pool[var_39_1] = var_39_2
	elseif arg_39_0._resCacheList[var_39_0] ~= nil then
		var_39_1 = Object.Instantiate(arg_39_0._resCacheList[var_39_0])

		var_39_1:SetActive(true)
	end

	return var_39_1
end

function var_0_5.InstMap(arg_40_0, arg_40_1)
	local var_40_0 = arg_40_0.GetMapPath(arg_40_1)
	local var_40_1
	local var_40_2 = arg_40_0._allPool[var_40_0]

	if var_40_2 then
		var_40_1 = var_40_2:GetObject()
		arg_40_0._ob2Pool[var_40_1] = var_40_2
	elseif arg_40_0._resCacheList[var_40_0] ~= nil then
		var_40_1 = Object.Instantiate(arg_40_0._resCacheList[var_40_0])
	else
		assert(false, "地图资源没有预加载：" .. arg_40_1)
	end

	var_40_1:SetActive(true)

	return var_40_1
end

function var_0_5.InstCardPuzzleCard(arg_41_0)
	local var_41_0 = arg_41_0._allPool["UI/CardTowerCardCombat"]
	local var_41_1 = var_41_0:GetObject()

	arg_41_0._ob2Pool[var_41_1] = var_41_0

	return var_41_1
end

function var_0_5.GetCharacterIcon(arg_42_0, arg_42_1)
	return arg_42_0._resCacheList[var_0_5.GetHrzIcon(arg_42_1)]
end

function var_0_5.GetCharacterSquareIcon(arg_43_0, arg_43_1)
	return arg_43_0._resCacheList[var_0_5.GetSquareIcon(arg_43_1)]
end

function var_0_5.GetCharacterQIcon(arg_44_0, arg_44_1)
	return arg_44_0._resCacheList[var_0_5.GetQIcon(arg_44_1)]
end

function var_0_5.GetAircraftIcon(arg_45_0, arg_45_1)
	return arg_45_0._resCacheList[var_0_5.GetAircraftIconPath(arg_45_1)]
end

function var_0_5.GetShipTypeIcon(arg_46_0, arg_46_1)
	return arg_46_0._resCacheList[var_0_5.GetShipTypeIconPath(arg_46_1)]
end

function var_0_5.GetCommanderHrzIcon(arg_47_0, arg_47_1)
	return arg_47_0._resCacheList[var_0_5.GetCommanderHrzIconPath(arg_47_1)]
end

function var_0_5.GetCommanderIcon(arg_48_0, arg_48_1)
	return arg_48_0._resCacheList[var_0_5.GetCommanderIconPath(arg_48_1)]
end

function var_0_5.GetShader(arg_49_0, arg_49_1)
	return (pg.ShaderMgr.GetInstance():GetShader(var_0_3.BATTLE_SHADER[arg_49_1]))
end

function var_0_5.AddPreloadResource(arg_50_0, arg_50_1)
	if type(arg_50_1) == "string" then
		arg_50_0._preloadList[arg_50_1] = false
	elseif type(arg_50_1) == "table" then
		for iter_50_0, iter_50_1 in ipairs(arg_50_1) do
			arg_50_0._preloadList[iter_50_1] = false
		end
	end
end

function var_0_5.AddPreloadCV(arg_51_0, arg_51_1)
	local var_51_0 = ShipWordHelper.RawGetCVKey(arg_51_1)

	if var_51_0 > 0 then
		arg_51_0._battleCVList[var_51_0] = pg.CriMgr.GetBattleCVBankName(var_51_0)
	end
end

function var_0_5.StartPreload(arg_52_0, arg_52_1, arg_52_2)
	local var_52_0 = 0
	local var_52_1 = 0

	for iter_52_0, iter_52_1 in pairs(arg_52_0._preloadList) do
		var_52_1 = var_52_1 + 1
	end

	for iter_52_2, iter_52_3 in pairs(arg_52_0._battleCVList) do
		var_52_1 = var_52_1 + 1
	end

	local function var_52_2()
		if not arg_52_0._poolRoot then
			return
		end

		var_52_0 = var_52_0 + 1

		if var_52_0 > var_52_1 then
			return
		end

		if arg_52_2 then
			arg_52_2(var_52_0)
		end

		if var_52_0 == var_52_1 then
			arg_52_0._preloadList = nil

			arg_52_1()
		end
	end

	for iter_52_4, iter_52_5 in pairs(arg_52_0._battleCVList) do
		pg.CriMgr.GetInstance():LoadBattleCV(iter_52_4, var_52_2)
	end

	for iter_52_6, iter_52_7 in pairs(arg_52_0._preloadList) do
		local var_52_3 = arg_52_0.GetResName(iter_52_6)

		if var_52_3 == "" or arg_52_0._resCacheList[iter_52_6] ~= nil then
			var_52_2()
		elseif string.find(iter_52_6, "herohrzicon/") or string.find(iter_52_6, "qicon/") or string.find(iter_52_6, "squareicon/") or string.find(iter_52_6, "commanderhrz/") or string.find(iter_52_6, "commandericon/") or string.find(iter_52_6, "AircraftIcon/") then
			local var_52_4, var_52_5 = HXSet.autoHxShiftPath(iter_52_6, var_52_3)

			ResourceMgr.Inst:getAssetAsync(var_52_4, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_54_0)
				if arg_54_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_52_6 .. "<<")
				else
					if not arg_52_0._poolRoot then
						var_0_4.Destroy(arg_54_0)

						return
					end

					if arg_52_0._resCacheList then
						arg_52_0._resCacheList[iter_52_6] = arg_54_0
					end
				end

				var_52_2()
			end), true, true)
		elseif string.find(iter_52_6, "shiptype/") then
			local var_52_6 = string.split(iter_52_6, "/")[2]

			GetSpriteFromAtlasAsync("shiptype", var_52_6, function(arg_55_0)
				if arg_55_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_52_6 .. "<<")
				else
					if not arg_52_0._poolRoot then
						var_0_4.Destroy(arg_55_0)

						return
					end

					if arg_52_0._resCacheList then
						arg_52_0._resCacheList[iter_52_6] = arg_55_0
					end
				end

				var_52_2()
			end)
		elseif string.find(iter_52_6, "painting/") then
			PoolMgr.GetInstance():GetPainting(var_0_5.GetPaintingName(var_52_3), true, function(arg_56_0)
				if arg_56_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_52_6 .. "<<")
				else
					if not arg_52_0._poolRoot then
						var_0_5.ClearPaintingRes(iter_52_6, arg_56_0)

						return
					end

					ShipExpressionHelper.SetExpression(arg_56_0, var_52_3)
					arg_56_0:SetActive(false)

					if arg_52_0._resCacheList then
						arg_52_0._resCacheList[iter_52_6] = arg_56_0
					end
				end

				var_52_2()
			end)
		elseif string.find(iter_52_6, "Char/") then
			arg_52_0:LoadSpineAsset(var_52_3, function(arg_57_0)
				if arg_57_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_52_6 .. "<<")
				else
					arg_57_0 = SpineAnim.AnimChar(var_52_3, arg_57_0)

					if not arg_52_0._poolRoot then
						var_0_5.ClearCharRes(iter_52_6, arg_57_0)

						return
					end

					arg_57_0:SetActive(false)

					if arg_52_0._resCacheList then
						arg_52_0._resCacheList[iter_52_6] = arg_57_0
					end
				end

				arg_52_0:InitPool(iter_52_6, arg_57_0)
				var_52_2()
			end)
		elseif string.find(iter_52_6, "UI/") then
			LoadAndInstantiateAsync("UI", var_52_3, function(arg_58_0)
				if arg_58_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_52_6 .. "<<")
				else
					if not arg_52_0._poolRoot then
						var_0_4.Destroy(arg_58_0)

						return
					end

					arg_58_0:SetActive(false)

					if arg_52_0._resCacheList then
						arg_52_0._resCacheList[iter_52_6] = arg_58_0
					end
				end

				arg_52_0:InitPool(iter_52_6, arg_58_0)
				var_52_2()
			end, true, true)
		else
			ResourceMgr.Inst:getAssetAsync(iter_52_6, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_59_0)
				if arg_59_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_52_6 .. "<<")
				else
					if not arg_52_0._poolRoot then
						var_0_4.Destroy(arg_59_0)

						return
					end

					if arg_52_0._resCacheList then
						arg_52_0._resCacheList[iter_52_6] = arg_59_0
					end
				end

				arg_52_0:InitPool(iter_52_6, arg_59_0)
				var_52_2()
			end), true, true)
		end
	end

	return var_52_1
end

function var_0_5.GetPaintingName(arg_60_0)
	local var_60_0 = false

	if PlayerPrefs.GetInt(BATTLE_HIDE_BG, 1) > 0 then
		var_60_0 = checkABExist("painting/" .. arg_60_0 .. "_n")
	else
		var_60_0 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_60_0, 0) ~= 0 and checkABExist("painting/" .. arg_60_0 .. "_n")
	end

	return arg_60_0 .. (var_60_0 and "_n" or "")
end

local var_0_6 = Vector3(0, 10000, 0)

function var_0_5.HideBullet(arg_61_0)
	arg_61_0.transform.position = var_0_6
end

function var_0_5.InitParticleSystemCB(arg_62_0)
	pg.EffectMgr.GetInstance():CommonEffectEvent(arg_62_0)
end

function var_0_5.InitPool(arg_63_0, arg_63_1, arg_63_2)
	local var_63_0 = arg_63_0._poolRoot.transform

	if string.find(arg_63_1, "Item/") then
		if arg_63_2:GetComponentInChildren(typeof(UnityEngine.TrailRenderer)) ~= nil or arg_63_2:GetComponentInChildren(typeof(ParticleSystem)) ~= nil then
			arg_63_0._allPool[arg_63_1] = pg.Pool.New(arg_63_0._bulletContainer.transform, arg_63_2, 15, 20, true, false):InitSize()
		else
			local var_63_1 = pg.Pool.New(arg_63_0._bulletContainer.transform, arg_63_2, 20, 20, true, true)

			var_63_1:SetRecycleFuncs(var_0_5.HideBullet)
			var_63_1:InitSize()

			arg_63_0._allPool[arg_63_1] = var_63_1
		end
	elseif string.find(arg_63_1, "Effect/") then
		if arg_63_2:GetComponent(typeof(UnityEngine.ParticleSystem)) then
			local var_63_2 = 5

			if string.find(arg_63_1, "smoke") and not string.find(arg_63_1, "smokeboom") then
				var_63_2 = 30
			elseif string.find(arg_63_1, "feijiyingzi") then
				var_63_2 = 1
			end

			local var_63_3 = pg.Pool.New(var_63_0, arg_63_2, var_63_2, 20, false, false)

			var_63_3:SetInitFuncs(var_0_5.InitParticleSystemCB)
			var_63_3:InitSize()

			arg_63_0._allPool[arg_63_1] = var_63_3
		else
			local var_63_4 = 8

			if string.find(arg_63_1, "AntiAirArea") or string.find(arg_63_1, "AntiSubArea") then
				var_63_4 = 1
			end

			GetOrAddComponent(arg_63_2, typeof(ParticleSystemEvent))

			local var_63_5 = pg.Pool.New(var_63_0, arg_63_2, var_63_4, 20, false, false)

			var_63_5:InitSize()

			arg_63_0._allPool[arg_63_1] = var_63_5
		end
	elseif string.find(arg_63_1, "Char/") then
		local var_63_6 = 1

		if string.find(arg_63_1, "danchuan") then
			var_63_6 = 3
		end

		local var_63_7 = pg.Pool.New(var_63_0, arg_63_2, var_63_6, 20, false, false):InitSize()

		var_63_7:SetRecycleFuncs(var_0_5.ResetSpineAction)

		arg_63_0._allPool[arg_63_1] = var_63_7
	elseif string.find(arg_63_1, "chargo/") then
		arg_63_0._allPool[arg_63_1] = pg.Pool.New(var_63_0, arg_63_2, 3, 20, false, false):InitSize()
	elseif string.find(arg_63_1, "orbit/") then
		arg_63_0._allPool[arg_63_1] = pg.Pool.New(var_63_0, arg_63_2, 2, 20, false, false):InitSize()
	elseif arg_63_1 == "UI/SkillPainting" then
		arg_63_0._allPool[arg_63_1] = pg.Pool.New(var_63_0, arg_63_2, 1, 20, false, false):InitSize()
	elseif arg_63_1 == "UI/MonsterAppearUI" then
		arg_63_0._allPool[arg_63_1] = pg.Pool.New(var_63_0, arg_63_2, 1, 20, false, false):InitSize()
	elseif arg_63_1 == "UI/CardTowerCardCombat" then
		arg_63_0._allPool[arg_63_1] = pg.Pool.New(var_63_0, arg_63_2, 7, 20, false, false):InitSize()
	elseif arg_63_1 == "UI/combatgridmanskillfloat" then
		arg_63_0._allPool[arg_63_1] = pg.Pool.New(var_63_0, arg_63_2, 1, 20, false, false):InitSize()
	elseif arg_63_1 == "UI/CombatHPBar" .. var_0_0.Battle.BattleState.GetCombatSkinKey() then
		var_0_0.Battle.BattleHPBarManager.GetInstance():Init(arg_63_2, var_63_0)
	elseif string.find(arg_63_1, "UI/CombatHPPop") then
		var_0_0.Battle.BattlePopNumManager.GetInstance():Init(arg_63_2, var_63_0)
	end
end

function var_0_5.GetRotateScript(arg_64_0, arg_64_1, arg_64_2)
	local var_64_0 = arg_64_0.rotateScriptMap

	if var_64_0[arg_64_1] then
		return var_64_0[arg_64_1]
	end

	local var_64_1 = GetOrAddComponent(arg_64_1, "BulletRotation")

	var_64_0[arg_64_1] = var_64_1

	return var_64_1
end

function var_0_5.GetCommonResource()
	return {
		var_0_5.GetMapPath("visionLine"),
		var_0_5.GetMapPath("exposeLine"),
		var_0_5.GetFXPath(var_0_0.Battle.BattleCharacterFactory.MOVE_WAVE_FX_NAME),
		var_0_5.GetFXPath(var_0_0.Battle.BattleCharacterFactory.BOMB_FX_NAME),
		var_0_5.GetFXPath(var_0_0.Battle.BattleBossCharacterFactory.BOMB_FX_NAME),
		var_0_5.GetFXPath(var_0_0.Battle.BattleAircraftCharacterFactory.BOMB_FX_NAME),
		var_0_5.GetFXPath("AlertArea"),
		var_0_5.GetFXPath("TorAlert"),
		var_0_5.GetFXPath("SquareAlert"),
		var_0_5.GetFXPath("AntiAirArea"),
		var_0_5.GetFXPath("AntiSubArea"),
		var_0_5.GetFXPath("AimBiasArea"),
		var_0_5.GetFXPath("shock"),
		var_0_5.GetFXPath("qianting_chushui"),
		var_0_5.GetFXPath(var_0_3.PLAYER_SUB_BUBBLE_FX),
		var_0_5.GetFXPath("weaponrange"),
		var_0_5.GetUIPath("SkillPainting"),
		var_0_5.GetUIPath("MonsterAppearUI"),
		var_0_5.GetUIPath("CombatHPBar" .. var_0_0.Battle.BattleState.GetCombatSkinKey()),
		var_0_5.GetUIPath("CombatHPPop" .. var_0_0.Battle.BattleState.GetCombatSkinKey())
	}
end

function var_0_5.GetDisplayCommonResource()
	return {
		var_0_5.GetFXPath(var_0_0.Battle.BattleCharacterFactory.MOVE_WAVE_FX_NAME),
		var_0_5.GetFXPath(var_0_0.Battle.BattleCharacterFactory.BOMB_FX_NAME),
		var_0_5.GetFXPath(var_0_0.Battle.BattleCharacterFactory.DANCHUAN_MOVE_WAVE_FX_NAME)
	}
end

function var_0_5.GetMapResource(arg_67_0)
	local var_67_0 = {}
	local var_67_1 = var_0_0.Battle.BattleMap

	for iter_67_0, iter_67_1 in ipairs(var_67_1.LAYERS) do
		local var_67_2 = var_67_1.GetMapResNames(arg_67_0, iter_67_1)

		for iter_67_2, iter_67_3 in ipairs(var_67_2) do
			var_67_0[#var_67_0 + 1] = var_0_5.GetMapPath(iter_67_3)
		end
	end

	return var_67_0
end

function var_0_5.GetBuffResource()
	local var_68_0 = {}
	local var_68_1 = require("buffFXPreloadList")

	for iter_68_0, iter_68_1 in ipairs(var_68_1) do
		var_68_0[#var_68_0 + 1] = var_0_5.GetFXPath(iter_68_1)
	end

	return var_68_0
end

function var_0_5.GetShipResource(arg_69_0, arg_69_1, arg_69_2)
	local var_69_0 = {}
	local var_69_1 = var_0_1.GetPlayerShipTmpDataFromID(arg_69_0)

	if arg_69_1 == nil or arg_69_1 == 0 then
		arg_69_1 = var_69_1.skin_id
	end

	local var_69_2 = var_0_1.GetPlayerShipSkinDataFromID(arg_69_1)

	var_69_0[#var_69_0 + 1] = var_0_5.GetCharacterPath(var_69_2.prefab)
	var_69_0[#var_69_0 + 1] = var_0_5.GetHrzIcon(var_69_2.painting)
	var_69_0[#var_69_0 + 1] = var_0_5.GetQIcon(var_69_2.painting)
	var_69_0[#var_69_0 + 1] = var_0_5.GetSquareIcon(var_69_2.painting)

	if arg_69_2 and var_0_1.GetShipTypeTmp(var_69_1.type).team_type == TeamType.Main then
		var_69_0[#var_69_0 + 1] = var_0_5.GetPaintingPath(var_69_2.painting)
	end

	return var_69_0
end

function var_0_5.GetEnemyResource(arg_70_0)
	local var_70_0 = {}
	local var_70_1 = arg_70_0.monsterTemplateID
	local var_70_2 = arg_70_0.bossData ~= nil
	local var_70_3 = arg_70_0.buffList or {}
	local var_70_4 = arg_70_0.phase or {}
	local var_70_5 = var_0_1.GetMonsterTmpDataFromID(var_70_1)

	var_70_0[#var_70_0 + 1] = var_0_5.GetCharacterPath(var_70_5.prefab)
	var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(var_70_5.wave_fx)

	if var_70_5.fog_fx then
		var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(var_70_5.fog_fx)
	end

	for iter_70_0, iter_70_1 in ipairs(var_70_5.appear_fx) do
		var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(iter_70_1)
	end

	for iter_70_2, iter_70_3 in ipairs(var_70_5.smoke) do
		local var_70_6 = iter_70_3[2]

		for iter_70_4, iter_70_5 in ipairs(var_70_6) do
			var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(iter_70_5[1])
		end
	end

	if arg_70_0.deadFX then
		var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(arg_70_0.deadFX)
	end

	if type(var_70_5.bubble_fx) == "table" then
		var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(var_70_5.bubble_fx[1])
	end

	local function var_70_7(arg_71_0)
		local var_71_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_71_0, 1)

		for iter_71_0, iter_71_1 in pairs(var_71_0.effect_list) do
			local var_71_1 = iter_71_1.arg_list.skill_id

			if var_71_1 then
				local var_71_2 = var_0_0.Battle.BattleDataFunction.GetSkillTemplate(var_71_1).painting

				if var_71_2 == 1 then
					var_70_0[#var_70_0 + 1] = var_0_5.GetHrzIcon(var_70_5.icon)
					var_70_0[#var_70_0 + 1] = var_0_5.GetSquareIcon(var_70_5.icon)
				elseif type(var_71_2) == "string" then
					var_70_0[#var_70_0 + 1] = var_0_5.GetHrzIcon(var_71_2)
					var_70_0[#var_70_0 + 1] = var_0_5.GetSquareIcon(var_71_2)
				end
			end

			local var_71_3 = iter_71_1.arg_list.buff_id

			if var_71_3 then
				var_70_7(var_71_3)
			end
		end
	end

	for iter_70_6, iter_70_7 in ipairs(var_70_3) do
		var_70_7(iter_70_7)
	end

	for iter_70_8, iter_70_9 in ipairs(var_70_4) do
		if iter_70_9.addBuff then
			for iter_70_10, iter_70_11 in ipairs(iter_70_9.addBuff) do
				var_70_7(iter_70_11)
			end
		end
	end

	if var_70_2 then
		var_70_0[#var_70_0 + 1] = var_0_5.GetSquareIcon(var_70_5.icon)
	end

	return var_70_0
end

function var_0_5.GetWeaponResource(arg_72_0, arg_72_1)
	local var_72_0 = {}

	if arg_72_0 == -1 then
		return var_72_0
	end

	local var_72_1 = var_0_1.GetWeaponPropertyDataFromID(arg_72_0)

	if var_72_1.type == var_0_2.EquipmentType.MAIN_CANNON or var_72_1.type == var_0_2.EquipmentType.SUB_CANNON or var_72_1.type == var_0_2.EquipmentType.TORPEDO or var_72_1.type == var_0_2.EquipmentType.ANTI_AIR or var_72_1.type == var_0_2.EquipmentType.ANTI_SEA or var_72_1.type == var_0_2.EquipmentType.POINT_HIT_AND_LOCK or var_72_1.type == var_0_2.EquipmentType.MANUAL_METEOR or var_72_1.type == var_0_2.EquipmentType.BOMBER_PRE_CAST_ALERT or var_72_1.type == var_0_2.EquipmentType.DEPTH_CHARGE or var_72_1.type == var_0_2.EquipmentType.MANUAL_TORPEDO or var_72_1.type == var_0_2.EquipmentType.DISPOSABLE_TORPEDO or var_72_1.type == var_0_2.EquipmentType.MANUAL_AAMISSILE or var_72_1.type == var_0_2.EquipmentType.BEAM or var_72_1.type == var_0_2.EquipmentType.SPACE_LASER or var_72_1.type == var_0_2.EquipmentType.FLEET_RANGE_ANTI_AIR or var_72_1.type == var_0_2.EquipmentType.MANUAL_MISSILE or var_72_1.type == var_0_2.EquipmentType.AUTO_MISSILE or var_72_1.type == var_0_2.EquipmentType.MISSILE then
		for iter_72_0, iter_72_1 in ipairs(var_72_1.bullet_ID) do
			local var_72_2 = var_0_5.GetBulletResource(iter_72_1, arg_72_1)

			for iter_72_2, iter_72_3 in ipairs(var_72_2) do
				var_72_0[#var_72_0 + 1] = iter_72_3
			end
		end
	elseif var_72_1.type == var_0_2.EquipmentType.INTERCEPT_AIRCRAFT or var_72_1.type == var_0_2.EquipmentType.STRIKE_AIRCRAFT then
		var_72_0 = var_0_5.GetAircraftResource(arg_72_0, nil, arg_72_1)
	elseif var_72_1.type == var_0_2.EquipmentType.PREVIEW_ARICRAFT then
		for iter_72_4, iter_72_5 in ipairs(var_72_1.bullet_ID) do
			var_72_0 = var_0_5.GetAircraftResource(iter_72_5, nil, arg_72_1)
		end
	end

	if var_72_1.type == var_0_2.EquipmentType.FLEET_RANGE_ANTI_AIR then
		local var_72_3 = var_0_5.GetBulletResource(var_0_3.AntiAirConfig.RangeBulletID)

		for iter_72_6, iter_72_7 in ipairs(var_72_3) do
			var_72_0[#var_72_0 + 1] = iter_72_7
		end
	end

	local var_72_4

	if arg_72_1 and arg_72_1 ~= 0 then
		var_72_4 = var_0_0.Battle.BattleDataFunction.GetEquipSkinDataFromID(arg_72_1)
	end

	if var_72_4 and var_72_4.fire_fx_name ~= "" then
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(var_72_4.fire_fx_name)
	else
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(var_72_1.fire_fx)
	end

	if var_72_1.precast_param.fx then
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(var_72_1.precast_param.fx)
	end

	if var_72_4 then
		local var_72_5 = var_72_4.orbit_combat

		if var_72_5 ~= "" then
			var_72_0[#var_72_0 + 1] = var_0_5.GetOrbitPath(var_72_5)
		end
	end

	return var_72_0
end

function var_0_5.GetEquipResource(arg_73_0, arg_73_1, arg_73_2)
	local var_73_0 = {}

	if arg_73_1 ~= 0 then
		local var_73_1 = var_0_0.Battle.BattleDataFunction.GetEquipSkinDataFromID(arg_73_1)
		local var_73_2 = var_73_1.ship_skin_id

		if var_73_2 ~= 0 then
			local var_73_3 = var_0_0.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(var_73_2)

			var_73_0[#var_73_0 + 1] = var_0_5.GetCharacterPath(var_73_3.prefab)
		end

		local var_73_4 = var_73_1.orbit_combat

		if var_73_4 ~= "" then
			var_73_0[#var_73_0 + 1] = var_0_5.GetOrbitPath(var_73_4)
		end
	end

	local var_73_5 = var_0_0.Battle.BattleDataFunction.GetWeaponDataFromID(arg_73_0)
	local var_73_6 = var_73_5.weapon_id

	for iter_73_0, iter_73_1 in ipairs(var_73_6) do
		local var_73_7 = var_0_5.GetWeaponResource(iter_73_1)

		for iter_73_2, iter_73_3 in ipairs(var_73_7) do
			var_73_0[#var_73_0 + 1] = iter_73_3
		end
	end

	local var_73_8 = var_73_5.skill_id

	for iter_73_4, iter_73_5 in ipairs(var_73_8) do
		local var_73_9 = arg_73_2 and var_0_0.Battle.BattleDataFunction.SkillTranform(arg_73_2, iter_73_5[1]) or iter_73_5[1]
		local var_73_10 = iter_73_5[2] or 1
		local var_73_11 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(var_73_9, var_73_10, {})

		for iter_73_6, iter_73_7 in ipairs(var_73_11) do
			var_73_0[#var_73_0 + 1] = iter_73_7
		end
	end

	return var_73_0
end

function var_0_5.GetBulletResource(arg_74_0, arg_74_1)
	local var_74_0 = {}
	local var_74_1

	if arg_74_1 ~= nil and arg_74_1 ~= 0 then
		var_74_1 = var_0_1.GetEquipSkinDataFromID(arg_74_1)
	end

	local var_74_2 = var_0_1.GetBulletTmpDataFromID(arg_74_0)
	local var_74_3

	if var_74_1 then
		var_74_3 = var_74_1.bullet_name

		if var_74_1.mirror == 1 then
			var_74_0[#var_74_0 + 1] = var_0_5.GetBulletPath(var_74_3 .. var_0_0.Battle.BattleBulletUnit.MIRROR_RES)
		end
	else
		var_74_3 = var_74_2.modle_ID
	end

	if var_74_2.type == var_0_2.BulletType.BEAM or var_74_2.type == var_0_2.BulletType.SPACE_LASER or var_74_2.type == var_0_2.BulletType.MISSILE or var_74_2.type == var_0_2.BulletType.ELECTRIC_ARC then
		var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_2.modle_ID)
	else
		var_74_0[#var_74_0 + 1] = var_0_5.GetBulletPath(var_74_3)
	end

	if var_74_2.extra_param.mirror then
		var_74_0[#var_74_0 + 1] = var_0_5.GetBulletPath(var_74_3 .. var_0_0.Battle.BattleBulletUnit.MIRROR_RES)
	end

	local var_74_4

	if var_74_1 and var_74_1.hit_fx_name ~= "" then
		var_74_4 = var_74_1.hit_fx_name
	else
		var_74_4 = var_74_2.hit_fx
	end

	var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_4)
	var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_2.miss_fx)
	var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_2.alert_fx)

	if var_74_2.extra_param.area_FX then
		var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_2.extra_param.area_FX)
	end

	if var_74_2.extra_param.shrapnel then
		for iter_74_0, iter_74_1 in ipairs(var_74_2.extra_param.shrapnel) do
			local var_74_5 = var_0_5.GetBulletResource(iter_74_1.bullet_ID)

			for iter_74_2, iter_74_3 in ipairs(var_74_5) do
				var_74_0[#var_74_0 + 1] = iter_74_3
			end
		end
	end

	for iter_74_4, iter_74_5 in ipairs(var_74_2.attach_buff) do
		if iter_74_5.effect_id then
			var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(iter_74_5.effect_id)
		end

		if iter_74_5.buff_id then
			local var_74_6 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_74_5.buff_id, 1, {})

			for iter_74_6, iter_74_7 in ipairs(var_74_6) do
				var_74_0[#var_74_0 + 1] = iter_74_7
			end
		end
	end

	return var_74_0
end

function var_0_5.GetAircraftResource(arg_75_0, arg_75_1, arg_75_2, arg_75_3)
	local var_75_0 = {}

	arg_75_2 = arg_75_2 or 0

	local var_75_1 = var_0_1.GetAircraftTmpDataFromID(arg_75_0)
	local var_75_2
	local var_75_3
	local var_75_4
	local var_75_5

	if arg_75_2 ~= 0 then
		local var_75_6, var_75_7, var_75_8

		var_75_2, var_75_6, var_75_7, var_75_8 = var_0_1.GetEquipSkin(arg_75_2)

		if var_75_6 ~= "" then
			var_75_0[#var_75_0 + 1] = var_0_5.GetBulletPath(var_75_6)
		end

		if var_75_7 ~= "" then
			var_75_0[#var_75_0 + 1] = var_0_5.GetBulletPath(var_75_7)
		end

		if var_75_8 ~= "" then
			var_75_0[#var_75_0 + 1] = var_0_5.GetBulletPath(var_75_8)
		end
	else
		var_75_2 = var_75_1.model_ID
	end

	var_75_0[#var_75_0 + 1] = var_0_5.GetCharacterGoPath(var_75_2)

	if arg_75_3 then
		var_75_0[#var_75_0 + 1] = var_0_5.GetAircraftIconPath(var_75_1.model_ID)
	end

	local var_75_9 = arg_75_1 or var_75_1.weapon_ID

	if type(var_75_9) == "table" then
		for iter_75_0, iter_75_1 in ipairs(var_75_9) do
			local var_75_10 = var_0_5.GetWeaponResource(iter_75_1)

			for iter_75_2, iter_75_3 in ipairs(var_75_10) do
				var_75_0[#var_75_0 + 1] = iter_75_3
			end
		end
	else
		local var_75_11 = var_0_5.GetWeaponResource(var_75_9)

		for iter_75_4, iter_75_5 in ipairs(var_75_11) do
			var_75_0[#var_75_0 + 1] = iter_75_5
		end
	end

	return var_75_0
end

function var_0_5.GetCommanderResource(arg_76_0)
	local var_76_0 = {}
	local var_76_1 = arg_76_0[1]

	var_76_0[#var_76_0 + 1] = var_0_5.GetCommanderHrzIconPath(var_76_1:getPainting())
	var_76_0[#var_76_0 + 1] = var_0_5.GetCommanderIconPath(var_76_1:getPainting())

	local var_76_2 = var_76_1:getSkills()[1]:getLevel()

	for iter_76_0, iter_76_1 in ipairs(arg_76_0[2]) do
		local var_76_3 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_76_1, var_76_2, {})

		for iter_76_2, iter_76_3 in ipairs(var_76_3) do
			var_76_0[#var_76_0 + 1] = iter_76_3
		end
	end

	return var_76_0
end

function var_0_5.GetStageResource(arg_77_0)
	local var_77_0 = var_0_0.Battle.BattleDataFunction.GetDungeonTmpDataByID(arg_77_0)
	local var_77_1 = {}
	local var_77_2 = {}

	for iter_77_0, iter_77_1 in ipairs(var_77_0.stages) do
		if iter_77_1.stageBuff then
			for iter_77_2, iter_77_3 in ipairs(iter_77_1.stageBuff) do
				local var_77_3 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_77_3.id, iter_77_3.level, {})

				for iter_77_4, iter_77_5 in ipairs(var_77_3) do
					print(iter_77_5)

					var_77_1[#var_77_1 + 1] = iter_77_5
				end
			end
		end

		for iter_77_6, iter_77_7 in ipairs(iter_77_1.waves) do
			if iter_77_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.NORMAL then
				for iter_77_8, iter_77_9 in ipairs(iter_77_7.spawn) do
					local var_77_4 = var_0_5.GetMonsterRes(iter_77_9)

					for iter_77_10, iter_77_11 in ipairs(var_77_4) do
						table.insert(var_77_1, iter_77_11)
					end
				end

				if iter_77_7.reinforcement then
					for iter_77_12, iter_77_13 in ipairs(iter_77_7.reinforcement) do
						local var_77_5 = var_0_5.GetMonsterRes(iter_77_13)

						for iter_77_14, iter_77_15 in ipairs(var_77_5) do
							table.insert(var_77_1, iter_77_15)
						end
					end
				end
			elseif iter_77_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.AID then
				local var_77_6 = iter_77_7.triggerParams.vanguard_unitList
				local var_77_7 = iter_77_7.triggerParams.main_unitList
				local var_77_8 = iter_77_7.triggerParams.sub_unitList

				local function var_77_9(arg_78_0)
					local var_78_0 = var_0_5.GetAidUnitsRes(arg_78_0)

					for iter_78_0, iter_78_1 in ipairs(var_78_0) do
						table.insert(var_77_1, iter_78_1)
					end

					for iter_78_2, iter_78_3 in ipairs(arg_78_0) do
						var_77_2[#var_77_2 + 1] = iter_78_3.skinId
					end
				end

				if var_77_6 then
					var_77_9(var_77_6)
				end

				if var_77_7 then
					var_77_9(var_77_7)
				end

				if var_77_8 then
					var_77_9(var_77_8)
				end
			elseif iter_77_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.ENVIRONMENT then
				for iter_77_16, iter_77_17 in ipairs(iter_77_7.spawn) do
					var_0_5.GetEnvironmentRes(var_77_1, iter_77_17)
				end
			elseif iter_77_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.CARD_PUZZLE then
				local var_77_10 = var_0_0.Battle.BattleDataFunction.GetCardRes(iter_77_7.triggerParams.card_id)

				for iter_77_18, iter_77_19 in ipairs(var_77_10) do
					table.insert(var_77_1, iter_77_19)
				end
			end

			if iter_77_7.airFighter ~= nil then
				for iter_77_20, iter_77_21 in pairs(iter_77_7.airFighter) do
					local var_77_11 = var_0_5.GetAircraftResource(iter_77_21.templateID, iter_77_21.weaponID, nil, true)

					for iter_77_22, iter_77_23 in ipairs(var_77_11) do
						var_77_1[#var_77_1 + 1] = iter_77_23
					end
				end
			end
		end
	end

	return var_77_1, var_77_2
end

function var_0_5.GetEnvironmentRes(arg_79_0, arg_79_1)
	table.insert(arg_79_0, arg_79_1.prefab and var_0_5.GetFXPath(arg_79_1.prefab))

	local var_79_0 = arg_79_1.behaviours
	local var_79_1 = var_0_0.Battle.BattleDataFunction.GetEnvironmentBehaviour(var_79_0).behaviour_list

	for iter_79_0, iter_79_1 in ipairs(var_79_1) do
		local var_79_2 = iter_79_1.type

		if var_79_2 == var_0_0.Battle.BattleConst.EnviroumentBehaviour.BUFF then
			local var_79_3 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_79_1.buff_id, 1, {})

			for iter_79_2, iter_79_3 in ipairs(var_79_3) do
				arg_79_0[#arg_79_0 + 1] = iter_79_3
			end
		elseif var_79_2 == var_0_0.Battle.BattleConst.EnviroumentBehaviour.SPAWN then
			local var_79_4 = iter_79_1.content and iter_79_1.content.alert and iter_79_1.content.alert.alert_fx

			table.insert(arg_79_0, var_79_4 and var_0_5.GetFXPath(var_79_4))

			local var_79_5 = iter_79_1.content and iter_79_1.content.child_prefab

			if var_79_5 then
				var_0_5.GetEnvironmentRes(arg_79_0, var_79_5)
			end
		elseif var_79_2 == var_0_0.Battle.BattleConst.EnviroumentBehaviour.PLAY_FX then
			arg_79_0[#arg_79_0 + 1] = var_0_5.GetFXPath(iter_79_1.FX_ID)
		end
	end
end

function var_0_5.GetMonsterRes(arg_80_0)
	local var_80_0 = {}
	local var_80_1 = var_0_5.GetEnemyResource(arg_80_0)

	for iter_80_0, iter_80_1 in ipairs(var_80_1) do
		var_80_0[#var_80_0 + 1] = iter_80_1
	end

	local var_80_2 = var_0_0.Battle.BattleDataFunction.GetMonsterTmpDataFromID(arg_80_0.monsterTemplateID)
	local var_80_3 = Clone(var_80_2.equipment_list)
	local var_80_4 = var_80_2.buff_list
	local var_80_5 = Clone(arg_80_0.buffList) or {}

	if arg_80_0.phase then
		for iter_80_2, iter_80_3 in ipairs(arg_80_0.phase) do
			if iter_80_3.addWeapon then
				for iter_80_4, iter_80_5 in ipairs(iter_80_3.addWeapon) do
					var_80_3[#var_80_3 + 1] = iter_80_5
				end
			end

			if iter_80_3.addRandomWeapon then
				for iter_80_6, iter_80_7 in ipairs(iter_80_3.addRandomWeapon) do
					for iter_80_8, iter_80_9 in ipairs(iter_80_7) do
						var_80_3[#var_80_3 + 1] = iter_80_9
					end
				end
			end

			if iter_80_3.addBuff then
				for iter_80_10, iter_80_11 in ipairs(iter_80_3.addBuff) do
					var_80_5[#var_80_5 + 1] = iter_80_11
				end
			end
		end
	end

	for iter_80_12, iter_80_13 in ipairs(var_80_4) do
		local var_80_6 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_80_13.ID, iter_80_13.LV, {})

		for iter_80_14, iter_80_15 in ipairs(var_80_6) do
			var_80_0[#var_80_0 + 1] = iter_80_15
		end
	end

	for iter_80_16, iter_80_17 in ipairs(var_80_5) do
		local var_80_7 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_80_17, 1, {})

		for iter_80_18, iter_80_19 in ipairs(var_80_7) do
			var_80_0[#var_80_0 + 1] = iter_80_19
		end

		local var_80_8 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(iter_80_17, 1)

		for iter_80_20, iter_80_21 in pairs(var_80_8.effect_list) do
			local var_80_9 = iter_80_21.arg_list.skill_id

			if var_80_9 and var_0_0.Battle.BattleDataFunction.NeedSkillPainting(var_80_9) then
				var_80_0[#var_80_0 + 1] = var_0_5.GetPaintingPath(var_0_1.GetMonsterTmpDataFromID(arg_80_0.monsterTemplateID).icon)

				break
			end
		end
	end

	for iter_80_22, iter_80_23 in ipairs(var_80_3) do
		local var_80_10 = var_0_5.GetWeaponResource(iter_80_23)

		for iter_80_24, iter_80_25 in ipairs(var_80_10) do
			var_80_0[#var_80_0 + 1] = iter_80_25
		end
	end

	return var_80_0
end

function var_0_5.GetEquipSkinPreviewRes(arg_81_0)
	local var_81_0 = {}
	local var_81_1 = var_0_1.GetEquipSkinDataFromID(arg_81_0)

	for iter_81_0, iter_81_1 in ipairs(var_81_1.weapon_ids) do
		local var_81_2 = var_0_5.GetWeaponResource(iter_81_1)

		for iter_81_2, iter_81_3 in ipairs(var_81_2) do
			var_81_0[#var_81_0 + 1] = iter_81_3
		end
	end

	local function var_81_3(arg_82_0)
		if arg_82_0 ~= "" then
			var_81_0[#var_81_0 + 1] = var_0_5.GetBulletPath(arg_82_0)
		end
	end

	local var_81_4, var_81_5, var_81_6, var_81_7, var_81_8, var_81_9 = var_0_1.GetEquipSkin(arg_81_0)

	if _.any(EquipType.AirProtoEquipTypes, function(arg_83_0)
		return table.contains(var_81_1.equip_type, arg_83_0)
	end) then
		var_81_0[#var_81_0 + 1] = var_0_5.GetCharacterGoPath(var_81_4)
	else
		var_81_0[#var_81_0 + 1] = var_0_5.GetBulletPath(var_81_4)
	end

	var_81_3(var_81_5)
	var_81_3(var_81_6)
	var_81_3(var_81_7)

	if var_81_8 and var_81_8 ~= "" then
		var_81_0[#var_81_0 + 1] = var_0_5.GetFXPath(var_81_8)
	end

	if var_81_9 and var_81_9 ~= "" then
		var_81_0[#var_81_0 + 1] = var_0_5.GetFXPath(var_81_9)
	end

	return var_81_0
end

function var_0_5.GetEquipSkinBulletRes(arg_84_0)
	local var_84_0 = {}
	local var_84_1, var_84_2, var_84_3, var_84_4 = var_0_1.GetEquipSkin(arg_84_0)

	local function var_84_5(arg_85_0)
		if arg_85_0 ~= "" then
			var_84_0[#var_84_0 + 1] = var_0_5.GetBulletPath(arg_85_0)
		end
	end

	local var_84_6 = var_0_1.GetEquipSkinDataFromID(arg_84_0)
	local var_84_7 = false

	for iter_84_0, iter_84_1 in ipairs(var_84_6.equip_type) do
		if table.contains(EquipType.AircraftSkinType, iter_84_1) then
			var_84_7 = true
		end
	end

	if var_84_7 then
		if var_84_1 ~= "" then
			var_84_0[#var_84_0 + 1] = var_0_5.GetCharacterGoPath(var_84_1)
		end
	else
		var_84_5(var_84_1)

		if var_0_1.GetEquipSkinDataFromID(arg_84_0).mirror == 1 then
			var_84_0[#var_84_0 + 1] = var_0_5.GetBulletPath(var_84_1 .. var_0_0.Battle.BattleBulletUnit.MIRROR_RES)
		end
	end

	var_84_5(var_84_2)
	var_84_5(var_84_3)
	var_84_5(var_84_4)

	return var_84_0
end

function var_0_5.GetAidUnitsRes(arg_86_0)
	local var_86_0 = {}

	for iter_86_0, iter_86_1 in ipairs(arg_86_0) do
		local var_86_1 = var_0_5.GetShipResource(iter_86_1.tmpID, nil, true)

		for iter_86_2, iter_86_3 in ipairs(iter_86_1.equipment) do
			if iter_86_3 ~= 0 then
				if iter_86_2 <= Ship.WEAPON_COUNT then
					local var_86_2 = var_0_1.GetWeaponDataFromID(iter_86_3).weapon_id

					for iter_86_4, iter_86_5 in ipairs(var_86_2) do
						local var_86_3 = var_0_5.GetWeaponResource(iter_86_5)

						for iter_86_6, iter_86_7 in ipairs(var_86_3) do
							table.insert(var_86_1, iter_86_7)
						end
					end
				else
					local var_86_4 = var_0_5.GetEquipResource(iter_86_3)

					for iter_86_8, iter_86_9 in ipairs(var_86_4) do
						table.insert(var_86_1, iter_86_9)
					end
				end
			end
		end

		for iter_86_10, iter_86_11 in ipairs(var_86_1) do
			table.insert(var_86_0, iter_86_11)
		end
	end

	return var_86_0
end

function var_0_5.GetSpWeaponResource(arg_87_0, arg_87_1)
	local var_87_0 = {}
	local var_87_1 = var_0_0.Battle.BattleDataFunction.GetSpWeaponDataFromID(arg_87_0).effect_id

	if var_87_1 ~= 0 then
		var_87_1 = arg_87_1 and var_0_0.Battle.BattleDataFunction.SkillTranform(arg_87_1, var_87_1) or var_87_1

		local var_87_2 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(var_87_1, 1, {})

		for iter_87_0, iter_87_1 in ipairs(var_87_2) do
			var_87_0[#var_87_0 + 1] = iter_87_1
		end
	end

	return var_87_0
end
