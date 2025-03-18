local var_0_0 = class("NewEducateProxy", import(".NetProxy"))

var_0_0.RESOURCE_UPDATED = "NewEducateProxy.RESOURCE_UPDATED"
var_0_0.ATTR_UPDATED = "NewEducateProxy.ATTR_UPDATED"
var_0_0.PERSONALITY_UPDATED = "NewEducateProxy.PERSONALITY_UPDATED"
var_0_0.TALENT_UPDATED = "NewEducateProxy.TALENT_UPDATED"
var_0_0.STATUS_UPDATED = "NewEducateProxy.STATUS_UPDATED"
var_0_0.POLAROID_UPDATED = "NewEducateProxy.POLAROID_UPDATED"
var_0_0.ENDING_UPDATED = "NewEducateProxy.ENDING_UPDATED"
var_0_0.NEXT_ROUND = "NewEducateProxy.NEXT_ROUND"

function var_0_0.register(arg_1_0)
	arg_1_0.data = {}
end

function var_0_0.ReqDataCheck(arg_2_0, arg_2_1)
	local var_2_0 = {}

	for iter_2_0, iter_2_1 in ipairs(pg.child2_data.all) do
		table.insert(var_2_0, function(arg_3_0)
			if not arg_2_0.data[iter_2_1] then
				pg.m02:sendNotification(GAME.NEW_EDUCATE_REQUEST, {
					id = iter_2_1,
					callback = arg_3_0
				})
			else
				arg_3_0()
			end
		end)
	end

	seriesAsync(var_2_0, function()
		existCall(arg_2_1)
	end)
end

function var_0_0.GetChar(arg_5_0, arg_5_1)
	return arg_5_0.data[arg_5_1]
end

