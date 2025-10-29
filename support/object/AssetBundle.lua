pg = pg or {}

local var_0_0 = pg
local var_0_1 = class("AssetBundle")

var_0_0.AssetBundle = var_0_1

function var_0_1.Ctor(arg_1_0, arg_1_1)
	arg_1_0.path = arg_1_1
end

function var_0_1.Load(arg_2_0, arg_2_1, arg_2_2, arg_2_3)
	assert(not arg_2_0.ab)

	arg_2_0.abs = {}

	if arg_2_1 then
		seriesAsync({
			function(arg_3_0)
				if not arg_2_2 then
					return arg_3_0()
				end

				local var_3_0 = table.CArrayToArray(ResourceMgr.Inst:GetAllDependencies(arg_2_0.path))

				parallelAsync(underscore.map(var_3_0, function(arg_4_0)
					return function(arg_5_0)
						AssetBundleHelper.LoadAssetBundle(arg_4_0, arg_2_1, false, function(arg_6_0)
							table.insert(arg_2_0.abs, arg_6_0)
							arg_5_0()
						end)
					end
				end), arg_3_0)
			end
		}, function()
			ResourceMgr.Inst:loadAssetBundleAsync(arg_2_0.path, function(arg_8_0)
				arg_2_0.ab = arg_8_0

				existCall(arg_2_3, arg_2_0)
			end)
		end)
	else
		if arg_2_2 then
			local var_2_0 = table.CArrayToArray(ResourceMgr.Inst:GetAllDependencies(arg_2_0.path))

			for iter_2_0, iter_2_1 in ipairs(var_2_0) do
				table.insert(arg_2_0.abs, AssetBundleHelper.LoadAssetBundle(iter_2_1, arg_2_1, false, nil))
			end
		end

		arg_2_0.ab = ResourceMgr.Inst:loadAssetBundleSync(arg_2_0.path)

		existCall(arg_2_3, arg_2_0)

		return arg_2_0
	end
end

function var_0_1.LoadAssetSync(arg_9_0, arg_9_1, ...)
	arg_9_1 = arg_9_0:ChangeAssetName(arg_9_1)

	if not arg_9_0.ab then
		warning(string.format("without assetbundle:%s", arg_9_0.path))

		return nil
	end

	return ResourceMgr.Inst:LoadAssetSync(arg_9_0.ab, arg_9_1, ...)
end

function var_0_1.LoadAssetAsync(arg_10_0, arg_10_1, arg_10_2, arg_10_3, ...)
	arg_10_1 = arg_10_0:ChangeAssetName(arg_10_1)

	if not arg_10_0.ab then
		warning(string.format("without assetbundle:%s", arg_10_0.path))

		return nil
	end

	return ResourceMgr.Inst:LoadAssetAsync(arg_10_0.ab, arg_10_1, arg_10_2, UnityEngine.Events.UnityAction_UnityEngine_Object(arg_10_3), ...)
end

function var_0_1.GetAllAssetNames(arg_11_0)
	return table.CArrayToArray(arg_11_0.ab:GetAllAssetNames())
end

function var_0_1.ChangeAssetName(arg_12_0, arg_12_1)
	if arg_12_1 == nil or arg_12_1 == "" or string.find(arg_12_1, "/") then
		return arg_12_1 or ""
	elseif not AssetBundleHelper.bundleDic[arg_12_0.path] then
		arg_12_0:BuildAssetNameDic()
	end

	return AssetBundleHelper.bundleDic[arg_12_0.path][string.lower(arg_12_1)] or arg_12_1
end

function var_0_1.BuildAssetNameDic(arg_13_0)
	if AssetBundleHelper.bundleDic[arg_13_0.path] then
		return
	end

	AssetBundleHelper.BuildAssetNameDic(arg_13_0.path, arg_13_0:GetAllAssetNames())
end

function var_0_1.ClearDependenciesBundle(arg_14_0)
	for iter_14_0, iter_14_1 in ipairs(arg_14_0.abs) do
		iter_14_1:Dispose()
	end

	arg_14_0.abs = {}
end

function var_0_1.ForceClearRef(arg_15_0, arg_15_1)
	arg_15_0:ClearDependenciesBundle()
	AssetBundleHelper.UnloadAssetBundle(arg_15_0.path, arg_15_1)

	arg_15_0.ab = nil
end

function var_0_1.Dispose(arg_16_0, arg_16_1)
	if arg_16_0.ab then
		arg_16_0:ForceClearRef(arg_16_1)
	end
end
