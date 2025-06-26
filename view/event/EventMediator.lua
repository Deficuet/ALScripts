EventConst = require("view/event/EventConst")

local var_0_0 = class("EventMediator", import("..base.ContextMediator"))

function var_0_0.register(arg_1_0)
	arg_1_0:bind(EventConst.EVENT_LIST_UPDATE, function(arg_2_0)
		arg_1_0:updateEventList(true)
	end)
	arg_1_0:bind(EventConst.EVENT_OPEN_DOCK, function(arg_3_0, arg_3_1)
		if not arg_1_0.contextData.selectedEventId then
			return
		end

		local var_3_0 = getProxy(BayProxy):getRawData()
		local var_3_1 = {}

		for iter_3_0, iter_3_1 in pairs(var_3_0) do
			if not table.contains(arg_3_1.template.ship_type, iter_3_1:getShipType()) or iter_3_1:isActivityNpc() then
				table.insert(var_3_1, iter_3_0)
			end
		end

		local var_3_2, var_3_3, var_3_4 = arg_1_0:getDockCallbackFuncs(arg_3_1)

		arg_1_0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			selectedMax = 6,
			useBlackBlock = true,
			selectedMin = 1,
			ignoredIds = var_3_1,
			selectedIds = arg_3_1 and arg_3_1.shipIds or {},
			onShip = var_3_2,
			confirmSelect = var_3_3,
			onSelected = var_3_4,
			leftTopInfo = i18n("word_operation"),
			hideTagFlags = ShipStatus.TAG_HIDE_EVENT,
			blockTagFlags = ShipStatus.TAG_BLOCK_EVENT
		})
	end)
	arg_1_0:bind(EventConst.EVENT_FLUSH_ALL, function(arg_4_0)
		arg_1_0:sendNotification(GAME.EVENT_FLUSH_ALL)
	end)
	arg_1_0:bind(EventConst.EVENT_START, function(arg_5_0, arg_5_1)
		arg_1_0:sendNotification(GAME.EVENT_START, {
			event = arg_5_1
		})
	end)
	arg_1_0:bind(EventConst.EVENT_GIVEUP, function(arg_6_0, arg_6_1)
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("event_confirm_giveup"),
			onYes = function()
				arg_1_0:sendNotification(GAME.EVENT_GIVEUP, {
					id = arg_6_1.id
				})
			end
		})
	end)
	arg_1_0:bind(EventConst.EVENT_FINISH, function(arg_8_0, arg_8_1)
		arg_1_0:sendNotification(GAME.EVENT_FINISH, {
			id = arg_8_1.id
		})
	end)
	arg_1_0:updateEventList(false, arg_1_0.contextData.eventList)
end

function var_0_0.listNotificationInterests(arg_9_0)
	return {
		GAME.EVENT_LIST_UPDATE,
		GAME.EVENT_FINISH_UPDATE,
		GAME.EVENT_SHOW_AWARDS
	}
end

function var_0_0.handleNotification(arg_10_0, arg_10_1)
	local var_10_0 = arg_10_1:getName()
	local var_10_1 = arg_10_1:getBody()

	if var_10_0 == GAME.EVENT_LIST_UPDATE then
		arg_10_0:updateEventList(true)
	elseif var_10_0 == GAME.EVENT_FINISH_UPDATE then
		arg_10_0:updateEventList(true)
	elseif var_10_0 == GAME.EVENT_SHOW_AWARDS then
		local var_10_2

		var_10_2 = coroutine.wrap(function()
			if #var_10_1.oldShips > 0 then
				arg_10_0.viewComponent:emit(BaseUI.ON_SHIP_EXP, {
					title = pg.collection_template[var_10_1.eventId].title,
					oldShips = var_10_1.oldShips,
					newShips = var_10_1.newShips,
					isCri = var_10_1.isCri
				}, var_10_2)
				coroutine.yield()
			end

			arg_10_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_10_1.awards)
		end)

		var_10_2()
	end
end

function var_0_0.updateEventList(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0 = getProxy(BayProxy)
	local var_12_1 = getProxy(EventProxy)

	var_12_1.virgin = false
	arg_12_0.contextData.eventList = arg_12_2 or var_12_1:getEventList()

	arg_12_0.viewComponent:setEventList(arg_12_0.contextData.eventList)

	if arg_12_1 then
		arg_12_0.viewComponent:updateAll(arg_12_1)
	end

	if getProxy(SettingsProxy):ShouldShowEventActHelp() and _.any(arg_12_0.contextData.eventList, function(arg_13_0)
		return arg_13_0:IsActivityType()
	end) then
		getProxy(SettingsProxy):MarkEventActHelpFlag()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_act_event.tip
		})
	end
end

function var_0_0.getDockCallbackFuncs(arg_14_0, arg_14_1)
	local function var_14_0(arg_15_0, arg_15_1, arg_15_2)
		local var_15_0, var_15_1 = ShipStatus.ShipStatusCheck("inEvent", arg_15_0, arg_15_1)

		if not var_15_0 then
			return var_15_0, var_15_1
		end

		local var_15_2 = getProxy(BayProxy)

		for iter_15_0, iter_15_1 in ipairs(arg_15_2) do
			local var_15_3 = var_15_2:getShipById(iter_15_1)

			if arg_15_0:isSameKind(var_15_3) then
				return false, i18n("ship_formationMediator_changeNameError_sameShip")
			end
		end

		return true
	end

	local function var_14_1(arg_16_0, arg_16_1, arg_16_2)
		arg_16_1()
	end

	local function var_14_2(arg_17_0)
		arg_14_1:setShipIds(arg_17_0)
	end

	return var_14_0, var_14_1, var_14_2
end

return var_0_0
