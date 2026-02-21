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
local var_0_12 = 12
local var_0_13 = 13
local var_0_14 = 14
local var_0_15 = 15
local var_0_16 = 16

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
		[var_0_12] = IslandObjectPoolSet.New(arg_1_1, 1, 1),
		[var_0_13] = IslandObjectPoolSet.New(arg_1_1, 3, 1),
		[var_0_14] = IslandObjectPoolSet.New(arg_1_1, 3, 1),
		[var_0_15] = IslandObjectPoolSet.New(arg_1_1, 4, 1),
		[var_0_16] = IslandObjectPoolSet.New(arg_1_1, 6, 2),
		[var_0_2] = IslandPublicAssetPoolSet.New(arg_1_1, 5, 2),
		[var_0_4] = IslandPublicAssetPoolSet.New(arg_1_1, 5, 2),
		[var_0_5] = IslandBtAssetPoolSet.New(arg_1_1, 5, 2)
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

local function var_0_17(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
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

local function var_0_18(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4)
	local var_11_0 = GetOrAddComponent(arg_11_4, typeof(Animator))
	local var_11_1 = var_11_0.runtimeAnimatorController

	arg_11_1:ReturnObject(arg_11_3, var_11_1)

	var_11_0.runtimeAnimatorController = nil

	arg_11_0:ReturnObject(arg_11_2, arg_11_4)
end

local function var_0_19(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_12_4)
	local var_12_0 = {}

	table.insert(var_12_0, function(arg_13_0)
		var_0_17(arg_12_0, arg_12_1, arg_12_2, arg_12_3, arg_13_0)
	end)
	seriesAsync(var_12_0, function(arg_14_0)
		local var_14_0 = GameObject.New(arg_14_0.name)

		setParent(arg_14_0, var_14_0.transform, false)
		arg_12_4(var_14_0)
	end)
end

local function var_0_20(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
	local var_15_0 = arg_15_4.transform:GetChild(0).gameObject

	var_0_18(arg_15_0, arg_15_1, arg_15_2, arg_15_3, var_15_0)
	Object.Destroy(arg_15_4)
end

function var_0_0.GetCharacter(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	local var_16_0 = arg_16_0:GetPool(var_0_1)
	local var_16_1 = arg_16_0:GetPool(var_0_2)

	var_0_19(var_16_0, var_16_1, arg_16_1, arg_16_2, arg_16_3)
end

function var_0_0.ReturnCharacter(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	if not arg_17_0.pools then
		return
	end

	local var_17_0 = arg_17_0:GetPool(var_0_1)
	local var_17_1 = arg_17_0:GetPool(var_0_2)

	var_0_20(var_17_0, var_17_1, arg_17_1, arg_17_2, arg_17_3)
end

function var_0_0.GetCharacterModel(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = arg_18_0:GetPool(var_0_1)
	local var_18_1 = arg_18_0:GetPool(var_0_2)

	var_0_17(var_18_0, var_18_1, arg_18_1, arg_18_2, arg_18_3)
end

function var_0_0.ReturnCharacterModel(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	local var_19_0 = arg_19_0:GetPool(var_0_1)
	local var_19_1 = arg_19_0:GetPool(var_0_2)

	var_0_18(var_19_0, var_19_1, arg_19_1, arg_19_2, arg_19_3)
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

function var_0_0.GetSceneDelegateItem(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4)
	local var_27_0 = arg_27_0:GetPool(var_0_16)
	local var_27_1 = arg_27_0:GetPool(var_0_2)
	local var_27_2 = {}
	local var_27_3

	table.insert(var_27_2, function(arg_28_0)
		var_27_0:GetObject(arg_27_1, typeof(GameObject), function(arg_29_0)
			var_27_3 = arg_29_0

			arg_28_0()
		end)
	end)
	table.insert(var_27_2, function(arg_30_0)
		var_27_1:GetObject(arg_27_2, typeof(RuntimeAnimatorController), function(arg_31_0)
			GetOrAddComponent(var_27_3, typeof(Animator)).runtimeAnimatorController = arg_31_0

			arg_30_0()
		end)
	end)
	table.insert(var_27_2, function(arg_32_0)
		var_27_3 = arg_27_0:NestModel(var_27_3)

		arg_32_0()
	end)

	if arg_27_3 and arg_27_3 ~= "" then
		table.insert(var_27_2, function(arg_33_0)
			arg_27_0:GetPool(var_0_5):GetObject(arg_27_3, typeof(NodeCanvas.BehaviourTrees.BehaviourTree), function(arg_34_0)
				GetOrAddComponent(var_27_3, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = arg_34_0

				arg_33_0()
			end)
		end)
	end

	seriesAsync(var_27_2, function()
		arg_27_4(var_27_3)
	end)
end

function var_0_0.ReturnSceneDelegateItem(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = arg_36_0:GetPool(var_0_16)
	local var_36_1 = arg_36_0:GetPool(var_0_2)
	local var_36_2 = arg_36_4.transform:GetChild(0).gameObject
	local var_36_3 = GetOrAddComponent(arg_36_4, typeof(Animator))
	local var_36_4 = var_36_3.runtimeAnimatorController

	var_36_1:ReturnObject(arg_36_2, var_36_4)

	var_36_3.runtimeAnimatorController = nil

	var_36_0:ReturnObject(path, var_36_2)
	Object.Destroy(arg_36_4)
end

function var_0_0.ClearSceneDelegateItem(arg_37_0, arg_37_1, arg_37_2)
	return
end

function var_0_0.GetSceneProductItem(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0:GetPool(var_0_6):GetObject(arg_38_1, typeof(GameObject), arg_38_2)
end

function var_0_0.ReturnSceneProductItem(arg_39_0, arg_39_1, arg_39_2)
	arg_39_0:GetPool(var_0_6):ReturnObject(arg_39_1, arg_39_2)
end

function var_0_0.ClearSceneProductItem(arg_40_0, arg_40_1, arg_40_2)
	arg_40_0:GetPool(var_0_6):Clear()
end

function var_0_0.GetSceneProductEffect(arg_41_0, arg_41_1, arg_41_2)
	arg_41_0:GetPool(var_0_7):GetObject(arg_41_1, typeof(GameObject), arg_41_2)
end

function var_0_0.ReturnSceneProductEffect(arg_42_0, arg_42_1, arg_42_2)
	arg_42_0:GetPool(var_0_7):ReturnObject(arg_42_1, arg_42_2)
end

function var_0_0.ClearSceneProductEffect(arg_43_0, arg_43_1, arg_43_2)
	arg_43_0:GetPool(var_0_7):Clear()
end

function var_0_0.GetAgoraObj(arg_44_0, arg_44_1, arg_44_2)
	arg_44_0:GetPool(var_0_8):GetObject(arg_44_1, typeof(GameObject), arg_44_2)
end

function var_0_0.ReturnAgoraObj(arg_45_0, arg_45_1, arg_45_2)
	arg_45_0:GetPool(var_0_8):ReturnObject(arg_45_1, arg_45_2)
end

function var_0_0.GetAgoraRoot(arg_46_0)
	return arg_46_0:GetPool(var_0_9):GetObject()
end

function var_0_0.ReturnAgoraRoot(arg_47_0, arg_47_1)
	arg_47_0:GetPool(var_0_9):ReturnObject(arg_47_1)
end

function var_0_0.ClearAograPools(arg_48_0)
	arg_48_0:GetPool(var_0_8):Clear()
	arg_48_0:GetPool(var_0_9):Clear()
end

function var_0_0.GetOpUI(arg_49_0)
	return arg_49_0:GetPool(var_0_11):GetObject()
end

function var_0_0.ReturnOpUI(arg_50_0, arg_50_1)
	arg_50_0:GetPool(var_0_11):ReturnObject(arg_50_1)
end

function var_0_0.BuildCommanderPart(arg_51_0, arg_51_1, arg_51_2)
	local var_51_0 = {}
	local var_51_1

	table.insert(var_51_0, function(arg_52_0)
		local var_52_0 = 0
		local var_52_1 = getProxy(IslandProxy):GetIsland():GetDressUpAgency()
		local var_52_2 = var_52_1:IsNew()

		local function var_52_3()
			var_52_0 = var_52_0 + 1

			if var_52_0 == #IslandShipDressHelperNew.CommanderCustom then
				local var_53_0 = IslandShipDressHelperNew.DressType.Hat
				local var_53_1 = var_52_2 and IslandShipDressHelperNew.GetInitDressByType(var_53_0) or var_52_1:GetDressByType(var_53_0)

				if var_53_1 ~= 0 then
					local var_53_2 = pg.island_dress_template[var_53_1].sub_type - 1

					GraphicsInterface.Instance:SetCharacterBlendShape(arg_51_1, IslandShipDressHelperNew.ComponentType.Hair, var_53_2, 100)
				end

				arg_52_0()
			end
		end

		for iter_52_0, iter_52_1 in ipairs(IslandShipDressHelperNew.CommanderCustom) do
			local var_52_4 = var_52_2 and IslandShipDressHelperNew.GetInitDressByType(iter_52_1) or var_52_1:GetDressByType(iter_52_1)
			local var_52_5 = var_52_1:GetCurrentColorByDressId(var_52_4)

			if var_52_4 == 0 then
				GraphicsInterface.Instance:SetCharacterComponentShow(arg_51_1, IslandShipDressHelperNew.ComponentType.Headware, false, var_52_3)
			else
				local var_52_6 = pg.island_dress_template[var_52_4]
				local var_52_7 = var_52_6.model

				if var_52_5 == 0 then
					GraphicsInterface.Instance:LoadCharacterComponent(arg_51_1, var_52_7, var_52_3)
				else
					local var_52_8 = pg.island_dress_colordiff_template[var_52_5].model

					GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_51_1, var_52_7, var_52_8, var_52_3)
				end

				if var_52_6.face_clip ~= "" then
					var_51_1 = var_52_6.face_clip
				end
			end
		end
	end)
	seriesAsync(var_51_0, function()
		arg_51_2(var_51_1)
	end)
end

function var_0_0.BuildVisterPart(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4)
	local var_55_0 = {}
	local var_55_1

	table.insert(var_55_0, function(arg_56_0)
		local var_56_0 = 0
		local var_56_1 = (arg_55_3 and getProxy(IslandProxy):GetIsland() or getProxy(IslandProxy):GetSharedIsland()):GetVisitorAgency():GetPlayer(arg_55_2)

		if not var_56_1 then
			arg_56_0()

			return
		end

		local function var_56_2()
			var_56_0 = var_56_0 + 1

			if var_56_0 == #IslandShipDressHelperNew.CommanderCustom then
				local var_57_0 = IslandShipDressHelperNew.DressType.Hat
				local var_57_1 = var_56_1:GetDressByType(var_57_0)

				if var_57_1 ~= 0 then
					local var_57_2 = pg.island_dress_template[var_57_1].sub_type - 1

					GraphicsInterface.Instance:SetCharacterBlendShape(arg_55_1, IslandShipDressHelperNew.ComponentType.Hair, var_57_2, 100)
				end

				arg_56_0()
			end
		end

		for iter_56_0, iter_56_1 in ipairs(IslandShipDressHelperNew.CommanderCustom) do
			local var_56_3 = var_56_1:GetDressByType(iter_56_1)
			local var_56_4 = var_56_1:GetCurrentColorByDressId(var_56_3)

			if var_56_3 == 0 then
				GraphicsInterface.Instance:SetCharacterComponentShow(arg_55_1, IslandShipDressHelperNew.ComponentType.Headware, false, var_56_2)
			else
				local var_56_5 = pg.island_dress_template[var_56_3]
				local var_56_6 = var_56_5.model

				if var_56_4 == 0 then
					GraphicsInterface.Instance:LoadCharacterComponent(arg_55_1, var_56_6, var_56_2)
				else
					local var_56_7 = pg.island_dress_colordiff_template[var_56_4].model

					GraphicsInterface.Instance:LoadCharacterComponentAndMaterial(arg_55_1, var_56_6, var_56_7, var_56_2)
				end

				if var_56_5.face_clip ~= "" then
					var_55_1 = var_56_5.face_clip
				end
			end
		end
	end)
	seriesAsync(var_55_0, function()
		arg_55_4(var_55_1)
	end)
end

function var_0_0.LoadAnimator(arg_59_0, arg_59_1, arg_59_2, arg_59_3, arg_59_4)
	local var_59_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_59_3, "", typeof(RuntimeAnimatorController), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_60_0)
		local var_60_0 = GetOrAddComponent(arg_59_1.transform, typeof(Animator))

		var_60_0.runtimeAnimatorController = arg_60_0
		arg_59_2 = arg_59_2 or "idle"

		var_60_0:Play(arg_59_2, 4)
		arg_59_4()
	end), true, true)

	table.insert(arg_59_0.loadingIdList, var_59_0)
end

function var_0_0.NestModel(arg_61_0, arg_61_1)
	local var_61_0 = arg_61_1.name
	local var_61_1 = GameObject.New(var_61_0)

	setParent(arg_61_1.transform, var_61_1.transform, false)

	arg_61_1 = var_61_1

	return arg_61_1
end

function var_0_0.GetCommanderModel(arg_62_0, arg_62_1, arg_62_2, arg_62_3, arg_62_4, arg_62_5)
	local var_62_0 = {}
	local var_62_1

	table.insert(var_62_0, function(arg_63_0)
		local var_63_0 = IslandAssetLoadDispatcher.Instance:Enqueue(arg_62_1.model, "", typeof(GameObject), UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_64_0)
			var_62_1 = Object.Instantiate(arg_64_0)

			arg_63_0()
		end), true, true)

		table.insert(arg_62_0.loadingIdList, var_63_0)
	end)

	if arg_62_3 then
		table.insert(var_62_0, function(arg_65_0)
			arg_62_0:BuildVisterPart(var_62_1, arg_62_3, arg_62_4, arg_65_0)
		end)
	else
		table.insert(var_62_0, function(arg_66_0)
			arg_62_0:BuildCommanderPart(var_62_1, arg_66_0)
		end)
	end

	table.insert(var_62_0, function(arg_67_0, arg_67_1)
		arg_62_0:LoadAnimator(var_62_1, arg_67_1, arg_62_1.animator, arg_67_0)
	end)
	table.insert(var_62_0, function(arg_68_0)
		var_62_1 = arg_62_0:NestModel(var_62_1)

		arg_68_0()
	end)

	if arg_62_5 and arg_62_5 ~= "" then
		table.insert(var_62_0, function(arg_69_0)
			arg_62_0:GetPool(var_0_5):GetObject(arg_62_5, typeof(NodeCanvas.BehaviourTrees.BehaviourTree), function(arg_70_0)
				GetOrAddComponent(var_62_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner)).graph = arg_70_0

				arg_69_0()
			end)
		end)
	end

	seriesAsync(var_62_0, function()
		arg_62_2(var_62_1)
	end)
end

function var_0_0.ReturnCommanderModel(arg_72_0, arg_72_1, arg_72_2)
	if arg_72_2 and arg_72_2 ~= "" then
		local var_72_0 = arg_72_0:GetPool(var_0_5)
		local var_72_1 = GetOrAddComponent(arg_72_1, typeof(NodeCanvas.BehaviourTrees.BehaviourTreeOwner))
		local var_72_2 = var_72_1.graph

		var_72_0:ReturnObject(arg_72_2, var_72_2)

		var_72_1.graph = nil
	end

	Object.Destroy(arg_72_1)
end

function var_0_0.GetDelegateEffect(arg_73_0, arg_73_1, arg_73_2)
	arg_73_0:GetPool(var_0_10):GetObject(arg_73_1, typeof(GameObject), arg_73_2)
end

function var_0_0.ReturnDelegateEffect(arg_74_0, arg_74_1, arg_74_2)
	arg_74_0:GetPool(var_0_10):ReturnObject(arg_74_1, arg_74_2)
end

function var_0_0.ClearDelegateEffect(arg_75_0)
	arg_75_0:GetPool(var_0_10):Clear()
end

function var_0_0.GetFishRod(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
	local var_76_0 = arg_76_0:GetPool(var_0_12)
	local var_76_1 = arg_76_0:GetPool(var_0_4)
	local var_76_2

	seriesAsync({
		function(arg_77_0)
			var_76_0:GetObject(arg_76_1, typeof(GameObject), function(arg_78_0)
				var_76_2 = arg_78_0

				arg_77_0()
			end)
		end,
		function(arg_79_0)
			var_76_1:GetObject(arg_76_2, typeof(RuntimeAnimatorController), function(arg_80_0)
				GetOrAddComponent(var_76_2, typeof(Animator)).runtimeAnimatorController = arg_80_0

				arg_79_0()
			end)
		end
	}, function()
		arg_76_3(var_76_2)
	end)
end

function var_0_0.ReturnFishRod(arg_82_0, arg_82_1, arg_82_2, arg_82_3)
	local var_82_0 = arg_82_0:GetPool(var_0_4)
	local var_82_1 = GetOrAddComponent(arg_82_3, typeof(Animator)).runtimeAnimatorController

	var_82_0:ReturnObject(arg_82_2, var_82_1)
	arg_82_0:GetPool(var_0_12):ReturnObject(arg_82_1, arg_82_3)
end

function var_0_0.GetFish(arg_83_0, arg_83_1, arg_83_2, arg_83_3)
	local var_83_0 = arg_83_0:GetPool(var_0_13)
	local var_83_1 = arg_83_0:GetPool(var_0_4)
	local var_83_2

	seriesAsync({
		function(arg_84_0)
			var_83_0:GetObject(arg_83_1, typeof(GameObject), function(arg_85_0)
				var_83_2 = arg_85_0

				arg_84_0()
			end)
		end,
		function(arg_86_0)
			var_83_1:GetObject(arg_83_2, typeof(RuntimeAnimatorController), function(arg_87_0)
				GetOrAddComponent(var_83_2, typeof(Animator)).runtimeAnimatorController = arg_87_0

				arg_86_0()
			end)
		end
	}, function()
		arg_83_3(var_83_2)
	end)
end

function var_0_0.ReturnFish(arg_89_0, arg_89_1, arg_89_2, arg_89_3)
	local var_89_0 = arg_89_0:GetPool(var_0_4)
	local var_89_1 = GetOrAddComponent(arg_89_3, typeof(Animator)).runtimeAnimatorController

	var_89_0:ReturnObject(arg_89_2, var_89_1)
	arg_89_0:GetPool(var_0_13):ReturnObject(arg_89_1, arg_89_3)
end

function var_0_0.GetUI(arg_90_0, arg_90_1, arg_90_2)
	arg_90_0:GetPool(var_0_14):GetObject("ui/" .. arg_90_1, typeof(GameObject), arg_90_2)
end

function var_0_0.ReturnUI(arg_91_0, arg_91_1, arg_91_2)
	arg_91_0:GetPool(var_0_14):ReturnObject("ui/" .. arg_91_1, arg_91_2)
end

function var_0_0.GetFishingEffect(arg_92_0, arg_92_1, arg_92_2)
	arg_92_0:GetPool(var_0_15):GetObject(arg_92_1, typeof(GameObject), arg_92_2)
end

function var_0_0.ReturnFishingEffect(arg_93_0, arg_93_1, arg_93_2)
	arg_93_0:GetPool(var_0_15):ReturnObject(arg_93_1, arg_93_2)
end

function var_0_0.ClearFishingEffect(arg_94_0)
	arg_94_0:GetPool(var_0_15):Clear()
end

function var_0_0.Dispose(arg_95_0)
	for iter_95_0, iter_95_1 in pairs(arg_95_0.pools) do
		iter_95_1:Dispose()
	end

	arg_95_0.pools = nil

	for iter_95_2, iter_95_3 in ipairs(arg_95_0.loadingIdList or {}) do
		IslandAssetLoadDispatcher.Instance:Cancel(iter_95_3)
	end

	arg_95_0.loadingIdList = nil
end

return var_0_0
