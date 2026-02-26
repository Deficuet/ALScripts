local var_0_0 = class("IslandPostManagePage", import("...base.IslandBasePage"))

var_0_0.PAGE_PROD = "prod"
var_0_0.PAGE_REST = "rest"
var_0_0.PAGE_COLLECTION = "collection"
var_0_0.EVENT_SHOW_SP_EVENT_TIP = "IslandPostManagePage:EVENT_SHOW_SP_EVENT_TIP"

function var_0_0.getUIName(arg_1_0)
	return "IslandPostManageUI"
end

function var_0_0.OnLoaded(arg_2_0)
	setText(arg_2_0._tf:Find("top/title/Text"), i18n("island_post_manage"))

	local var_2_0 = arg_2_0._tf:Find("Adapt/pages")

	arg_2_0.pages = {}
	arg_2_0.pages[var_0_0.PAGE_PROD] = IslandPostProdPanel.New(var_2_0, arg_2_0.event, setmetatable({
		ShowMsgBox = function(arg_3_0, arg_3_1)
			arg_2_0:ShowMsgBox(arg_3_1)
		end
	}, {
		__index = arg_2_0.contextData
	}))
	arg_2_0.pages[var_0_0.PAGE_REST] = IslandPostRestPanel.New(var_2_0, arg_2_0.event)
	arg_2_0.pages[var_0_0.PAGE_COLLECTION] = IslandCollectionPanel.New(var_2_0, arg_2_0.event, setmetatable({
		ShowMsgBox = function(arg_4_0, arg_4_1)
			arg_2_0:ShowMsgBox(arg_4_1)
		end
	}, {
		__index = arg_2_0.contextData
	}))
	arg_2_0.togglesTF = arg_2_0._tf:Find("Adapt/types/content")

	setText(arg_2_0.togglesTF:Find("prod/unsel"), i18n("island_post_produce"))
	setText(arg_2_0.togglesTF:Find("prod/sel/content/Text"), i18n("island_post_produce"))
	setText(arg_2_0.togglesTF:Find("rest/unsel"), i18n("island_post_operate"))
	setText(arg_2_0.togglesTF:Find("rest/sel/content/Text"), i18n("island_post_operate"))
	setText(arg_2_0.togglesTF:Find("collection/unsel"), i18n("island_chara_gather_tip"))
	setText(arg_2_0.togglesTF:Find("collection/sel/content/Text"), i18n("island_chara_gather_tip"))

	arg_2_0.signInNoticeTF = arg_2_0._tf:Find("Adapt/signInBtn/notice")
	arg_2_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_2_0._tf, arg_2_0.event)
end

function var_0_0.OnInit(arg_5_0)
	arg_5_0:bind(var_0_0.EVENT_SHOW_SP_EVENT_TIP, function(arg_6_0, arg_6_1, arg_6_2)
		setParent(arg_5_0._tf, pg.UIMgr.GetInstance().UIMain)
		arg_5_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_ISLAND_POST_EVENT,
			rest = arg_6_1,
			isNew = arg_6_2,
			onHide = function()
				setParent(arg_5_0._tf, pg.UIMgr.GetInstance().OverlayMain)
			end,
			onYes = function()
				arg_5_0.pages[var_0_0.PAGE_REST]:TriggerEvent(arg_6_1.id)
			end
		})
	end)
	onButton(arg_5_0, arg_5_0._tf:Find("top/title/help"), function()
		arg_5_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_helpbtn_commission")
		})
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("top/back"), function()
		arg_5_0:Hide()
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("top/home"), function()
		arg_5_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_5_0, arg_5_0._tf:Find("Adapt/signInBtn"), function()
		arg_5_0:Hide()
		arg_5_0:emit(IslandBaseMediator.SWITCH_MAP, IslandConst.AGORA_MAP_ID, IslandConst.SIGNIN_SP)
	end, SFX_PANEL)
	eachChild(arg_5_0.togglesTF, function(arg_13_0)
		onToggle(arg_5_0, arg_13_0, function(arg_14_0)
			if arg_14_0 then
				arg_5_0.curPage = arg_13_0.name
				arg_5_0.contextData.curPage = arg_5_0.curPage

				arg_5_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)

	arg_5_0.buildingIds = pg.island_set.post_manage_produce.key_value_varchar
	arg_5_0.restIds = pg.island_set.post_manage_operate.key_value_varchar
end

function var_0_0.AddListeners(arg_15_0)
	arg_15_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_15_0.FlushProdPage)
	arg_15_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_15_0.OnFlushProdPageAndShipExpDone)
	arg_15_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_15_0.OnFlushProdPageAndShipExpDone)
	arg_15_0:AddListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_15_0.FlushRestPage)
	arg_15_0:AddListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_15_0.FlushRestPage)
	arg_15_0:AddListener(IslandManageAgecny.ADD_RESTAURANT, arg_15_0.FlushRestPage)
	arg_15_0:AddListener(IslandManageAgecny.ADD_ASSISTANT, arg_15_0.FlushRestPage)
	arg_15_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_15_0.FlushRestPage)
	arg_15_0:AddListener(GAME.ISLAND_GET_AUTO_COLLECTION_DATA_DONE, arg_15_0.OnGetCollctionData)
	arg_15_0:AddListener(GAME.ISLAND_TAKE_AUTO_COLLECTION_DONE, arg_15_0.OnGetCollctionDone)
end

