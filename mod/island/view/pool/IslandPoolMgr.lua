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
local var_0_11 = 11

function var_0_0.Ctor(arg_1_0, arg_1_1)
	arg_1_0.pools = {
		[var_0_1] = IslandObjectPoolSet.New(arg_1_1, 3, 2),
		[var_0_3] = IslandObjectPoolSet.New(arg_1_1, 8, 2),
		[var_0_6] = IslandObjectPoolSet.New(arg_1_1, 3, 5),
		[var_0_7] = IslandObjectPoolSet.New(arg_1_1, 3, 5),
		[var_0_8] = IslandObjectPoolSet.New(arg_1_1, 10, 3),
		[var_0_9] = IslandRootTplPool.New(arg_1_1, "ui/agorafurnituretpl", 1, 20),
		[var_0_10] = IslandObjectPoolSet.New(arg_1_1, 2, 6),
		[var_0_11] = IslandUITplPoolSet.New(arg_1_1, "ui/IslandOpUI", 1, 1, false),
		[var_0_2] = IslandAssetPoolSet.New(arg_1_1, 5, 2),
		[var_0_4] = IslandAssetPoolSet.New(arg_1_1, 5, 2),
		[var_0_5] = IslandAssetPoolSet.New(arg_1_1, 5, 2)
	}
	arg_1_0.loadingIdList = {}
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

