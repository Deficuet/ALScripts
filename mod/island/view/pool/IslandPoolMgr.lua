local var_0_0 = class("IslandPoolMgr")
local var_0_1 = 1
local var_0_2 = 2
local var_0_3 = 3
local var_0_4 = 4
local var_0_5 = 5
local var_0_6 = 6
local var_0_7 = 7
local var_0_8 = 8
local var_0_9 = 9
local var_0_10 = 10

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.pools = {
		[var_0_1] = IslandObjectPoolSet.New(arg_1_1, 3, 2),
		[var_0_3] = IslandObjectPoolSet.New(arg_1_1, 8, 2),
		[var_0_6] = IslandObjectPoolSet.New(arg_1_1, 3, 5),
		[var_0_7] = IslandObjectPoolSet.New(arg_1_1, 3, 5),
		[var_0_8] = IslandObjectPoolSet.New(arg_1_1, 10, 3),
		[var_0_9] = IslandAgoraFurnitureTplPool.New(arg_1_1, 1, 20),
		[var_0_10] = IslandObjectPoolSet.New(arg_1_1, 2, 5),
		[var_0_2] = IslandAssetPoolSet.New(arg_1_1, 5, 2),
		[var_0_4] = IslandAssetPoolSet.New(arg_1_1, 5, 2),
		[var_0_5] = IslandAssetPoolSet.New(arg_1_1, 5, 2)
	}
end

function var_0_0.Init(arg_2_0, arg_2_1)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in pairs(arg_2_0.pools) do
		table.insert(var_2_0, function(arg_3_0)
			iter_2_1:Init(arg_3_0)
		end)
	end

	parallelAsync(var_2_0, arg_2_1)
end

function var_0_0.GetPool(arg_4_0, arg_4_1)
	assert(arg_4_0.pools[arg_4_1], "pool is nil >>>" .. arg_4_1)

	return arg_4_0.pools[arg_4_1]
end

