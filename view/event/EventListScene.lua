EventConst = require("view/event/EventConst")
EventListItem = require("view/event/EventListItem")
EventDetailPanel = require("view/event/EventDetailPanel")

local var_0_0 = class("EventListScene", import("..base.BaseUI"))
local var_0_1 = {
	{
		0,
		1,
		3,
		4,
		6
	},
	{
		2,
		5
	}
}

function var_0_0.getUIName(arg_1_0)
	return "EventUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"weaponframes",
		"shiptype",
		"ui/iconcolorful"
	}

	local function var_2_1(arg_3_0)
		if noEmptyStr(arg_3_0) and not table.contains(var_2_0, arg_3_0) then
			table.insert(var_2_0, arg_3_0)
		end
	end

	local function var_2_2(arg_4_0)
		if not arg_4_0 or not arg_4_0.type or not arg_4_0.id then
			return
		end

		local var_4_0 = Drop.Create({
			arg_4_0.type,
			arg_4_0.id,
			arg_4_0.nums or arg_4_0.count or 1
		})

		var_2_1(var_4_0:getIcon())
		var_2_1(var_4_0:getDefaultIcon())
	end

	local var_2_3 = getProxy(EventProxy):getEventList() or {}
	local var_2_4 = getProxy(BayProxy)

	for iter_2_0, iter_2_1 in ipairs(var_2_3) do
		var_2_1("eventtype/" .. iter_2_1.template.icon)

		for iter_2_2, iter_2_3 in ipairs(iter_2_1.template.drop_display or {}) do
			var_2_2(iter_2_3)
		end

		var_2_2(iter_2_1.template.special_drop)

		for iter_2_4, iter_2_5 in ipairs(iter_2_1.shipIds or {}) do
			local var_2_5 = var_2_4:RawGetShipById(iter_2_5)

			if var_2_5 then
				var_2_1("SquareIcon/" .. var_2_5:getPainting())
			end
		end
	end

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.init(arg_5_0)
	function arg_5_0.dispatch(...)
		arg_5_0:emit(...)
	end

	arg_5_0.blurPanel = arg_5_0._tf:Find("blur_panel")
	arg_5_0.lay = arg_5_0.blurPanel:Find("adapt/left_length")
	arg_5_0.topPanel = arg_5_0._tf:Find("blur_panel/adapt/top").gameObject
	arg_5_0.btnBack = arg_5_0._tf:Find("blur_panel/adapt/top/back_btn").gameObject
	arg_5_0.topLeft = arg_5_0._tf:Find("blur_panel/adapt/top/topLeftBg$")
	arg_5_0.topLeftBg = arg_5_0._tf:Find("blur_panel/adapt/top/topLeftBg$").gameObject
	arg_5_0.labelShipNums = arg_5_0._tf:Find("blur_panel/adapt/top/topLeftBg$/labelShipNums$"):GetComponent("Text")
	arg_5_0.mask = arg_5_0._tf:Find("mask$"):GetComponent("Image")
	arg_5_0.scrollItem = EventListItem.New(arg_5_0._tf:Find("blur_panel/scrollItem").gameObject, arg_5_0.dispatch)

	arg_5_0.scrollItem.go:SetActive(false)

	arg_5_0.detailPanel = EventDetailPanel.New(arg_5_0._tf:Find("detailPanel").gameObject, arg_5_0.dispatch)

	arg_5_0.detailPanel.go:SetActive(false)

	arg_5_0.scrollRectObj = arg_5_0._tf:Find("scrollRect$")
	arg_5_0.scrollRect = arg_5_0.scrollRectObj:GetComponent("LScrollRect")

	function arg_5_0.scrollRect.onInitItem(arg_7_0)
		arg_5_0:onInitItem(arg_7_0)
	end

	function arg_5_0.scrollRect.onUpdateItem(arg_8_0, arg_8_1)
		arg_5_0:onUpdateItem(arg_8_0, arg_8_1)
	end

	function arg_5_0.scrollRect.onReturnItem(arg_9_0, arg_9_1)
		arg_5_0:onReturnItem(arg_9_0, arg_9_1)
	end

	arg_5_0.scrollItems = {}
	arg_5_0.selectedItem = nil
	arg_5_0.rawLayouts = {}

	setImageAlpha(arg_5_0.mask, 0)

	arg_5_0.scrollRect.decelerationRate = 0.07
	arg_5_0.listEmptyTF = arg_5_0._tf:Find("empty")

	setActive(arg_5_0.listEmptyTF, false)

	arg_5_0.listEmptyTxt = arg_5_0.listEmptyTF:Find("Text")

	setText(arg_5_0.listEmptyTxt, i18n("list_empty_tip_eventui"))
