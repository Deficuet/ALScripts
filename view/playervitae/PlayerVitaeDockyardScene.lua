local var_0_0 = class("PlayerVitaeDockyardScene", import("view.ship.DockyardScene"))

function var_0_0.SortShips(arg_1_0, arg_1_1)
	local var_1_0 = getProxy(PlayerProxy):getRawData().characters
	local var_1_1 = {}
	local var_1_2 = #var_1_0 + 1

	for iter_1_0, iter_1_1 in ipairs(var_1_0) do
		var_1_1[iter_1_1] = var_1_2 - iter_1_0
	end

	table.insert(arg_1_1, function(arg_2_0)
		return -(var_1_1[arg_2_0.id] or 0)
	end)
	table.sort(arg_1_0.shipVOs, CompareFuncs(arg_1_1))
end

function var_0_0.init(arg_3_0)
	var_0_0.super.init(arg_3_0)

	arg_3_0.selectedMarks = {}

	for iter_3_0, iter_3_1 in ipairs(arg_3_0.contextData.selectedMarks or {}) do
		local var_3_0, var_3_1 = ShipPhantom.UnpackMark(iter_3_1)

		if var_3_1 == 0 then
			table.insert(arg_3_0.selectedIds, var_3_0)
		else
			table.insert(arg_3_0.selectedMarks, iter_3_1)
		end
	end

	arg_3_0.contextData.selectedMarks = nil

	setActive(arg_3_0.togglePhantom, true)
end

function var_0_0.OnClickPhantom(arg_4_0, arg_4_1)
	if arg_4_1.phantomId == 0 then
		arg_4_0:selectShip(arg_4_1)
	else
		arg_4_0:selectPhantom(arg_4_1)
	end
end

function var_0_0.selectPhantom(arg_5_0, arg_5_1)
	local var_5_0 = arg_5_1:GetShipPhantomMark()
	local var_5_1 = false
	local var_5_2

	for iter_5_0, iter_5_1 in ipairs(arg_5_0.selectedMarks) do
		if iter_5_1 == var_5_0 then
			var_5_1 = true
			var_5_2 = iter_5_0

			break
		end
	end

	if var_5_1 or arg_5_0.selectedMax == 1 and arg_5_0:GetSelectCount() > 0 then
		local var_5_3 = defaultValue(var_5_2, 1)
		local var_5_4 = getProxy(BayProxy):GetShipPhantom(arg_5_0.selectedMarks[var_5_3])
		local var_5_5, var_5_6 = arg_5_0.onCancelShip(var_5_4, function()
			if not arg_5_0.exited then
				return
			end

			arg_5_0:selectPhantom(arg_5_1)
		end, arg_5_0.selectedMarks)

		if not var_5_5 then
			if var_5_6 then
				pg.TipsMgr.GetInstance():ShowTips(var_5_6)
			end

			return
		end

		table.remove(arg_5_0.selectedMarks, var_5_3)
	end

	if not var_5_1 then
		local var_5_7, var_5_8 = arg_5_0.checkShip(arg_5_1, function()
			if arg_5_0.exited then
				return
			end

			arg_5_0:selectPhantom(arg_5_1)
		end, arg_5_0.selectedMarks)

		if not var_5_7 then
			if var_5_8 then
				pg.TipsMgr.GetInstance():ShowTips(var_5_8)
			end

			return
		end

		if arg_5_0.selectedMax == 0 or arg_5_0:GetSelectCount() < arg_5_0.selectedMax then
			table.insert(arg_5_0.selectedMarks, var_5_0)
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("ship_dockyardScene_error_choiseRoleLess", arg_5_0.selectedMax))

			return
		end
	end

	arg_5_0:updateSelected()

	if arg_5_0.contextData.mode == var_0_0.MODE_DESTROY then
		arg_5_0:updateDestroyRes()
	elseif arg_5_0.contextData.mode == var_0_0.MODE_MOD then
		arg_5_0:updateModAttr()
	end

	arg_5_0:UpdateGuildViewEquipmentsBtn()
end

function var_0_0.GetSelectCount(arg_8_0)
	return #arg_8_0.selectedIds + #arg_8_0.selectedMarks
end

function var_0_0.GetConfirmSelect(arg_9_0)
	local var_9_0 = {}

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.selectedIds) do
		table.insert(var_9_0, ShipPhantom.PackMark(iter_9_1, 0))
	end

	table.insertto(var_9_0, arg_9_0.selectedMarks)

	return var_9_0
end

return var_0_0
