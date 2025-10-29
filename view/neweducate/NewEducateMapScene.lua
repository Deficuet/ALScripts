local var_0_0 = class("NewEducateMapScene", import("view.newEducate.base.NewEducateBaseUI"))

var_0_0.DEFAULT_SCALE = 1
var_0_0.SCALE = 1.15
var_0_0.SPEED = 65
var_0_0.ALPHA_TIME = 0.25

function var_0_0.getUIName(arg_1_0)
	return "NewEducateMapUI"
end

function var_0_0.SetData(arg_2_0)
	arg_2_0.shopSiteId = arg_2_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.SHOP)
	arg_2_0.workSiteId = arg_2_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.WORK)
	arg_2_0.travelSiteId = arg_2_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.TRAVEL)
end

function var_0_0.init(arg_3_0)
	arg_3_0.uiTF = arg_3_0._tf:Find("ui")
	arg_3_0.mapTF = arg_3_0._tf:Find("map")

	setLocalScale(arg_3_0.mapTF, {
		x = var_0_0.DEFAULT_SCALE,
		y = var_0_0.DEFAULT_SCALE,
		z = var_0_0.DEFAULT_SCALE
	})

	arg_3_0.travelTF = arg_3_0.mapTF:Find("content/travel")
	arg_3_0.workTF = arg_3_0.mapTF:Find("content/work")
	arg_3_0.shopTF = arg_3_0.mapTF:Find("content/shop")

	local var_3_0 = arg_3_0.mapTF:Find("content/events")

	arg_3_0.eventUIList = UIItemList.New(var_3_0, var_3_0:Find("tpl"))

	local var_3_1 = arg_3_0.mapTF:Find("content/ships")

	arg_3_0.shipUIList = UIItemList.New(var_3_1, var_3_1:Find("tpl"))
	arg_3_0.personalityTipPanel = NewEducatePersonalityTipPanel.New(arg_3_0.adaptTF, arg_3_0.event, arg_3_0.contextData)

	arg_3_0.personalityTipPanel:RegisterView(arg_3_0)

	arg_3_0.topPanel = NewEducateTopPanel.New(arg_3_0.uiTF, arg_3_0.event, setmetatable({
		showBack = true
	}, {
		__index = arg_3_0.contextData
	}))

	arg_3_0.topPanel:RegisterView(arg_3_0)

	arg_3_0.infoPanel = NewEducateInfoPanel.New(arg_3_0.uiTF, arg_3_0.event, setmetatable({
		hide = true
	}, {
		__index = arg_3_0.contextData
	}))

	arg_3_0.infoPanel:RegisterView(arg_3_0)

	arg_3_0.detailPanel = NewEducateSiteDetailPanel.New(arg_3_0.uiTF, arg_3_0.event, setmetatable({
		onHide = function()
			arg_3_0:OnDetailHide()
		end
	}, {
		__index = arg_3_0.contextData
	}))

	arg_3_0.detailPanel:RegisterView(arg_3_0)

	arg_3_0.nodePanel = NewEducateNodePanel.New(arg_3_0.adaptTF, arg_3_0.event, setmetatable({
		onHide = function()
			arg_3_0:OnDetailHide()
			arg_3_0:FlushView()
		end,
		onSiteEnd = function()
			arg_3_0:ShowInfoUI(true)
		end,
		onNormal = function()
			arg_3_0.infoPanel:ExecuteAction("HidePanel", true)
			arg_3_0.topPanel:ExecuteAction("Hide")
		end
	}, {
		__index = arg_3_0.contextData
	}))

	arg_3_0.nodePanel:RegisterView(arg_3_0)

	arg_3_0.extendLimit = Vector2(arg_3_0.mapTF.rect.width - arg_3_0._tf.rect.width, arg_3_0.mapTF.rect.height - arg_3_0._tf.rect.height) / 2
	arg_3_0.duration = 0.5
	arg_3_0.curSiteId = 0
	arg_3_0.playerID = getProxy(PlayerProxy):getRawData().id
end

