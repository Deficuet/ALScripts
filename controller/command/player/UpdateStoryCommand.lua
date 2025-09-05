local var_0_0 = class("UpdateStoryCommand", pm.SimpleCommand)

function var_0_0.execute(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1:getBody()
	local var_1_1 = var_1_0.storyId
	local var_1_2 = var_1_0.callback

	assert(type(var_1_1) == "string")

	if not pg.ConnectionMgr.GetInstance():getConnection() or not pg.ConnectionMgr.GetInstance():isConnected() then
		return
	end

	if not getProxy(PlayerProxy) then
		return
	end

	local var_1_3 = pg.NewStoryMgr.GetInstance()
	local var_1_4 = {}

	local function var_1_5(arg_2_0, arg_2_1)
		pg.ConnectionMgr.GetInstance():Send(11017, {
			story_id = arg_2_0
		}, 11018, function(arg_3_0)
			var_1_3:SetPlayedFlag(arg_2_0)

			local var_3_0 = PlayerConst.addTranDrop(arg_3_0.drop_list)

			table.insertto(var_1_4, var_3_0)

			if arg_2_1 then
				arg_2_1()
			end
		end)
	end

	local function var_1_6(arg_4_0, arg_4_1)
		local var_4_0, var_4_1 = var_1_3:StoryName2StoryId(arg_4_0)
		local var_4_2 = {}

		if var_4_0 and var_4_0 > 0 and not var_1_3:GetPlayedFlag(var_4_0) then
			table.insert(var_4_2, function(arg_5_0)
				var_1_5(var_4_0, arg_5_0)
			end)
		end

		if var_4_1 and var_4_1 > 0 and not var_1_3:GetPlayedFlag(var_4_1) then
			table.insert(var_4_2, function(arg_6_0)
				var_1_5(var_4_1, arg_6_0)
			end)
		end

		parallelAsync(var_4_2, arg_4_1)
	end

	local var_1_7 = var_1_3:StoryLinkNames(var_1_1) or {}

	table.insert(var_1_7, var_1_1)

	local var_1_8 = {}

	for iter_1_0, iter_1_1 in ipairs(var_1_7) do
		table.insert(var_1_8, function(arg_7_0)
			var_1_6(iter_1_1, arg_7_0)
		end)
	end

	seriesAsync(var_1_8, function()
		existCall(var_1_2)
		arg_1_0:sendNotification(GAME.STORY_UPDATE_DONE, {
			storyName = var_1_1,
			awards = var_1_4
		})
	end)
end

return var_0_0
