local var_0_0 = class("RecordableSearchBar")

function var_0_0.CreateData(arg_1_0)
	local var_1_0 = {}

	assert(arg_1_0.key, "key is required")
	assert(arg_1_0.parent, "parent is required")

	var_1_0.uiName = arg_1_0.uiName or "RecordableSearchBarUI"
	var_1_0.synPosition = arg_1_0.synPosition
	var_1_0.position = arg_1_0.position or Vector3.zero
	var_1_0.anchoredPosition = arg_1_0.anchoredPosition or Vector3.zero
	var_1_0.holder = arg_1_0.holder or "..."
	var_1_0.onSearch = arg_1_0.onSearch
	var_1_0.onActive = arg_1_0.onActive
	var_1_0.onInputChanged = arg_1_0.onInputChanged
	var_1_0.enabledFlag = arg_1_0.enabledFlag
	var_1_0.expandParent = arg_1_0.expand_parent
	var_1_0.refreshPosWhenExpand = arg_1_0.refresh_pos_when_expand
	var_1_0.key = arg_1_0.key .. "_SearchBar_"
	var_1_0.parent = arg_1_0.parent

	return var_1_0
end

local var_0_1 = 0
local var_0_2 = 1
local var_0_3 = 2
local var_0_4 = 3

function var_0_0.Ctor(arg_2_0, arg_2_1)
	pg.DelegateInfo.New(arg_2_0)

	arg_2_0.enabledFlag = arg_2_1.enabledFlag
	arg_2_0.state = var_0_1
	arg_2_0.data = arg_2_1

	arg_2_0:Load()
end

function var_0_0.IsEmpty(arg_3_0)
	return arg_3_0.state == var_0_1 or arg_3_0.state == var_0_4
end

function var_0_0.IsLoaded(arg_4_0)
	return arg_4_0.state == var_0_3
end

function var_0_0.IsDestory(arg_5_0)
	return arg_5_0.state == var_0_4
end

function var_0_0.Load(arg_6_0)
	if not arg_6_0:IsEmpty() then
		return
	end

	arg_6_0.state = var_0_2

	local var_6_0 = arg_6_0.data

	LoadAndInstantiateAsync("ui", var_6_0.uiName, function(arg_7_0)
		if arg_6_0:IsDestory() then
			arg_6_0:Unload(arg_7_0)

			return
		end

		arg_6_0:Init(arg_7_0)
	end, true, true)
end

function var_0_0.Init(arg_8_0, arg_8_1)
	arg_8_0._go = arg_8_1

	local var_8_0 = arg_8_0.data

	arg_8_1.transform:SetParent(var_8_0.parent, false)
	arg_8_0:InitToggle()
	arg_8_0:UpdatePosition()
	arg_8_0:UpdateAnchoredPosition()

	if var_8_0.synPosition then
		arg_8_0:SyncPosition()
	end

	if arg_8_0.enabledFlag ~= nil then
		setActive(arg_8_0._go, arg_8_0.enabledFlag)

		arg_8_0.enabledFlag = nil
	end

	arg_8_0.state = var_0_3
end