function var_0_0.didEnter(arg_8_0)
	arg_8_0:SetData()
	arg_8_0.topPanel:Load()
	arg_8_0.infoPanel:Load()
	onButton(arg_8_0, arg_8_0.travelTF, function()
		arg_8_0:FocusTF(arg_8_0.travelTF)

		arg_8_0.curSiteId = arg_8_0.travelSiteId

		arg_8_0.detailPanel:ExecuteAction("Show", arg_8_0.travelSiteId)
		arg_8_0:ShowInfoUI()
	end, SFX_PANEL)

	local var_8_0 = pg.child2_site_display[arg_8_0.travelSiteId].position

	setAnchoredPosition(arg_8_0.travelTF, {
		x = var_8_0[1],
		y = var_8_0[2]
	})
	onButton(arg_8_0, arg_8_0.workTF, function()
		arg_8_0:FocusTF(arg_8_0.workTF)

		arg_8_0.curSiteId = arg_8_0.workSiteId

		arg_8_0.detailPanel:ExecuteAction("Show", arg_8_0.workSiteId)
		arg_8_0:ShowInfoUI()
	end, SFX_PANEL)

	local var_8_1 = pg.child2_site_display[arg_8_0.workSiteId].position

	setAnchoredPosition(arg_8_0.workTF, {
		x = var_8_1[1],
		y = var_8_1[2]
	})
	onButton(arg_8_0, arg_8_0.shopTF, function()
		arg_8_0:FocusTF(arg_8_0.shopTF)

		arg_8_0.curSiteId = arg_8_0.shopSiteId

		arg_8_0.detailPanel:ExecuteAction("Show", arg_8_0.shopSiteId)
		arg_8_0:ShowInfoUI()
	end, SFX_PANEL)

	local var_8_2 = pg.child2_site_display[arg_8_0.shopSiteId].position

	setAnchoredPosition(arg_8_0.shopTF, {
		x = var_8_2[1],
		y = var_8_2[2]
	})
	arg_8_0.eventUIList:make(function(arg_12_0, arg_12_1, arg_12_2)
		if arg_12_0 == UIItemList.EventUpdate then
			local var_12_0 = arg_8_0.eventSiteIds[arg_12_1 + 1]

			arg_12_2.name = var_12_0

			local var_12_1 = pg.child2_site_display[var_12_0]

			LoadImageSpriteAsync("neweducateicon/" .. var_12_1.event_icon, arg_12_2, true)
			LoadImageSpriteAsync("neweducateicon/" .. var_12_1.event_title, arg_12_2:Find("name"), true)
			setAnchoredPosition(arg_12_2, {
				x = var_12_1.position[1],
				y = var_12_1.position[2]
			})
			onButton(arg_8_0, arg_12_2, function()
				arg_8_0:FocusTF(arg_12_2)

				arg_8_0.curSiteId = var_12_0

				arg_8_0.detailPanel:ExecuteAction("Show", var_12_0)
				arg_8_0:ShowInfoUI()
			end, SFX_PANEL)
		end
	end)
	arg_8_0.shipUIList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			arg_8_0:UpdateShipSite(arg_14_1, arg_14_2)
		end
	end)
	arg_8_0:FlushView()

	if arg_8_0.contextData.char:GetFSM():GetCurNode() ~= 0 then
		arg_8_0.curSiteId = arg_8_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.MAP):GetCurSiteId()

		arg_8_0:ShowInfoUI()
		arg_8_0:OnNodeStart(arg_8_0.contextData.char:GetFSM():GetCurNode())
	else
		arg_8_0:CheckEventPerformance()
	end
end

function var_0_0.CheckEventPerformance(arg_15_0)
	local var_15_0 = {}

	for iter_15_0, iter_15_1 in ipairs(arg_15_0.eventSiteIds) do
		local var_15_1 = pg.child2_site_display[iter_15_1].param
		local var_15_2 = pg.child2_site_event_group[var_15_1].performance

		if #var_15_2 > 0 and PlayerPrefs.GetInt(arg_15_0:GetEventLocalKey(var_15_1)) ~= 1 then
			table.insert(var_15_0, function(arg_16_0)
				arg_15_0.nodePanel:ExecuteAction("PlayWordIds", var_15_2, arg_16_0)
				PlayerPrefs.SetInt(arg_15_0:GetEventLocalKey(var_15_1), 1)
			end)
		end
	end

	seriesAsync(var_15_0, function()
		return
	end)
end

function var_0_0.GetEventLocalKey(arg_18_0, arg_18_1)
	return NewEducateConst.NEW_EDUCATE_EVENT_TIP .. "_" .. arg_18_0.playerID .. "_" .. arg_18_0.contextData.char.id .. "_" .. arg_18_0.contextData.char:GetGameCnt() .. "_" .. arg_18_1
end

