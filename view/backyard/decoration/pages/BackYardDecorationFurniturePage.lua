local var_0_0 = class("BackYardDecorationFurniturePage", import(".BackYardDecorationBasePage"))

var_0_0.SELECTED_FURNITRUE = "BackYardDecorationFurniturePage:SELECTED_FURNITRUE"

local function var_0_1(arg_1_0)
	if not var_0_0.PageTypeList then
		var_0_0.PageTypeList = {
			0,
			1,
			7,
			2,
			3,
			4,
			5,
			6,
			8
		}
	end

	return var_0_0.PageTypeList[arg_1_0]
end

function var_0_0.getUIName(arg_2_0)
	return "BackYardDecorationFurniturePage"
end

function var_0_0.OnFurnitureUpdated(arg_3_0, arg_3_1)
	for iter_3_0, iter_3_1 in pairs(arg_3_0.cards) do
		if iter_3_1.furniture:getConfig("id") == arg_3_1:getConfig("id") then
			local var_3_0, var_3_1 = arg_3_0:GetPutCntByConfigId(arg_3_0.dorm, arg_3_1:getConfig("id"))

			iter_3_1:Flush(arg_3_1, var_3_0, var_3_1)
		end
	end
end

function var_0_0.GetPutCntByConfigId(arg_4_0, arg_4_1, arg_4_2)
	local var_4_0 = 0
	local var_4_1 = {}

	for iter_4_0, iter_4_1 in pairs(arg_4_1:GetThemeList()) do
		local var_4_2 = iter_4_1:GetSameFurnitureCnt(arg_4_2)

		var_4_0 = var_4_0 + var_4_2

		if var_4_2 > 0 then
			table.insert(var_4_1, iter_4_0)
		end
	end

	local var_4_3 = 0

	if #var_4_1 > 1 then
		var_4_3 = getProxy(DormProxy).floor
	elseif #var_4_1 == 1 then
		var_4_3 = var_4_1[1]
	end

	return var_4_0, var_4_3
end

function var_0_0.OnDisplayList(arg_5_0)
	arg_5_0.displays = arg_5_0:GetDisplays()

	arg_5_0:SortDisplays()
end

function var_0_0.SortDisplays(arg_6_0)
	if not arg_6_0.contextData.filterPanel:GetLoaded() then
		local var_6_0 = {}

		for iter_6_0, iter_6_1 in ipairs(arg_6_0.displays) do
			local var_6_1 = arg_6_0:GetPutCntByConfigId(arg_6_0.dorm, iter_6_1.configId)
			local var_6_2 = iter_6_1:GetOwnCnt()

			var_6_0[iter_6_1.id] = var_6_2 <= var_6_1 and 0 or 1
		end

		local var_6_3 = arg_6_0.orderMode

		table.sort(arg_6_0.displays, function(arg_7_0, arg_7_1)
			local var_7_0 = var_6_0[arg_7_0.id]
			local var_7_1 = var_6_0[arg_7_1.id]

			if var_7_0 == var_7_1 then
				local var_7_2 = arg_7_0.newFlag and 1 or 0
				local var_7_3 = arg_7_1.newFlag and 1 or 0

				if var_7_2 == var_7_3 then
					if var_6_3 == BackYardDecorationFilterPanel.ORDER_MODE_ASC then
						return arg_7_0.id < arg_7_1.id
					elseif var_6_3 == BackYardDecorationFilterPanel.ORDER_MODE_DASC then
						return arg_7_0.id > arg_7_1.id
					end
				else
					return var_7_3 < var_7_2
				end
			else
				return var_7_0 < var_7_1
			end
		end)
		arg_6_0:SetTotalCount()
	else
		arg_6_0.contextData.filterPanel:setFilterData(arg_6_0:GetDisplays())
		arg_6_0.contextData.filterPanel:filter()

		local var_6_4 = arg_6_0.contextData.filterPanel:GetFilterData()

		arg_6_0:OnFilterDone(var_6_4)
	end
