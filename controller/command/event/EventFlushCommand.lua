local var_0_0 = class("EventFlushCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(EventProxy)

	if var_1_0:IsFlushing() then
		return
	end

	var_1_0:SetFlushing(true)
	pg.ConnectionMgr.GetInstance():Send(13009, {
		type = 0
	}, 13010, function(arg_2_0)
		var_1_0:SetFlushing(false)

		if arg_2_0.result == 0 then
			var_1_0:SetDirty(false)
			var_1_0:updateAll(arg_2_0.collection_list)
		else
			var_1_0:SetDirty(true)
			pg.TipsMgr.GetInstance():ShowTips(errorTip("event_flush_fail", arg_2_0.result))
		end
	end)
end

return var_0_0
