local var_0_0 = class("NewEducateSelTopicCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.id
	local var_1_2 = var_1_0.topicId

	pg.ConnectionMgr.GetInstance():Send(29017, {
		id = var_1_1,
		chat_id = var_1_2
	}, 29018, function(arg_2_0)
		if arg_2_0.result == 0 then
			local var_2_0 = getProxy(NewEducateProxy):GetCurChar():GetFSM()

			var_2_0:SetStystemNo(NewEducateFSM.STYSTEM.TOPIC)
			var_2_0:GetState(NewEducateFSM.STYSTEM.TOPIC):MarkFinish()
			var_2_0:SetCurNode(arg_2_0.first_node)

			local var_2_1 = NewEducateHelper.MergeDrops(arg_2_0.drop)

			NewEducateHelper.UpdateDropsData(var_2_1)
			arg_1_0:sendNotification(GAME.NEW_EDUCATE_SEL_TOPIC_DONE, {
				drops = NewEducateHelper.FilterBenefit(var_2_1),
				node = arg_2_0.first_node
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("NewEducate_SelTopic", arg_2_0.result))
		end
	end)
end

return var_0_0