function var_0_0.InitToggle(arg_9_0)
	local var_9_0 = arg_9_0.data

	arg_9_0.toggle = arg_9_0._go.transform:Find("button/Image")
	arg_9_0.onTr = arg_9_0._go.transform:Find("button/Image/on")
	arg_9_0.offTr = arg_9_0._go.transform:Find("button/Image/off")
	arg_9_0.searchTr = arg_9_0._go.transform:Find("button/search")
	arg_9_0.holder = arg_9_0._go.transform:Find("button/search/holder"):GetComponent(typeof(Text))
	arg_9_0.noDrawGraphicCom = arg_9_0._go:GetComponent("NoDrawingGraphic")
	arg_9_0.historyTr = arg_9_0._go.transform:Find("button/history")
	arg_9_0.uiHistoryList = UIItemList.New(arg_9_0.historyTr, arg_9_0.historyTr:Find("Text"))
	arg_9_0.mainBtnTr = arg_9_0._go.transform:Find("button")
	arg_9_0.isSelected = false

	onToggle(arg_9_0, arg_9_0.toggle, function(arg_10_0)
		setActive(arg_9_0.onTr, arg_10_0)
		setActive(arg_9_0.searchTr, arg_10_0)
		setActive(arg_9_0.offTr, not arg_10_0)

		if var_9_0.onActive then
			var_9_0.onActive(arg_10_0)
		end

		if not arg_10_0 then
			arg_9_0:OnUnSelectedInputField()
		end

		arg_9_0:Reparent(arg_10_0)
	end, SFX_PANEL)
	triggerToggle(arg_9_0.toggle, false)

	arg_9_0.etl = arg_9_0.searchTr:GetComponent(typeof(EventTriggerListener))

	arg_9_0.etl:AddSelectFunc(function(arg_11_0, arg_11_1)
		arg_9_0:OnSelectedInputField()
	end)
	onInputEndEdit(arg_9_0, arg_9_0.searchTr, function()
		local var_12_0 = getInputText(arg_9_0.searchTr)

		arg_9_0:RecordSearch(var_12_0)

		if var_9_0.onSearch then
			var_9_0.onSearch(var_12_0)
		end
	end)
	onInputChanged(arg_9_0, arg_9_0.searchTr, function()
		if var_9_0.onInputChanged then
			var_9_0.onInputChanged(str)
		end
	end)
	onButton(arg_9_0, arg_9_0._go, function()
		local var_14_0 = getInputText(arg_9_0.searchTr)

		arg_9_0:RecordSearch(var_14_0)
		arg_9_0:OnUnSelectedInputField()
	end, SFX_PANEL)
	arg_9_0:UpdateHolder(var_9_0.holder)
end

