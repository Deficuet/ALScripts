local var_0_0 = class("DOAYearHotSpringMediator", import("view.base.ContextMediator"))

var_0_0.UNLOCK_SLOT = "UNLOCK_SLOT"
var_0_0.OPEN_INFO = "OPEN_INFO"
var_0_0.OPEN_CHUANWU = "DOAYearHotSpringMediator:Open chuanwu"

function var_0_0.register(arg_1_0)
	arg_1_0:bind(var_0_0.UNLOCK_SLOT, function(arg_2_0, arg_2_1)
		local var_2_0, var_2_1 = arg_1_0.activity:GetUpgradeCost()

		MsgboxMediator.ShowMsgBox({
			type = MSGBOX_TYPE_NORMAL,
			content = i18n("hotspring_expand", var_2_1),
			contextSprites = {
				{
					name = "wenquanshoupai",
					path = "props/wenquanshoupai"
				}
			},
			onYes = function()
				if arg_1_0.activity:GetCoins() < var_2_1 then
					pg.TipsMgr.GetInstance():ShowTips(i18n("hotspring_tip2"))

					return
				end

				arg_1_0:sendNotification(GAME.ACTIVITY_OPERATION, {
					activity_id = arg_2_1,
					cmd = SpringActivity.OPERATION_UNLOCK
				})
			end
		})
	end)
	arg_1_0:bind(var_0_0.OPEN_CHUANWU, function(arg_4_0, arg_4_1, arg_4_2)
		arg_1_0:OnSelShips(arg_4_1, arg_4_2)
	end)

	local var_1_0 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_HOTSPRING)

	arg_1_0.activity = var_1_0

	arg_1_0.viewComponent:SetActivity(var_1_0)
	arg_1_0:bind(var_0_0.OPEN_INFO, function()
		arg_1_0:addSubLayers(Context.New({
			mediator = DOAYearHotSpringShipSelectMediator,
			viewComponent = DOAYearHotSpringShipSelectLayer,
			data = {
				actId = var_1_0.id
			}
		}))
	end)
end

function var_0_0.GetGetSlotCount(arg_6_0)
	return arg_6_0.activity:GetSlotCount()
end

function var_0_0.OnSelShips(arg_7_0, arg_7_1, arg_7_2)
	local var_7_0 = arg_7_0:GetSelectedShipIds(arg_7_2)
	local var_7_1 = {
		callbackQuit = true,
		selectedMax = arg_7_0:GetGetSlotCount(),
		quitTeam = arg_7_2 ~= nil,
		ignoredIds = pg.ShipFlagMgr.GetInstance():FilterShips({
			isActivityNpc = true
		}),
		selectedIds = Clone(var_7_0),
		preView = arg_7_0.viewComponent.__cname,
		hideTagFlags = ShipStatus.TAG_HIDE_BACKYARD,
		blockTagFlags = ShipStatus.TAG_BLOCK_BACKYARD,
		onShip = function(arg_8_0, arg_8_1, arg_8_2)
			return arg_7_0:OnShip(arg_8_0, arg_8_1, arg_8_2)
		end,
		onSelected = function(arg_9_0, arg_9_1)
			arg_7_0:OnSelected(arg_7_1, arg_9_0, arg_9_1)
		end,
		priorEquipUpShipIDList = _.filter(arg_7_0.activity:GetShipIds(), function(arg_10_0)
			return arg_10_0 > 0
		end),
		leftTopWithFrameInfo = i18n("backyard_longpress_ship_tip")
	}

	var_7_1.isLayer = true
	var_7_1.energyDisplay = true

	arg_7_0:addSubLayers(Context.New({
		viewComponent = DockyardScene,
		mediator = DockyardMediator,
		data = var_7_1
	}))
end

function var_0_0.GetSelectedShipIds(arg_11_0, arg_11_1)
	local var_11_0 = arg_11_1 and arg_11_1.id or -1
	local var_11_1 = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.activity:GetShipIds()) do
		local var_11_2 = iter_11_1 > 0 and getProxy(BayProxy):RawGetShipById(iter_11_1)

		if var_11_2 and var_11_2.id ~= var_11_0 then
			table.insert(var_11_1, var_11_2.id)
		end
	end

	return var_11_1
end

