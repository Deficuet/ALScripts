local var_0_0 = class("IslandMainBtnContainer")

var_0_0.SPECIAL_BTN = {
	season = "IslandMainSeasonBtn",
	technology = "IslandMainTechnologyBtn"
}

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._tf = arg_1_1
	arg_1_0.event = arg_1_2
	arg_1_0.tpl = arg_1_0._tf:Find("tpl")

	setActive(arg_1_0.tpl, false)
	arg_1_0:InitBtns()
end

function var_0_0.InitBtns(arg_2_0)
	arg_2_0.btns = {}
	arg_2_0.unlockIds = {}

	local var_2_0 = pg.island_main_btns.get_id_list_by_main_type[1]

	table.sort(var_2_0, CompareFuncs({
		function(arg_3_0)
			return pg.island_main_btns[arg_3_0].order
		end,
		function(arg_4_0)
			return arg_4_0
		end
	}))

	for iter_2_0, iter_2_1 in ipairs(var_2_0) do
		local var_2_1 = pg.island_main_btns[iter_2_1]

		table.insert(arg_2_0.unlockIds, var_2_1.ability_id)

		local var_2_2 = var_2_1.btn_name

		if var_0_0.SPECIAL_BTN[var_2_2] then
			local var_2_3 = var_0_0.SPECIAL_BTN[var_2_2]

			arg_2_0.btns[var_2_2] = _G[var_2_3].New(arg_2_0._tf:Find(var_2_2), arg_2_0.event, iter_2_1)
		else
			arg_2_0.btns[var_2_2] = IslandMainBaseBtn.New(cloneTplTo(arg_2_0.tpl, arg_2_0._tf), arg_2_0.event, iter_2_1)
		end

		arg_2_0.btns[var_2_2]:SetAsLastSibling()
	end

	arg_2_0:Flush()
end

function var_0_0.OnUnlockSystem(arg_5_0, arg_5_1)
	if table.contains(arg_5_0.unlockIds, arg_5_1) then
		for iter_5_0, iter_5_1 in pairs(arg_5_0.btns) do
			iter_5_1:UnlockCheck()
		end
	end
end

function var_0_0.OnTrackTaskChange(arg_6_0)
	local var_6_0 = arg_6_0.btns.map

	if var_6_0 and var_6_0:IsUnlock() then
		var_6_0:TipCheck()
	end
end

function var_0_0.OnFinishDelegation(arg_7_0)
	local var_7_0 = arg_7_0.btns.technology

	if var_7_0 and var_7_0:IsUnlock() then
		var_7_0:TipCheck()
		var_7_0:StatusCheck()
	end
end

function var_0_0.OnUnlockTechnology(arg_8_0)
	local var_8_0 = arg_8_0.btns.technology

	if var_8_0 and var_8_0:IsUnlock() then
		var_8_0:StatusCheck()
	end
end

function var_0_0.Flush(arg_9_0)
	for iter_9_0, iter_9_1 in pairs(arg_9_0.btns) do
		iter_9_1:Flush()
	end
end

function var_0_0.ActiveOrDisactive(arg_10_0, arg_10_1)
	setActive(arg_10_0._tf, arg_10_1)
end

function var_0_0.Dispose(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.btns) do
		iter_11_1:Dispose()
	end

	arg_11_0.btns = nil
end

return var_0_0
