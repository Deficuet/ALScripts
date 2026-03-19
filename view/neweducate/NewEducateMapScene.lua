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
		end,
		onClickUpEntryGood = function(arg_5_0)
			arg_3_0:onClickUpEntryGood(arg_5_0)
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
		end,
		view = arg_3_0
	}, {
		__index = arg_3_0.contextData
	}))

	arg_3_0.nodePanel:RegisterView(arg_3_0)

	arg_3_0.extendLimit = Vector2(arg_3_0.mapTF.rect.width - arg_3_0._tf.rect.width, arg_3_0.mapTF.rect.height - arg_3_0._tf.rect.height) / 2
	arg_3_0.duration = 0.5
	arg_3_0.curSiteId = 0
	arg_3_0.playerID = getProxy(PlayerProxy):getRawData().id
end

function var_0_0.didEnter(arg_9_0)
	arg_9_0:SetData()
	arg_9_0.topPanel:Load()
	arg_9_0.infoPanel:Load()
	onButton(arg_9_0, arg_9_0.travelTF, function()
		arg_9_0:FocusTF(arg_9_0.travelTF)

		arg_9_0.curSiteId = arg_9_0.travelSiteId

		arg_9_0.detailPanel:ExecuteAction("Show", arg_9_0.travelSiteId)
		arg_9_0:ShowInfoUI()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.workTF, function()
		arg_9_0:FocusTF(arg_9_0.workTF)

		arg_9_0.curSiteId = arg_9_0.workSiteId

		arg_9_0.detailPanel:ExecuteAction("Show", arg_9_0.workSiteId)
		arg_9_0:ShowInfoUI()
	end, SFX_PANEL)
	onButton(arg_9_0, arg_9_0.shopTF, function()
		arg_9_0:FocusTF(arg_9_0.shopTF)

		arg_9_0.curSiteId = arg_9_0.shopSiteId

		arg_9_0.detailPanel:ExecuteAction("Show", arg_9_0.shopSiteId)
		arg_9_0:ShowInfoUI()
		arg_9_0.infoPanel:ExecuteAction("SetShopOpen", true)
	end, SFX_PANEL)
	arg_9_0.eventUIList:make(function(arg_13_0, arg_13_1, arg_13_2)
		if arg_13_0 == UIItemList.EventUpdate then
			local var_13_0 = arg_9_0.eventSiteIds[arg_13_1 + 1]

			arg_13_2.name = var_13_0

			local var_13_1 = pg.child2_site_display[var_13_0]

			LoadImageSpriteAsync("neweducateicon/" .. var_13_1.event_icon, arg_13_2, true)
			LoadImageSpriteAsync("neweducateicon/" .. var_13_1.event_title, arg_13_2:Find("name"), true)
			setAnchoredPosition(arg_13_2, {
				x = var_13_1.position[1],
				y = var_13_1.position[2]
			})
			onButton(arg_9_0, arg_13_2, function()
				arg_9_0:FocusTF(arg_13_2)

				arg_9_0.curSiteId = var_13_0

				arg_9_0.detailPanel:ExecuteAction("Show", var_13_0)
				arg_9_0:ShowInfoUI()
			end, SFX_PANEL)
		end
	end)
	arg_9_0.shipUIList:make(function(arg_15_0, arg_15_1, arg_15_2)
		if arg_15_0 == UIItemList.EventUpdate then
			arg_9_0:UpdateShipSite(arg_15_1, arg_15_2)
		end
	end)
	arg_9_0:FlushView()

	if arg_9_0.contextData.char:GetFSM():GetCurNode() ~= 0 then
		arg_9_0.curSiteId = arg_9_0.contextData.char:GetFSM():GetState(NewEducateFSM.SYSTEM.MAP):GetCurSiteId()

		arg_9_0:ShowInfoUI()
		arg_9_0:OnNodeStart(arg_9_0.contextData.char:GetFSM():GetCurNode())
	else
		arg_9_0:CheckEventPerformance()

		if arg_9_0.contextData.openShop then
			triggerButton(arg_9_0.shopTF)
		end
	end
end