end

function var_0_0.OnOrderModeUpdated(arg_8_0)
	arg_8_0:SortDisplays()
end

function var_0_0.change2ScrPos(arg_9_0, arg_9_1)
	local var_9_0 = GameObject.Find("UICamera"):GetComponent("Camera")
	local var_9_1 = arg_9_0:GetComponent("RectTransform")

	return (LuaHelper.ScreenToLocal(var_9_1, arg_9_1, var_9_0))
end

function var_0_0.OnLoaded(arg_10_0)
	arg_10_0:bind(BackYardDecorationPutlistPage.SELECTED_FURNITRUE, function()
		arg_10_0:ClearMark()
	end)
	arg_10_0:bind(BackYardDecrationLayer.INNER_SELECTED_FURNITRUE, function(arg_12_0, arg_12_1)
		arg_10_0:Selected(arg_12_1)
	end)

	arg_10_0.scrollRect = arg_10_0._tf:GetComponent("LScrollRect")

	local function var_10_0()
		if arg_10_0.timer then
			arg_10_0.timer:Stop()

			arg_10_0.timer = nil
		end
	end

	local function var_10_1(arg_14_0)
		arg_10_0.timer = Timer.New(arg_14_0, 0.8, 1)

		arg_10_0.timer:Start()
	end

	local function var_10_2(arg_15_0)
		local var_15_0 = var_0_0.change2ScrPos(arg_10_0._tf:Find("content"), arg_15_0.position)
		local var_15_1

		for iter_15_0, iter_15_1 in pairs(arg_10_0.cards) do
			local var_15_2 = iter_15_1._bg
			local var_15_3 = iter_15_1._tf.localPosition.x
			local var_15_4 = iter_15_1._tf.localPosition.y
			local var_15_5 = Vector2(var_15_3 + var_15_2.rect.width / 2, var_15_4 + var_15_2.rect.height / 2)
			local var_15_6 = Vector2(var_15_3 + var_15_2.rect.width / 2, var_15_4 - var_15_2.rect.height / 2)
			local var_15_7 = Vector2(var_15_3 - var_15_2.rect.width / 2, var_15_4 - var_15_2.rect.height / 2)

			if var_15_0.x > var_15_7.x and var_15_0.x < var_15_6.x and var_15_0.y > var_15_6.y and var_15_0.y < var_15_5.y then
				var_15_1 = iter_15_1

				break
			end
		end

		return var_15_1
	end

	local var_10_3 = GetOrAddComponent(arg_10_0._tf, typeof(EventTriggerListener))

	var_10_3:AddPointDownFunc(function(arg_16_0, arg_16_1)
		arg_10_0.downPosition = arg_16_1.position

		local var_16_0 = var_10_2(arg_16_1)

		if var_16_0 then
			var_10_0()
			var_10_1(function()
				arg_10_0.lock = true

				local var_17_0 = var_16_0._tf.position

				arg_10_0.contextData.furnitureDescMsgBox:ExecuteAction("SetUp", var_16_0.furniture, var_17_0)
			end)
		end
	end)
	var_10_3:AddPointUpFunc(function(arg_18_0, arg_18_1)
		var_10_0()

		if arg_10_0.lock then
			arg_10_0.contextData.furnitureDescMsgBox:ExecuteAction("Hide")
			onNextTick(function()
				arg_10_0.lock = false
			end)
		else
			local var_18_0 = arg_18_1.position

			if Vector2.Distance(var_18_0, arg_10_0.downPosition) > 1 then
				return
			end

			local var_18_1 = var_10_2(arg_18_1)

			if var_18_1 and var_18_1:HasMask() and var_18_1.furniture:isPaper() then
				arg_10_0:emit(BackYardDecorationMediator.REMOVE_PAPER, var_18_1.furniture)
			elseif var_18_1 and not var_18_1:HasMask() then
				local var_18_2 = Clone(var_18_1.furniture)

				arg_10_0:emit(BackYardDecorationMediator.ADD_FURNITURE, var_18_2)
			elseif var_18_1 and var_18_1:HasMask() then
				arg_10_0:ClearMark()

				arg_10_0.selectedId = var_18_1.furniture.id

				var_18_1:UpdateMark(arg_10_0.selectedId)
				arg_10_0:emit(BackYardDecorationMediator.ON_SELECTED_FURNITRUE, var_18_1.furniture.id)
				arg_10_0:emit(var_0_0.SELECTED_FURNITRUE)
			end
		end
	end)