function var_0_0.OnShip(arg_12_0, arg_12_1, arg_12_2, arg_12_3)
	local var_12_0, var_12_1 = ShipStatus.ShipStatusCheck("inBackyard", arg_12_1, function(arg_13_0)
		arg_12_2()
	end)

	return var_12_0, var_12_1
end

function var_0_0.OnSelected(arg_14_0, arg_14_1, arg_14_2, arg_14_3)
	local var_14_0 = Clone(arg_14_0.activity:GetShipIds())

	_.each(_.range(arg_14_0.activity:GetSlotCount()), function(arg_15_0)
		var_14_0[arg_15_0] = var_14_0[arg_15_0] or 0
	end)

	if arg_14_2 == nil or #arg_14_2 == 0 then
		if var_14_0[arg_14_1] > 0 then
			arg_14_0:sendNotification(GAME.ACTIVITY_OPERATION, {
				activity_id = arg_14_0.activity.id,
				cmd = SpringActivity.OPERATION_SETSHIP,
				kvargs1 = {
					{
						value = 0,
						key = arg_14_1
					}
				}
			})
		end

		existCall(arg_14_3)

		return
	end

	local var_14_1 = _.filter(arg_14_2, function(arg_16_0)
		return not table.contains(var_14_0, arg_16_0)
	end)

	table.Foreach(var_14_0, function(arg_17_0, arg_17_1)
		if arg_17_1 == 0 or table.contains(arg_14_2, arg_17_1) then
			return
		end

		var_14_0[arg_17_0] = 0
	end)

	if #var_14_1 == 1 and var_14_0[arg_14_1] == 0 then
		var_14_0[arg_14_1] = var_14_1[1]
	else
		local var_14_2 = 0

		_.each(var_14_1, function(arg_18_0)
			while var_14_2 <= #var_14_0 do
				var_14_2 = var_14_2 + 1

				if var_14_0[var_14_2] == 0 then
					break
				end
			end

			var_14_0[var_14_2] = arg_18_0
		end)
	end

	local var_14_3 = {}
	local var_14_4 = arg_14_0.activity:GetShipIds()

	table.Foreach(var_14_0, function(arg_19_0, arg_19_1)
		if (var_14_4[arg_19_0] or 0) ~= arg_19_1 then
			table.insert(var_14_3, {
				key = arg_19_0,
				value = arg_19_1
			})
		end
	end)

	if #var_14_3 > 0 then
		arg_14_0:sendNotification(GAME.ACTIVITY_OPERATION, {
			activity_id = arg_14_0.activity.id,
			cmd = SpringActivity.OPERATION_SETSHIP,
			kvargs1 = var_14_3
		})
	end

	arg_14_3()
end

function var_0_0.listNotificationInterests(arg_20_0)
	return {
		PlayerProxy.UPDATED,
		ActivityProxy.ACTIVITY_UPDATED,
		ActivityProxy.ACTIVITY_SHOW_AWARDS,
		var_0_0.OPEN_CHUANWU,
		var_0_0.UNLOCK_SLOT
	}
end

function var_0_0.handleNotification(arg_21_0, arg_21_1)
	local var_21_0 = arg_21_1:getName()
	local var_21_1 = arg_21_1:getBody()

	if var_21_0 == nil then
		-- block empty
	elseif var_21_0 == ActivityProxy.ACTIVITY_SHOW_AWARDS then
		arg_21_0.viewComponent:emit(BaseUI.ON_ACHIEVE, var_21_1.awards, var_21_1.callback)
	elseif var_21_0 == ActivityProxy.ACTIVITY_UPDATED then
		if var_21_1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HOTSPRING then
			arg_21_0.activity = var_21_1

			arg_21_0.viewComponent:SetActivity(var_21_1)
			arg_21_0.viewComponent:UpdateView()
		end
	elseif var_21_0 == var_0_0.OPEN_CHUANWU then
		arg_21_0.viewComponent:emit(var_0_0.OPEN_CHUANWU, unpack(var_21_1))
	elseif var_21_0 == var_0_0.UNLOCK_SLOT then
		arg_21_0.viewComponent:emit(var_0_0.UNLOCK_SLOT, var_21_1)
	end
end

function var_0_0.remove(arg_22_0)
	return
end

return var_0_0
