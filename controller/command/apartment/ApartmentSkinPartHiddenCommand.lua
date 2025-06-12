local var_0_0 = class("ApartmentSkinPartHiddenCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.groupId
	local var_1_2 = var_1_0.skinId
	local var_1_3 = var_1_0.partList
	local var_1_4 = getProxy(ApartmentProxy)

	pg.ConnectionMgr.GetInstance():Send(28038, {
		ship_group = var_1_1,
		skin_id = var_1_2,
		hidden_parts = var_1_3
	}, 28039, function(arg_2_0)
		if arg_2_0.result == 0 then
			var_1_4:ModifyApartment(var_1_1, function(arg_3_0)
				arg_3_0:SetHiddenParts(var_1_2, var_1_3)
			end)
		else
			pg.TipsMgr.GetInstance():ShowTips(ERROR_MESSAGE[arg_2_0.result] .. arg_2_0.result)
		end
	end)
end

return var_0_0
