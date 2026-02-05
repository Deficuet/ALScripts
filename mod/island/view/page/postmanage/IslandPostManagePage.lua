local var_0_0 = class("IslandPostManagePage", import("...base.IslandBasePage"))

var_0_0.PAGE_PROD = "prod"
var_0_0.PAGE_REST = "rest"
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
	arg_2_0.togglesTF = arg_2_0._tf:Find("Adapt/types/content")

	setText(arg_2_0.togglesTF:Find("prod/unsel"), i18n("island_post_produce"))
	setText(arg_2_0.togglesTF:Find("prod/sel/content/Text"), i18n("island_post_produce"))
	setText(arg_2_0.togglesTF:Find("rest/unsel"), i18n("island_post_operate"))
	setText(arg_2_0.togglesTF:Find("rest/sel/content/Text"), i18n("island_post_operate"))

	arg_2_0.signInNoticeTF = arg_2_0._tf:Find("Adapt/signInBtn/notice")
	arg_2_0.awardDisplayPanel = IslandAwardDisplayInMainPanel.New(arg_2_0._tf, arg_2_0.event)
end

function var_0_0.OnInit(arg_4_0)
	arg_4_0:bind(var_0_0.EVENT_SHOW_SP_EVENT_TIP, function(arg_5_0, arg_5_1, arg_5_2)
		setParent(arg_4_0._tf, pg.UIMgr.GetInstance().UIMain)
		arg_4_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_ISLAND_POST_EVENT,
			rest = arg_5_1,
			isNew = arg_5_2,
			onHide = function()
				setParent(arg_4_0._tf, pg.UIMgr.GetInstance().OverlayMain)
			end,
			onYes = function()
				arg_4_0.pages[var_0_0.PAGE_REST]:TriggerEvent(arg_5_1.id)
			end
		})
	end)
	onButton(arg_4_0, arg_4_0._tf:Find("top/title/help"), function()
		arg_4_0:ShowMsgBox({
			type = IslandMsgBox.TYPE_WHITOUT_BTN,
			content = i18n("island_helpbtn_commission")
		})
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("top/back"), function()
		arg_4_0:Hide()
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("top/home"), function()
		arg_4_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_4_0, arg_4_0._tf:Find("Adapt/signInBtn"), function()
		arg_4_0:Hide()
		arg_4_0:emit(IslandBaseMediator.SWITCH_MAP, IslandConst.AGORA_MAP_ID, IslandConst.SIGNIN_SP)
	end, SFX_PANEL)
	eachChild(arg_4_0.togglesTF, function(arg_12_0)
		onToggle(arg_4_0, arg_12_0, function(arg_13_0)
			if arg_13_0 then
				arg_4_0.curPage = arg_12_0.name
				arg_4_0.contextData.curPage = arg_4_0.curPage

				arg_4_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)

	arg_4_0.buildingIds = pg.island_set.post_manage_produce.key_value_varchar
	arg_4_0.restIds = pg.island_set.post_manage_operate.key_value_varchar
end

function var_0_0.AddListeners(arg_14_0)
	arg_14_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_14_0.FlushProdPage)
	arg_14_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_14_0.OnFlushProdPageAndShipExpDone)
	arg_14_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_14_0.OnFlushProdPageAndShipExpDone)
	arg_14_0:AddListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_14_0.FlushRestPage)
	arg_14_0:AddListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_14_0.FlushRestPage)
	arg_14_0:AddListener(IslandManageAgecny.ADD_RESTAURANT, arg_14_0.FlushRestPage)
	arg_14_0:AddListener(IslandManageAgecny.ADD_ASSISTANT, arg_14_0.FlushRestPage)
	arg_14_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_14_0.FlushRestPage)
end

