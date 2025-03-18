local var_0_0 = class("CourtYardShip", import("..map.CourtYardDepthItem"))

var_0_0.STATE_IDLE = 0
var_0_0.STATE_MOVE = 1
var_0_0.STATE_MOVING_ZERO = 2
var_0_0.STATE_MOVING_HALF = 3
var_0_0.STATE_MOVING_ONE = 4
var_0_0.STATE_DRAG = 5
var_0_0.STATE_TOUCH = 6
var_0_0.STATE_GETAWARD = 7
var_0_0.STATE_STOP = 8
var_0_0.STATE_INTERACT = 9
var_0_0.STATE_CANCEL_INTERACT = 10

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0.id = arg_1_2.id
	arg_1_0.configId = arg_1_2.configId
	arg_1_0.prefab = arg_1_2:getPrefab()
	arg_1_0.attachments = arg_1_2:getAttachmentPrefab()
	arg_1_0.inimacy = arg_1_2.state_info_3 or 0
	arg_1_0.coin = arg_1_2.state_info_4 or 0
	arg_1_0.skinId = arg_1_2.skinId
	arg_1_0.groupId = arg_1_2.groupId
	arg_1_0.config = pg.ship_data_statistics[arg_1_0.configId]
	arg_1_0.moveTime = math.floor(1 / arg_1_0.config.backyard_speed)

	var_0_0.super.Ctor(arg_1_0, arg_1_1, arg_1_0.id, 1, 1)

	arg_1_0.state = var_0_0.STATE_IDLE
	arg_1_0.moveCnt = 0
end

function var_0_0.GetLevel(arg_2_0)
	return 2
end

function var_0_0.GetSkinID(arg_3_0)
	return arg_3_0.skinId
end

function var_0_0.GetGroupID(arg_4_0)
	return arg_4_0.groupId
end

function var_0_0.GetObjType(arg_5_0)
	return CourtYardConst.OBJ_TYPE_SHIP
end

function var_0_0.SetPosition(arg_6_0, arg_6_1)
	var_0_0.super.SetPosition(arg_6_0, arg_6_1)

	if arg_6_0.state == CourtYardShip.STATE_MOVING_HALF then
		return
	end

	arg_6_0:DispatchEvent(CourtYardEvent.SHIP_POSITION_CHANGE, arg_6_1, arg_6_0:GetOffset())
end

function var_0_0.InActivityRange(arg_7_0, arg_7_1)
	local var_7_0 = arg_7_0:GetHost():GetStorey():GetRange()

	return arg_7_1.x < var_7_0.x and arg_7_1.y < var_7_0.y and arg_7_1.x >= 0 and arg_7_1.y >= 0
end

function var_0_0.GetDeathType(arg_8_0)
	return CourtYardConst.DEPTH_TYPE_SHIP
end

function var_0_0.GetShipType(arg_9_0)
	return CourtYardConst.SHIP_TYPE_SELF
end

function var_0_0._ChangeState(arg_10_0, arg_10_1, arg_10_2)
	arg_10_0.state = arg_10_1

	arg_10_0:DispatchEvent(CourtYardEvent.SHIP_STATE_CHANGE, arg_10_1, arg_10_2)
end

function var_0_0.ChangeState(arg_11_0, arg_11_1, arg_11_2)
	arg_11_0:Clear()

	if arg_11_1 == var_0_0.STATE_IDLE then
		arg_11_0:OnStateIdle()
	elseif arg_11_1 == var_0_0.STATE_MOVING_ONE then
		arg_11_0:OnStateMoveOne()
	elseif (arg_11_1 == var_0_0.STATE_STOP or arg_11_1 == var_0_0.STATE_TOUCH or arg_11_1 == var_0_0.STATE_GETAWARD) and arg_11_0.state == var_0_0.STATE_INTERACT then
		-- block empty
	elseif arg_11_1 == var_0_0.STATE_INTERACT then
		arg_11_0:OnInterAction(arg_11_2)
	else
		arg_11_0:_ChangeState(arg_11_1)
	end
end

function var_0_0.ShouldResetPosition(arg_12_0)
	return arg_12_0.state == var_0_0.STATE_STOP or arg_12_0.state == var_0_0.STATE_CANCEL_INTERACT
end

function var_0_0.WillInteraction(arg_13_0)
	arg_13_0:DispatchEvent(CourtYardEvent.SHIP_WILL_INTERACTION, slot)
end

function var_0_0.StartInteraction(arg_14_0, arg_14_1, arg_14_2)
	if arg_14_2 then
		arg_14_0.interactionSlot = arg_14_1
	else
		arg_14_0:ChangeState(CourtYardShip.STATE_INTERACT, arg_14_1)
	end
end

function var_0_0.OnPreheatActionEnd(arg_15_0)
	return
end

function var_0_0.UpdateInteraction(arg_16_0, ...)
	arg_16_0:DispatchEvent(CourtYardEvent.SHIP_UPDATE_INTERACTION, ...)
end

