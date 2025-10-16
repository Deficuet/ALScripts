local var_0_0 = class("CommanderHomeBatchSelPage", import(".CommanderHomeBaseSelPage"))

function var_0_0.getUIName(arg_1_0)
	return "CatteryBatchSelPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollrect = arg_2_0._tf:Find("page/frame/scrollrect"):GetComponent("LScrollRect")
	arg_2_0.okBtn = arg_2_0._tf:Find("page/frame/ok_button")
	arg_2_0.uiList = UIItemList.New(arg_2_0._tf:Find("page/frame/list/content"), arg_2_0._tf:Find("page/frame/comanderTF"))
	arg_2_0.closeBtn = arg_2_0._tf:Find("page/close_btn")
end

function var_0_0.OnInit(arg_3_0)
	var_0_0.super.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.okBtn, function()
		arg_3_0:Filter()
	end, SFX_PANEL)
end

function var_0_0.Filter(arg_7_0)
	local var_7_0 = arg_7_0.home:GetCatteries()
	local var_7_1 = {}

	for iter_7_0, iter_7_1 in ipairs(arg_7_0.displayCatteries) do
		local var_7_2 = var_7_0[iter_7_0]
		local var_7_3 = var_7_2:ExistCommander()
		local var_7_4 = var_7_2:GetCommanderId()
		local var_7_5 = var_7_2:IsLocked()

		if not var_7_5 and var_7_3 and iter_7_1.commanderId == var_7_4 then
			-- block empty
		elseif not var_7_5 and not var_7_3 and iter_7_1.commanderId == 0 then
			-- block empty
		else
			table.insert(var_7_1, {
				pos = iter_7_0,
				id = iter_7_1.commanderId
			})
		end
	end

	local var_7_6 = {}

	for iter_7_2, iter_7_3 in ipairs(var_7_1) do
		table.insert(var_7_6, function(arg_8_0)
			arg_7_0:emit(CommanderHomeMediator.ON_SEL_COMMANDER, iter_7_3.pos, iter_7_3.id, false, arg_8_0)
		end)
	end

	seriesAsync(var_7_6)
end

function var_0_0.Update(arg_9_0, arg_9_1)
	arg_9_0:Show()

	arg_9_0.home = arg_9_1

	arg_9_0:InitList()
	var_0_0.super.Update(arg_9_0)
	arg_9_0:UpdateSelectedList()
end

function var_0_0.Show(arg_10_0)
	var_0_0.super.Show(arg_10_0)
	arg_10_0:emit(CommanderHomeLayer.DESC_PAGE_OPEN)
end

function var_0_0.InitList(arg_11_0)
	local var_11_0 = arg_11_0.home:GetCatteries()

	arg_11_0.maxCnt = 0
	arg_11_0.displayCatteries = {}

	for iter_11_0, iter_11_1 in pairs(var_11_0) do
		local var_11_1 = iter_11_1:GetState()
		local var_11_2 = iter_11_1:ExistCommander()
		local var_11_3 = var_11_1 == Cattery.STATE_LOCK

		table.insert(arg_11_0.displayCatteries, {
			isLock = var_11_3,
			commanderId = var_11_2 and iter_11_1:GetCommanderId() or 0
		})

		if not var_11_3 then
			arg_11_0.maxCnt = arg_11_0.maxCnt + 1
		end
	end

	arg_11_0.uiList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			arg_11_0:UpdateSelectedCard(arg_12_1 + 1, arg_12_2)
		end
	end)
end