end

local var_0_2 = {
	"daily",
	"urgency"
}

function var_0_0.didEnter(arg_10_0)
	onButton(arg_10_0, arg_10_0.btnBack, function()
		if arg_10_0.selectedItem then
			arg_10_0:easeOut(function()
				arg_10_0:emit(var_0_0.ON_BACK)
			end)
		else
			arg_10_0:emit(var_0_0.ON_BACK)
		end
	end, SFX_CANCEL)
	setActive(arg_10_0._tf:Find("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(arg_10_0._tf:Find("stamp"), false)
	end

	onButton(arg_10_0, arg_10_0._tf:Find("stamp"), function()
		getProxy(TaskProxy):dealMingshiTouchFlag(9)
	end, SFX_CONFIRM)

	arg_10_0.toggles = {}
	arg_10_0.toggleIndex = -1

	for iter_10_0, iter_10_1 in ipairs(var_0_2) do
		arg_10_0.toggles[iter_10_0] = arg_10_0.lay:Find("frame/scroll_rect/tagRoot/" .. iter_10_1 .. "_btn")

		onToggle(arg_10_0, arg_10_0.toggles[iter_10_0], function(arg_14_0)
			local var_14_0 = arg_10_0.toggleIndex == -1

			if arg_14_0 and arg_10_0.toggleIndex ~= iter_10_0 then
				arg_10_0.toggleIndex = iter_10_0

				if arg_10_0.selectedItem then
					pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0.blurPanel, arg_10_0._tf)

					local var_14_1 = arg_10_0.scrollRect.content
					local var_14_2 = var_14_1.childCount
					local var_14_3 = 1000000

					for iter_14_0 = 0, var_14_2 - 1 do
						local var_14_4 = var_14_1:GetChild(iter_14_0)

						if var_14_4 == arg_10_0.selectedItem.tr then
							var_14_3 = iter_14_0
						elseif var_14_3 < iter_14_0 then
							var_14_4:GetComponent(typeof(LayoutElement)).ignoreLayout = arg_10_0.rawLayouts[var_14_4] or false
						end
					end

					arg_10_0.rawLayouts = {}

					arg_10_0.mask.gameObject:SetActive(false)
					arg_10_0.scrollItem.go:SetActive(false)
					arg_10_0.detailPanel.go:SetActive(false)

					arg_10_0.scrollRect.enabled = true
					arg_10_0.selectedItem = nil
					arg_10_0.contextData.selectedEventId = nil
				end

				arg_10_0.contextData.index = iter_10_0

				arg_10_0:Flush(not var_14_0)
			end
		end)
	end

	local var_10_0 = arg_10_0.contextData.index or 1

	triggerToggle(arg_10_0.toggles[var_10_0], true)

	local function var_10_1()
		if arg_10_0.scrollItem.event:GetState() == EventInfo.StateFinish then
			arg_10_0.dispatch(EventConst.EVENT_FINISH, arg_10_0.scrollItem.event)
		else
			arg_10_0:easeOut()
		end
	end

	onButton(arg_10_0, arg_10_0.scrollItem.bgNormal, var_10_1, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.scrollItem.bgEmergence, var_10_1, SFX_PANEL)
	onButton(arg_10_0, arg_10_0.mask.gameObject, function()
		arg_10_0:easeOut()
	end, SFX_CANCEL)
	arg_10_0:ctimer()
	arg_10_0:updateBtnTip()
end

function var_0_0.onBackPressed(arg_17_0)
	pg.CriMgr.GetInstance():PlaySoundEffect_V3(SFX_CANCEL)
	triggerButton(arg_17_0.btnBack)
end

function var_0_0.setEventList(arg_18_0, arg_18_1)
	arg_18_0.eventList = arg_18_1
end

function var_0_0.updateAll(arg_19_0)
	if arg_19_0.selectedItem then
		local var_19_0 = underscore.detect(arg_19_0.eventList, function(arg_20_0)
			return arg_20_0.id == arg_19_0.selectedItem.event.id
		end)

		if var_19_0 then
			local var_19_1 = getProxy(EventProxy)

			arg_19_0.labelShipNums.text = var_19_1.maxFleetNums - var_19_1:countBusyFleetNums() .. "/" .. var_19_1.maxFleetNums

			arg_19_0.scrollItem:Update(arg_19_0.selectedItem.index, var_19_0)
			arg_19_0.detailPanel:Update(arg_19_0.selectedItem.index, var_19_0)
		else
			arg_19_0:easeOut()
		end

		arg_19_0.invalide = true
	else
		arg_19_0:Flush()
	end

	arg_19_0:updateBtnTip()
end

function var_0_0.Flush(arg_21_0, arg_21_1)
	arg_21_1 = false

	local var_21_0 = getProxy(EventProxy)

	if var_21_0:checkZeroHourEvent() then
		arg_21_0.dispatch(EventConst.EVENT_FLUSH_ALL)

		return
	elseif var_0_2[arg_21_0.contextData.index] == "urgency" and var_21_0:checkNightEvent() then
		arg_21_0.dispatch(EventConst.EVENT_FLUSH_ALL)

		return
	end

	if not arg_21_1 then
		arg_21_0.labelShipNums.text = var_21_0.maxFleetNums - var_21_0:countBusyFleetNums() .. "/" .. var_21_0.maxFleetNums

		if arg_21_0.contextData.selectedEventId then
			pg.UIMgr.GetInstance():LoadingOn()
			seriesAsync({
				function(arg_22_0)
					if arg_21_0.scrollRect.isStart then
						arg_22_0()
					else
						arg_21_0.scrollRect.onStart = arg_22_0
					end
				end,
				function(arg_23_0)
					local var_23_0 = arg_21_0.contextData.selectedEventId
					local var_23_1 = 1

					for iter_23_0, iter_23_1 in ipairs(arg_21_0.filterEventList) do
						if iter_23_1.id == var_23_0 then
							var_23_1 = iter_23_0

							break
						end
					end

					local var_23_2 = arg_21_0.scrollRect:HeadIndexToValue(var_23_1 - 1)

					arg_21_0.scrollRect:ScrollTo(var_23_2)

					for iter_23_2, iter_23_3 in pairs(arg_21_0.scrollItems) do
						if iter_23_3.event and iter_23_3.event.id == var_23_0 then
							arg_21_0.selectedItem = iter_23_3

							arg_21_0:showDetail()

							break
						end
					end

					arg_23_0()
				end
			}, function()
				pg.UIMgr.GetInstance():LoadingOff()
			end)
		end
	end

	arg_21_0:filter()
	arg_21_0.scrollRect:SetTotalCount(#arg_21_0.filterEventList, arg_21_1 and 0 or arg_21_0.scrollRect.value)
	setActive(arg_21_0.listEmptyTF, #arg_21_0.filterEventList <= 0)
end

function var_0_0.filter(arg_25_0)
	arg_25_0.filterEventList = {}

	local var_25_0 = var_0_1[arg_25_0.contextData.index]

	for iter_25_0, iter_25_1 in ipairs(arg_25_0.eventList) do
		for iter_25_2, iter_25_3 in ipairs(var_25_0) do
			if iter_25_1.template.type == iter_25_3 then
				table.insert(arg_25_0.filterEventList, iter_25_1)

				break
			end
		end
	end

	table.sort(arg_25_0.filterEventList, CompareFuncs({
		function(arg_26_0)
			return arg_26_0:IsActivityType() and 0 or 1
		end,
		function(arg_27_0)
			return -arg_27_0:GetState()
		end,
		function(arg_28_0)
			return arg_28_0.template.type == 3 and 0 or 1
		end,
		function(arg_29_0)
			return arg_29_0.overTime == 0 and 0 or 1
		end,
		function(arg_30_0)
			return arg_30_0.id
		end
	}))
end

function var_0_0.onInitItem(arg_31_0, arg_31_1)
	local var_31_0 = EventListItem.New(arg_31_1, arg_31_0.dispatch)

	local function var_31_1()
		if var_31_0.event:GetState() == EventInfo.StateFinish then
			arg_31_0.dispatch(EventConst.EVENT_FINISH, var_31_0.event)
		else
			arg_31_0:easeIn(var_31_0)
		end
	end

	onButton(arg_31_0, var_31_0.bgNormal, var_31_1, SFX_PANEL)
	onButton(arg_31_0, var_31_0.bgEmergence, var_31_1, SFX_PANEL)

	arg_31_0.scrollItems[arg_31_1] = var_31_0
end

function var_0_0.onUpdateItem(arg_33_0, arg_33_1, arg_33_2)
	GetComponent(tf(arg_33_2), "CanvasGroup").alpha = 1

	local var_33_0 = arg_33_0.scrollItems[arg_33_2]

	if not var_33_0 then
		arg_33_0:onInitItem(arg_33_2)

		var_33_0 = arg_33_0.scrollItems[arg_33_2]
	end

	local var_33_1 = arg_33_0.filterEventList[arg_33_1 + 1]

	if var_33_1 then
		var_33_0:Update(arg_33_1, var_33_1)
		var_33_0:UpdateTime()
	end
end

function var_0_0.onReturnItem(arg_34_0, arg_34_1, arg_34_2)
	if arg_34_0.scrollItems and arg_34_0.scrollItems[arg_34_2] then
		arg_34_0.scrollItems[arg_34_2]:Clear()
	end
end

function var_0_0.easeIn(arg_35_0, arg_35_1)
	if not arg_35_0.easing then
		arg_35_0.easing = true
		arg_35_0.selectedItem = arg_35_1

		arg_35_0:setOpEnabled(false)
		arg_35_0:easeInDetail(function()
			pg.UIMgr.GetInstance():BlurPanel(arg_35_0.blurPanel)

			arg_35_0.easing = false

			arg_35_0:setOpEnabled(true)
		end)
	end
end

function var_0_0.easeOut(arg_37_0, arg_37_1)
	if not arg_37_0.easing then
		arg_37_0.easing = true

		arg_37_0:setOpEnabled(false)
		arg_37_0:easeOutDetail(function()
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_37_0.blurPanel, arg_37_0._tf)

			arg_37_0.easing = false
			arg_37_0.selectedItem = nil
			arg_37_0.contextData.selectedEventId = nil

			arg_37_0:setOpEnabled(true)

			if arg_37_0.invalide then
				arg_37_0.invalide = false

				arg_37_0:Flush()
			end

			if arg_37_1 then
				arg_37_1()
			end
		end)
	end
end

function var_0_0.easeInDetail(arg_39_0, arg_39_1)
	local var_39_0 = 0.3
	local var_39_1 = 0.3

	arg_39_0.mask.gameObject:SetActive(true)

	arg_39_0.scrollRect.enabled = false

	local var_39_2 = arg_39_0.scrollRect.transform
	local var_39_3 = arg_39_0.scrollRect.content
	local var_39_4 = var_39_2.rect.yMax
	local var_39_5 = var_39_0 * math.abs(var_39_4 - var_39_3.localPosition.y - arg_39_0.selectedItem.tr.localPosition.y) / var_39_2.rect.height
	local var_39_6 = arg_39_0.scrollRect.value
	local var_39_7 = arg_39_0.scrollRect:HeadIndexToValue(arg_39_0.selectedItem.index)

	LeanTween.value(var_39_3.gameObject, var_39_6, var_39_7, var_39_5):setEase(LeanTweenType.easeInOutCirc):setOnUpdate(System.Action_float(function(arg_40_0)
		arg_39_0.scrollRect:SetNormalizedPosition(arg_40_0, 1)
	end)):setOnComplete(System.Action(function()
		local var_41_0 = arg_39_0.scrollItem.tr.localPosition

		var_41_0.y = var_39_4 + var_39_2.localPosition.y
		arg_39_0.scrollItem.tr.localPosition = var_41_0

		arg_39_0.scrollItem.go:SetActive(true)
		arg_39_0.scrollItem:Update(arg_39_0.selectedItem.index, arg_39_0.selectedItem.event)
		arg_39_0.scrollItem:UpdateTime()

		local var_41_1 = -347
		local var_41_2 = arg_39_0.detailPanel.tr

		var_41_2:SetParent(arg_39_0.scrollItem.tr:Find("maskDetail"), true)

		var_41_2.localPosition = Vector3.zero

		arg_39_0.detailPanel.go:SetActive(true)
		arg_39_0.detailPanel:Update(arg_39_0.selectedItem.index, arg_39_0.selectedItem.event)

		arg_39_0.contextData.selectedEventId = arg_39_0.selectedItem.event.id

		shiftPanel(arg_39_0.detailPanel.go, nil, -155, var_39_1, 0, true):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(arg_39_1))

		local var_41_3 = var_39_3.childCount
		local var_41_4 = 100000
		local var_41_5 = {}

		for iter_41_0 = 0, var_41_3 - 1 do
			local var_41_6 = var_39_3:GetChild(iter_41_0)

			if var_41_6 == arg_39_0.selectedItem.tr then
				var_41_4 = iter_41_0
			elseif var_41_4 < iter_41_0 then
				table.insert(var_41_5, var_41_6)
			end
		end

		arg_39_0.rawLayouts = {}

		for iter_41_1, iter_41_2 in ipairs(var_41_5) do
			local var_41_7 = iter_41_2:GetComponent(typeof(LayoutElement))

			arg_39_0.rawLayouts[iter_41_2] = var_41_7.ignoreLayout
			var_41_7.ignoreLayout = true

			shiftPanel(iter_41_2, nil, iter_41_2.localPosition.y + var_41_1, var_39_1, 0, true):setEase(LeanTweenType.easeInOutCirc)
		end
	end))
end

function var_0_0.easeOutDetail(arg_42_0, arg_42_1)
	local var_42_0 = 0.2
	local var_42_1 = 268
	local var_42_2 = arg_42_0.scrollRect.content
	local var_42_3 = var_42_2.childCount
	local var_42_4 = 100000
	local var_42_5 = {}

	for iter_42_0 = 0, var_42_3 - 1 do
		local var_42_6 = var_42_2:GetChild(iter_42_0)

		if var_42_6 == arg_42_0.selectedItem.tr then
			var_42_4 = iter_42_0
		elseif var_42_4 < iter_42_0 then
			table.insert(var_42_5, var_42_6)
		end
	end

	for iter_42_1, iter_42_2 in ipairs(var_42_5) do
		shiftPanel(iter_42_2, nil, iter_42_2.localPosition.y + var_42_1, var_42_0, 0, true):setEase(LeanTweenType.easeInOutCirc)
	end

	shiftPanel(arg_42_0.detailPanel.go, nil, 129, var_42_0, 0, true):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(function()
		for iter_43_0, iter_43_1 in ipairs(var_42_5) do
			iter_43_1:GetComponent(typeof(LayoutElement)).ignoreLayout = arg_42_0.rawLayouts[iter_43_1] or false
		end

		arg_42_0.rawLayouts = {}

		arg_42_0.mask.gameObject:SetActive(false)
		arg_42_0.scrollItem.go:SetActive(false)
		arg_42_0.detailPanel.go:SetActive(false)

		arg_42_0.scrollRect.enabled = true

		arg_42_1()
	end))
