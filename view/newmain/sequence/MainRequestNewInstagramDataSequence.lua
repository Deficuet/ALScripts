local var_0_0 = class("MainRequestNewInstagramDataSequence")

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = {}

	if not getProxy(InstagramProxy):IsReqNewInstagramData() then
		table.insert(var_1_0, function(arg_2_0)
			local var_2_0 = getProxy(InstagramProxy):GetNewInstagramIds()

			pg.m02:sendNotification(GAME.REQ_NEW_INSTAGRAM_DATA, {
				idList = var_2_0,
				callback = arg_2_0
			})
		end)
	end

	seriesAsync(var_1_0, arg_1_1)
end

return var_0_0