function var_0_0.CheckEventPerformance(arg_16_0)
	local var_16_0 = {}

	for iter_16_0, iter_16_1 in ipairs(arg_16_0.eventSiteIds) do
		local var_16_1 = pg.child2_site_display[iter_16_1].param
		local var_16_2 = pg.child2_site_event_group[var_16_1].performance

		if #var_16_2 > 0 and PlayerPrefs.GetInt(arg_16_0:GetEventLocalKey(var_16_1)) ~= 1 then
			table.insert(var_16_0, function(arg_17_0)
				arg_16_0.nodePanel:ExecuteAction("PlayWordIds", var_16_2, arg_17_0)
				PlayerPrefs.SetInt(arg_16_0:GetEventLocalKey(var_16_1), 1)
			end)
		end
	end

	seriesAsync(var_16_0, function()
		return
	end)
end

function var_0_0.GetEventLocalKey(arg_19_0, arg_19_1)
	return NewEducateConst.NEW_EDUCATE_EVENT_TIP .. "_" .. arg_19_0.playerID .. "_" .. arg_19_0.contextData.char.id .. "_" .. arg_19_0.contextData.char:GetGameCnt() .. "_" .. arg_19_1
end

function var_0_0.ShowInfoUI(arg_20_0, arg_20_1)
	arg_20_0.infoPanel:ExecuteAction("ShowPanel")
	arg_20_0.topPanel:ExecuteAction("Flush")

	if arg_20_1 then
		return
	end

	arg_20_0.hideTFList = {}

	local var_20_0 = pg.child2_site_display[arg_20_0.curSiteId].type

	if var_20_0 ~= NewEducateConst.SITE_TYPE.WORK then
		table.insert(arg_20_0.hideTFList, arg_20_0.workTF)
	end

	if var_20_0 ~= NewEducateConst.SITE_TYPE.TRAVEL then
		table.insert(arg_20_0.hideTFList, arg_20_0.travelTF)
	end

	if var_20_0 ~= NewEducateConst.SITE_TYPE.SHOP then
		table.insert(arg_20_0.hideTFList, arg_20_0.shopTF)
	end

	eachChild(arg_20_0.eventUIList.container, function(arg_21_0)
		if arg_20_0.curSiteId ~= tonumber(arg_21_0.name) then
			table.insert(arg_20_0.hideTFList, arg_21_0)
		end
	end)
	eachChild(arg_20_0.shipUIList.container, function(arg_22_0)
		if arg_20_0.curSiteId ~= tonumber(arg_22_0.name) then
			table.insert(arg_20_0.hideTFList, arg_22_0)
		end
	end)

	for iter_20_0, iter_20_1 in ipairs(arg_20_0.hideTFList) do
		arg_20_0:managedTween(LeanTween.value, nil, go(iter_20_1), 1, 0, var_0_0.ALPHA_TIME):setOnUpdate(System.Action_float(function(arg_23_0)
			GetOrAddComponent(iter_20_1, "CanvasGroup").alpha = arg_23_0
		end))
	end
end

function var_0_0.OnDetailHide(arg_24_0)
	arg_24_0.infoPanel:ExecuteAction("HidePanel")
	arg_24_0.infoPanel:ExecuteAction("SetShopOpen", false)
	arg_24_0.topPanel:ExecuteAction("Flush")
	arg_24_0.topPanel:ExecuteAction("Show")
	arg_24_0:managedTween(LeanTween.value, nil, go(arg_24_0.mapTF), var_0_0.SCALE, var_0_0.DEFAULT_SCALE, arg_24_0.duration):setOnUpdate(System.Action_float(function(arg_25_0)
		setLocalScale(arg_24_0.mapTF, {
			x = arg_25_0,
			y = arg_25_0,
			z = arg_25_0
		})
	end))
	SetCompomentEnabled(arg_24_0.mapTF, typeof(ScrollRect), false)

	arg_24_0.twFocusId = LeanTween.move(arg_24_0.mapTF, Vector3(0, 0, 0), arg_24_0.duration):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
		setSizeDelta(arg_24_0.mapTF, Vector2(2400, 1478))
		SetCompomentEnabled(arg_24_0.mapTF, typeof(ScrollRect), true)
	end)).uniqueId

	for iter_24_0, iter_24_1 in ipairs(arg_24_0.hideTFList or {}) do
		arg_24_0:managedTween(LeanTween.value, nil, go(iter_24_1), 0, 1, var_0_0.ALPHA_TIME):setOnUpdate(System.Action_float(function(arg_27_0)
			GetOrAddComponent(iter_24_1, "CanvasGroup").alpha = arg_27_0
		end))
	end