function var_0_0.Reparent(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_0.data

	if var_15_0.expandParent then
		local var_15_1 = arg_15_1 and var_15_0.expandParent or var_15_0.parent

		arg_15_0._go.transform:SetParent(var_15_1, false)

		if var_15_0.refreshPosWhenExpand then
			if arg_15_1 then
				arg_15_0.mainBtnTr.position = var_15_0.parent.position
			else
				arg_15_0:UpdateAnchoredPosition()
			end
		end
	end
end

function var_0_0.UpdatePosition(arg_16_0)
	local var_16_0 = arg_16_0.data

	if not var_16_0.position then
		return
	end

	local var_16_1 = arg_16_0._go.transform:InverseTransformPoint(var_16_0.position)

	arg_16_0.mainBtnTr.localPosition = Vector3(var_16_1.x, var_16_1.y, 0)
end

function var_0_0.UpdateAnchoredPosition(arg_17_0)
	local var_17_0 = arg_17_0.data

	if not var_17_0.anchoredPosition then
		return
	end

	arg_17_0.mainBtnTr.anchoredPosition = var_17_0.anchoredPosition
end

function var_0_0.SyncPosition(arg_18_0)
	arg_18_0:RemoveSyncPosition()

	arg_18_0.timer = Timer.New(function()
		arg_18_0:UpdatePosition()
	end, 0.1, -1)

	arg_18_0.timer:Start()
end

function var_0_0.RemoveSyncPosition(arg_20_0)
	if arg_20_0.timer then
		arg_20_0.timer:Stop()

		arg_20_0.timer = nil
	end
end

function var_0_0.RecordSearch(arg_21_0, arg_21_1)
	if not arg_21_1 or arg_21_1 == "" then
		return
	end

	local var_21_0 = arg_21_0.data.key
	local var_21_1 = arg_21_0:GetHistorySearch()

	if table.contains(var_21_1, arg_21_1) then
		return
	end

	table.insert(var_21_1, 1, arg_21_1)

	local var_21_2 = {}
	local var_21_3 = math.min(#var_21_1, 3)

	for iter_21_0 = 1, var_21_3 do
		table.insert(var_21_2, var_21_1[iter_21_0])
	end

	local var_21_4 = table.concat(var_21_2, "#")

	PlayerPrefs.SetString(var_21_0, var_21_4)
	PlayerPrefs.Save()
end

function var_0_0.GetHistorySearch(arg_22_0)
	local var_22_0 = arg_22_0.data.key
	local var_22_1 = PlayerPrefs.GetString(var_22_0, "")

	if not var_22_1 or var_22_1 == "" then
		return {}
	end

	local var_22_2 = {}
	local var_22_3 = string.split(var_22_1, "#")

	for iter_22_0, iter_22_1 in ipairs(var_22_3) do
		if iter_22_1 ~= "" then
			table.insert(var_22_2, iter_22_1)
		end
	end

	return var_22_2
end

function var_0_0.OnSelectedInputField(arg_23_0)
	local var_23_0 = arg_23_0:GetHistorySearch()

	if arg_23_0.isSelected or #var_23_0 <= 0 then
		return
	end

	arg_23_0.isSelected = true
	arg_23_0.noDrawGraphicCom.raycastTarget = true

	arg_23_0:InitHistorySearch(var_23_0)
end

function var_0_0.OnUnSelectedInputField(arg_24_0)
	if not arg_24_0.isSelected then
		return
	end

	arg_24_0.isSelected = false
	arg_24_0.noDrawGraphicCom.raycastTarget = false

	arg_24_0:CloseHistorySearch()
end

function var_0_0.InitHistorySearch(arg_25_0, arg_25_1)
	local var_25_0 = arg_25_0.data

	setActive(arg_25_0.historyTr, true)

	local var_25_1 = arg_25_0:GetHistorySearch()

	arg_25_0.uiHistoryList:make(function(arg_26_0, arg_26_1, arg_26_2)
		local var_26_0 = arg_26_1 + 1

		if arg_26_0 == UIItemList.EventUpdate then
			setText(arg_26_2, var_25_1[var_26_0])
			onButton(arg_25_0, arg_26_2, function()
				setInputText(arg_25_0.searchTr, var_25_1[var_26_0])

				if var_25_0.onSearch then
					var_25_0.onSearch(var_25_1[var_26_0])
				end

				arg_25_0:OnUnSelectedInputField()
			end, SFX_PANEL)
			setActive(arg_26_2:Find("Image"), var_26_0 ~= #var_25_1)
		end
	end)
	arg_25_0.uiHistoryList:align(#var_25_1)
end

function var_0_0.CloseHistorySearch(arg_28_0)
	setActive(arg_28_0.historyTr, false)
end

function var_0_0.GetInputText(arg_29_0)
	if not arg_29_0:IsLoaded() then
		return ""
	end

	return getInputText(arg_29_0.searchTr)
end

function var_0_0.UpdateHolder(arg_30_0, arg_30_1)
	if not arg_30_0:IsLoaded() then
		return
	end

	setText(arg_30_0.holder, arg_30_1)
end

function var_0_0.ClearInputText(arg_31_0)
	if not arg_31_0:IsLoaded() then
		return
	end

	setInputText(arg_31_0.searchTr, "")
end

function var_0_0.Unload(arg_32_0, arg_32_1)
	Object.Destroy(arg_32_1)
end

function var_0_0.EnableOrDisable(arg_33_0, arg_33_1)
	if arg_33_0:IsLoaded() then
		setActive(arg_33_0._go, arg_33_1)
	else
		arg_33_0.enabledFlag = arg_33_1
	end
end

function var_0_0.Dispose(arg_34_0)
	pg.DelegateInfo.Dispose(arg_34_0)

	if arg_34_0:IsLoaded() then
		arg_34_0:Unload(arg_34_0._go)
		arg_34_0:OnUnSelectedInputField()

		if arg_34_0.etl then
			ClearEventTrigger(arg_34_0.etl)
		end

		setInputText(arg_34_0.searchTr, "")
		arg_34_0:RemoveSyncPosition()
	end

	arg_34_0.state = var_0_4
	arg_34_0.data = nil
	arg_34_0.enabledFlag = nil
	arg_34_0._go = nil
end

return var_0_0