end

function var_0_0.ClearMark(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.cards) do
		iter_20_1:UpdateMark(-1)
	end

	arg_20_0.selectedId = nil
end

function var_0_0.Selected(arg_21_0, arg_21_1)
	arg_21_0:ClearMark()

	for iter_21_0, iter_21_1 in pairs(arg_21_0.cards) do
		if iter_21_1.furniture.id == arg_21_1 then
			iter_21_1:UpdateMark(arg_21_1)
		end
	end

	arg_21_0.selectedId = arg_21_1
end

function var_0_0.OnInitItem(arg_22_0, arg_22_1)
	local var_22_0 = BackYardDecorationCard.New(arg_22_1)

	arg_22_0.cards[arg_22_1] = var_22_0
end

function var_0_0.OnUpdateItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.cards[arg_23_2]

	if not var_23_0 then
		arg_23_0:OnInitItem(arg_23_2)

		var_23_0 = arg_23_0.cards[arg_23_2]
	end

	local var_23_1 = arg_23_0.lastDiaplys[arg_23_1 + 1]

	if not var_23_1 then
		return
	end

	local var_23_2, var_23_3 = arg_23_0:GetPutCntByConfigId(arg_23_0.dorm, var_23_1:getConfig("id"))

	var_23_0:Update(var_23_1, var_23_2, var_23_3, arg_23_0.selectedId or -1)
	var_23_0:PlayEnterAnimation()
end

function var_0_0.GetDisplays(arg_24_0)
	local var_24_0 = {}
	local var_24_1 = arg_24_0.dorm:GetPurchasedFurnitures()
	local var_24_2 = var_0_1(arg_24_0.pageType)
	local var_24_3 = pg.furniture_data_template.get_id_list_by_tag[var_24_2]

	for iter_24_0, iter_24_1 in ipairs(var_24_3 or {}) do
		local var_24_4 = var_24_1[iter_24_1]

		if var_24_4 then
			table.insert(var_24_0, var_24_4)
		end
	end

	return var_24_0
end

function var_0_0.OnFilterDone(arg_25_0, arg_25_1)
	arg_25_0.displays = arg_25_1

	arg_25_0:SetTotalCount()
end

function var_0_0.SetTotalCount(arg_26_0)
	if not arg_26_0.searchKey or arg_26_0.searchKey == "" then
		arg_26_0.lastDiaplys = arg_26_0.displays
	else
		arg_26_0.lastDiaplys = {}

		for iter_26_0, iter_26_1 in ipairs(arg_26_0.displays) do
			if iter_26_1:isMatchSearchKey(arg_26_0.searchKey) then
				table.insert(arg_26_0.lastDiaplys, iter_26_1)
			end
		end
	end

	arg_26_0.scrollRect.enabled = true

	arg_26_0.scrollRect:SetTotalCount(#arg_26_0.lastDiaplys)
end

function var_0_0.OnSearchKeyChanged(arg_27_0)
	arg_27_0:SetTotalCount()
end

function var_0_0.OnDestroy(arg_28_0)
	if arg_28_0.timer then
		arg_28_0.timer:Stop()

		arg_28_0.timer = nil
	end

	for iter_28_0, iter_28_1 in pairs(arg_28_0.cards or {}) do
		iter_28_1:Dispose()
	end

	arg_28_0.cards = nil
end

return var_0_0
