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

function var_0_5.InstReisalinAPUI(arg_39_0)
	local var_39_0 = arg_39_0._allPool["UI/combatreisalinapui"]
	local var_39_1 = var_39_0:GetObject()

	arg_39_0._ob2Pool[var_39_1] = var_39_0

	return var_39_1
end

function var_0_5.InstYumiaManaUI(arg_40_0)
	local var_40_0 = arg_40_0._allPool["UI/combatyumiamanaui"]
	local var_40_1 = var_40_0:GetObject()

	arg_40_0._ob2Pool[var_40_1] = var_40_0

	return var_40_1
end

function var_0_5.InstPainting(arg_41_0, arg_41_1)
	local var_41_0 = arg_41_0.GetPaintingPath(arg_41_1)
	local var_41_1
	local var_41_2 = arg_41_0._allPool[var_41_0]

	if var_41_2 then
		var_41_1 = var_41_2:GetObject()
		arg_41_0._ob2Pool[var_41_1] = var_41_2
	elseif arg_41_0._resCacheList[var_41_0] ~= nil then
		var_41_1 = Object.Instantiate(arg_41_0._resCacheList[var_41_0])

		var_41_1:SetActive(true)
	end

	return var_41_1
end

function var_0_5.InstMap(arg_42_0, arg_42_1)
	local var_42_0 = arg_42_0.GetMapPath(arg_42_1)
	local var_42_1
	local var_42_2 = arg_42_0._allPool[var_42_0]

	if var_42_2 then
		var_42_1 = var_42_2:GetObject()
		arg_42_0._ob2Pool[var_42_1] = var_42_2
	elseif arg_42_0._resCacheList[var_42_0] ~= nil then
		var_42_1 = Object.Instantiate(arg_42_0._resCacheList[var_42_0])
	else
		assert(false, "地图资源没有预加载：" .. arg_42_1)
	end

	var_42_1:SetActive(true)

	return var_42_1
end

function var_0_5.InstCardPuzzleCard(arg_43_0)
	local var_43_0 = arg_43_0._allPool["UI/CardTowerCardCombat"]
	local var_43_1 = var_43_0:GetObject()

	arg_43_0._ob2Pool[var_43_1] = var_43_0

	return var_43_1
end

function var_0_5.GetCharacterIcon(arg_44_0, arg_44_1)
	return arg_44_0._resCacheList[var_0_5.GetHrzIcon(arg_44_1)]
end

function var_0_5.GetCharacterSquareIcon(arg_45_0, arg_45_1)
	return arg_45_0._resCacheList[var_0_5.GetSquareIcon(arg_45_1)]
end

function var_0_5.GetCharacterQIcon(arg_46_0, arg_46_1)
	return arg_46_0._resCacheList[var_0_5.GetQIcon(arg_46_1)]
end

function var_0_5.GetAircraftIcon(arg_47_0, arg_47_1)
	return arg_47_0._resCacheList[var_0_5.GetAircraftIconPath(arg_47_1)]
end

function var_0_5.GetShipTypeIcon(arg_48_0, arg_48_1)
	return arg_48_0._resCacheList[var_0_5.GetShipTypeIconPath(arg_48_1)]
end

function var_0_5.GetCommanderHrzIcon(arg_49_0, arg_49_1)
	return arg_49_0._resCacheList[var_0_5.GetCommanderHrzIconPath(arg_49_1)]
end

function var_0_5.GetCommanderIcon(arg_50_0, arg_50_1)
	return arg_50_0._resCacheList[var_0_5.GetCommanderIconPath(arg_50_1)]
end

function var_0_5.GetShader(arg_51_0, arg_51_1)
	return (pg.ShaderMgr.GetInstance():GetShader(var_0_3.BATTLE_SHADER[arg_51_1]))
end

function var_0_5.AddPreloadResource(arg_52_0, arg_52_1)
	if type(arg_52_1) == "string" then
		arg_52_0._preloadList[arg_52_1] = false
	elseif type(arg_52_1) == "table" then
		for iter_52_0, iter_52_1 in ipairs(arg_52_1) do
			arg_52_0._preloadList[iter_52_1] = false
		end
	end
end

function var_0_5.AddPreloadCV(arg_53_0, arg_53_1)
	local var_53_0 = Ship.getCVKeyID(arg_53_1)

	if var_53_0 > 0 then
		arg_53_0._battleCVList[var_53_0] = pg.CriMgr.GetBattleCVBankName(var_53_0)
	end
end