local function var_0_12(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
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

local function var_0_13(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = GetOrAddComponent(arg_11_4, typeof(Animator))
	local var_11_1 = var_11_0.runtimeAnimatorController

	arg_11_1:ReturnObject(arg_11_3, var_11_1)

	var_11_0.runtimeAnimatorController = nil

	arg_11_0:ReturnObject(arg_11_2, arg_11_4)
end

local function var_0_14(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	local var_12_0 = {}

	table.insert(var_12_0, function(arg_13_0)
		var_0_12(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_13_0)
	end)
	seriesAsync(var_12_0, function(arg_14_0)
		local var_14_0 = GameObject.New(arg_14_0.name)

		setParent(arg_14_0, var_14_0.transform, false)
		arg_12_4(var_14_0)
	end)
end

local function var_0_15(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = arg_15_4.transform:GetChild(0).gameObject

	var_0_13(arg_15_0, arg_15_1, arg_15_2, arg_15_3, var_15_0)
	Object.Destroy(arg_15_4)
end

function var_0_0.GetCharacter(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_0:GetPool(var_0_1)
	local var_16_1 = arg_16_0:GetPool(var_0_2)

	var_0_14(var_16_0, var_16_1, arg_16_1, arg_16_2, arg_16_3)
end

function var_0_0.ReturnCharacter(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if not arg_17_0.pools then
		return
	end

	local var_17_0 = arg_17_0:GetPool(var_0_1)
	local var_17_1 = arg_17_0:GetPool(var_0_2)

	var_0_15(var_17_0, var_17_1, arg_17_1, arg_17_2, arg_17_3)
end

function var_0_0.GetCharacterModel(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0:GetPool(var_0_1)
	local var_18_1 = arg_18_0:GetPool(var_0_2)

	var_0_12(var_18_0, var_18_1, arg_18_1, arg_18_2, arg_18_3)
end

function var_0_0.ReturnCharacterModel(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_0:GetPool(var_0_1)
	local var_19_1 = arg_19_0:GetPool(var_0_2)

	var_0_13(var_19_0, var_19_1, arg_19_1, arg_19_2, arg_19_3)
end

function var_0_0.GetSceneCharacter(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
	local var_20_0 = arg_20_0:GetPool(var_0_5)
	local var_20_1 = {}
	local var_20_2

	table.insert(var_20_1, function(arg_21_0)
		arg_20_0:GetCharacter(arg_20_1, arg_20_2, function(arg_22_0)
			var_20_2 = arg_22_0

			arg_21_0()
		end)
	end)

	if arg_20_3 and arg_20_3 ~= "" then
		table.insert(var_20_1, function(arg_23_0)
			var_20_0:GetObject(arg_20_3, typeof(NodeCanvas.BehaviourTrees.BehaviourTree), function(arg_24_0)
				GetOrAddComponent(var_20_2, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = arg_24_0

				arg_23_0()
			end)
		end)
	end

	seriesAsync(var_20_1, function()
		arg_20_4(var_20_2)
	end)
end

function var_0_0.ReturnSceneCharacter(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = arg_26_0:GetPool(var_0_5)

	if arg_26_3 and arg_26_3 ~= "" then
		local var_26_1 = GetOrAddComponent(arg_26_4, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))
		local var_26_2 = var_26_1.graph

		var_26_0:ReturnObject(arg_26_3, var_26_2)

		var_26_1.graph = nil
	end

	arg_26_0:ReturnCharacter(arg_26_1, arg_26_2, arg_26_4)
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

function var_0_0.GetOpUI(arg_38_0)
	return arg_38_0:GetPool(var_0_11):GetObject()
end

function var_0_0.ReturnOpUI(arg_39_0, arg_39_1)
	arg_39_0:GetPool(var_0_11):ReturnObject(arg_39_1)
end

function var_0_0.BuildCommanderPart(arg_40_0, arg_40_1, arg_40_2)
	local var_40_0 = {}
	local var_40_1

	table.insert(var_40_0, function(arg_41_0)
		local var_41_0 = 0
		local var_41_1 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()
		local var_41_2 = var_41_1:IsNew()

		local function var_41_3()
			var_41_0 = var_41_0 + 1

			if var_41_0 == #IslandShipDressHelperNew.CommanderCustom then
				local var_42_0 = IslandShipDressHelperNew.DressType.Hat
				local var_42_1 = var_41_2 and IslandShipDressHelperNew.GetInitDressByType(var_42_0) or var_41_1:GetDressByType(var_42_0)

				if var_42_1 ~= 0 then
					local var_42_2 = pg.island_dress_template[var_42_1].sub_type - 1

					GraphicsInterface.Instance:SetCharacterBlendShape(arg_40_1, IslandShipDressHelperNew.ComponentType.Hair, var_42_2, 100)
				end

				arg_41_0()
			end
		end

		for iter_41_0, iter_41_1 in ipairs(IslandShipDressHelperNew.CommanderCustom) do
			local var_41_4 = var_41_2 and IslandShipDressHelperNew.GetInitDressByType(iter_41_1) or var_41_1:GetDressByType(iter_41_1)
			local var_41_5 = var_41_1:GetCurrentColorByDressId(var_41_4)

			if var_41_4 == 0 then
				GraphicsInterface.Instance:SetCharacterComponentShow(arg_40_1, IslandShipDressHelperNew.ComponentType.Headware, false, var_41_3)
			else
				local var_41_6 = pg.island_dress_template[var_41_4]
				local var_41_7 = var_41_6.model

				if var_41_5 == 0 then
					GraphicsInterface.Instance:LoadCharacterComponent(arg_40_1, var_41_7, var_41_3)
				else
					local var_41_8 = pg.island_dress_colordiff_template[var_41_5].model

					GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_40_1, var_41_7, var_41_8, var_41_3)
				end

				if var_41_6.face_clip ~= "" then
					var_40_1 = var_41_6.face_clip
				end
			end
		end
	end)
	seriesAsync(var_40_0, function()
		arg_40_2(var_40_1)
	end)
end

function var_0_0.BuildVisterPart(arg_44_0, arg_44_1, arg_44_2, arg_44_3, arg_44_4)
	local var_44_0 = {}
	local var_44_1

	table.insert(var_44_0, function(arg_45_0)
		local var_45_0 = 0
		local var_45_1 = (arg_44_3 and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetVisitorAgency():GetPlayer(arg_44_2)

		if not var_45_1 then
			arg_45_0()

			return
		end

		local function var_45_2()
			var_45_0 = var_45_0 + 1

			if var_45_0 == #IslandShipDressHelperNew.CommanderCustom then
				local var_46_0 = IslandShipDressHelperNew.DressType.Hat
				local var_46_1 = var_45_1:GetDressByType(var_46_0)

				if var_46_1 ~= 0 then
					local var_46_2 = pg.island_dress_template[var_46_1].sub_type - 1

					GraphicsInterface.Instance:SetCharacterBlendShape(arg_44_1, IslandShipDressHelperNew.ComponentType.Hair, var_46_2, 100)
				end

				arg_45_0()
			end
		end

		for iter_45_0, iter_45_1 in ipairs(IslandShipDressHelperNew.CommanderCustom) do
			local var_45_3 = var_45_1:GetDressByType(iter_45_1)
			local var_45_4 = var_45_1:GetCurrentColorByDressId(var_45_3)

			if var_45_3 == 0 then
				GraphicsInterface.Instance:SetCharacterComponentShow(arg_44_1, IslandShipDressHelperNew.ComponentType.Headware, false, var_45_2)
			else
				local var_45_5 = pg.island_dress_template[var_45_3]
				local var_45_6 = var_45_5.model

				if var_45_4 == 0 then
					GraphicsInterface.Instance:LoadCharacterComponent(arg_44_1, var_45_6, var_45_2)
				else
					local var_45_7 = pg.island_dress_colordiff_template[var_45_4].model

					GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_44_1, var_45_6, var_45_7, var_45_2)
				end

				if var_45_5.face_clip ~= "" then
					var_44_1 = var_45_5.face_clip
				end
			end
		end
	end)
	seriesAsync(var_44_0, function()
		arg_44_4(var_44_1)
	end)
end

function var_0_0.LoadAnimator(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4)
	local var_48_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_48_3, "", typeof(RuntimeAnimatorController), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_49_0)
		local var_49_0

		var_49_0.runtimeAnimatorController, var_49_0 = Object.Instantiate(arg_49_0), GetOrAddComponent(arg_48_1.transform, typeof(Animator))
		arg_48_2 = arg_48_2 or "idle"

		var_49_0:Play(arg_48_2, 4)
		arg_48_4()
	end), true, true)

	table.insert(arg_48_0.loadingIdList, var_48_0)
end

function var_0_0.NestModel(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1.name
	local var_50_1 = GameObject.New(var_50_0)

	setParent(arg_50_1.transform, var_50_1.transform, false)

	arg_50_1 = var_50_1

	return arg_50_1
end

function var_0_0.GetCommanderModel(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5)
	local var_51_0 = {}
	local var_51_1

	table.insert(var_51_0, function(arg_52_0)
		local var_52_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_51_1.model, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_53_0)
			var_51_1 = Object.Instantiate(arg_53_0)

			arg_52_0()
		end), true, true)

		table.insert(arg_51_0.loadingIdList, var_52_0)
	end)

	if arg_51_3 then
		table.insert(var_51_0, function(arg_54_0)
			arg_51_0:BuildVisterPart(var_51_1, arg_51_3, arg_51_4, arg_54_0)
		end)
	else
		table.insert(var_51_0, function(arg_55_0)
			arg_51_0:BuildCommanderPart(var_51_1, arg_55_0)
		end)
	end

	table.insert(var_51_0, function(arg_56_0, arg_56_1)
		arg_51_0:LoadAnimator(var_51_1, arg_56_1, arg_51_1.animator, arg_56_0)
	end)
	table.insert(var_51_0, function(arg_57_0)
		var_51_1 = arg_51_0:NestModel(var_51_1)

		arg_57_0()
	end)

	if arg_51_5 and arg_51_5 ~= "" then
		table.insert(var_51_0, function(arg_58_0)
			arg_51_0:GetPool(var_0_5):GetObject(arg_51_5, typeof(NodeCanvas.BehaviourTrees.BehaviourTree), function(arg_59_0)
				GetOrAddComponent(var_51_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = arg_59_0

				arg_58_0()
			end)
		end)
	end

	seriesAsync(var_51_0, function()
		arg_51_2(var_51_1)
	end)
end

function var_0_0.ReturnCommanderModel(arg_61_0, arg_61_1, arg_61_2)
	if arg_61_2 and arg_61_2 ~= "" then
		local var_61_0 = arg_61_0:GetPool(var_0_5)
		local var_61_1 = GetOrAddComponent(arg_61_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))
		local var_61_2 = var_61_1.graph

		var_61_0:ReturnObject(arg_61_2, var_61_2)

		var_61_1.graph = nil
	end

	Object.Destroy(arg_61_1)
end

function var_0_0.GetDelegateEffect(arg_62_0, arg_62_1, arg_62_2)
	arg_62_0:GetPool(var_0_10):GetObject(arg_62_1, typeof(GameObject), arg_62_2)
end

function var_0_0.ReturnDelegateEffect(arg_63_0, arg_63_1, arg_63_2)
	arg_63_0:GetPool(var_0_10):ReturnObject(arg_63_1, arg_63_2)
end

function var_0_0.ClearDelegateEffect(arg_64_0)
	arg_64_0:GetPool(var_0_10):Clear()
end

function var_0_0.Dispose(arg_65_0)
	for iter_65_0, iter_65_1 in pairs(arg_65_0.pools) do
		iter_65_1:Dispose()
	end

	arg_65_0.pools = nil

	for iter_65_2, iter_65_3 in ipairs(arg_65_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_65_3)
	end

	arg_65_0.loadingIdList = nil
end

return var_0_0