function var_0_0.ShowInfoUI(arg_19_0, arg_19_1)
	arg_19_0.infoPanel:ExecuteAction("ShowPanel")
	arg_19_0.topPanel:ExecuteAction("ShowDetail")

	if arg_19_1 then
		return
	end

	arg_19_0.hideTFList = {}

	local var_19_0 = pg.child2_site_display[arg_19_0.curSiteId].type

	if var_19_0 ~= NewEducateConst.SITE_TYPE.WORK then
		table.insert(arg_19_0.hideTFList, arg_19_0.workTF)
	end

	if var_19_0 ~= NewEducateConst.SITE_TYPE.TRAVEL then
		table.insert(arg_19_0.hideTFList, arg_19_0.travelTF)
	end

	if var_19_0 ~= NewEducateConst.SITE_TYPE.SHOP then
		table.insert(arg_19_0.hideTFList, arg_19_0.shopTF)
	end

	eachChild(arg_19_0.eventUIList.container, function(arg_20_0)
		if arg_19_0.curSiteId ~= tonumber(arg_20_0.name) then
			table.insert(arg_19_0.hideTFList, arg_20_0)
		end
	end)
	eachChild(arg_19_0.shipUIList.container, function(arg_21_0)
		if arg_19_0.curSiteId ~= tonumber(arg_21_0.name) then
			table.insert(arg_19_0.hideTFList, arg_21_0)
		end
	end)

	for iter_19_0, iter_19_1 in ipairs(arg_19_0.hideTFList) do
		arg_19_0:managedTween(LeanTween.value, nil, go(iter_19_1), 1, 0, var_0_0.ALPHA_TIME):setOnUpdate(System.Action_float(function(arg_22_0)
			GetOrAddComponent(iter_19_1, "CanvasGroup").alpha = arg_22_0
		end))
	end
end

function var_0_0.OnDetailHide(arg_23_0)
	arg_23_0.infoPanel:ExecuteAction("HidePanel")
	arg_23_0.topPanel:ExecuteAction("ShowBack")
	arg_23_0:managedTween(LeanTween.value, nil, go(arg_23_0.mapTF), var_0_0.SCALE, var_0_0.DEFAULT_SCALE, arg_23_0.duration):setOnUpdate(System.Action_float(function(arg_24_0)
		setLocalScale(arg_23_0.mapTF, {
			x = arg_24_0,
			y = arg_24_0,
			z = arg_24_0
		})
	end))
	SetCompomentEnabled(arg_23_0.mapTF, typeof(ScrollRect), false)

	arg_23_0.twFocusId = LeanTween.move(arg_23_0.mapTF, Vector3(0, 0, 0), arg_23_0.duration):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
		setSizeDelta(arg_23_0.mapTF, Vector2(2400, 1478))
		SetCompomentEnabled(arg_23_0.mapTF, typeof(ScrollRect), true)
	end)).uniqueId

	for iter_23_0, iter_23_1 in ipairs(arg_23_0.hideTFList or {}) do
		arg_23_0:managedTween(LeanTween.value, nil, go(iter_23_1), 0, 1, var_0_0.ALPHA_TIME):setOnUpdate(System.Action_float(function(arg_26_0)
			GetOrAddComponent(iter_23_1, "CanvasGroup").alpha = arg_26_0
		end))
	end
end

