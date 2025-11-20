local var_0_0 = class("BackYardInteractionPreview")
local var_0_1 = 0.5

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.container = arg_1_1
	arg_1_0.initPosition = arg_1_2
end

function var_0_0.Flush(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	if arg_2_0.furnitureId == arg_2_2 and arg_2_0.shipSkinId == arg_2_1 then
		return
	end

	arg_2_0.scale = arg_2_3 or 1

	if arg_2_4 then
		arg_2_0.position = Vector3(arg_2_4[1], arg_2_4[2], 0)
	else
		arg_2_0.position = arg_2_0.initPosition
	end

	arg_2_0:StartLoad(arg_2_1, arg_2_2)

	arg_2_0.shipSkinId = arg_2_1
	arg_2_0.furnitureId = arg_2_2
end

function var_0_0.StartLoad(arg_3_0, arg_3_1, arg_3_2)
	arg_3_0:UnloadSpines()
	pg.UIMgr.GetInstance():LoadingOn()
	seriesAsync({
		function(arg_4_0)
			arg_3_0:LoadFurniture(arg_3_2, arg_4_0)
		end,
		function(arg_5_0)
			arg_3_0:LoadShip(arg_3_1, arg_5_0)
		end,
		function(arg_6_0)
			arg_3_0:StartInteraction(arg_3_2, arg_3_1, arg_6_0)
		end
	}, function()
		pg.UIMgr.GetInstance():LoadingOff()
	end)
end

function var_0_0.LoadShip(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = pg.ship_skin_template[arg_8_1].prefab

	arg_8_0.loadedShip = SpineAnimChar.New()

	arg_8_0.loadedShip:SetPaint(var_8_0)
	arg_8_0.loadedShip:Load(true, function(arg_9_0)
		if arg_8_0.loadedAnimator then
			arg_9_0:SetParent(arg_8_0.loadedAnimator)
		else
			arg_9_0:SetParent(arg_8_0.loadedFurniture)
		end

		arg_9_0:SetName(var_8_0)
		arg_9_0:SetLocalScale(Vector3(var_0_1, var_0_1, 1))
		arg_9_0:SetLocalPosition(Vector3())
		arg_8_2()
	end)
end

function var_0_0.LoadFurniture(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = pg.furniture_data_template
	local var_10_1 = var_10_0[arg_10_1].spine[1][1]
	local var_10_2

	if var_10_0[arg_10_1].spine[2] then
		var_10_2 = var_10_0[arg_10_1].spine[2][1]
	end

	local var_10_3

	if var_10_0[arg_10_1].animator and var_10_0[arg_10_1].animator[1] then
		var_10_3 = var_10_0[arg_10_1].animator[1][1]
	end

	seriesAsync({
		function(arg_11_0)
			arg_10_0:LoadRes("sfurniture/" .. var_10_1, function(arg_12_0)
				setParent(arg_12_0, arg_10_0.container)

				arg_10_0.loadedFurniture = arg_12_0

				arg_10_0:AdjustTranform(arg_12_0)
				arg_11_0()
			end)
		end,
		function(arg_13_0)
			if not var_10_3 then
				arg_13_0()

				return
			end

			arg_10_0:LoadRes("sfurniture/" .. var_10_3, function(arg_14_0)
				setActive(arg_14_0, false)
				setParent(arg_14_0, arg_10_0.loadedFurniture)

				arg_10_0.loadedAnimator = arg_14_0

				arg_13_0()
			end)
		end,
		function(arg_15_0)
			if not var_10_2 then
				arg_15_0()

				return
			end

			arg_10_0:LoadRes("sfurniture/" .. var_10_2, function(arg_16_0)
				setParent(arg_16_0, arg_10_0.container)

				arg_10_0.loadedFurnitureMask = arg_16_0

				arg_10_0:AdjustTranform(arg_16_0)
				arg_15_0()
			end)
		end
	}, arg_10_2)
end

function var_0_0.AdjustTranform(arg_17_0, arg_17_1)
	arg_17_1.transform.localScale = Vector3(arg_17_0.scale, arg_17_0.scale, 1)
	arg_17_1.transform.localPosition = arg_17_0.position
end

function var_0_0.StartInteraction(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	local var_18_0 = pg.furniture_data_template[arg_18_1].spine[3][2]
	local var_18_1 = pg.furniture_data_template[arg_18_1].spine_action_replace
	local var_18_2 = {}
	local var_18_3 = {}

	for iter_18_0, iter_18_1 in ipairs(var_18_0) do
		local var_18_4
		local var_18_5

		if type(iter_18_1) == "string" then
			var_18_5, var_18_4 = iter_18_1, iter_18_1
		elseif type(iter_18_1) == "table" then
			var_18_5, var_18_4 = iter_18_1[1], iter_18_1[3] or iter_18_1[1]
		end

		local var_18_6, var_18_7 = arg_18_0:GetReplaceAction(var_18_1, arg_18_2, var_18_5, var_18_4)

		table.insert(var_18_2, var_18_6)
		table.insert(var_18_3, var_18_7)
	end

	arg_18_0:StartActions(arg_18_1, var_18_2, var_18_3)
	arg_18_3()
end

function var_0_0.GetReplaceAction(arg_19_0, arg_19_1, arg_19_2, arg_19_3, arg_19_4)
	if not arg_19_1 or arg_19_1 == "" or #arg_19_1 == 0 then
		return arg_19_3, arg_19_4
	end

	local var_19_0 = _.detect(arg_19_1, function(arg_20_0)
		return _.any(arg_20_0[2], function(arg_21_0)
			return arg_21_0 == arg_19_2
		end) and arg_19_4 == arg_20_0[1] and arg_20_0[5] == 1
	end)

	if var_19_0 then
		local var_19_1 = var_19_0[4] or 0

		if var_19_1 == 0 then
			return var_19_0[3], var_19_0[3]
		elseif var_19_1 == 1 then
			return arg_19_3, var_19_0[3]
		elseif var_19_1 == 2 then
			return var_19_0[3], arg_19_4
		end
	else
		return arg_19_3, arg_19_4
	end
end

function var_0_0.StartActions(arg_22_0, arg_22_1, arg_22_2, arg_22_3)
	local var_22_0 = 1
	local var_22_1 = 0
	local var_22_2

	local function var_22_3()
		var_22_1 = var_22_1 + 1

		if var_22_1 == 3 then
			var_22_1, var_22_0 = 0, var_22_0 + 1

			var_22_2(var_22_0)
		end
	end

	function var_22_2(arg_24_0)
		if arg_24_0 > #arg_22_2 then
			if arg_22_0.loadedAnimator then
				setActive(arg_22_0.loadedAnimator, false)
			end

			return
		end

		local var_24_0 = arg_22_2[arg_24_0]
		local var_24_1 = arg_22_3[arg_24_0]

		arg_22_0:PlayAction(arg_22_0.loadedFurniture.transform:Find("spine"), var_24_0, var_22_3)

		if arg_22_0.loadedFurnitureMask then
			arg_22_0:PlayAction(arg_22_0.loadedFurniture.transform:Find("spine"), var_24_0, var_22_3)
		else
			var_22_3()
		end

		arg_22_0:PlayAction(arg_22_0.loadedShip, var_24_1, var_22_3)
	end

	var_22_2(var_22_0)

	if arg_22_0.loadedAnimator then
		setActive(arg_22_0.loadedAnimator, true)
	else
		arg_22_0:StartFollowBone(arg_22_1)
	end
end

function var_0_0.StartFollowBone(arg_25_0, arg_25_1)
	local var_25_0 = pg.furniture_data_template[arg_25_1].followBone

	if not var_25_0 then
		return
	end

	local var_25_1 = var_25_0[1]
	local var_25_2 = var_25_0[2]
	local var_25_3 = arg_25_0.loadedFurniture.transform

	arg_25_0.loadedShip:SetLocalScale(Vector3(var_25_2 * var_0_1, var_0_1, 1))

	SpineAnimUI.AddFollower(var_25_1, var_25_3:Find("spine"), arg_25_0.loadedShip.transform):GetComponent("Spine.Unity.BoneFollowerGraphic").followLocalScale = true

	arg_25_0.loadedShip:SetLocalPosition(Vector3(0, 0, 0))
end

function var_0_0.PlayAction(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	arg_26_1:SetActionCallBack(function(arg_27_0)
		if arg_27_0 == "finish" then
			arg_26_1:SetActionCallBack(nil)
			arg_26_3()
		end
	end)
	arg_26_1:SetAction(arg_26_2, 0)
end

function var_0_0.UnloadSpines(arg_28_0)
	if not IsNil(arg_28_0.loadedShip) then
		arg_28_0.loadedShip:Dispose()
	end

	if not IsNil(arg_28_0.loadedAnimator) then
		Object.Destroy(arg_28_0.loadedAnimator)
	end

	if not IsNil(arg_28_0.loadedFurniture) then
		Object.Destroy(arg_28_0.loadedFurniture)
	end

	if not IsNil(arg_28_0.loadedFurnitureMask) then
		Object.Destroy(arg_28_0.loadedFurnitureMask)
	end

	arg_28_0.shipSkinId = nil
	arg_28_0.furnitureId = nil
end

function var_0_0.Dispose(arg_29_0)
	arg_29_0:UnloadSpines()
end

function var_0_0.LoadRes(arg_30_0, arg_30_1, arg_30_2)
	ResourceMgr.Inst:getAssetAsync(arg_30_1, "", UnityEngine.Events.UnityAction_UnityEngine_Object(function(arg_31_0)
		arg_30_2(Instantiate(arg_31_0))
	end), true, true)
end

return var_0_0