function var_0_0.UpdateSelectedList(arg_13_0)
	arg_13_0.uiList:align(#arg_13_0.displayCatteries)
end

function var_0_0.UpdateSelectedCard(arg_14_0, arg_14_1, arg_14_2)
	local var_14_0 = arg_14_0.displayCatteries[arg_14_1]
	local var_14_1 = var_14_0.commanderId
	local var_14_2 = getProxy(CommanderProxy):RawGetCommanderById(var_14_1)

	if var_14_2 then
		CommanderCard.New(arg_14_2):update(var_14_2)

		local var_14_3 = arg_14_0:CheckIncludeSelf(var_14_2.id)

		setActive(arg_14_2:Find("info/home"), not var_14_3)
	end

	if not var_14_0.isLock then
		onButton(arg_14_0, arg_14_2, function()
			if var_14_2 then
				var_14_0.commanderId = 0

				arg_14_0:UpdateSelectedCard(arg_14_1, arg_14_2)
				arg_14_0:UpdateCardSelected()
			end
		end, SFX_PANEL)
	end

	setActive(arg_14_2:Find("info"), var_14_2 ~= nil)
	setActive(arg_14_2:Find("lock_b"), var_14_0.isLock)
	setActive(arg_14_2:Find("empty_b"), var_14_2 == nil)
	setActive(arg_14_2:Find("tip"), false)
	setActive(arg_14_2:Find("up"), false)
end

function var_0_0.CheckIncludeSelf(arg_16_0, arg_16_1)
	local var_16_0 = arg_16_0.home:GetCatteries()

	for iter_16_0, iter_16_1 in ipairs(var_16_0) do
		if iter_16_1:GetCommanderId() == arg_16_1 then
			return false
		end
	end

	return true
end

function var_0_0.GetSelectedCommanderList(arg_17_0)
	local var_17_0 = {}

	for iter_17_0, iter_17_1 in ipairs(arg_17_0.displayCatteries) do
		if not iter_17_1.isLock and iter_17_1.commanderId ~= 0 then
			table.insert(var_17_0, iter_17_1.commanderId)
		end
	end

	return var_17_0
end

function var_0_0.GetEmptyPosIndex(arg_18_0)
	for iter_18_0, iter_18_1 in pairs(arg_18_0.displayCatteries) do
		if not iter_18_1.isLock and iter_18_1.commanderId == 0 then
			return iter_18_0
		end
	end

	return -1
end

function var_0_0.OnUpdateItem(arg_19_0, arg_19_1, arg_19_2)
	var_0_0.super.OnUpdateItem(arg_19_0, arg_19_1, arg_19_2)

	local var_19_0 = arg_19_1 + 1
	local var_19_1 = arg_19_0.displays[var_19_0]
	local var_19_2 = arg_19_0.cards[arg_19_2]
	local var_19_3 = var_19_2.commanderVO and var_19_2.commanderVO.id or 0
	local var_19_4 = arg_19_0:GetSelectedCommanderList()

	setActive(var_19_2._tf:Find("sel_b"), table.contains(var_19_4, var_19_3))

	if var_19_3 > 0 then
		local var_19_5 = arg_19_0:CheckIncludeSelf(var_19_3)

		setActive(var_19_2._tf:Find("info/home"), not var_19_5)
	end
end

function var_0_0.OnSelected(arg_20_0, arg_20_1)
	local var_20_0 = arg_20_0:GetEmptyPosIndex()

	if var_20_0 <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("commander_selected_max", arg_20_0.maxCnt))

		return
	end

	local var_20_1 = arg_20_1.commanderVO

	if not var_20_1 then
		return
	end

	local var_20_2 = arg_20_0:GetSelectedCommanderList()

	if not table.contains(var_20_2, var_20_1.id) then
		arg_20_0.displayCatteries[var_20_0].commanderId = var_20_1.id
	else
		for iter_20_0, iter_20_1 in ipairs(arg_20_0.displayCatteries) do
			if iter_20_1.commanderId == var_20_1.id then
				arg_20_0.displayCatteries[iter_20_0].commanderId = 0

				break
			end
		end
	end

	arg_20_0:UpdateCardSelected()
	arg_20_0:UpdateSelectedList()
end

function var_0_0.UpdateCardSelected(arg_21_0)
	local var_21_0 = arg_21_0:GetSelectedCommanderList()

	for iter_21_0, iter_21_1 in pairs(arg_21_0.cards) do
		local var_21_1 = iter_21_1.commanderVO and iter_21_1.commanderVO.id or 0

		setActive(iter_21_1._tf:Find("sel_b"), table.contains(var_21_0, var_21_1))
	end
end

function var_0_0.Hide(arg_22_0)
	arg_22_0:emit(CommanderHomeLayer.DESC_PAGE_CLOSE)
	var_0_0.super.Hide(arg_22_0)
end

return var_0_0