function var_0_0.ClearInteraction(arg_17_0, arg_17_1, arg_17_2, arg_17_3)
	arg_17_0.interactionSlot = nil

	if not arg_17_3 then
		arg_17_0:ChangeState(var_0_0.STATE_CANCEL_INTERACT)
		arg_17_0:DispatchEvent(CourtYardEvent.SHIP_STOP_INTERACTION, arg_17_1)
	end
end

function var_0_0.OnStateIdle(arg_18_0)
	arg_18_0:_ChangeState(var_0_0.STATE_IDLE)

	arg_18_0.timer = Timer.New(function()
		arg_18_0.moveCnt = math.random(1, 5)

		arg_18_0:_ChangeState(var_0_0.STATE_MOVE)
	end, math.random(10, 20), 1)

	arg_18_0.timer:Start()
end

function var_0_0.OnStateMoveOne(arg_20_0)
	arg_20_0:_ChangeState(var_0_0.STATE_MOVING_ONE)
	arg_20_0:ClearMarkPosition()

	arg_20_0.timer = Timer.New(function()
		arg_20_0.moveCnt = arg_20_0.moveCnt - 1

		if arg_20_0.moveCnt <= 0 then
			arg_20_0:ChangeState(var_0_0.STATE_IDLE)
		else
			arg_20_0:_ChangeState(var_0_0.STATE_MOVE)
		end
	end, arg_20_0.moveTime * 0.5, 1)

	arg_20_0.timer:Start()
end

function var_0_0.OnInterAction(arg_22_0, arg_22_1)
	arg_22_0.interactionSlot = arg_22_1

	arg_22_0:_ChangeState(var_0_0.STATE_INTERACT)
	arg_22_0:DispatchEvent(CourtYardEvent.SHIP_START_INTERACTION, arg_22_1)
end

function var_0_0.GetInterActionData(arg_23_0)
	return arg_23_0.interactionSlot
end

function var_0_0.Move(arg_24_0, arg_24_1)
	arg_24_0:MarkPosition(arg_24_1)
	arg_24_0:ChangeState(var_0_0.STATE_MOVING_ZERO)

	arg_24_0.timer = Timer.New(function()
		arg_24_0:ChangeState(var_0_0.STATE_MOVING_HALF)
	end, arg_24_0.moveTime * 0.5, 1)

	arg_24_0.timer:Start()
	arg_24_0:DispatchEvent(CourtYardEvent.SHIP_MOVE, arg_24_1, arg_24_0:GetOffset())
end

function var_0_0.GetState(arg_26_0)
	return arg_26_0.state
end

function var_0_0.GetPrefab(arg_27_0)
	return arg_27_0.prefab
end

function var_0_0.getPrefab(arg_28_0)
	return arg_28_0:GetPrefab()
end

function var_0_0.getAttachmentPrefab(arg_29_0)
	return arg_29_0.attachments
end

function var_0_0.GetMoveTime(arg_30_0)
	return arg_30_0.moveTime
end

function var_0_0.Clear(arg_31_0)
	if arg_31_0.timer then
		arg_31_0.timer:Stop()

		arg_31_0.timer = nil
	end
end

function var_0_0.ChangeInimacy(arg_32_0, arg_32_1)
	arg_32_0.inimacy = arg_32_1

	arg_32_0:DispatchEvent(CourtYardEvent.SHIP_INIMACY_CHANGE, arg_32_1)
end

function var_0_0.ChangeCoin(arg_33_0, arg_33_1)
	arg_33_0.coin = arg_33_1

	arg_33_0:DispatchEvent(CourtYardEvent.SHIP_COIN_CHANGE, arg_33_1)
end

function var_0_0.ClearInimacy(arg_34_0)
	local var_34_0 = arg_34_0.inimacy

	if var_34_0 <= 0 then
		return
	end

	arg_34_0:ChangeInimacy(0)
	arg_34_0:ChangeState(var_0_0.STATE_GETAWARD)
	arg_34_0:DispatchEvent(CourtYardEvent.SHIP_GET_AWARD, var_34_0, 2)
end

function var_0_0.ClearCoin(arg_35_0)
	local var_35_0 = arg_35_0.coin

	if var_35_0 <= 0 then
		return
	end

	arg_35_0:ChangeCoin(0)
	arg_35_0:ChangeState(var_0_0.STATE_GETAWARD)
	arg_35_0:DispatchEvent(CourtYardEvent.SHIP_GET_AWARD, var_35_0, 1)
end

function var_0_0.AddExp(arg_36_0, arg_36_1)
	arg_36_0:DispatchEvent(CourtYardEvent.SHIP_GET_AWARD, arg_36_1, 3)
end

function var_0_0.GetInterActionBgm(arg_37_0)
	return nil
end

function var_0_0.Dispose(arg_38_0)
	var_0_0.super.Dispose(arg_38_0)
	arg_38_0:Clear()

	local var_38_0 = arg_38_0:GetInterActionData()

	if var_38_0 then
		var_38_0:Stop()
	end
end

return var_0_0
