local var_0_0 = class("IslandDressupNpcBuilder", import(".IslandNpcBuilder"))

function var_0_0.GetModule(arg_1_0, arg_1_1, arg_1_2)
	return IslandDressupNpcUnit.New(arg_1_1, arg_1_2)
end

function var_0_0.LoadOtherPart(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0 = arg_2_3.shipId

	if not var_2_0 or var_2_0 == 0 then
		arg_2_4()

		return
	end

	seriesAsync({
		function(arg_3_0)
			local var_3_0 = arg_2_0.view:GetIsland()
			local var_3_1 = IslandShipDressHelperNew.New(var_3_0)

			arg_2_2:SetShipDressHelper(var_3_1)
			var_3_1:PreLoadShipDressupItem(arg_2_1, var_2_0, arg_3_0)
		end
	}, function()
		existCall(arg_2_4)
	end)
end

return var_0_0
