pg = pg or {}

local var_0_0 = pg

var_0_0.SecondaryPWDMgr = singletonClass("SecondaryPWDMgr")

local var_0_1 = var_0_0.SecondaryPWDMgr

var_0_1.UNLOCK_SHIP = 1
var_0_1.UNLOCK_COMMANDER = 2
var_0_1.RESOLVE_EQUIPMENT = 3
var_0_1.CREATE_INHERIT = 4
var_0_1.CLOSE_PASSWORD = 98
var_0_1.SET_PASSWORD = 99
var_0_1.CHANGE_SETTING = 100

local function var_0_2()
	if not PLATFORM_CODE then
		return
	end

	local var_1_0 = {
		var_0_1.UNLOCK_SHIP,
		var_0_1.RESOLVE_EQUIPMENT
	}

	if PLATFORM_CODE ~= PLATFORM_US then
		table.insert(var_1_0, 2, var_0_1.UNLOCK_COMMANDER)
	end

	if PLATFORM_CODE == PLATFORM_JP then
		-- block empty
	end

	return var_1_0
end

function var_0_1.Init(arg_2_0, arg_2_1)
	var_0_1.LIMITED_OPERATION = var_0_2()

	if arg_2_1 then
		arg_2_1()
	end
end

function var_0_1.LimitedOperation(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	local var_3_0 = getProxy(SecondaryPWDProxy)
	local var_3_1 = var_3_0:getRawData()

	if not table.contains(var_3_1.system_list, arg_3_1) then
		if arg_3_3 then
			arg_3_3()
		end

		return
	end

	if var_3_1.state == 0 then
		if arg_3_3 then
			arg_3_3()
		end

		return
	end

	local var_3_2, var_3_3 = var_3_0:GetPermissionState()

	if not var_3_2 then
		arg_3_0:ShowWarningWindow()
		var_0_0.m02:sendNotification(GAME.CANCEL_LIMITED_OPERATION)

		return
	end

	if var_3_1.state == 2 then
		if arg_3_3 then
			arg_3_3()
		end

		return
	end

	local var_3_4 = Context.New({
		mediator = SecondaryPasswordMediator,
		viewComponent = SecondaryPasswordLayer,
		data = {
			mode = SecondaryPasswordLayer.InputView,
			type = arg_3_1,
			info = arg_3_2,
			callback = arg_3_3
		}
	})

	arg_3_0:LoadLayer(var_3_4)
end

function var_0_1.ChangeSetting(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = getProxy(SecondaryPWDProxy)
	local var_4_1 = var_4_0:getRawData()

	if table.equal(arg_4_1, var_4_1.system_list) then
		return
	end

	local var_4_2, var_4_3 = var_4_0:GetPermissionState()

	if not var_4_2 then
		arg_4_0:ShowWarningWindow()
		var_0_0.m02:sendNotification(GAME.CANCEL_LIMITED_OPERATION)

		return
	end

	local var_4_4 = Context.New({
		mediator = SecondaryPasswordMediator,
		viewComponent = SecondaryPasswordLayer,
		data = {
			mode = SecondaryPasswordLayer.InputView,
			type = #arg_4_1 == 0 and var_0_1.CLOSE_PASSWORD or var_0_1.CHANGE_SETTING,
			settings = arg_4_1,
			callback = arg_4_2
		}
	})

	arg_4_0:LoadLayer(var_4_4)
end

function var_0_1.SetPassword(arg_5_0, arg_5_1)
	if getProxy(SecondaryPWDProxy):getRawData().state > 0 then
		return
	end

	local var_5_0 = Context.New({
		mediator = SecondaryPasswordMediator,
		viewComponent = SecondaryPasswordLayer,
		data = {
			mode = SecondaryPasswordLayer.SetView,
			type = var_0_1.SET_PASSWORD,
			settings = var_0_1.LIMITED_OPERATION,
			callback = arg_5_1
		}
	})

	arg_5_0:LoadLayer(var_5_0)
end

function var_0_1.LoadLayer(arg_6_0, arg_6_1)
	local var_6_0 = getProxy(ContextProxy):getCurrentContext()
	local var_6_1 = var_6_0:getContextByMediator(var_6_0.mediator)

	while var_6_1.parent do
		var_6_1 = var_6_1.parent
	end

	var_0_0.m02:sendNotification(GAME.LOAD_LAYERS, {
		parentContext = var_6_1,
		context = arg_6_1
	})
end

function var_0_1.ShowWarningWindow(arg_7_0)
	local var_7_0 = {
		title = "warning",
		mode = "showresttime",
		hideNo = true,
		type = MSGBOX_TYPE_SECONDPWD
	}

	var_0_0.MsgboxMgr.GetInstance():ShowMsgBox(var_7_0)
end

function var_0_1.FetchData(arg_8_0)
	var_0_0.m02:sendNotification(GAME.FETCH_PASSWORD_STATE)
end

function var_0_1.IsNormalOp(arg_9_0, arg_9_1)
	if not arg_9_1 then
		return false
	end

	return table.contains(var_0_1.LIMITED_OPERATION, arg_9_1)
end

function var_0_1.Dispose(arg_10_0)
	return
end

return var_0_1