function var_0_0.FlushView(arg_27_0)
	local var_27_0 = arg_27_0.contextData.char:GetFSM():GetState(NewEducateFSM.STYSTEM.MAP)

	arg_27_0.eventSiteIds = underscore.map(var_27_0:GetEvents(), function(arg_28_0)
		return arg_27_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.EVENT, arg_28_0)
	end)

	table.sort(arg_27_0.eventSiteIds, CompareFuncs({
		function(arg_29_0)
			return pg.child2_site_display[arg_29_0].position[1]
		end
	}))

	local var_27_1 = arg_27_0.contextData.char:GetShipIds()
	local var_27_2 = underscore.select(var_27_1, function(arg_30_0)
		return not arg_27_0:IsMaxShip(arg_30_0) and not var_27_0:IsSelectedShip(arg_30_0)
	end)

	arg_27_0.shipSiteIds = underscore.map(var_27_2, function(arg_31_0)
		return arg_27_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.SHIP, arg_31_0)
	end)

	arg_27_0.eventUIList:align(#arg_27_0.eventSiteIds)
	arg_27_0.shipUIList:align(#arg_27_0.shipSiteIds)
	setActive(arg_27_0.shopTF, arg_27_0.contextData.char:IsUnlock("shop"))
	arg_27_0:CheckUpgradeNormalSite()
end

function var_0_0.IsMaxShip(arg_32_0, arg_32_1)
	local var_32_0 = pg.child2_site_character[arg_32_1]
	local var_32_1 = pg.child2_site_character.get_id_list_by_group[var_32_0.group]

	return not underscore.detect(var_32_1, function(arg_33_0)
		return pg.child2_site_character[arg_33_0].level == var_32_0.level + 1
	end)
end

function var_0_0.IsMaxNormal(arg_34_0, arg_34_1)
	local var_34_0 = pg.child2_site_normal[arg_34_1]
	local var_34_1 = pg.child2_site_normal.get_id_list_by_character[arg_34_0.contextData.char.id]

	return not underscore.detect(var_34_1, function(arg_35_0)
		local var_35_0 = pg.child2_site_normal[arg_35_0]

		return var_35_0.type == var_34_0.type and var_35_0.site_lv == var_34_0.site_lv + 1
	end)
end

function var_0_0.CheckUpgradeNormalSite(arg_36_0)
	local var_36_0 = {}

	for iter_36_0, iter_36_1 in pairs(NewEducateConst.SITE_NORMAL_TYPE) do
		local var_36_1 = arg_36_0.contextData.char:GetNormalIdByType(iter_36_1)
		local var_36_2 = pg.child2_site_normal[var_36_1].special_args
		local var_36_3 = arg_36_0.contextData.char:IsMatchComplex(var_36_2)

		if not arg_36_0:IsMaxNormal(var_36_1) and var_36_3 then
			table.insert(var_36_0, var_36_1)
		end
	end

	if #var_36_0 > 0 then
		local var_36_4 = {}

		for iter_36_2, iter_36_3 in ipairs(var_36_0) do
			table.insert(var_36_4, function(arg_37_0)
				arg_36_0:emit(NewEducateMapMediator.ON_UPGRADE_NORMAL, iter_36_3, arg_37_0)
			end)
		end

		seriesAsync(var_36_4, function()
			if arg_36_0.detailPanel:isShowing() then
				arg_36_0.detailPanel:ExecuteAction("Flush")
			end
		end)
	end
end

function var_0_0.UpdateShipSite(arg_39_0, arg_39_1, arg_39_2)
	local var_39_0 = arg_39_0.shipSiteIds[arg_39_1 + 1]

	arg_39_2.name = var_39_0

	local var_39_1 = pg.child2_site_display[var_39_0]
	local var_39_2 = arg_39_2:Find("bottom/name_mask/name")

	setScrollText(var_39_2, var_39_1.name)
	setAnchoredPosition(arg_39_2, {
		x = var_39_1.position[1],
		y = var_39_1.position[2]
	})
	LoadImageSpriteAsync("squareicon/" .. var_39_1.icon, arg_39_2:Find("top/mask/icon"), true)

	local var_39_3 = pg.child2_site_character[var_39_1.param].level

	eachChild(arg_39_2:Find("top/lv"), function(arg_40_0)
		setActive(arg_40_0, tonumber(arg_40_0.name) <= var_39_3)
	end)
	setActive(arg_39_2:Find("top/red"), var_39_1.bg == "red")
	setActive(arg_39_2:Find("top/blue"), var_39_1.bg == "blue")
	setActive(arg_39_2:Find("bottom/red"), var_39_1.bg == "red")
	setActive(arg_39_2:Find("bottom/blue"), var_39_1.bg == "blue")
	setActive(arg_39_2:Find("bottom/grey"), false)
	onButton(arg_39_0, arg_39_2, function()
		arg_39_0:FocusTF(arg_39_2)

		arg_39_0.curSiteId = var_39_0

		arg_39_0.detailPanel:ExecuteAction("Show", var_39_0)
		arg_39_0:ShowInfoUI()
	end, SFX_PANEL)
end

function var_0_0.UpdateShipLv(arg_42_0)
	eachChild(arg_42_0.shipUIList.container, function(arg_43_0)
		if tonumber(arg_43_0.name) == arg_42_0.curSiteId then
			local var_43_0 = pg.child2_site_display[arg_42_0.curSiteId]
			local var_43_1 = pg.child2_site_character[var_43_0.param].level + 1

			eachChild(arg_43_0:Find("top/lv"), function(arg_44_0)
				setActive(arg_44_0, tonumber(arg_44_0.name) <= var_43_1)
			end)
		end
	end)
end

function var_0_0.OnShoppingDone(arg_45_0)
	arg_45_0.detailPanel:ExecuteAction("FlushShop")
end

function var_0_0.OnResUpdate(arg_46_0)
	arg_46_0.topPanel:ExecuteAction("FlushRes")
end

function var_0_0.OnAttrUpdate(arg_47_0)
	arg_47_0.infoPanel:ExecuteAction("FlushAttrs")
	arg_47_0.topPanel:ExecuteAction("FlushProgress")
end

function var_0_0.OnPersonalityUpdate(arg_48_0, arg_48_1, arg_48_2)
	arg_48_0.personalityTipPanel:ExecuteAction("FlushPersonality", arg_48_1, arg_48_2)
end

function var_0_0.OnTalentUpdate(arg_49_0)
	arg_49_0.infoPanel:ExecuteAction("FlushTalents")
end

function var_0_0.OnStatusUpdate(arg_50_0)
	arg_50_0.infoPanel:ExecuteAction("FlushStatus")
end

function var_0_0.OnNodeStart(arg_51_0, arg_51_1)
	arg_51_0.nodePanel:ExecuteAction("StartNode", arg_51_1)
end

function var_0_0.OnNextNode(arg_52_0, arg_52_1)
	arg_52_0.nodePanel:ExecuteAction("ProceedNode", arg_52_1.node, arg_52_1.drop, arg_52_1.noNextCb)
end

function var_0_0.FocusTF(arg_53_0, arg_53_1, arg_53_2)
	setSizeDelta(arg_53_0.mapTF, Vector2(3280, 2038))

	arg_53_0.extendLimit = Vector2(arg_53_0.mapTF.rect.width * var_0_0.SCALE - arg_53_0._tf.rect.width, arg_53_0.mapTF.rect.height * var_0_0.SCALE - arg_53_0._tf.rect.height) / 2

	local var_53_0 = arg_53_1.anchoredPosition * -1

	var_53_0.x = math.clamp(var_53_0.x, -arg_53_0.extendLimit.x, arg_53_0.extendLimit.x) * var_0_0.SCALE
	var_53_0.y = math.clamp(var_53_0.y, -arg_53_0.extendLimit.y, arg_53_0.extendLimit.y) * var_0_0.SCALE

	if arg_53_0.twFocusId then
		LeanTween.cancel(arg_53_0.twFocusId)

		arg_53_0.twFocusId = nil
	end

	local var_53_1 = {}

	table.insert(var_53_1, function(arg_54_0)
		SetCompomentEnabled(arg_53_0.mapTF, typeof(ScrollRect), false)

		local var_54_0 = (arg_53_0.mapTF.anchoredPosition - var_53_0).magnitude

		arg_53_0.duration = var_54_0 > 0 and var_54_0 / (var_0_0.SPEED * math.sqrt(var_54_0)) or 0

		arg_53_0:managedTween(LeanTween.value, nil, go(arg_53_0.mapTF), var_0_0.DEFAULT_SCALE, var_0_0.SCALE, arg_53_0.duration):setOnUpdate(System.Action_float(function(arg_55_0)
			setLocalScale(arg_53_0.mapTF, {
				x = arg_55_0,
				y = arg_55_0,
				z = arg_55_0
			})
		end))

		arg_53_0.twFocusId = LeanTween.move(arg_53_0.mapTF, Vector3(var_53_0.x, var_53_0.y, 0), arg_53_0.duration):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(arg_54_0)).uniqueId
	end)
	seriesAsync(var_53_1, function()
		SetCompomentEnabled(arg_53_0.mapTF, typeof(ScrollRect), true)

		if arg_53_2 then
			arg_53_2()
		end
	end)
end

function var_0_0.onBackPressed(arg_57_0)
	if arg_57_0.nodePanel:isShowing() then
		return
	end

	if arg_57_0.detailPanel:isShowing() then
		arg_57_0.detailPanel:Hide()
	else
		arg_57_0.super.onBackPressed(arg_57_0)
	end
end

function var_0_0.willExit(arg_58_0)
	if arg_58_0.topPanel then
		arg_58_0.topPanel:Destroy()

		arg_58_0.topPanel = nil
	end

	if arg_58_0.infoPanel then
		arg_58_0.infoPanel:Destroy()

		arg_58_0.infoPanel = nil
	end

	if arg_58_0.detailPanel then
		arg_58_0.detailPanel:Destroy()

		arg_58_0.detailPanel = nil
	end

	if arg_58_0.personalityTipPanel then
		arg_58_0.personalityTipPanel:Destroy()

		arg_58_0.personalityTipPanel = nil
	end

	if arg_58_0.nodePanel then
		arg_58_0.nodePanel:Destroy()

		arg_58_0.nodePanel = nil
	end
end

return var_0_0