end

function var_0_0.showDetail(arg_44_0)
	arg_44_0.scrollRect.enabled = false

	arg_44_0.mask.gameObject:SetActive(true)

	local var_44_0 = arg_44_0.scrollRect.transform
	local var_44_1 = arg_44_0.scrollRect.content
	local var_44_2 = arg_44_0.scrollItem.tr.localPosition

	var_44_2.y = var_44_0.rect.yMax + var_44_0.localPosition.y
	arg_44_0.scrollItem.tr.localPosition = var_44_2

	arg_44_0.scrollItem.go:SetActive(true)
	arg_44_0.scrollItem:Update(arg_44_0.selectedItem.index, arg_44_0.selectedItem.event)
	arg_44_0.scrollItem:UpdateTime()

	local var_44_3 = -347
	local var_44_4 = arg_44_0.detailPanel.tr

	var_44_4:SetParent(arg_44_0.scrollItem.tr:Find("maskDetail"), true)

	var_44_4.anchoredPosition = Vector3.New(-1, -155, 0)

	arg_44_0.detailPanel.go:SetActive(true)
	arg_44_0.detailPanel:Update(arg_44_0.selectedItem.index, arg_44_0.selectedItem.event)

	arg_44_0.contextData.selectedEventId = arg_44_0.selectedItem.event.id

	local var_44_5 = var_44_1.childCount
	local var_44_6 = 100000

	arg_44_0.rawLayouts = {}

	for iter_44_0 = 0, var_44_5 - 1 do
		local var_44_7 = var_44_1:GetChild(iter_44_0)
		local var_44_8 = var_44_7:GetComponent(typeof(LayoutElement))

		if var_44_8.ignoreLayout or not var_44_7.gameObject.activeSelf then
			arg_44_0.rawLayouts[var_44_7] = var_44_8.ignoreLayout
		elseif var_44_7 == arg_44_0.selectedItem.tr then
			var_44_6 = iter_44_0
		elseif var_44_6 < iter_44_0 then
			arg_44_0.rawLayouts[var_44_7] = var_44_8.ignoreLayout
			var_44_8.ignoreLayout = true
			var_44_7.localPosition = var_44_7.localPosition + Vector3.New(-1, var_44_3, 0)
		end
	end

	pg.UIMgr.GetInstance():BlurPanel(arg_44_0.blurPanel)