function var_0_0.RemoveListeners(arg_16_0)
	arg_16_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_16_0.FlushProdPage)
	arg_16_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_16_0.OnFlushProdPageAndShipExpDone)
	arg_16_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_16_0.OnFlushProdPageAndShipExpDone)
	arg_16_0:RemoveListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_16_0.FlushRestPage)
	arg_16_0:RemoveListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_16_0.FlushRestPage)
	arg_16_0:RemoveListener(IslandManageAgecny.ADD_RESTAURANT, arg_16_0.FlushRestPage)
	arg_16_0:RemoveListener(IslandManageAgecny.ADD_ASSISTANT, arg_16_0.FlushRestPage)
	arg_16_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_16_0.FlushRestPage)
	arg_16_0:RemoveListener(GAME.ISLAND_GET_AUTO_COLLECTION_DATA_DONE, arg_16_0.OnGetCollctionData)
	arg_16_0:RemoveListener(GAME.ISLAND_TAKE_AUTO_COLLECTION_DONE, arg_16_0.OnGetCollctionDone)
end

function var_0_0.SwitchPage(arg_17_0)
	for iter_17_0, iter_17_1 in pairs(arg_17_0.pages) do
		if iter_17_0 == arg_17_0.curPage then
			if arg_17_0.curPage == var_0_0.PAGE_COLLECTION then
				pg.UIMgr.GetInstance():LoadingOn()
				arg_17_0:emit(IslandMediator.GET_AUTO_COLLECTION_DATA, 1)
			else
				iter_17_1:ExecuteAction("Show")
			end
		else
			iter_17_1:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnGetCollctionData(arg_18_0, arg_18_1)
	arg_18_0.pages[var_0_0.PAGE_COLLECTION]:ExecuteAction("Show", arg_18_1.data)

	local var_18_0 = pg.TimeMgr.GetInstance():GetServerTime()
	local var_18_1 = getProxy(PlayerProxy):getPlayerId()
	local var_18_2 = "IslandSignAutoCollectTime" .. tostring(var_18_1)

	PlayerPrefs.SetInt(var_18_2, var_18_0)
	arg_18_0:FlushCollectionTip()
	pg.UIMgr.GetInstance():LoadingOff()
end

function var_0_0.OnGetCollctionDone(arg_19_0, arg_19_1)
	arg_19_0.pages[var_0_0.PAGE_COLLECTION]:ExecuteAction("OnGetCollctionDone", arg_19_1)
end

function var_0_0.OnShow(arg_20_0)
	arg_20_0:BlurPanel()
	triggerToggle(arg_20_0.togglesTF:Find(arg_20_0.contextData.curPage or var_0_0.PAGE_PROD), true)
	arg_20_0:FlushTips()
	setActive(arg_20_0.signInNoticeTF, getProxy(IslandProxy):GetIsland():GetSignInAgency():CanSignIn())
end

function var_0_0.FlushTips(arg_21_0)
	arg_21_0:FlushProdTip()
	arg_21_0:FlushRestTip()
	arg_21_0:FlushCollectionTip()
end

function var_0_0.FlushProdTip(arg_22_0)
	local var_22_0 = IslandMainBtnTipHelper.IsPostProdTip()

	setActive(arg_22_0.togglesTF:Find("prod/unsel/tip"), var_22_0)
	setActive(arg_22_0.togglesTF:Find("prod/sel/tip"), var_22_0)
end

function var_0_0.FlushRestTip(arg_23_0)
	local var_23_0 = IslandMainBtnTipHelper.IsPostRestTip()

	setActive(arg_23_0.togglesTF:Find("rest/unsel/tip"), var_23_0)
	setActive(arg_23_0.togglesTF:Find("rest/sel/tip"), var_23_0)
end

function var_0_0.FlushCollectionTip(arg_24_0)
	local var_24_0 = IslandMainBtnTipHelper.IsPostCollectionTip()

	setActive(arg_24_0.togglesTF:Find("collection/unsel/tip"), var_24_0)
	setActive(arg_24_0.togglesTF:Find("collection/sel/tip"), var_24_0)
end

function var_0_0.OnFlushProdPageAndShipExpDone(arg_25_0, arg_25_1)
	if arg_25_1.addShipExpData then
		local var_25_0 = {}
		local var_25_1 = arg_25_1.addShipExpData.addShipId
		local var_25_2 = arg_25_1.addShipExpData.addExp
		local var_25_3 = IslandShip.StaticGetPrefab(var_25_1)
		local var_25_4 = "island/IslandShipIcon/" .. var_25_3

		arg_25_0.awardDisplayPanel:ExecuteAction("ShowAwards", {
			shipExp = true,
			icon = var_25_4,
			num = var_25_2
		})
	end

	arg_25_0:FlushProdPage(arg_25_1)
end

function var_0_0.FlushProdPage(arg_26_0, arg_26_1)
	arg_26_0:FlushProdTip()
	arg_26_0.pages[var_0_0.PAGE_PROD]:ExecuteAction("FlushSlot", arg_26_1.slotId)
end

function var_0_0.FlushRestPage(arg_27_0)
	arg_27_0:FlushRestTip()
	arg_27_0.pages[var_0_0.PAGE_REST]:ExecuteAction("Flush")
end

function var_0_0.OnHide(arg_28_0)
	arg_28_0:UnBlurPanel()

	if arg_28_0.awardDisplayPanel then
		arg_28_0.awardDisplayPanel:Hide()
	end
end

function var_0_0.OnDisable(arg_29_0)
	arg_29_0:OnHide()
end

function var_0_0.OnDestroy(arg_30_0)
	arg_30_0:UnBlurPanel()

	for iter_30_0, iter_30_1 in pairs(arg_30_0.pages) do
		if iter_30_1 then
			iter_30_1:Destroy()

			iter_30_1 = nil
		end
	end

	if arg_30_0.awardDisplayPanel then
		arg_30_0.awardDisplayPanel:Destroy()

		arg_30_0.awardDisplayPanel = nil
	end
end

return var_0_0