end

function var_0_0.onClickUpEntryGood(arg_28_0, arg_28_1)
	arg_28_0:emit(var_0_0.GO_SUBLAYER, Context.New({
		mediator = NewEducateTarotEntryMediator,
		viewComponent = NewEducateTarotEntryLayer,
		data = {
			goodId = arg_28_1.id,
			type = NewEducateTarotEntryLayer.TYPE.SHOP,
			cost = arg_28_1:getConfig("resource_num")
		}
	}))
end

function var_0_0.FlushView(arg_29_0)
	local var_29_0 = arg_29_0.contextData.char:GetFSM():GetState(NewEducateFSM.SYSTEM.MAP)

	arg_29_0.eventSiteIds = underscore.map(var_29_0:GetEvents(), function(arg_30_0)
		return arg_29_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.EVENT, arg_30_0)
	end)

	table.sort(arg_29_0.eventSiteIds, CompareFuncs({
		function(arg_31_0)
			return pg.child2_site_display[arg_31_0].position[1]
		end
	}))

	local var_29_1 = arg_29_0.contextData.char:GetShipIds()
	local var_29_2 = underscore.select(var_29_1, function(arg_32_0)
		return not arg_29_0:IsMaxShip(arg_32_0) and not var_29_0:IsSelectedShip(arg_32_0)
	end)

	arg_29_0.shipSiteIds = underscore.map(var_29_2, function(arg_33_0)
		return arg_29_0.contextData.char:GetSiteId(NewEducateConst.SITE_TYPE.SHIP, arg_33_0)
	end)

	arg_29_0.eventUIList:align(#arg_29_0.eventSiteIds)
	arg_29_0.shipUIList:align(#arg_29_0.shipSiteIds)
	arg_29_0:InitPermanentNodes()
	setActive(arg_29_0.shopTF, arg_29_0.contextData.char:IsUnlock("shop"))
	arg_29_0:CheckUpgradeNormalSite()
end

function var_0_0.InitPermanentNodes(arg_34_0)
	if arg_34_0.travelSiteId then
		arg_34_0:InitPermanent(arg_34_0.travelSiteId, arg_34_0.travelTF)
	end

	if arg_34_0.workSiteId then
		arg_34_0:InitPermanent(arg_34_0.workSiteId, arg_34_0.workTF)
	end

	if arg_34_0.shopSiteId then
		arg_34_0:InitPermanent(arg_34_0.shopSiteId, arg_34_0.shopTF)
	end
end

function var_0_0.InitPermanent(arg_35_0, arg_35_1, arg_35_2)
	local var_35_0 = pg.child2_site_display[arg_35_1]

	LoadImageSpriteAsync("neweducateicon/" .. var_35_0.event_icon, arg_35_2, true)
	LoadImageSpriteAsync("neweducateicon/" .. var_35_0.event_title, arg_35_2:Find("name"), true)
	setAnchoredPosition(arg_35_2, {
		x = var_35_0.position[1],
		y = var_35_0.position[2]
	})
end

function var_0_0.IsMaxShip(arg_36_0, arg_36_1)
	local var_36_0 = pg.child2_site_character[arg_36_1]
	local var_36_1 = pg.child2_site_character.get_id_list_by_group[var_36_0.group]

	return not underscore.detect(var_36_1, function(arg_37_0)
		return pg.child2_site_character[arg_37_0].level == var_36_0.level + 1
	end)
end

function var_0_0.IsMaxNormal(arg_38_0, arg_38_1)
	local var_38_0 = pg.child2_site_normal[arg_38_1]
	local var_38_1 = pg.child2_site_normal.get_id_list_by_character[arg_38_0.contextData.char.id]

	return not underscore.detect(var_38_1, function(arg_39_0)
		local var_39_0 = pg.child2_site_normal[arg_39_0]

		return var_39_0.type == var_38_0.type and var_39_0.site_lv == var_38_0.site_lv + 1
	end)
end

function var_0_0.CheckUpgradeNormalSite(arg_40_0)
	local var_40_0 = {}

	for iter_40_0, iter_40_1 in pairs(NewEducateConst.SITE_NORMAL_TYPE) do
		local var_40_1 = arg_40_0.contextData.char:GetNormalIdByType(iter_40_1)
		local var_40_2 = pg.child2_site_normal[var_40_1].special_args
		local var_40_3 = arg_40_0.contextData.char:IsMatchComplex(var_40_2)

		if not arg_40_0:IsMaxNormal(var_40_1) and var_40_3 then
			table.insert(var_40_0, var_40_1)
		end
	end

	if #var_40_0 > 0 then
		local var_40_4 = {}

		for iter_40_2, iter_40_3 in ipairs(var_40_0) do
			table.insert(var_40_4, function(arg_41_0)
				arg_40_0:emit(NewEducateMapMediator.ON_UPGRADE_NORMAL, iter_40_3, arg_41_0)
			end)
		end

		seriesAsync(var_40_4, function()
			if arg_40_0.detailPanel:isShowing() then
				arg_40_0.detailPanel:ExecuteAction("Flush")
			end
		end)
	end
end

function var_0_0.UpdateShipSite(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0 = arg_43_0.shipSiteIds[arg_43_1 + 1]

	arg_43_2.name = var_43_0

	local var_43_1 = pg.child2_site_display[var_43_0]
	local var_43_2 = arg_43_2:Find("bottom/name_mask/name")

	setScrollText(var_43_2, var_43_1.name)
	setAnchoredPosition(arg_43_2, {
		x = var_43_1.position[1],
		y = var_43_1.position[2]
	})
	LoadImageSpriteAsync("squareicon/" .. var_43_1.icon, arg_43_2:Find("top/mask/icon"), true)

	local var_43_3 = pg.child2_site_character[var_43_1.param].level

	eachChild(arg_43_2:Find("top/lv"), function(arg_44_0)
		setActive(arg_44_0, tonumber(arg_44_0.name) <= var_43_3)
	end)
	setActive(arg_43_2:Find("top/red"), var_43_1.bg == "red")
	setActive(arg_43_2:Find("top/blue"), var_43_1.bg == "blue")
	setActive(arg_43_2:Find("bottom/red"), var_43_1.bg == "red")
	setActive(arg_43_2:Find("bottom/blue"), var_43_1.bg == "blue")
	setActive(arg_43_2:Find("bottom/grey"), false)
	onButton(arg_43_0, arg_43_2, function()
		if arg_43_0.contextData.char:GetFSM():CheckPriorityStystem() then
			pg.TipsMgr.GetInstance():ShowTips(i18n("child2_priority_tip"))

			return
		end

		arg_43_0:FocusTF(arg_43_2)

		arg_43_0.curSiteId = var_43_0

		arg_43_0.detailPanel:ExecuteAction("Show", var_43_0)
		arg_43_0:ShowInfoUI()
	end, SFX_PANEL)
end

function var_0_0.UpdateShipLv(arg_46_0)
	eachChild(arg_46_0.shipUIList.container, function(arg_47_0)
		if tonumber(arg_47_0.name) == arg_46_0.curSiteId then
			local var_47_0 = pg.child2_site_display[arg_46_0.curSiteId]
			local var_47_1 = pg.child2_site_character[var_47_0.param].level + 1

			eachChild(arg_47_0:Find("top/lv"), function(arg_48_0)
				setActive(arg_48_0, tonumber(arg_48_0.name) <= var_47_1)
			end)
		end
	end)
end

function var_0_0.OnShoppingDone(arg_49_0)
	arg_49_0.detailPanel:ExecuteAction("FlushShop")
	arg_49_0:emit(var_0_0.ON_PRIORITY_STATE)
end

function var_0_0.OnRefreshShopDone(arg_50_0)
	arg_50_0.detailPanel:ExecuteAction("FlushShop")
end

function var_0_0.OnResUpdate(arg_51_0)
	arg_51_0.topPanel:ExecuteAction("FlushRes")
end

function var_0_0.OnAttrUpdate(arg_52_0)
	arg_52_0.infoPanel:ExecuteAction("FlushAttrs")
	arg_52_0.topPanel:ExecuteAction("FlushProgress")
end

function var_0_0.OnPersonalityUpdate(arg_53_0, arg_53_1, arg_53_2)
	arg_53_0.personalityTipPanel:ExecuteAction("FlushPersonality", arg_53_1, arg_53_2)
end

function var_0_0.OnTalentUpdate(arg_54_0)
	arg_54_0.infoPanel:ExecuteAction("FlushTalents")
end

function var_0_0.OnStatusUpdate(arg_55_0)
	arg_55_0.infoPanel:ExecuteAction("FlushStatus")
end

function var_0_0.OnTarotUpdate(arg_56_0)
	arg_56_0.infoPanel:ExecuteAction("FlushTarot")
end

function var_0_0.OnNodeStart(arg_57_0, arg_57_1)
	arg_57_0.nodePanel:ExecuteAction("StartNode", arg_57_1)
end

function var_0_0.OnNextNode(arg_58_0, arg_58_1)
	arg_58_0.nodePanel:ExecuteAction("ProceedNode", arg_58_1.node, arg_58_1.drop, arg_58_1.noNextCb)
end

function var_0_0.FocusTF(arg_59_0, arg_59_1, arg_59_2)
	setSizeDelta(arg_59_0.mapTF, Vector2(3280, 2038))

	arg_59_0.extendLimit = Vector2(arg_59_0.mapTF.rect.width * var_0_0.SCALE - arg_59_0._tf.rect.width, arg_59_0.mapTF.rect.height * var_0_0.SCALE - arg_59_0._tf.rect.height) / 2

	local var_59_0 = arg_59_1.anchoredPosition * -1

	var_59_0.x = math.clamp(var_59_0.x, -arg_59_0.extendLimit.x, arg_59_0.extendLimit.x) * var_0_0.SCALE
	var_59_0.y = math.clamp(var_59_0.y, -arg_59_0.extendLimit.y, arg_59_0.extendLimit.y) * var_0_0.SCALE

	if arg_59_0.twFocusId then
		LeanTween.cancel(arg_59_0.twFocusId)

		arg_59_0.twFocusId = nil
	end

	local var_59_1 = {}

	table.insert(var_59_1, function(arg_60_0)
		SetCompomentEnabled(arg_59_0.mapTF, typeof(ScrollRect), false)

		local var_60_0 = (arg_59_0.mapTF.anchoredPosition - var_59_0).magnitude

		arg_59_0.duration = var_60_0 > 0 and var_60_0 / (var_0_0.SPEED * math.sqrt(var_60_0)) or 0

		arg_59_0:managedTween(LeanTween.value, nil, go(arg_59_0.mapTF), var_0_0.DEFAULT_SCALE, var_0_0.SCALE, arg_59_0.duration):setOnUpdate(System.Action_float(function(arg_61_0)
			setLocalScale(arg_59_0.mapTF, {
				x = arg_61_0,
				y = arg_61_0,
				z = arg_61_0
			})
		end))

		arg_59_0.twFocusId = LeanTween.move(arg_59_0.mapTF, Vector3(var_59_0.x, var_59_0.y, 0), arg_59_0.duration):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(arg_60_0)).uniqueId
	end)
	seriesAsync(var_59_1, function()
		SetCompomentEnabled(arg_59_0.mapTF, typeof(ScrollRect), true)

		if arg_59_2 then
			arg_59_2()
		end
	end)
end

function var_0_0.onBackPressed(arg_63_0)
	if arg_63_0.nodePanel:isShowing() then
		return
	end

	if arg_63_0.detailPanel:isShowing() then
		arg_63_0.detailPanel:Hide()
	else
		arg_63_0.super.onBackPressed(arg_63_0)
	end
end

function var_0_0.willExit(arg_64_0)
	if arg_64_0.topPanel then
		arg_64_0.topPanel:Destroy()

		arg_64_0.topPanel = nil
	end

	if arg_64_0.infoPanel then
		arg_64_0.infoPanel:Destroy()

		arg_64_0.infoPanel = nil
	end

	if arg_64_0.detailPanel then
		arg_64_0.detailPanel:Destroy()

		arg_64_0.detailPanel = nil
	end

	if arg_64_0.personalityTipPanel then
		arg_64_0.personalityTipPanel:Destroy()

		arg_64_0.personalityTipPanel = nil
	end

	if arg_64_0.nodePanel then
		arg_64_0.nodePanel:Destroy()

		arg_64_0.nodePanel = nil
	end
end

return var_0_0
