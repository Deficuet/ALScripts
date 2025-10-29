local var_0_0 = class("IslandSystemDelegationUnitBuilder", import(".IslandSystemNpcBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandSystemDelegationUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.SetTag(arg_2_0, arg_2_1)
	arg_2_1.tag = IslandConst.TAG_NPC
end

function var_0_0.AddComponents(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = GetOrAddComponent(arg_3_1, typeof(CharacterController))

	var_3_0.slopeLimit = 50
	var_3_0.stepOffset = 0.3
	var_3_0.stepOffset = 0.08
	var_3_0.minMoveDistance = 0
	var_3_0.height = 1.76
	var_3_0.stepOffset = 0.4
	var_3_0.center = Vector3(0, 0.96, 0)

	GetOrAddComponent(arg_3_1, typeof(CharacterHandleController))
end

function var_0_0.LoadOtherPart(arg_4_0, arg_4_1, arg_4_2, arg_4_3, arg_4_4)
	if arg_4_3.type == IslandConst.UNIT_TYPE_SYSTEM_DELEAGTION_ANIMATION then
		arg_4_4()

		return
	end

	local var_4_0 = arg_4_3.id
	local var_4_1 = arg_4_3.isChicken

	if var_4_0 == 1 or var_4_1 then
		arg_4_4()

		return
	end

	seriesAsync({
		function(arg_5_0)
			local var_5_0 = arg_4_0.view:GetIsland()
			local var_5_1 = IslandShipDressHelperNew.New(var_5_0)

			arg_4_2:SetShipDressHelper(var_5_1)
			var_5_1:PreLoadShipDressupItem(arg_4_1, var_4_0, arg_5_0)
		end
	}, function()
		existCall(arg_4_4)
	end)
end

return var_0_0
