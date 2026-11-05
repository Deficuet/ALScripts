local var_0_0 = class("AutoLoader")
local var_0_1 = false
local var_0_2 = false
local var_0_3 = import("view.util.RequestPackages.LoadPrefabRequestPackage")
local var_0_4 = import("view.util.RequestPackages.LoadReferenceRequestPackage")
local var_0_5 = import("view.util.RequestPackages.LoadLive2dRequestPackage")
local var_0_6 = import("view.util.RequestPackages.LoadBundleRequesetPackage")
local var_0_7 = import("view.util.RequestPackages.GetSpineRequestPackage")
local var_0_8 = import("view.util.RequestPackages.GetPrefabRequestPackage")
local var_0_9 = import("view.util.RequestPackages.GetSpriteRequestPackage")
local var_0_10 = import("view.util.RequestPackages.ReturnPrefabRequestPackage")
local var_0_11 = import("view.util.RequestPackages.ReturnSpineRequestPackage")
local var_0_12 = import("view.util.RequestPackages.UnloadBundleRequesetPackage")
local var_0_13 = import("view.util.RequestPackages.DestroyAtlasPoolRequestPackage")

var_0_0.PartLoading = bit.lshift(1, 0)
var_0_0.PartLoaded = bit.lshift(1, 1)

function var_0_0.Ctor(arg_1_0)
	arg_1_0._loadingRequest = {}
	arg_1_0._returnRequest = {}
	arg_1_0._instKeyDict = {}
	arg_1_0._keyInstDict = {}
	arg_1_0._groupDict = {}
end

function var_0_0.GenerateUID4LoadingRequest(arg_2_0)
	arg_2_0._uidCounter = (arg_2_0._uidCounter or 0) + 1

	assert(arg_2_0._uidCounter ~= 0, "Error on Generating UID Too much times")

	return arg_2_0._uidCounter
end