function var_0_5.StartPreload(arg_54_0, arg_54_1, arg_54_2)
	local var_54_0 = 0
	local var_54_1 = 0

	for iter_54_0, iter_54_1 in pairs(arg_54_0._preloadList) do
		var_54_1 = var_54_1 + 1
	end

	for iter_54_2, iter_54_3 in pairs(arg_54_0._battleCVList) do
		var_54_1 = var_54_1 + 1
	end

	local function var_54_2()
		if not arg_54_0._poolRoot then
			return
		end

		var_54_0 = var_54_0 + 1

		if var_54_0 > var_54_1 then
			return
		end

		if arg_54_2 then
			arg_54_2(var_54_0)
		end

		if var_54_0 == var_54_1 then
			arg_54_0._preloadList = nil

			arg_54_1()
		end
	end

	for iter_54_4, iter_54_5 in pairs(arg_54_0._battleCVList) do
		pg.CriMgr.GetInstance():LoadBattleCV(iter_54_4, var_54_2)
	end

	for iter_54_6, iter_54_7 in pairs(arg_54_0._preloadList) do
		local var_54_3 = arg_54_0.GetResName(iter_54_6)

		if var_54_3 == "" or arg_54_0._resCacheList[iter_54_6] ~= nil then
			var_54_2()
		elseif string.find(iter_54_6, "herohrzicon/") or string.find(iter_54_6, "qicon/") or string.find(iter_54_6, "squareicon/") or string.find(iter_54_6, "commanderhrz/") or string.find(iter_54_6, "commandericon/") or string.find(iter_54_6, "AircraftIcon/") then
			local var_54_4, var_54_5 = HXSet.autoHxShiftPath(iter_54_6, var_54_3)

			ResourceMgr.Inst:getAssetAsync(var_54_4, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_56_0)
				if arg_56_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_54_6 .. "<<")
				else
					if not arg_54_0._poolRoot then
						var_0_4.Destroy(arg_56_0)

						return
					end

					if arg_54_0._resCacheList then
						arg_54_0._resCacheList[iter_54_6] = arg_56_0
					end
				end

				var_54_2()
			end), true, true)
		elseif string.find(iter_54_6, "shiptype/") then
			local var_54_6 = string.split(iter_54_6, "/")[2]

			GetSpriteFromAtlasAsync("shiptype", var_54_6, function(arg_57_0)
				if arg_57_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_54_6 .. "<<")
				else
					if not arg_54_0._poolRoot then
						var_0_4.Destroy(arg_57_0)

						return
					end

					if arg_54_0._resCacheList then
						arg_54_0._resCacheList[iter_54_6] = arg_57_0
					end
				end

				var_54_2()
			end)
		elseif string.find(iter_54_6, "painting/") then
			PoolMgr.GetInstance():GetPainting(var_0_5.GetPaintingName(var_54_3), true, function(arg_58_0)
				if arg_58_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_54_6 .. "<<")
				else
					if not arg_54_0._poolRoot then
						var_0_5.ClearPaintingRes(iter_54_6, arg_58_0)

						return
					end

					ShipExpressionHelper.SetExpression(arg_58_0, var_54_3)
					arg_58_0:SetActive(false)

					if arg_54_0._resCacheList then
						arg_54_0._resCacheList[iter_54_6] = arg_58_0
					end
				end

				var_54_2()
			end)
		elseif string.find(iter_54_6, "Char/") then
			arg_54_0:LoadSpineAsset(var_54_3, function(arg_59_0)
				if arg_59_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_54_6 .. "<<")
				else
					arg_59_0 = SpineAnim.AnimChar(var_54_3, arg_59_0)

					if not arg_54_0._poolRoot then
						var_0_5.ClearCharRes(iter_54_6, arg_59_0)

						return
					end

					arg_59_0:SetActive(false)

					if arg_54_0._resCacheList then
						arg_54_0._resCacheList[iter_54_6] = arg_59_0
					end
				end

				arg_54_0:InitPool(iter_54_6, arg_59_0)
				var_54_2()
			end)
		elseif string.find(iter_54_6, "UI/") then
			print(var_54_3)
			LoadAndInstantiateAsync("UI", var_54_3, function(arg_60_0)
				if arg_60_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_54_6 .. "<<")
				else
					if not arg_54_0._poolRoot then
						var_0_4.Destroy(arg_60_0)

						return
					end

					arg_60_0:SetActive(false)

					if arg_54_0._resCacheList then
						arg_54_0._resCacheList[iter_54_6] = arg_60_0
					end
				end

				print(iter_54_6)
				arg_54_0:InitPool(iter_54_6, arg_60_0)
				var_54_2()
			end, true, true)
		else
			ResourceMgr.Inst:getAssetAsync(iter_54_6, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_61_0)
				if arg_61_0 == nil then
					originalPrint("资源预加载失败，检查以下目录：>>" .. iter_54_6 .. "<<")
				else
					if not arg_54_0._poolRoot then
						var_0_4.Destroy(arg_61_0)

						return
					end

					if arg_54_0._resCacheList then
						arg_54_0._resCacheList[iter_54_6] = arg_61_0
					end
				end

				arg_54_0:InitPool(iter_54_6, arg_61_0)
				var_54_2()
			end), true, true)
		end
	end

	return var_54_1
end

function var_0_5.GetPaintingName(arg_62_0)
	local var_62_0 = false

	if PlayerPrefs.GetInt(BATTLE_HIDE_BG, 1) > 0 then
		var_62_0 = checkABExist("painting/" .. arg_62_0 .. "_n")
	else
		var_62_0 = PlayerPrefs.GetInt("paint_hide_other_obj_" .. arg_62_0, 0) ~= 0 and checkABExist("painting/" .. arg_62_0 .. "_n")
	end

	return arg_62_0 .. (var_62_0 and "_n" or "")
end

local var_0_6 = Vector3(0, 10000, 0)

function var_0_5.HideBullet(arg_63_0)
	arg_63_0.transform.position = var_0_6
end

function var_0_5.InitParticleSystemCB(arg_64_0)
	pg.EffectMgr.GetInstance():CommonEffectEvent(arg_64_0)
end

