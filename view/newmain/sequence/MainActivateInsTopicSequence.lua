local var_0_0 = class("MainActivateInsTopicSequence")
local var_0_1 = pg.activity_ins_chat_group
local var_0_2 = pg.ship_data_group

function var_0_0.Execute(arg_1_0, arg_1_1)
	local var_1_0 = {}
	local var_1_1 = getProxy(InstagramChatProxy)
	local var_1_2 = var_1_1:GetNotActiveTopicIdsByType(1)
	local var_1_3 = var_1_1:GetNotActiveTopicIdsByType(2)
	local var_1_4 = var_1_1:GetNotActiveTopicIdsByType(3)
	local var_1_5 = var_1_1:GetNotActiveTopicIdsByType(4)
	local var_1_6 = var_1_1:GetNotActiveTopicIdsByType(5)
	local var_1_7 = var_1_1:GetNotActiveTopicIdsByType(6)
	local var_1_8 = var_1_1:GetNotActiveTopicIdsByType(7)
	local var_1_9 = getProxy(CollectionProxy):getGroups()

	for iter_1_0, iter_1_1 in ipairs(var_0_2.all) do
		local var_1_10 = var_0_2[iter_1_1]

		if ShipGroup.getState(var_1_10.code, var_1_9[var_1_10.group_type], false) == ShipGroup.STATE_UNLOCK then
			local var_1_11 = var_0_1.get_id_list_by_ship_group[var_1_10.group_type]

			if var_1_11 then
				for iter_1_2, iter_1_3 in ipairs(var_1_11) do
					if var_1_2 and _.contains(var_1_2, iter_1_3) then
						table.insert(var_1_0, iter_1_3)
					end

					if var_1_3 and _.contains(var_1_3, iter_1_3) and var_1_9[var_1_10.group_type].maxIntimacy / 100 >= tonumber(var_0_1[iter_1_3].trigger_param) then
						table.insert(var_1_0, iter_1_3)
					end

					if var_1_8 and _.contains(var_1_8, iter_1_3) and var_1_9[var_1_10.group_type].married == 1 then
						table.insert(var_1_0, iter_1_3)
					end
				end
			end
		end
	end

	if var_1_4 then
		local var_1_12 = pg.TimeMgr.GetInstance():GetServerTime()

		for iter_1_4, iter_1_5 in ipairs(var_1_4) do
			if #var_0_1[iter_1_5].trigger_param == 1 then
				if var_1_12 >= pg.TimeMgr.GetInstance():parseTimeFromConfig(var_0_1[iter_1_5].trigger_param[1]) then
					table.insert(var_1_0, iter_1_5)
				end
			elseif #var_0_1[iter_1_5].trigger_param == 2 then
				local var_1_13 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_0_1[iter_1_5].trigger_param[1])
				local var_1_14 = pg.TimeMgr.GetInstance():parseTimeFromConfig(var_0_1[iter_1_5].trigger_param[2])

				if var_1_13 <= var_1_12 and var_1_12 <= var_1_14 then
					table.insert(var_1_0, iter_1_5)
				end
			end
		end
	end

	if var_1_5 then
		for iter_1_6, iter_1_7 in ipairs(var_1_5) do
			local var_1_15 = pg.NewStoryMgr.GetInstance():StoryId2StoryName(tonumber(var_0_1[iter_1_7].trigger_param))

			if pg.NewStoryMgr.GetInstance():IsPlayed(var_1_15) then
				table.insert(var_1_0, iter_1_7)
			end
		end
	end

	if var_1_6 then
		for iter_1_8, iter_1_9 in ipairs(var_1_6) do
			if getProxy(ChapterProxy):getChapterById(tonumber(var_0_1[iter_1_9].trigger_param)):isClear() then
				table.insert(var_1_0, iter_1_9)
			end
		end
	end

	if var_1_7 then
		local var_1_16 = getProxy(TaskProxy)

		for iter_1_10, iter_1_11 in ipairs(var_1_7) do
			if var_1_16:getFinishTaskById(tonumber(var_0_1[iter_1_11].trigger_param)) then
				table.insert(var_1_0, iter_1_11)
			end
		end
	end

	if #var_1_0 > 0 then
		var_1_1:ActivateTopics(var_1_0)
	end

	arg_1_1()
end

function var_0_0.ShowTip(arg_2_0)
	return
end

return var_0_0
