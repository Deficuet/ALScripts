local var_0_0 = class("RequestOldInstagramDataCommand", pm.SimpleCommand)
local var_0_1 = 50

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = getProxy(InstagramProxy)

	if var_1_1:IsReqOldInstagramData() then
		if var_1_0.callback then
			var_1_0.callback()
		end

		return
	end

	local var_1_2 = var_1_1:GetOldInstagramIds()
	local var_1_3 = {}
	local var_1_4 = math.ceil(#var_1_2 / var_0_1)

	for iter_1_0 = 1, var_1_4 do
		local var_1_5 = (iter_1_0 - 1) * var_0_1 + 1
		local var_1_6 = math.min(iter_1_0 * var_0_1, #var_1_2)

		table.insert(var_1_3, function(arg_2_0)
			arg_1_0:Send(var_1_2[var_1_5], var_1_2[var_1_6], arg_2_0)
		end)
	end

	seriesAsync(var_1_3, function()
		if var_1_0.callback then
			var_1_0.callback()
		end

		var_1_1:MarkOldInstagramData()
		arg_1_0:sendNotification(GAME.REQ_OLD_INSTAGRAM_DATA_DONE)
	end)
end

function var_0_0.Send(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	local var_4_0 = getProxy(InstagramProxy)

	pg.ConnectionMgr.GetInstance():Send(11705, {
		index_begin = arg_4_1,
		index_end = arg_4_2
	}, 11706, function(arg_5_0)
		for iter_5_0, iter_5_1 in ipairs(arg_5_0.ins_message_list) do
			local var_5_0 = Instagram.New(iter_5_1)

			var_4_0:AddInstagram(var_5_0)
		end

		arg_4_3()
	end)
end

return var_0_0