function var_0_5.InitPool(arg_65_0, arg_65_1, arg_65_2)
	local var_65_0 = arg_65_0._poolRoot.transform

	if string.find(arg_65_1, "Item/") then
		if arg_65_2:GetComponentInChildren(typeof(UnityEngine.TrailRenderer)) ~= nil or arg_65_2:GetComponentInChildren(typeof(ParticleSystem)) ~= nil then
			arg_65_0._allPool[arg_65_1] = pg.Pool.New(arg_65_0._bulletContainer.transform, arg_65_2, 15, 20, true, false):InitSize()
		else
			local var_65_1 = pg.Pool.New(arg_65_0._bulletContainer.transform, arg_65_2, 20, 20, true, true)

			var_65_1:SetRecycleFuncs(var_0_5.HideBullet)
			var_65_1:InitSize()

			arg_65_0._allPool[arg_65_1] = var_65_1
		end
	elseif string.find(arg_65_1, "Effect/") then
		if arg_65_2:GetComponent(typeof(UnityEngine.ParticleSystem)) then
			local var_65_2 = 5

			if string.find(arg_65_1, "smoke") and not string.find(arg_65_1, "smokeboom") then
				var_65_2 = 30
			elseif string.find(arg_65_1, "feijiyingzi") then
				var_65_2 = 1
			end

			local var_65_3 = pg.Pool.New(var_65_0, arg_65_2, var_65_2, 20, false, false)

			var_65_3:SetInitFuncs(var_0_5.InitParticleSystemCB)
			var_65_3:InitSize()

			arg_65_0._allPool[arg_65_1] = var_65_3
		else
			local var_65_4 = 8

			if string.find(arg_65_1, "AntiAirArea") or string.find(arg_65_1, "AntiSubArea") then
				var_65_4 = 1
			end

			GetOrAddComponent(arg_65_2, typeof(ParticleSystemEvent))

			local var_65_5 = pg.Pool.New(var_65_0, arg_65_2, var_65_4, 20, false, false)

			var_65_5:InitSize()

			arg_65_0._allPool[arg_65_1] = var_65_5
		end
	elseif string.find(arg_65_1, "Char/") then
		local var_65_6 = 1

		if string.find(arg_65_1, "danchuan") then
			var_65_6 = 3
		end

		local var_65_7 = pg.Pool.New(var_65_0, arg_65_2, var_65_6, 20, false, false):InitSize()

		var_65_7:SetRecycleFuncs(var_0_5.ResetSpineAction)

		arg_65_0._allPool[arg_65_1] = var_65_7
	elseif string.find(arg_65_1, "chargo/") then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 3, 20, false, false):InitSize()
	elseif string.find(arg_65_1, "orbit/") then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 2, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/SkillPainting" then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 1, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/MonsterAppearUI" then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 1, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/CardTowerCardCombat" then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 7, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/combatgridmanskillfloat" then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 1, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/combatreisalinapui" then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 1, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/combatyumiamanaui" then
		arg_65_0._allPool[arg_65_1] = pg.Pool.New(var_65_0, arg_65_2, 1, 20, false, false):InitSize()
	elseif arg_65_1 == "UI/CombatHPBar" .. var_0_0.Battle.BattleState.GetCombatSkinKey() then
		var_0_0.Battle.BattleHPBarManager.GetInstance():Init(arg_65_2, var_65_0)
	elseif string.find(arg_65_1, "UI/CombatHPPop") then
		var_0_0.Battle.BattlePopNumManager.GetInstance():Init(arg_65_2, var_65_0)
	end
end

function var_0_5.GetRotateScript(arg_66_0, arg_66_1, arg_66_2)
	local var_66_0 = arg_66_0.rotateScriptMap

	if var_66_0[arg_66_1] then
		return var_66_0[arg_66_1]
	end

	local var_66_1 = GetOrAddComponent(arg_66_1, "BulletRotation")

	var_66_0[arg_66_1] = var_66_1

	return var_66_1
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
		var_0_5.GetUIPath("combatreisalinapui"),
		var_0_5.GetUIPath("combatyumiamanaui"),
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

