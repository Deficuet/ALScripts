local var_0_0 = class("IslandVisitorBuilder", import(".IslandCharUnitBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandVisitorUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.SetTag(arg_2_0, arg_2_1)
	return
end

function var_0_0.SetupBT(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3()
end

function var_0_0.AddComponents(arg_4_0, arg_4_1, arg_4_2)
	var_0_0.super.AddComponents(arg_4_0, arg_4_1, arg_4_2)

	local var_4_0 = GetOrAddComponent(arg_4_1, typeof(CharacterController))

	var_4_0.slopeLimit = 50
	var_4_0.stepOffset = 0.3
	var_4_0.stepOffset = 0.08
	var_4_0.minMoveDistance = 0
	var_4_0.height = 1.76
	var_4_0.stepOffset = 0.4
	var_4_0.center = Vector3(0, 0.96, 0)

	GetOrAddComponent(arg_4_1, typeof(CharacterHandleController))

	arg_4_1.name = "Visitor_" .. arg_4_2.id
end

function var_0_0.LoadOtherPart(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	seriesAsync({
		function(arg_6_0)
			local var_6_0 = IslandShipDressHelperNew.New()

			arg_5_2:SetShipDressHelper(var_6_0)

			local var_6_1 = arg_5_3.id
			local var_6_2 = getProxy(PlayerProxy):getRawData().id == arg_5_3.islandId

			var_6_0:PreLoadVisterDressupItem(arg_5_1, var_6_1, var_6_2, arg_6_0)
		end
	}, function()
		existCall(arg_5_4)
	end)
end

function var_0_0.Load(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_1:GetBehaviourTree()
	local var_8_1 = arg_8_1.id
	local var_8_2 = getProxy(PlayerProxy):getRawData().id == arg_8_1.islandId

	arg_8_0:GetPoolMgr():GetCommanderModel({
		model = arg_8_1:GetAssetPath(),
		animator = arg_8_1:GetAnimator()
	}, arg_8_2, var_8_1, var_8_2, var_8_0)
end

function var_0_0.Recycle(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1:GetBehaviourTree()

	arg_9_0:GetPoolMgr():ReturnCommanderModel(arg_9_2, var_9_0)
end

return var_0_0
