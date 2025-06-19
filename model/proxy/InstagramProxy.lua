local var_0_0 = class("InstagramProxy", import(".NetProxy"))
local var_0_1 = pg.activity_ins_language
local var_0_2 = pg.activity_ins_npc_template

function var_0_0.register(arg_1_0)
	arg_1_0.messages = {}
	arg_1_0.isReqNewInstagramData = false
	arg_1_0.isReqOldInstagramData = false
	arg_1_0.allReply = {}

	local function var_1_0(arg_2_0)
		local var_2_0 = arg_2_0.npc_reply_persist

		if type(arg_2_0.npc_reply_persist) == "string" then
			var_2_0 = {}
		end

		local var_2_1 = ""
		local var_2_2 = pg.TimeMgr.GetInstance():GetServerTime()

		if var_0_1[arg_2_0.message_persist] then
			var_2_1 = var_0_1[arg_2_0.message_persist].value
			var_2_2 = pg.TimeMgr.GetInstance():parseTimeFromConfig(arg_2_0.time_persist)
		end

		return {
			id = arg_2_0.id,
			time = var_2_2,
			text = var_2_1,
			npc_reply = var_2_0
		}
	end

	for iter_1_0, iter_1_1 in ipairs(var_0_2.all) do
		local var_1_1 = var_1_0(var_0_2[iter_1_1])

		arg_1_0.allReply[iter_1_1] = var_1_1
	end
end

function var_0_0.IsReqOldInstagramData(arg_3_0)
	return arg_3_0.isReqOldInstagramData
end

function var_0_0.MarkOldInstagramData(arg_4_0)
	arg_4_0.isReqOldInstagramData = true
end

function var_0_0.IsReqNewInstagramData(arg_5_0)
	return arg_5_0.isReqNewInstagramData
end

function var_0_0.MarkNewInstagramData(arg_6_0)
	arg_6_0.isReqNewInstagramData = true

	arg_6_0:AddInstagramTimer()
end

function var_0_0.AddInstagram(arg_7_0, arg_7_1)
	arg_7_0.messages[arg_7_1.id] = arg_7_1
end

function var_0_0.GetAllReply(arg_8_0)
	return arg_8_0.allReply
end

function var_0_0.GetMessages(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in pairs(arg_9_0.messages) do
		table.insert(var_9_0, iter_9_1)
	end

	return var_9_0
end

function var_0_0.ExistMessage(arg_10_0)
	return table.getCount(arg_10_0.messages) > 0
end

function var_0_0.GetData(arg_11_0)
	return arg_11_0.messages
end

function var_0_0.GetMessageById(arg_12_0, arg_12_1)
	return arg_12_0.messages[arg_12_1]
end

function var_0_0.AddMessage(arg_13_0, arg_13_1)
	arg_13_0.messages[arg_13_1.id] = arg_13_1
end

function var_0_0.UpdateMessage(arg_14_0, arg_14_1)
	if not arg_14_0.messages[arg_14_1.id] then
		arg_14_0:AddMessage(arg_14_1)
	else
		arg_14_0.messages[arg_14_1.id] = arg_14_1
	end
end

function var_0_0.ShouldShowTip(arg_15_0)
	local var_15_0 = arg_15_0:GetMessages()

	return _.any(var_15_0, function(arg_16_0)
		return arg_16_0:ShouldShowTip()
	end)
end

function var_0_0.GetNewInstagramBeginIdAndEndId()
	local var_17_0 = Mathf.Infinity
	local var_17_1 = Mathf.NegativeInfinity

	for iter_17_0, iter_17_1 in ipairs(pg.activity_ins_template.all) do
		if pg.activity_ins_template[iter_17_1].is_active == 1 then
			if iter_17_1 < var_17_0 then
				var_17_0 = iter_17_1
			end

			if var_17_1 < iter_17_1 then
				var_17_1 = iter_17_1
			end
		end
	end

	return var_17_0, var_17_1
end

function var_0_0.GetOldInstagramIds()
	local var_18_0 = {}

	for iter_18_0, iter_18_1 in ipairs(pg.activity_ins_template.all) do
		if pg.activity_ins_template[iter_18_1].is_active == 0 then
			table.insert(var_18_0, iter_18_1)
		end
	end

	return var_18_0
end

function var_0_0.GetNextPushTime(arg_19_0)
	local var_19_0 = pg.activity_ins_template.all

	for iter_19_0, iter_19_1 in ipairs(var_19_0) do
		local var_19_1 = pg.activity_ins_template[iter_19_1]

		if var_19_1.is_active == 1 and arg_19_0:GetMessageById(iter_19_1) == nil then
			return pg.TimeMgr.GetInstance():parseTimeFromConfig(var_19_1.time), iter_19_1
		end
	end
end

function var_0_0.AddInstagramTimer(arg_20_0, arg_20_1)
	arg_20_0:RemoveInstagramTimer()

	local var_20_0, var_20_1 = arg_20_0:GetNextPushTime()

	if not var_20_0 then
		return
	end

	local var_20_2 = var_20_0 - pg.TimeMgr.GetInstance():GetServerTime() + math.Random(1, 3)

	local function var_20_3()
		pg.m02:sendNotification(GAME.ACT_INSTAGRAM_OP, {
			cmd = ActivityConst.INSTAGRAM_OP_ACTIVE,
			arg1 = var_20_1
		})
	end

	if var_20_2 <= 0 then
		var_20_3()

		return
	end

	arg_20_0.timer = Timer.New(function()
		arg_20_0:RemoveInstagramTimer()
		var_20_3()
	end, var_20_2, 1)

	arg_20_0.timer:Start()
end

function var_0_0.RemoveInstagramTimer(arg_23_0)
	if arg_23_0.timer then
		arg_23_0.timer:Stop()

		arg_23_0.timer = nil
	end
end

function var_0_0.remove(arg_24_0)
	arg_24_0.isReqNewInstagramData = false

	arg_24_0:RemoveInstagramTimer()
end

return var_0_0