function var_0_5.GetMapResource(arg_69_0)
	local var_69_0 = {}
	local var_69_1 = var_0_0.Battle.BattleMap

	for iter_69_0, iter_69_1 in ipairs(var_69_1.LAYERS) do
		local var_69_2 = var_69_1.GetMapResNames(arg_69_0, iter_69_1)

		for iter_69_2, iter_69_3 in ipairs(var_69_2) do
			var_69_0[#var_69_0 + 1] = var_0_5.GetMapPath(iter_69_3)
		end
	end

	return var_69_0
end

function var_0_5.GetBuffResource()
	local var_70_0 = {}
	local var_70_1 = require("buffFXPreloadList")

	for iter_70_0, iter_70_1 in ipairs(var_70_1) do
		var_70_0[#var_70_0 + 1] = var_0_5.GetFXPath(iter_70_1)
	end

	return var_70_0
end

function var_0_5.GetShipResource(arg_71_0, arg_71_1, arg_71_2)
	local var_71_0 = {}
	local var_71_1 = var_0_1.GetPlayerShipTmpDataFromID(arg_71_0)

	if arg_71_1 == nil or arg_71_1 == 0 then
		arg_71_1 = var_71_1.skin_id
	end

	local var_71_2 = var_0_1.GetPlayerShipSkinDataFromID(arg_71_1)

	var_71_0[#var_71_0 + 1] = var_0_5.GetCharacterPath(var_71_2.prefab)
	var_71_0[#var_71_0 + 1] = var_0_5.GetHrzIcon(var_71_2.painting)
	var_71_0[#var_71_0 + 1] = var_0_5.GetQIcon(var_71_2.painting)
	var_71_0[#var_71_0 + 1] = var_0_5.GetSquareIcon(var_71_2.painting)

	if arg_71_2 and var_0_1.GetShipTypeTmp(var_71_1.type).team_type == TeamType.Main then
		var_71_0[#var_71_0 + 1] = var_0_5.GetPaintingPath(var_71_2.painting)
	end

	return var_71_0
end

function var_0_5.GetEnemyResource(arg_72_0)
	local var_72_0 = {}
	local var_72_1 = arg_72_0.monsterTemplateID
	local var_72_2 = arg_72_0.bossData ~= nil
	local var_72_3 = arg_72_0.buffList or {}
	local var_72_4 = arg_72_0.phase or {}
	local var_72_5 = var_0_1.GetMonsterTmpDataFromID(var_72_1)

	var_72_0[#var_72_0 + 1] = var_0_5.GetCharacterPath(var_72_5.prefab)
	var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(var_72_5.wave_fx)

	if var_72_5.fog_fx then
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(var_72_5.fog_fx)
	end

	for iter_72_0, iter_72_1 in ipairs(var_72_5.appear_fx) do
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(iter_72_1)
	end

	for iter_72_2, iter_72_3 in ipairs(var_72_5.smoke) do
		local var_72_6 = iter_72_3[2]

		for iter_72_4, iter_72_5 in ipairs(var_72_6) do
			var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(iter_72_5[1])
		end
	end

	if arg_72_0.deadFX then
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(arg_72_0.deadFX)
	end

	if type(var_72_5.bubble_fx) == "table" then
		var_72_0[#var_72_0 + 1] = var_0_5.GetFXPath(var_72_5.bubble_fx[1])
	end

	local function var_72_7(arg_73_0)
		local var_73_0 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(arg_73_0, 1)

		for iter_73_0, iter_73_1 in pairs(var_73_0.effect_list) do
			local var_73_1 = iter_73_1.arg_list.skill_id

			if var_73_1 then
				local var_73_2 = var_0_0.Battle.BattleDataFunction.GetSkillTemplate(var_73_1).painting

				if var_73_2 == 1 then
					var_72_0[#var_72_0 + 1] = var_0_5.GetHrzIcon(var_72_5.icon)
					var_72_0[#var_72_0 + 1] = var_0_5.GetSquareIcon(var_72_5.icon)
				elseif type(var_73_2) == "string" then
					var_72_0[#var_72_0 + 1] = var_0_5.GetHrzIcon(var_73_2)
					var_72_0[#var_72_0 + 1] = var_0_5.GetSquareIcon(var_73_2)
				end
			end

			local var_73_3 = iter_73_1.arg_list.buff_id

			if var_73_3 then
				var_72_7(var_73_3)
			end
		end
	end

	for iter_72_6, iter_72_7 in ipairs(var_72_3) do
		var_72_7(iter_72_7)
	end

	for iter_72_8, iter_72_9 in ipairs(var_72_4) do
		if iter_72_9.addBuff then
			for iter_72_10, iter_72_11 in ipairs(iter_72_9.addBuff) do
				var_72_7(iter_72_11)
			end
		end
	end

	if var_72_2 then
		var_72_0[#var_72_0 + 1] = var_0_5.GetSquareIcon(var_72_5.icon)
	end

	return var_72_0
end

function var_0_5.GetWeaponResource(arg_74_0, arg_74_1)
	local var_74_0 = {}

	if arg_74_0 == -1 then
		return var_74_0
	end

	local var_74_1 = var_0_1.GetWeaponPropertyDataFromID(arg_74_0)

	if var_74_1.type == var_0_2.EquipmentType.MAIN_CANNON or var_74_1.type == var_0_2.EquipmentType.SUB_CANNON or var_74_1.type == var_0_2.EquipmentType.TORPEDO or var_74_1.type == var_0_2.EquipmentType.ANTI_AIR or var_74_1.type == var_0_2.EquipmentType.ANTI_SEA or var_74_1.type == var_0_2.EquipmentType.POINT_HIT_AND_LOCK or var_74_1.type == var_0_2.EquipmentType.MANUAL_METEOR or var_74_1.type == var_0_2.EquipmentType.BOMBER_PRE_CAST_ALERT or var_74_1.type == var_0_2.EquipmentType.DEPTH_CHARGE or var_74_1.type == var_0_2.EquipmentType.MANUAL_TORPEDO or var_74_1.type == var_0_2.EquipmentType.DISPOSABLE_TORPEDO or var_74_1.type == var_0_2.EquipmentType.MANUAL_AAMISSILE or var_74_1.type == var_0_2.EquipmentType.BEAM or var_74_1.type == var_0_2.EquipmentType.SPACE_LASER or var_74_1.type == var_0_2.EquipmentType.FLEET_RANGE_ANTI_AIR or var_74_1.type == var_0_2.EquipmentType.MANUAL_MISSILE or var_74_1.type == var_0_2.EquipmentType.AUTO_MISSILE or var_74_1.type == var_0_2.EquipmentType.MISSILE then
		for iter_74_0, iter_74_1 in ipairs(var_74_1.bullet_ID) do
			local var_74_2 = var_0_5.GetBulletResource(iter_74_1, arg_74_1)

			for iter_74_2, iter_74_3 in ipairs(var_74_2) do
				var_74_0[#var_74_0 + 1] = iter_74_3
			end
		end
	elseif var_74_1.type == var_0_2.EquipmentType.INTERCEPT_AIRCRAFT or var_74_1.type == var_0_2.EquipmentType.STRIKE_AIRCRAFT then
		var_74_0 = var_0_5.GetAircraftResource(arg_74_0, nil, arg_74_1)
	elseif var_74_1.type == var_0_2.EquipmentType.PREVIEW_ARICRAFT then
		for iter_74_4, iter_74_5 in ipairs(var_74_1.bullet_ID) do
			var_74_0 = var_0_5.GetAircraftResource(iter_74_5, nil, arg_74_1)
		end
	end

	if var_74_1.type == var_0_2.EquipmentType.FLEET_RANGE_ANTI_AIR then
		local var_74_3 = var_0_5.GetBulletResource(var_0_3.AntiAirConfig.RangeBulletID)

		for iter_74_6, iter_74_7 in ipairs(var_74_3) do
			var_74_0[#var_74_0 + 1] = iter_74_7
		end
	end

	local var_74_4

	if arg_74_1 and arg_74_1 ~= 0 then
		var_74_4 = var_0_0.Battle.BattleDataFunction.GetEquipSkinDataFromID(arg_74_1)
	end

	if var_74_4 and var_74_4.fire_fx_name ~= "" then
		var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_4.fire_fx_name)
	else
		var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_1.fire_fx)
	end

	if var_74_1.precast_param.fx then
		var_74_0[#var_74_0 + 1] = var_0_5.GetFXPath(var_74_1.precast_param.fx)
	end

	if var_74_4 then
		local var_74_5 = var_74_4.orbit_combat

		if var_74_5 ~= "" then
			var_74_0[#var_74_0 + 1] = var_0_5.GetOrbitPath(var_74_5)
		end
	end

	return var_74_0
end

function var_0_5.GetEquipResource(arg_75_0, arg_75_1, arg_75_2)
	local var_75_0 = {}

	if arg_75_1 ~= 0 then
		local var_75_1 = var_0_0.Battle.BattleDataFunction.GetEquipSkinDataFromID(arg_75_1)
		local var_75_2 = var_75_1.ship_skin_id

		if var_75_2 ~= 0 then
			local var_75_3 = var_0_0.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(var_75_2)

			var_75_0[#var_75_0 + 1] = var_0_5.GetCharacterPath(var_75_3.prefab)
		end

		local var_75_4 = var_75_1.orbit_combat

		if var_75_4 ~= "" then
			var_75_0[#var_75_0 + 1] = var_0_5.GetOrbitPath(var_75_4)
		end
	end

	local var_75_5 = var_0_0.Battle.BattleDataFunction.GetWeaponDataFromID(arg_75_0)
	local var_75_6 = var_75_5.weapon_id

	for iter_75_0, iter_75_1 in ipairs(var_75_6) do
		local var_75_7 = var_0_5.GetWeaponResource(iter_75_1)

		for iter_75_2, iter_75_3 in ipairs(var_75_7) do
			var_75_0[#var_75_0 + 1] = iter_75_3
		end
	end

	local var_75_8 = var_75_5.skill_id

	for iter_75_4, iter_75_5 in ipairs(var_75_8) do
		local var_75_9 = arg_75_2 and var_0_0.Battle.BattleDataFunction.SkillTranform(arg_75_2, iter_75_5[1]) or iter_75_5[1]
		local var_75_10 = iter_75_5[2] or 1
		local var_75_11 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(var_75_9, var_75_10, {})

		for iter_75_6, iter_75_7 in ipairs(var_75_11) do
			var_75_0[#var_75_0 + 1] = iter_75_7
		end
	end

	return var_75_0
end

function var_0_5.GetBulletResource(arg_76_0, arg_76_1)
	local var_76_0 = {}
	local var_76_1

	if arg_76_1 ~= nil and arg_76_1 ~= 0 then
		var_76_1 = var_0_1.GetEquipSkinDataFromID(arg_76_1)
	end

	local var_76_2 = var_0_1.GetBulletTmpDataFromID(arg_76_0)
	local var_76_3

	if var_76_1 then
		var_76_3 = var_76_1.bullet_name

		if var_76_1.mirror == 1 then
			var_76_0[#var_76_0 + 1] = var_0_5.GetBulletPath(var_76_3 .. var_0_0.Battle.BattleBulletUnit.MIRROR_RES)
		end
	else
		var_76_3 = var_76_2.modle_ID
	end

	if var_76_2.type == var_0_2.BulletType.BEAM or var_76_2.type == var_0_2.BulletType.SPACE_LASER or var_76_2.type == var_0_2.BulletType.MISSILE or var_76_2.type == var_0_2.BulletType.ELECTRIC_ARC then
		var_76_0[#var_76_0 + 1] = var_0_5.GetFXPath(var_76_2.modle_ID)
	else
		var_76_0[#var_76_0 + 1] = var_0_5.GetBulletPath(var_76_3)
	end

	if var_76_2.extra_param.mirror then
		var_76_0[#var_76_0 + 1] = var_0_5.GetBulletPath(var_76_3 .. var_0_0.Battle.BattleBulletUnit.MIRROR_RES)
	end

	local var_76_4

	if var_76_1 and var_76_1.hit_fx_name ~= "" then
		var_76_4 = var_76_1.hit_fx_name
	else
		var_76_4 = var_76_2.hit_fx
	end

	var_76_0[#var_76_0 + 1] = var_0_5.GetFXPath(var_76_4)
	var_76_0[#var_76_0 + 1] = var_0_5.GetFXPath(var_76_2.miss_fx)
	var_76_0[#var_76_0 + 1] = var_0_5.GetFXPath(var_76_2.alert_fx)

	if var_76_2.extra_param.area_FX then
		var_76_0[#var_76_0 + 1] = var_0_5.GetFXPath(var_76_2.extra_param.area_FX)
	end

	if var_76_2.extra_param.shrapnel then
		for iter_76_0, iter_76_1 in ipairs(var_76_2.extra_param.shrapnel) do
			local var_76_5 = var_0_5.GetBulletResource(iter_76_1.bullet_ID)

			for iter_76_2, iter_76_3 in ipairs(var_76_5) do
				var_76_0[#var_76_0 + 1] = iter_76_3
			end
		end
	end

	for iter_76_4, iter_76_5 in ipairs(var_76_2.attach_buff) do
		if iter_76_5.effect_id then
			var_76_0[#var_76_0 + 1] = var_0_5.GetFXPath(iter_76_5.effect_id)
		end

		if iter_76_5.buff_id then
			local var_76_6 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_76_5.buff_id, 1, {})

			for iter_76_6, iter_76_7 in ipairs(var_76_6) do
				var_76_0[#var_76_0 + 1] = iter_76_7
			end
		end
	end

	return var_76_0
end

function var_0_5.GetAircraftResource(arg_77_0, arg_77_1, arg_77_2, arg_77_3)
	local var_77_0 = {}

	arg_77_2 = arg_77_2 or 0

	local var_77_1 = var_0_1.GetAircraftTmpDataFromID(arg_77_0)
	local var_77_2
	local var_77_3
	local var_77_4
	local var_77_5

	if arg_77_2 ~= 0 then
		local var_77_6, var_77_7, var_77_8

		var_77_2, var_77_6, var_77_7, var_77_8 = var_0_1.GetEquipSkin(arg_77_2)

		if var_77_6 ~= "" then
			var_77_0[#var_77_0 + 1] = var_0_5.GetBulletPath(var_77_6)
		end

		if var_77_7 ~= "" then
			var_77_0[#var_77_0 + 1] = var_0_5.GetBulletPath(var_77_7)
		end

		if var_77_8 ~= "" then
			var_77_0[#var_77_0 + 1] = var_0_5.GetBulletPath(var_77_8)
		end
	else
		var_77_2 = var_77_1.model_ID
	end

	var_77_0[#var_77_0 + 1] = var_0_5.GetCharacterGoPath(var_77_2)

	if arg_77_3 then
		var_77_0[#var_77_0 + 1] = var_0_5.GetAircraftIconPath(var_77_1.model_ID)
	end

	local var_77_9 = arg_77_1 or var_77_1.weapon_ID

	if type(var_77_9) == "table" then
		for iter_77_0, iter_77_1 in ipairs(var_77_9) do
			local var_77_10 = var_0_5.GetWeaponResource(iter_77_1)

			for iter_77_2, iter_77_3 in ipairs(var_77_10) do
				var_77_0[#var_77_0 + 1] = iter_77_3
			end
		end
	else
		local var_77_11 = var_0_5.GetWeaponResource(var_77_9)

		for iter_77_4, iter_77_5 in ipairs(var_77_11) do
			var_77_0[#var_77_0 + 1] = iter_77_5
		end
	end

	return var_77_0
end

function var_0_5.GetCommanderResource(arg_78_0)
	local var_78_0 = {}
	local var_78_1 = arg_78_0[1]

	var_78_0[#var_78_0 + 1] = var_0_5.GetCommanderHrzIconPath(var_78_1:getPainting())
	var_78_0[#var_78_0 + 1] = var_0_5.GetCommanderIconPath(var_78_1:getPainting())

	local var_78_2 = var_78_1:getSkills()[1]:getLevel()

	for iter_78_0, iter_78_1 in ipairs(arg_78_0[2]) do
		local var_78_3 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_78_1, var_78_2, {})

		for iter_78_2, iter_78_3 in ipairs(var_78_3) do
			var_78_0[#var_78_0 + 1] = iter_78_3
		end
	end

	return var_78_0
end

function var_0_5.GetStageResource(arg_79_0)
	local var_79_0 = var_0_0.Battle.BattleDataFunction.GetDungeonTmpDataByID(arg_79_0)
	local var_79_1 = {}
	local var_79_2 = {}

	for iter_79_0, iter_79_1 in ipairs(var_79_0.stages) do
		if iter_79_1.stageBuff then
			for iter_79_2, iter_79_3 in ipairs(iter_79_1.stageBuff) do
				local var_79_3 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_79_3.id, iter_79_3.level, {})

				for iter_79_4, iter_79_5 in ipairs(var_79_3) do
					print(iter_79_5)

					var_79_1[#var_79_1 + 1] = iter_79_5
				end
			end
		end

		for iter_79_6, iter_79_7 in ipairs(iter_79_1.waves) do
			if iter_79_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.NORMAL then
				for iter_79_8, iter_79_9 in ipairs(iter_79_7.spawn) do
					local var_79_4 = var_0_5.GetMonsterRes(iter_79_9)

					for iter_79_10, iter_79_11 in ipairs(var_79_4) do
						table.insert(var_79_1, iter_79_11)
					end
				end

				if iter_79_7.reinforcement then
					for iter_79_12, iter_79_13 in ipairs(iter_79_7.reinforcement) do
						local var_79_5 = var_0_5.GetMonsterRes(iter_79_13)

						for iter_79_14, iter_79_15 in ipairs(var_79_5) do
							table.insert(var_79_1, iter_79_15)
						end
					end
				end
			elseif iter_79_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.AID then
				local var_79_6 = iter_79_7.triggerParams.vanguard_unitList
				local var_79_7 = iter_79_7.triggerParams.main_unitList
				local var_79_8 = iter_79_7.triggerParams.sub_unitList

				local function var_79_9(arg_80_0)
					local var_80_0 = var_0_5.GetAidUnitsRes(arg_80_0)

					for iter_80_0, iter_80_1 in ipairs(var_80_0) do
						table.insert(var_79_1, iter_80_1)
					end

					for iter_80_2, iter_80_3 in ipairs(arg_80_0) do
						var_79_2[#var_79_2 + 1] = iter_80_3.skinId
					end
				end

				if var_79_6 then
					var_79_9(var_79_6)
				end

				if var_79_7 then
					var_79_9(var_79_7)
				end

				if var_79_8 then
					var_79_9(var_79_8)
				end
			elseif iter_79_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.ENVIRONMENT then
				for iter_79_16, iter_79_17 in ipairs(iter_79_7.spawn) do
					var_0_5.GetEnvironmentRes(var_79_1, iter_79_17)
				end
			elseif iter_79_7.triggerType == var_0_0.Battle.BattleConst.WaveTriggerType.CARD_PUZZLE then
				local var_79_10 = var_0_0.Battle.BattleDataFunction.GetCardRes(iter_79_7.triggerParams.card_id)

				for iter_79_18, iter_79_19 in ipairs(var_79_10) do
					table.insert(var_79_1, iter_79_19)
				end
			end

			if iter_79_7.airFighter ~= nil then
				for iter_79_20, iter_79_21 in pairs(iter_79_7.airFighter) do
					local var_79_11 = var_0_5.GetAircraftResource(iter_79_21.templateID, iter_79_21.weaponID, nil, true)

					for iter_79_22, iter_79_23 in ipairs(var_79_11) do
						var_79_1[#var_79_1 + 1] = iter_79_23
					end
				end
			end
		end
	end

	return var_79_1, var_79_2
end

function var_0_5.GetEnvironmentRes(arg_81_0, arg_81_1)
	table.insert(arg_81_0, arg_81_1.prefab and var_0_5.GetFXPath(arg_81_1.prefab))

	local var_81_0 = arg_81_1.behaviours
	local var_81_1 = var_0_0.Battle.BattleDataFunction.GetEnvironmentBehaviour(var_81_0).behaviour_list

	for iter_81_0, iter_81_1 in ipairs(var_81_1) do
		local var_81_2 = iter_81_1.type

		if var_81_2 == var_0_0.Battle.BattleConst.EnviroumentBehaviour.BUFF then
			local var_81_3 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_81_1.buff_id, 1, {})

			for iter_81_2, iter_81_3 in ipairs(var_81_3) do
				arg_81_0[#arg_81_0 + 1] = iter_81_3
			end
		elseif var_81_2 == var_0_0.Battle.BattleConst.EnviroumentBehaviour.SPAWN then
			local var_81_4 = iter_81_1.content and iter_81_1.content.alert and iter_81_1.content.alert.alert_fx

			table.insert(arg_81_0, var_81_4 and var_0_5.GetFXPath(var_81_4))

			local var_81_5 = iter_81_1.content and iter_81_1.content.child_prefab

			if var_81_5 then
				var_0_5.GetEnvironmentRes(arg_81_0, var_81_5)
			end
		elseif var_81_2 == var_0_0.Battle.BattleConst.EnviroumentBehaviour.PLAY_FX then
			arg_81_0[#arg_81_0 + 1] = var_0_5.GetFXPath(iter_81_1.FX_ID)
		end
	end
end

function var_0_5.GetMonsterRes(arg_82_0)
	local var_82_0 = {}
	local var_82_1 = var_0_5.GetEnemyResource(arg_82_0)

	for iter_82_0, iter_82_1 in ipairs(var_82_1) do
		var_82_0[#var_82_0 + 1] = iter_82_1
	end

	local var_82_2 = var_0_0.Battle.BattleDataFunction.GetMonsterTmpDataFromID(arg_82_0.monsterTemplateID)
	local var_82_3 = Clone(var_82_2.equipment_list)
	local var_82_4 = var_82_2.buff_list
	local var_82_5 = Clone(arg_82_0.buffList) or {}

	if arg_82_0.phase then
		for iter_82_2, iter_82_3 in ipairs(arg_82_0.phase) do
			if iter_82_3.addWeapon then
				for iter_82_4, iter_82_5 in ipairs(iter_82_3.addWeapon) do
					var_82_3[#var_82_3 + 1] = iter_82_5
				end
			end

			if iter_82_3.addRandomWeapon then
				for iter_82_6, iter_82_7 in ipairs(iter_82_3.addRandomWeapon) do
					for iter_82_8, iter_82_9 in ipairs(iter_82_7) do
						var_82_3[#var_82_3 + 1] = iter_82_9
					end
				end
			end

			if iter_82_3.addBuff then
				for iter_82_10, iter_82_11 in ipairs(iter_82_3.addBuff) do
					var_82_5[#var_82_5 + 1] = iter_82_11
				end
			end
		end
	end

	for iter_82_12, iter_82_13 in ipairs(var_82_4) do
		local var_82_6 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_82_13.ID, iter_82_13.LV, {})

		for iter_82_14, iter_82_15 in ipairs(var_82_6) do
			var_82_0[#var_82_0 + 1] = iter_82_15
		end
	end

	for iter_82_16, iter_82_17 in ipairs(var_82_5) do
		local var_82_7 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(iter_82_17, 1, {})

		for iter_82_18, iter_82_19 in ipairs(var_82_7) do
			var_82_0[#var_82_0 + 1] = iter_82_19
		end

		local var_82_8 = var_0_0.Battle.BattleDataFunction.GetBuffTemplate(iter_82_17, 1)

		for iter_82_20, iter_82_21 in pairs(var_82_8.effect_list) do
			local var_82_9 = iter_82_21.arg_list.skill_id

			if var_82_9 and var_0_0.Battle.BattleDataFunction.NeedSkillPainting(var_82_9) then
				var_82_0[#var_82_0 + 1] = var_0_5.GetPaintingPath(var_0_1.GetMonsterTmpDataFromID(arg_82_0.monsterTemplateID).icon)

				break
			end
		end
	end

	for iter_82_22, iter_82_23 in ipairs(var_82_3) do
		local var_82_10 = var_0_5.GetWeaponResource(iter_82_23)

		for iter_82_24, iter_82_25 in ipairs(var_82_10) do
			var_82_0[#var_82_0 + 1] = iter_82_25
		end
	end

	return var_82_0
end

function var_0_5.GetEquipSkinPreviewRes(arg_83_0)
	local var_83_0 = {}
	local var_83_1 = var_0_1.GetEquipSkinDataFromID(arg_83_0)

	for iter_83_0, iter_83_1 in ipairs(var_83_1.weapon_ids) do
		local var_83_2 = var_0_5.GetWeaponResource(iter_83_1)

		for iter_83_2, iter_83_3 in ipairs(var_83_2) do
			var_83_0[#var_83_0 + 1] = iter_83_3
		end
	end

	local function var_83_3(arg_84_0)
		if arg_84_0 ~= "" then
			var_83_0[#var_83_0 + 1] = var_0_5.GetBulletPath(arg_84_0)
		end
	end

	local var_83_4, var_83_5, var_83_6, var_83_7, var_83_8, var_83_9 = var_0_1.GetEquipSkin(arg_83_0)

	if _.any(EquipType.AirProtoEquipTypes, function(arg_85_0)
		return table.contains(var_83_1.equip_type, arg_85_0)
	end) then
		var_83_0[#var_83_0 + 1] = var_0_5.GetCharacterGoPath(var_83_4)
	else
		var_83_0[#var_83_0 + 1] = var_0_5.GetBulletPath(var_83_4)
	end

	var_83_3(var_83_5)
	var_83_3(var_83_6)
	var_83_3(var_83_7)

	if var_83_8 and var_83_8 ~= "" then
		var_83_0[#var_83_0 + 1] = var_0_5.GetFXPath(var_83_8)
	end

	if var_83_9 and var_83_9 ~= "" then
		var_83_0[#var_83_0 + 1] = var_0_5.GetFXPath(var_83_9)
	end

	return var_83_0
end

function var_0_5.GetEquipSkinBulletRes(arg_86_0)
	local var_86_0 = {}
	local var_86_1, var_86_2, var_86_3, var_86_4 = var_0_1.GetEquipSkin(arg_86_0)

	local function var_86_5(arg_87_0)
		if arg_87_0 ~= "" then
			var_86_0[#var_86_0 + 1] = var_0_5.GetBulletPath(arg_87_0)
		end
	end

	local var_86_6 = var_0_1.GetEquipSkinDataFromID(arg_86_0)
	local var_86_7 = false

	for iter_86_0, iter_86_1 in ipairs(var_86_6.equip_type) do
		if table.contains(EquipType.AircraftSkinType, iter_86_1) then
			var_86_7 = true
		end
	end

	if var_86_7 then
		if var_86_1 ~= "" then
			var_86_0[#var_86_0 + 1] = var_0_5.GetCharacterGoPath(var_86_1)
		end
	else
		var_86_5(var_86_1)

		if var_0_1.GetEquipSkinDataFromID(arg_86_0).mirror == 1 then
			var_86_0[#var_86_0 + 1] = var_0_5.GetBulletPath(var_86_1 .. var_0_0.Battle.BattleBulletUnit.MIRROR_RES)
		end
	end

	var_86_5(var_86_2)
	var_86_5(var_86_3)
	var_86_5(var_86_4)

	return var_86_0
end

function var_0_5.GetAidUnitsRes(arg_88_0)
	local var_88_0 = {}

	for iter_88_0, iter_88_1 in ipairs(arg_88_0) do
		local var_88_1 = var_0_5.GetShipResource(iter_88_1.tmpID, nil, true)

		for iter_88_2, iter_88_3 in ipairs(iter_88_1.equipment) do
			if iter_88_3 ~= 0 then
				if iter_88_2 <= Ship.WEAPON_COUNT then
					local var_88_2 = var_0_1.GetWeaponDataFromID(iter_88_3).weapon_id

					for iter_88_4, iter_88_5 in ipairs(var_88_2) do
						local var_88_3 = var_0_5.GetWeaponResource(iter_88_5)

						for iter_88_6, iter_88_7 in ipairs(var_88_3) do
							table.insert(var_88_1, iter_88_7)
						end
					end
				else
					local var_88_4 = var_0_5.GetEquipResource(iter_88_3)

					for iter_88_8, iter_88_9 in ipairs(var_88_4) do
						table.insert(var_88_1, iter_88_9)
					end
				end
			end
		end

		for iter_88_10, iter_88_11 in ipairs(var_88_1) do
			table.insert(var_88_0, iter_88_11)
		end
	end

	return var_88_0
end

function var_0_5.GetSpWeaponResource(arg_89_0, arg_89_1)
	local var_89_0 = {}
	local var_89_1 = var_0_0.Battle.BattleDataFunction.GetSpWeaponDataFromID(arg_89_0).effect_id

	if var_89_1 ~= 0 then
		var_89_1 = arg_89_1 and var_0_0.Battle.BattleDataFunction.SkillTranform(arg_89_1, var_89_1) or var_89_1

		local var_89_2 = var_0_0.Battle.BattleDataFunction.GetResFromBuff(var_89_1, 1, {})

		for iter_89_0, iter_89_1 in ipairs(var_89_2) do
			var_89_0[#var_89_0 + 1] = iter_89_1
		end
	end

	return var_89_0
end
