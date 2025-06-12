local var_0_0 = class("RequestNewInstagramDataCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.beginId
	local var_1_2 = var_1_0.endId
	local var_1_3 = getProxy(InstagramProxy)

	if var_1_3:IsReqNewInstagramData() then
		if var_1_0.callback then
			var_1_0.callback()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(11705, {
		index_begin = var_1_1,
		index_end = var_1_2
	}, 11706, function(arg_2_0)
		for iter_2_0, iter_2_1 in ipairs(arg_2_0.ins_message_list) do
			local var_2_0 = Instagram.New(iter_2_1)

			var_1_3:AddInstagram(var_2_0)
		end

		var_1_3:MarkNewInstagramData()

		if var_1_0.callback then
			var_1_0.callback()
		end

		arg_1_0:sendNotification(GAME.REQ_NEW_INSTAGRAM_DATA_DONE)
	end)
end

return var_0_0
