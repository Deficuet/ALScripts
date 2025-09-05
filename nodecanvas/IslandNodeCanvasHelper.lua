function _IslandFindUnit(arg_1_0, arg_1_1)
	if not _IslandCore then
		return nil
	end

	local var_1_0 = _IslandCore:GetView():GetUnitModuleWithType(arg_1_0, arg_1_1)

	if not var_1_0 then
		return nil
	end

	return var_1_0._go
end

function _IslandDestoryUnit(arg_2_0, arg_2_1)
	if not _IslandCore then
		return nil
	end

	_IslandCore:Link(ISLAND_EVT.RMOVE_UNIT, arg_2_0, arg_2_1)
end

function _IslandMoveUnit(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	if not _IslandCore then
		return nil
	end

	_IslandCore:Link(ISLAND_EVT.MOVE_UNIT, {
		id = arg_3_1,
		type = arg_3_0,
		position = arg_3_2,
		speed = arg_3_3
	})
end

function _IslandStopMoveUnit(arg_4_0, arg_4_1)
	if not _IslandCore then
		return nil
	end

	_IslandCore:Link(ISLAND_EVT.STOP_MOVE_UNIT, {
		id = arg_4_1,
		type = arg_4_0
	})
end

function _IslandPlayBubble(arg_5_0, arg_5_1)
	if not _IslandCore then
		return nil
	end

	_IslandCore:Link(ISLAND_EVT.PLAY_BUBBLE, {
		name = arg_5_0,
		callback = arg_5_1
	})
end

function _IslandChangeDelegateSlotModel(arg_6_0, arg_6_1, arg_6_2)
	if not _IslandCore then
		return nil
	end

	getProxy(IslandProxy):GetIsland():DispatchEvent(ISLAND_EVT.CHANGE_SLOT_MODEL, {
		id = arg_6_1,
		type = arg_6_0,
		modelId = arg_6_2
	})
end

function _IslandStartDelegateSlotPerform(arg_7_0, arg_7_1)
	if not _IslandCore then
		return nil
	end

	local var_7_0 = getProxy(IslandProxy):GetIsland()

	_IslandCore:Link(ISLAND_EVT.START_DELEGATE_SLOT_PERFORM, {
		id = arg_7_1,
		type = arg_7_0
	})
end