end

function var_0_0.ctimer(arg_45_0)
	local var_45_0 = 1

	arg_45_0.timer = Timer.New(function()
		if arg_45_0.selectedItem then
			arg_45_0.scrollItem:UpdateTime()
		end

		local var_46_0 = pg.TimeMgr.GetInstance()
		local var_46_1 = var_46_0:GetServerTime()

		if var_46_0:STimeDescS(var_46_1, "%Y/%m/%d") ~= var_46_0:STimeDescS(var_46_1 - 1, "%Y/%m/%d") then
			arg_45_0.dispatch(EventConst.EVENT_FLUSH_ALL)

			return
		end

		local var_46_2 = false

		for iter_46_0, iter_46_1 in pairs(arg_45_0.scrollItems) do
			if iter_46_1.go.name ~= "-1" then
				iter_46_1:UpdateTime()

				local var_46_3 = iter_46_1.event:GetCountDownTime()

				if var_46_3 and var_46_3 < 0 then
					var_46_2 = true
				end
			end
		end

		if var_46_2 then
			arg_45_0.dispatch(EventConst.EVENT_LIST_UPDATE)
		end
	end, var_45_0, -1, true)

	arg_45_0.timer:Start()
end

function var_0_0.ktimer(arg_47_0)
	if arg_47_0.timer then
		arg_47_0.timer:Stop()

		arg_47_0.timer = nil
	end
