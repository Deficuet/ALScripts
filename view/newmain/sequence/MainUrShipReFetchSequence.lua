local var_0_0 = class("MainUrShipReFetchSequence", import("...base.ContextMediator"))

var_0_0.ON_TIME_UP = "MainUrShipReFetchSequence:ON_TIME_UP"

function var_0_0.Ctor(arg_1_0)
	var_0_0.super.Ctor(arg_1_0, BaseEventLogic.New())
	pg.m02:registerMediator(arg_1_0)
end

function var_0_0.Execute(arg_2_0, arg_2_1)
	local var_2_0 = getProxy(ActivityProxy):getActivitiesByType(ActivityConst.ACTIVITY_TYPE_GRAFTING)

	if #var_2_0 == 0 then
		arg_2_1()

		return
	end

	arg_2_0:CheckUrShipAct(var_2_0, arg_2_1)
end

local function var_0_1(arg_3_0)
	local var_3_0 = getProxy(ActivityProxy):getActivityById(arg_3_0)

	return var_3_0 and not var_3_0:isEnd()
end

local function var_0_2(arg_4_0)
	return arg_4_0 == ActivityConst.ACTIVITY_TYPE_BUILDSHIP_1 or arg_4_0 == ActivityConst.ACTIVITY_TYPE_BUILD or arg_4_0 == ActivityConst.ACTIVITY_TYPE_NEWSERVER_BUILD
end

local function var_0_3(arg_5_0)
	if not arg_5_0 or arg_5_0:isEnd() then
		return false
	end

	local var_5_0 = arg_5_0:getConfig("config_id")

	if var_0_1(var_5_0) then
		return false
	end

	local var_5_1 = pg.activity_template[var_5_0]

	return var_5_1 and var_0_2(var_5_1.type)
end

function var_0_0.CheckUrShipAct(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = {}

	for iter_6_0, iter_6_1 in pairs(arg_6_1) do
		if var_0_3(iter_6_1) then
			table.insert(var_6_0, function(arg_7_0)
				arg_6_0:TryFetchUrShips(iter_6_1, arg_7_0)
			end)
		end
	end

	seriesAsync(var_6_0, arg_6_2)
end

local function var_0_4(arg_8_0)
	local var_8_0 = getProxy(ActivityProxy):getActivityById(arg_8_0)

	if not var_8_0 or var_8_0:isEnd() then
		return false
	end

	local var_8_1 = var_8_0:getConfig("config_id")
	local var_8_2 = pg.ship_data_create_exchange[var_8_1]
	local var_8_3 = var_8_2.exchange_request
	local var_8_4 = var_8_2.exchange_available_times
	local var_8_5 = var_8_0.data1
	local var_8_6 = var_8_0.data2
	local var_8_7 = math.min(var_8_4, var_8_6 + 1) * var_8_3

	return var_8_6 < var_8_4 and var_8_7 <= var_8_5
end

function var_0_0.TryFetchUrShips(arg_9_0, arg_9_1, arg_9_2)
	local function var_9_0()
		arg_9_0:TryFetchUrShips(arg_9_1, arg_9_2)
	end

	if var_0_4(arg_9_1.id) then
		arg_9_0:ShowFetchShipMsgbox(arg_9_1.id, var_9_0)
	else
		arg_9_2()
	end
end

function var_0_0.ShowFetchShipMsgbox(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0.callback = arg_11_2
	arg_11_0.page = UrShipRefetchWindow.New(pg.UIMgr.GetInstance().UIMain)

	arg_11_0.page:ExecuteAction("Show", arg_11_1)
end

function var_0_0.listNotificationInterests(arg_12_0)
	return {
		GAME.GRAFTING_ACT_OP_DONE,
		MainUrShipReFetchSequence.ON_TIME_UP
	}
end

function var_0_0.handleNotification(arg_13_0, arg_13_1)
	local var_13_0 = arg_13_1:getName()
	local var_13_1 = arg_13_1:getBody()

	if var_13_0 == GAME.GRAFTING_ACT_OP_DONE and var_0_2(var_13_1.linkActType) then
		if #var_13_1.awards > 0 then
			arg_13_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_13_1.awards, arg_13_0.callback)
		else
			arg_13_0.callback()
		end

		if arg_13_0.page and arg_13_0.page:GetLoaded() and arg_13_0.page:isShowing() then
			arg_13_0.page:Hide()
		end

		arg_13_0.callback = nil
	elseif var_13_0 == MainUrShipReFetchSequence.ON_TIME_UP then
		if arg_13_0.page and arg_13_0.page:GetLoaded() and arg_13_0.page:isShowing() then
			arg_13_0.page:Hide()
		end

		if arg_13_0.callback then
			arg_13_0.callback()

			arg_13_0.callback = nil
		end
	end
end

function var_0_0.Clear(arg_14_0)
	if arg_14_0.page then
		arg_14_0.page:Destroy()

		arg_14_0.page = nil
	end
end

function var_0_0.Dispose(arg_15_0)
	pg.m02:removeMediator(arg_15_0.__cname)
	arg_15_0:Clear()
end

function var_0_0.addSubLayers(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
	assert(isa(arg_16_1, Context), "should be an instance of Context")

	local var_16_0 = getProxy(ContextProxy):getCurrentContext():getContextByMediator(NewMainMediator)

	if arg_16_2 then
		while var_16_0.parent do
			var_16_0 = var_16_0.parent
		end
	end

	pg.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_16_0,
		context = arg_16_1,
		callback = arg_16_3
	})
end

return var_0_0