function var_0_0.GetPrefab(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	arg_3_2 = arg_3_2 or ""

	arg_3_0:ClearRequest(arg_3_4)

	arg_3_4 = arg_3_4 or arg_3_0:GenerateUID4LoadingRequest()

	local var_3_0
	local var_3_1 = var_0_8.New(arg_3_1, arg_3_2, function(arg_4_0)
		arg_3_0._loadingRequest[arg_3_4] = nil
		arg_3_0._instKeyDict[arg_4_0] = arg_3_4
		arg_3_0._keyInstDict[arg_3_4] = arg_4_0
		arg_3_0._returnRequest[arg_3_4] = var_0_10.New(arg_3_1, arg_3_2, arg_4_0)

		if arg_3_3 then
			arg_3_3(arg_4_0)
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Path: " .. arg_3_1 .. " Name: " .. arg_3_2 .. " ;")
	end

	arg_3_0._loadingRequest[arg_3_4] = var_3_1

	var_3_1:Start()

	return arg_3_4
end

function var_0_0.GetPrefabBYStopLoading(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	arg_5_2 = arg_5_2 or ""

	arg_5_0:ClearRequest(arg_5_4, var_0_0.PartLoading)

	arg_5_4 = arg_5_4 or arg_5_0:GenerateUID4LoadingRequest()

	local var_5_0
	local var_5_1 = var_0_8.New(arg_5_1, arg_5_2, function(arg_6_0)
		arg_5_0._loadingRequest[arg_5_4] = nil

		arg_5_0:ClearRequest(arg_5_4, var_0_0.PartLoaded)

		arg_5_0._instKeyDict[arg_6_0] = arg_5_4
		arg_5_0._keyInstDict[arg_5_4] = arg_6_0
		arg_5_0._returnRequest[arg_5_4] = var_0_10.New(arg_5_1, arg_5_2, arg_6_0)

		if arg_5_3 then
			arg_5_3(arg_6_0)
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Path: " .. arg_5_1 .. " Name: " .. arg_5_2 .. " ;")
	end

	arg_5_0._loadingRequest[arg_5_4] = var_5_1

	var_5_1:Start()

	return arg_5_4
end

function var_0_0.GetPrefabBYGroup(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
	local var_7_0 = arg_7_0:GetPrefab(arg_7_1, arg_7_2, arg_7_3)

	arg_7_0._groupDict[var_7_0] = arg_7_4

	return var_7_0
end

function var_0_0.ReturnPrefab(arg_8_0, arg_8_1)
	arg_8_0:ClearRequest(arg_8_0._instKeyDict[go(arg_8_1)])
end

function var_0_0.ReturnGroup(arg_9_0, arg_9_1)
	if not arg_9_1 then
		return
	end

	for iter_9_0, iter_9_1 in pairs(arg_9_0._groupDict) do
		if iter_9_1 == arg_9_1 then
			arg_9_0:ClearRequest(iter_9_0)
		end
	end
end

function var_0_0.GetSpine(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
	if not noEmptyStr(arg_10_1) then
		return
	end

	arg_10_1 = arg_10_1 or ""

	arg_10_0:ClearRequest(arg_10_3)

	arg_10_3 = arg_10_3 or arg_10_0:GenerateUID4LoadingRequest()

	local var_10_0
	local var_10_1 = var_0_7.New(arg_10_1, function(arg_11_0)
		arg_10_0._loadingRequest[arg_10_3] = nil
		arg_10_0._instKeyDict[arg_11_0] = arg_10_3
		arg_10_0._keyInstDict[arg_10_3] = arg_11_0
		arg_10_0._returnRequest[arg_10_3] = var_0_11.New(arg_10_1, arg_11_0)

		if arg_10_2 then
			arg_10_2(arg_11_0)
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Spine: " .. arg_10_1 .. " ;")
	end

	arg_10_0._loadingRequest[arg_10_3] = var_10_1

	var_10_1:Start()

	return arg_10_3
end

function var_0_0.ReturnSpine(arg_12_0, arg_12_1)
	arg_12_0:ClearRequest(arg_12_0._instKeyDict[go(arg_12_1)])
end

function var_0_0.GetSprite(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4)
	arg_13_3:GetComponent(typeof(Image)).enabled = false

	return arg_13_0:GetSpriteQuiet(arg_13_1, arg_13_2, arg_13_3, arg_13_4)
end

function var_0_0.GetSpriteQuiet(arg_14_0, arg_14_1, arg_14_2, arg_14_3, arg_14_4)
	arg_14_2 = arg_14_2 or ""

	local var_14_0 = tf(arg_14_3)

	arg_14_0:GetSpriteDirect(arg_14_1, arg_14_2, function(arg_15_0)
		local var_15_0 = arg_14_3:GetComponent(typeof(Image))

		var_15_0.enabled = true
		var_15_0.sprite = arg_15_0

		if arg_14_4 then
			var_15_0:SetNativeSize()
		end
	end, var_14_0)

	return var_14_0
end

function var_0_0.GetSpriteDirect(arg_16_0, arg_16_1, arg_16_2, arg_16_3, arg_16_4)
	arg_16_1, arg_16_2 = HXSet.autoHxShiftPath(arg_16_1, arg_16_2)

	arg_16_0:ClearRequest(arg_16_4)

	arg_16_4 = arg_16_4 or arg_16_0:GenerateUID4LoadingRequest()

	local function var_16_0(arg_17_0)
		arg_16_0._loadingRequest[arg_16_4] = nil

		if arg_16_3 then
			arg_16_3(arg_17_0)
		end
	end

	local function var_16_1(arg_18_0, arg_18_1, arg_18_2)
		local var_18_0 = var_0_9.New(arg_18_0, arg_18_1, arg_18_2)

		if var_0_1 then
			warning("AutoLoader Loading Atlas: " .. arg_18_0 .. " Name: " .. arg_18_1 .. " ;")
		end

		arg_16_0._loadingRequest[arg_16_4] = var_18_0
		arg_16_0._returnRequest[arg_18_0] = var_0_13.New(arg_18_0)

		var_18_0:Start()
	end

	if HXSet.isHx() then
		local var_16_2 = arg_16_1
		local var_16_3 = arg_16_2

		if arg_16_2 == "" then
			if checkABExist(var_16_2 .. "_hx") then
				var_16_2 = var_16_2 .. "_hx"
			end
		else
			var_16_3 = var_16_3 .. "_hx"
		end

		var_16_1(var_16_2, var_16_3, function(arg_19_0)
			if arg_19_0 == nil then
				var_16_1(arg_16_1, arg_16_2, var_16_0)
			else
				var_16_0(arg_19_0)
			end
		end)
	else
		var_16_1(arg_16_1, arg_16_2, var_16_0)
	end

	return arg_16_4
end

function var_0_0.GetOffSpriteRequest(arg_20_0, arg_20_1)
	arg_20_0:ClearRequest(arg_20_1)
end

function var_0_0.LoadPrefab(arg_21_0, arg_21_1, arg_21_2, arg_21_3, arg_21_4)
	arg_21_2 = arg_21_2 or ""

	arg_21_0:ClearRequest(arg_21_4)

	arg_21_4 = arg_21_4 or arg_21_0:GenerateUID4LoadingRequest()

	local var_21_0
	local var_21_1 = var_0_3.New(arg_21_1, arg_21_2, function(arg_22_0)
		arg_21_0._loadingRequest[arg_21_4] = nil

		if arg_21_3 then
			arg_21_3(arg_22_0)
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Once Path: " .. arg_21_1 .. " Name: " .. arg_21_2 .. " ;")
	end

	arg_21_0._loadingRequest[arg_21_4] = var_21_1

	var_21_1:Start()

	return arg_21_4
end

function var_0_0.LoadLive2D(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	local var_23_0
	local var_23_1, var_23_2 = HXSet.autoHxShift("live2d/", arg_23_1)

	arg_23_1 = var_23_2

	local var_23_3 = var_23_1 .. arg_23_1

	arg_23_0:ClearRequest(arg_23_3)

	arg_23_3 = arg_23_3 or arg_23_0:GenerateUID4LoadingRequest()

	local var_23_4
	local var_23_5 = var_0_5.New(var_23_3, "", function(arg_24_0)
		arg_23_0._loadingRequest[arg_23_3] = nil

		if arg_23_2 then
			arg_23_2(arg_24_0)
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Live2D Once Path: " .. var_23_3 .. " Name: " .. arg_23_1 .. " ;")
	end

	arg_23_0._loadingRequest[arg_23_3] = var_23_5

	var_23_5:Start()

	return arg_23_3
end

function var_0_0.LoadSprite(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = arg_25_3:GetComponent(typeof(Image))

	var_25_0.enabled = false
	arg_25_2 = arg_25_2 or ""

	local var_25_1 = tf(arg_25_3)

	arg_25_0:ClearRequest(var_25_1)

	local var_25_2
	local var_25_3 = var_0_4.New(arg_25_1, arg_25_2, typeof(Sprite), function(arg_26_0)
		arg_25_0._loadingRequest[var_25_1] = nil
		var_25_0.enabled = true
		var_25_0.sprite = arg_26_0

		if arg_25_4 then
			var_25_0:SetNativeSize()
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Once Path: " .. arg_25_1 .. " Name: " .. arg_25_2 .. " ;")
	end

	arg_25_0._loadingRequest[var_25_1] = var_25_3

	var_25_3:Start()

	return var_25_1
end

function var_0_0.LoadReference(arg_27_0, arg_27_1, arg_27_2, arg_27_3, arg_27_4, arg_27_5)
	arg_27_2 = arg_27_2 or ""

	arg_27_0:ClearRequest(arg_27_5)

	arg_27_5 = arg_27_5 or arg_27_0:GenerateUID4LoadingRequest()

	local var_27_0
	local var_27_1 = var_0_4.New(arg_27_1, arg_27_2, arg_27_3, function(arg_28_0)
		arg_27_0._loadingRequest[arg_27_5] = nil

		if arg_27_4 then
			arg_27_4(arg_28_0)
		end
	end)

	if var_0_1 then
		warning("AutoLoader Loading Once Path: " .. arg_27_1 .. " Name: " .. arg_27_2 .. " ;")
	end

	arg_27_0._loadingRequest[arg_27_5] = var_27_1

	var_27_1:Start()

	return arg_27_5
end

function var_0_0.DestroyAtlas(arg_29_0, arg_29_1)
	arg_29_0:ClearRequest(arg_29_1)
end

function var_0_0.LoadBundle(arg_30_0, arg_30_1, arg_30_2)
	local var_30_0 = arg_30_0:GenerateUID4LoadingRequest()
	local var_30_1
	local var_30_2 = var_0_6.New(arg_30_1, function(arg_31_0)
		arg_30_0._loadingRequest[var_30_0] = nil
		arg_30_0._returnRequest[var_30_0] = var_0_12.New(arg_30_1)

		existCall(arg_30_2, arg_31_0)
	end)

	if var_0_1 then
		warning("AutoLoader Loading Bundle: " .. arg_30_1 .. " ;")
	end

	arg_30_0._loadingRequest[var_30_0] = var_30_2

	var_30_2:Start()

	return var_30_0
end

function var_0_0.GetRequestPackage(arg_32_0, arg_32_1, arg_32_2)
	arg_32_2 = arg_32_2 or var_0_0.PartLoading + var_0_0.PartLoaded

	return bit.band(arg_32_2, var_0_0.PartLoading) > 0 and arg_32_0._loadingRequest[arg_32_1] or bit.band(arg_32_2, var_0_0.PartLoaded) > 0 and arg_32_0._returnRequest[arg_32_1] or nil
end

function var_0_0.GetLoadingRP(arg_33_0, arg_33_1)
	return arg_33_0._loadingRequest[arg_33_1]
end

function var_0_0.ClearRequest(arg_34_0, arg_34_1, arg_34_2)
	if (not arg_34_2 or bit.band(arg_34_2, var_0_0.PartLoading) > 0) and arg_34_0._loadingRequest[arg_34_1] then
		if var_0_2 then
			local var_34_0 = arg_34_0._loadingRequest[arg_34_1]

			warning("AutoLoader Unload loading Path: " .. var_34_0.path .. " Name: " .. var_34_0.name .. " ;")
		end

		arg_34_0._loadingRequest[arg_34_1]:Stop()

		arg_34_0._loadingRequest[arg_34_1] = nil
	end

	if not arg_34_2 or bit.band(arg_34_2, var_0_0.PartLoaded) > 0 then
		if arg_34_0._returnRequest[arg_34_1] then
			if var_0_2 then
				local var_34_1 = arg_34_0._returnRequest[arg_34_1]

				if isa(var_34_1, var_0_11) then
					warning("AutoLoader Unload Spine: " .. var_34_1.name .. " ;")
				elseif isa(var_34_1, var_0_13) then
					warning("AutoLoader Unload Atlas: " .. var_34_1.path .. " ;")
				elseif isa(var_34_1, var_0_12) then
					warning("AutoLoader Unload Bundle: " .. var_34_1.path .. " ;")
				elseif isa(var_34_1, var_0_10) then
					warning("AutoLoader Unload Path: " .. var_34_1.path .. " Name: " .. var_34_1.name .. " ;")
				else
					warning("Not Handle " .. var_34_1.__cname .. " " .. (var_34_1.name or "NIL"))
				end
			end

			arg_34_0._returnRequest[arg_34_1]:Start()

			arg_34_0._returnRequest[arg_34_1] = nil
		end

		if arg_34_0._keyInstDict[arg_34_1] then
			arg_34_0._instKeyDict[arg_34_0._keyInstDict[arg_34_1]] = nil
			arg_34_0._keyInstDict[arg_34_1] = nil
		end
	end

	if arg_34_1 then
		arg_34_0._groupDict[arg_34_1] = nil
	end
end

function var_0_0.ClearLoadingRequests(arg_35_0)
	for iter_35_0 in pairs(arg_35_0._loadingRequest) do
		arg_35_0:ClearRequest(iter_35_0)
	end

	table.clear(arg_35_0._loadingRequest)
end

function var_0_0.ClearLoadedRequests(arg_36_0)
	for iter_36_0 in pairs(arg_36_0._returnRequest) do
		arg_36_0:ClearRequest(iter_36_0)
	end

	table.clear(arg_36_0._returnRequest)
end

function var_0_0.ClearRequests(arg_37_0)
	arg_37_0:ClearLoadingRequests()
	arg_37_0:ClearLoadedRequests()
	table.clear(arg_37_0._instKeyDict)
	table.clear(arg_37_0._keyInstDict)
end

function var_0_0.RegisterLoaded(arg_38_0, arg_38_1, arg_38_2)
	arg_38_0._instKeyDict[arg_38_2] = arg_38_1
	arg_38_0._keyInstDict[arg_38_1] = arg_38_2

	local var_38_0 = {
		Start = function()
			Destroy(arg_38_2)
		end
	}

	arg_38_0._returnRequest[arg_38_1] = var_38_0
end

function var_0_0.Clear(arg_40_0)
	arg_40_0:ClearRequests()
end

return var_0_0