end

function var_0_0.setOpEnabled(arg_48_0, arg_48_1)
	_.each(arg_48_0.toggles, function(arg_49_0)
		setToggleEnabled(arg_49_0, arg_48_1)
	end)
	setButtonEnabled(arg_48_0.btnBack, arg_48_1)
end

function var_0_0.updateBtnTip(arg_50_0)
	local var_50_0 = {
		false,
		getProxy(EventProxy):checkNightEvent()
	}

	for iter_50_0, iter_50_1 in ipairs(arg_50_0.eventList) do
		if iter_50_1:GetState() == EventInfo.StateFinish then
			var_50_0[iter_50_1.template.type] = true
		end
	end

	for iter_50_2, iter_50_3 in ipairs(arg_50_0.toggles) do
		setActive(findTF(iter_50_3, "tip"), var_50_0[iter_50_2])
	end
end

function var_0_0.willExit(arg_51_0)
	if arg_51_0.tweens then
		cancelTweens(arg_51_0.tweens)
	end

	pg.UIMgr.GetInstance():UnOverlayPanel(arg_51_0.blurPanel, arg_51_0._tf)
	arg_51_0:ktimer()

	for iter_51_0, iter_51_1 in pairs(arg_51_0.scrollItems) do
		iter_51_1:Clear()
	end

	arg_51_0.scrollItem:Clear()
	arg_51_0.detailPanel:Clear()
end

return var_0_0