local function var_0_11(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = {}
	local var_5_1
	local var_5_2

	table.insert(var_5_0, function(arg_6_0)
		arg_5_0:GetObject(arg_5_2, typeof(GameObject), function(arg_7_0)
			var_5_1 = arg_7_0

			arg_6_0()
		end)
	end)
	table.insert(var_5_0, function(arg_8_0)
		arg_5_1:GetObject(arg_5_3, typeof(RuntimeAnimatorController), function(arg_9_0)
			var_5_2 = arg_9_0

			arg_8_0()
		end)
	end)
	seriesAsync(var_5_0, function()
		GetOrAddComponent(var_5_1.transform, typeof(Animator)).runtimeAnimatorController = var_5_2

		arg_5_4(var_5_1)
	end)
end

local function var_0_12(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = {}

	table.insert(var_11_0, function(arg_12_0)
		var_0_11(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_12_0)
	end)
	seriesAsync(var_11_0, function(arg_13_0)
		local var_13_0 = GameObject.New(arg_13_0.name)

		setParent(arg_13_0, var_13_0.transform, false)
		arg_11_4(var_13_0)
	end)
end

local function var_0_13(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4, arg_14_5)
	local var_14_0 = GetOrAddComponent(arg_14_4, typeof(Animator))
	local var_14_1 = var_14_0.runtimeAnimatorController

	arg_14_1:ReturnObject(arg_14_3, var_14_1)

	var_14_0.runtimeAnimatorController = nil

	arg_14_0:ReturnObject(arg_14_2, arg_14_4)
end

local function var_0_14(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = arg_15_4.transform:GetChild(0).gameObject

	var_0_13(arg_15_0, arg_15_1, arg_15_2, arg_15_3, var_15_0)
	Object.Destroy(arg_15_4)
end

function var_0_0.GetCharacter(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_0:GetPool(var_0_1)
	local var_16_1 = arg_16_0:GetPool(var_0_2)

	var_0_12(var_16_0, var_16_1, arg_16_1, arg_16_2, arg_16_3, notWarp)
end

function var_0_0.ReturnCharacter(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	local var_17_0 = arg_17_0:GetPool(var_0_1)
	local var_17_1 = arg_17_0:GetPool(var_0_2)

	var_0_14(var_17_0, var_17_1, arg_17_1, arg_17_2, arg_17_3)
end

function var_0_0.GetCharacterModel(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0:GetPool(var_0_1)
	local var_18_1 = arg_18_0:GetPool(var_0_2)

	var_0_11(var_18_0, var_18_1, arg_18_1, arg_18_2, arg_18_3)
end

function var_0_0.ReturnCharacterModel(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_0:GetPool(var_0_1)
	local var_19_1 = arg_19_0:GetPool(var_0_2)

	var_0_13(var_19_0, var_19_1, arg_19_1, arg_19_2, arg_19_3)
end

function var_0_0.GetSceneCharacter(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = arg_20_0:GetPool(var_0_3)
	local var_20_1 = arg_20_0:GetPool(var_0_4)
	local var_20_2 = arg_20_0:GetPool(var_0_5)
	local var_20_3 = {}
	local var_20_4

	table.insert(var_20_3, function(arg_21_0)
		var_0_12(var_20_0, var_20_1, arg_20_1, arg_20_2, function(arg_22_0)
			var_20_4 = arg_22_0

			arg_21_0()
		end)
	end)

	if arg_20_3 and arg_20_3 ~= "" then
		table.insert(var_20_3, function(arg_23_0)
			var_20_2:GetObject(arg_20_3, typeof(NodeCanvas.BehaviourTrees.BehaviourTree), function(arg_24_0)
				GetOrAddComponent(var_20_4, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = arg_24_0

				arg_23_0()
			end)
		end)
	end

	seriesAsync(var_20_3, function()
		arg_20_4(var_20_4)
	end)
end

function var_0_0.ReturnSceneCharacter(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = arg_26_0:GetPool(var_0_3)
	local var_26_1 = arg_26_0:GetPool(var_0_4)
	local var_26_2 = arg_26_0:GetPool(var_0_5)

	if arg_26_3 and arg_26_3 ~= "" then
		local var_26_3 = GetOrAddComponent(arg_26_4, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))
		local var_26_4 = var_26_3.graph

		var_26_2:ReturnObject(arg_26_3, var_26_4)

		var_26_3.graph = nil
	end

	var_0_14(var_26_0, var_26_1, arg_26_1, arg_26_2, arg_26_4)
end

function var_0_0.GetSceneProductItem(arg_27_0, arg_27_1, arg_27_2)
	arg_27_0:GetPool(var_0_6):GetObject(arg_27_1, typeof(GameObject), arg_27_2)
end

function var_0_0.ReturnSceneProductItem(arg_28_0, arg_28_1, arg_28_2)
	arg_28_0:GetPool(var_0_6):ReturnObject(arg_28_1, arg_28_2)
end

function var_0_0.ClearSceneProductItem(arg_29_0, arg_29_1, arg_29_2)
	arg_29_0:GetPool(var_0_6):Clear()
end

function var_0_0.GetSceneProductEffect(arg_30_0, arg_30_1, arg_30_2)
	arg_30_0:GetPool(var_0_7):GetObject(arg_30_1, typeof(GameObject), arg_30_2)
end

function var_0_0.ReturnSceneProductEffect(arg_31_0, arg_31_1, arg_31_2)
	arg_31_0:GetPool(var_0_7):ReturnObject(arg_31_1, arg_31_2)
end

function var_0_0.ClearSceneProductEffect(arg_32_0, arg_32_1, arg_32_2)
	arg_32_0:GetPool(var_0_7):Clear()
end

function var_0_0.GetAgoraObj(arg_33_0, arg_33_1, arg_33_2)
	arg_33_0:GetPool(var_0_8):GetObject(arg_33_1, typeof(GameObject), arg_33_2)
end

function var_0_0.ReturnAgoraObj(arg_34_0, arg_34_1, arg_34_2)
	arg_34_0:GetPool(var_0_8):ReturnObject(arg_34_1, arg_34_2)
end

function var_0_0.GetAgoraRoot(arg_35_0)
	return arg_35_0:GetPool(var_0_9):GetObject()
end

function var_0_0.ReturnAgoraRoot(arg_36_0, arg_36_1)
	arg_36_0:GetPool(var_0_9):ReturnObject(arg_36_1)
end

function var_0_0.ClearAograPools(arg_37_0)
	arg_37_0:GetPool(var_0_8):Clear()
	arg_37_0:GetPool(var_0_9):Clear()
end

function var_0_0.BuildCommanderPart(arg_38_0, arg_38_1, arg_38_2)
	local var_38_0 = {}

	table.insert(var_38_0, function(arg_39_0)
		local var_39_0 = 0
		local var_39_1 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()
		local var_39_2 = var_39_1:IsNew()

		local function var_39_3()
			var_39_0 = var_39_0 + 1

			if var_39_0 == #IslandShipDressHelperNew.CommanderCustom then
				arg_39_0()
			end
		end

		for iter_39_0, iter_39_1 in ipairs(IslandShipDressHelperNew.CommanderCustom) do
			local var_39_4 = var_39_2 and IslandShipDressHelperNew.GetInitDressByType(iter_39_1) or var_39_1:GetDressByType(iter_39_1)
			local var_39_5 = var_39_1:GetCurrentColorByDressId(var_39_4)

			if var_39_4 == 0 then
				GraphicsInterface.Instance:SetCharacterComponentShow(arg_38_1, IslandShipDressHelperNew.ComponentType.Headware, false, var_39_3)
			else
				local var_39_6 = pg.island_dress_template[var_39_4].model

				if var_39_5 == 0 then
					GraphicsInterface.Instance:LoadCharacterComponent(arg_38_1, var_39_6, var_39_3)
				else
					local var_39_7 = pg.island_dress_colordiff_template[var_39_5].model

					GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_38_1, var_39_6, var_39_7, var_39_3)
				end
			end
		end
	end)
	seriesAsync(var_38_0, function()
		arg_38_2(arg_38_1)
	end)
end

function var_0_0.LoadAnimator(arg_42_0, arg_42_1, arg_42_2, arg_42_3)
	ResourceMgr.Inst:getAssetAsync(arg_42_2, "", typeof(RuntimeAnimatorController), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_43_0)
		local var_43_0 = Object.Instantiate(arg_43_0)

		GetOrAddComponent(arg_42_1.transform, typeof(Animator)).runtimeAnimatorController = var_43_0

		arg_42_3()
	end), true, true)
end

function var_0_0.NestModel(arg_44_0, arg_44_1)
	local var_44_0 = arg_44_1.name
	local var_44_1 = GameObject.New(var_44_0)

	setParent(arg_44_1.transform, var_44_1.transform, false)

	arg_44_1 = var_44_1

	return arg_44_1
end

function var_0_0.GetCommanderModel(arg_45_0, arg_45_1, arg_45_2)
	local var_45_0 = {}
	local var_45_1

	table.insert(var_45_0, function(arg_46_0)
		ResourceMgr.Inst:getAssetAsync(arg_45_1.model, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_47_0)
			var_45_1 = Object.Instantiate(arg_47_0)

			arg_46_0(var_45_1)
		end), true, true)
	end)
	table.insert(var_45_0, function(arg_48_0)
		arg_45_0:BuildCommanderPart(var_45_1, arg_48_0)
	end)
	table.insert(var_45_0, function(arg_49_0)
		arg_45_0:LoadAnimator(var_45_1, arg_45_1.animator, arg_49_0)
	end)
	table.insert(var_45_0, function(arg_50_0)
		var_45_1 = arg_45_0:NestModel(var_45_1)

		arg_50_0()
	end)
	seriesAsync(var_45_0, function()
		arg_45_2(var_45_1)
	end)
end

function var_0_0.ReturnCommanderModel(arg_52_0, arg_52_1)
	Object.Destroy(arg_52_1)
end

function var_0_0.GetDelegateEffect(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0:GetPool(var_0_10):GetObject(arg_53_1, typeof(GameObject), arg_53_2)
end

function var_0_0.ReturnDelegateEffect(arg_54_0, arg_54_1, arg_54_2)
	arg_54_0:GetPool(var_0_10):ReturnObject(arg_54_1, arg_54_2)
end

function var_0_0.ClearDelegateEffect(arg_55_0)
	arg_55_0:GetPool(var_0_10):Clear()
end

function var_0_0.Dispose(arg_56_0)
	for iter_56_0, iter_56_1 in pairs(arg_56_0.pools) do
		iter_56_1:Dispose()
	end

	arg_56_0.pools = nil
end

return var_0_0