function var_0_0.UpdateChar(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = NewEducateChar.New(arg_6_1)

	arg_6_0.data[var_6_0.id] = var_6_0

	arg_6_0.data[var_6_0.id]:InitPermanent(arg_6_2)
	arg_6_0.data[var_6_0.id]:InitFSM(arg_6_1.fsm)
end

function var_0_0.ResetChar(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0.data[arg_7_1]:GetPermanentData()

	var_7_0:AddGameCnt()

	arg_7_0.data[arg_7_1] = NewEducateChar.New(arg_7_2)

	arg_7_0.data[arg_7_1]:SetPermanent(var_7_0)
	arg_7_0.data[arg_7_1]:InitFSM(arg_7_2.fsm)
end

function var_0_0.RefreshChar(arg_8_0, arg_8_1, arg_8_2)
	local var_8_0 = arg_8_0.data[arg_8_1]:GetPermanentData()

	arg_8_0.data[arg_8_1] = NewEducateChar.New(arg_8_2)

	arg_8_0.data[arg_8_1]:SetPermanent(var_8_0)
	arg_8_0.data[arg_8_1]:InitFSM(arg_8_2.fsm)
end

function var_0_0.SetCurChar(arg_9_0, arg_9_1)
	arg_9_0.curId = arg_9_1
end

function var_0_0.GetCurChar(arg_10_0)
	return arg_10_0.data[arg_10_0.curId]
end

function var_0_0.AddBuff(arg_11_0, arg_11_1, arg_11_2)
	assert(pg.child2_benefit_list[arg_11_1], "child2_benefit_list不存在id" .. arg_11_1)

	if not pg.child2_benefit_list[arg_11_1] then
		return
	end

	arg_11_0.data[arg_11_0.curId]:AddBuff(arg_11_1, arg_11_2)

	local var_11_0 = pg.child2_benefit_list[arg_11_1].type

	if var_11_0 == NewEducateBuff.TYPE.TALENT then
		arg_11_0:sendNotification(var_0_0.TALENT_UPDATED)
	elseif var_11_0 == NewEducateBuff.TYPE.STATUS then
		arg_11_0:sendNotification(var_0_0.STATUS_UPDATED)
	end
end

function var_0_0.UpdateResources(arg_12_0, arg_12_1)
	arg_12_0.data[arg_12_0.curId]:SetResources(arg_12_1)
	arg_12_0:sendNotification(var_0_0.RESOURCE_UPDATED)
end

function var_0_0.UpdateRes(arg_13_0, arg_13_1, arg_13_2)
	arg_13_0.data[arg_13_0.curId]:UpdateRes(arg_13_1, arg_13_2)
	arg_13_0:sendNotification(var_0_0.RESOURCE_UPDATED)
end

function var_0_0.UpdateAttrs(arg_14_0, arg_14_1)
	arg_14_0.data[arg_14_0.curId]:SetAttrs(arg_14_1)
	arg_14_0:sendNotification(var_0_0.ATTR_UPDATED)
end

function var_0_0.UpdateAttr(arg_15_0, arg_15_1, arg_15_2)
	local var_15_0 = arg_15_0.data[arg_15_0.curId]:GetPersonalityTag()

	arg_15_0.data[arg_15_0.curId]:UpdateAttr(arg_15_1, arg_15_2)
	arg_15_0:sendNotification(var_0_0.ATTR_UPDATED)

	if arg_15_1 == arg_15_0.data[arg_15_0.curId]:GetPersonalityId() then
		arg_15_0:sendNotification(var_0_0.PERSONALITY_UPDATED, {
			number = arg_15_2,
			oldTag = var_15_0
		})
	end
end

function var_0_0.AddPolaroid(arg_16_0, arg_16_1, arg_16_2)
	arg_16_0.data[arg_16_0.curId]:GetPermanentData():AddPolaroid(arg_16_1)
	arg_16_0:sendNotification(var_0_0.POLAROID_UPDATED)
	pg.m02:sendNotification(GAME.NEW_EDUCATE_TRACK, NewEducateTrackCommand.BuildDataPolariod(arg_16_0.data[arg_16_0.curId]:GetGameCnt(), arg_16_0.data[arg_16_0.curId]:GetRoundData().round, arg_16_1))
end

function var_0_0.AddActivatedEndings(arg_17_0, arg_17_1)
	arg_17_0.data[arg_17_0.curId]:GetPermanentData():AddActivatedEndings(arg_17_1)
	arg_17_0:sendNotification(var_0_0.ENDING_UPDATED)
end

function var_0_0.AddFinishedEnding(arg_18_0, arg_18_1)
	arg_18_0.data[arg_18_0.curId]:GetPermanentData():AddFinishedEnding(arg_18_1)
	arg_18_0:sendNotification(var_0_0.ENDING_UPDATED)
end

function var_0_0.UpdateUnlock(arg_19_0, arg_19_1)
	arg_19_1 = arg_19_1 or arg_19_0.curId

	if not arg_19_0.data[arg_19_1] then
		return
	end

	arg_19_0.data[arg_19_1]:GetPermanentData():UpdateSecretaryIDs(true)
end

function var_0_0.Costs(arg_20_0, arg_20_1)
	underscore.each(arg_20_1, function(arg_21_0)
		arg_20_0:Cost(arg_21_0)
	end)
end

function var_0_0.Cost(arg_22_0, arg_22_1)
	switch(arg_22_1.type, {
		[NewEducateConst.DROP_TYPE.ATTR] = function()
			arg_22_0:UpdateAttr(arg_22_1.id, -arg_22_1.number)
		end,
		[NewEducateConst.DROP_TYPE.RES] = function()
			arg_22_0:UpdateRes(arg_22_1.id, -arg_22_1.number)
		end
	}, function()
		assert(false, "非法消耗类型:" .. arg_22_1.type)
	end)
end

function var_0_0.NextRound(arg_26_0)
	arg_26_0.data[arg_26_0.curId]:OnNextRound()
	arg_26_0:sendNotification(var_0_0.NEXT_ROUND)
end

function var_0_0.GetStoryInfo(arg_27_0)
	local var_27_0 = arg_27_0.data[arg_27_0.curId]

	return var_27_0:GetPaintingName(), var_27_0:GetCallName(), var_27_0:GetBGName()
end

function var_0_0.RecordEnterTime(arg_28_0, arg_28_1)
	arg_28_0.enterTimeStamp = arg_28_1 and 0 or pg.TimeMgr.GetInstance():GetServerTime()
end

function var_0_0.GetEnterTime(arg_29_0)
	return arg_29_0.enterTimeStamp or 0
end

function var_0_0.remove(arg_30_0)
	return
end

return var_0_0