function var_0_0.RemoveListeners(arg_15_0)
	arg_15_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_15_0.FlushProdPage)
	arg_15_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_15_0.OnFlushProdPageAndShipExpDone)
	arg_15_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_15_0.OnFlushProdPageAndShipExpDone)
	arg_15_0:RemoveListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_15_0.FlushRestPage)
	arg_15_0:RemoveListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_15_0.FlushRestPage)
	arg_15_0:RemoveListener(IslandManageAgecny.ADD_RESTAURANT, arg_15_0.FlushRestPage)
	arg_15_0:RemoveListener(IslandManageAgecny.ADD_ASSISTANT, arg_15_0.FlushRestPage)
	arg_15_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_15_0.FlushRestPage)
end

function var_0_0.SwitchPage(arg_16_0)
	for iter_16_0, iter_16_1 in pairs(arg_16_0.pages) do
		if iter_16_0 == arg_16_0.curPage then
			iter_16_1:ExecuteAction("Show")
		else
			iter_16_1:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnShow(arg_17_0)
	arg_17_0:BlurPanel()
	triggerToggle(arg_17_0.togglesTF:Find(arg_17_0.contextData.curPage or var_0_0.PAGE_PROD), true)
	arg_17_0:FlushTips()
	setActive(arg_17_0.signInNoticeTF, getProxy(IslandProxy):GetIsland():GetSignInAgency():CanSignIn())
end

function var_0_0.FlushTips(arg_18_0)
	arg_18_0:FlushProdTip()
	arg_18_0:FlushRestTip()
end

function var_0_0.FlushProdTip(arg_19_0)
	local var_19_0 = IslandMainBtnTipHelper.IsPostProdTip()

	setActive(arg_19_0.togglesTF:Find("prod/unsel/tip"), var_19_0)
	setActive(arg_19_0.togglesTF:Find("prod/sel/tip"), var_19_0)
end

function var_0_0.FlushRestTip(arg_20_0)
	local var_20_0 = IslandMainBtnTipHelper.IsPostRestTip()

	setActive(arg_20_0.togglesTF:Find("rest/unsel/tip"), var_20_0)
	setActive(arg_20_0.togglesTF:Find("rest/sel/tip"), var_20_0)
end

function var_0_0.OnFlushProdPageAndShipExpDone(arg_21_0, arg_21_1)
	if arg_21_1.addShipExpData then
		local var_21_0 = {}
		local var_21_1 = arg_21_1.addShipExpData.addShipId
		local var_21_2 = arg_21_1.addShipExpData.addExp
		local var_21_3 = IslandShip.StaticGetPrefab(var_21_1)
		local var_21_4 = "island/IslandShipIcon/" .. var_21_3

		arg_21_0.awardDisplayPanel:ExecuteAction("ShowAwards", {
			shipExp = true,
			icon = var_21_4,
			num = var_21_2
		})
	end

	arg_21_0:FlushProdPage(arg_21_1)
end

function var_0_0.FlushProdPage(arg_22_0, arg_22_1)
	arg_22_0:FlushProdTip()
	arg_22_0.pages[var_0_0.PAGE_PROD]:ExecuteAction("FlushSlot", arg_22_1.slotId)
end

function var_0_0.FlushRestPage(arg_23_0)
	arg_23_0:FlushRestTip()
	arg_23_0.pages[var_0_0.PAGE_REST]:ExecuteAction("Flush")
end

function var_0_0.OnHide(arg_24_0)
	arg_24_0:UnBlurPanel()

	if arg_24_0.awardDisplayPanel then
		arg_24_0.awardDisplayPanel:Hide()
	end
end

function var_0_0.OnDisable(arg_25_0)
	arg_25_0:OnHide()
end

function var_0_0.OnDestroy(arg_26_0)
	arg_26_0:UnBlurPanel()

	for iter_26_0, iter_26_1 in pairs(arg_26_0.pages) do
		if iter_26_1 then
			iter_26_1:Destroy()

			iter_26_1 = nil
		end
	end

	if arg_26_0.awardDisplayPanel then
		arg_26_0.awardDisplayPanel:Destroy()

		arg_26_0.awardDisplayPanel = nil
	end
end

return var_0_0
