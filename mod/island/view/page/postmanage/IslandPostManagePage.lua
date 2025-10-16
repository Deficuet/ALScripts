local var_0_0 = class("IslandPostManagePage", import("...base.IslandBasePage"))

var_0_0.PAGE_PROD = "prod"
var_0_0.PAGE_REST = "rest"

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
	eachChild(arg_4_0.togglesTF, function(arg_9_0)
		onToggle(arg_4_0, arg_9_0, function(arg_10_0)
			if arg_10_0 then
				arg_4_0.curPage = arg_9_0.name

				arg_4_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)

	arg_4_0.buildingIds = pg.island_set.post_manage_produce.key_value_varchar
	arg_4_0.restIds = pg.island_set.post_manage_operate.key_value_varchar
end

function var_0_0.AddListeners(arg_11_0)
	arg_11_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_11_0.FlushProdPage)
	arg_11_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_11_0.OnFlushProdPageAndShipExpDone)
	arg_11_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_11_0.OnFlushProdPageAndShipExpDone)
	arg_11_0:AddListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_11_0.FlushRestPage)
	arg_11_0:AddListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_11_0.FlushRestPage)
	arg_11_0:AddListener(IslandManageAgecny.ADD_RESTAURANT, arg_11_0.FlushRestPage)
	arg_11_0:AddListener(IslandManageAgecny.ADD_ASSISTANT, arg_11_0.FlushRestPage)
	arg_11_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_11_0.FlushRestPage)
end

function var_0_0.RemoveListeners(arg_12_0)
	arg_12_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_12_0.FlushProdPage)
	arg_12_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_12_0.OnFlushProdPageAndShipExpDone)
	arg_12_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_12_0.OnFlushProdPageAndShipExpDone)
	arg_12_0:RemoveListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_12_0.FlushRestPage)
	arg_12_0:RemoveListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_12_0.FlushRestPage)
	arg_12_0:RemoveListener(IslandManageAgecny.ADD_RESTAURANT, arg_12_0.FlushRestPage)
	arg_12_0:RemoveListener(IslandManageAgecny.ADD_ASSISTANT, arg_12_0.FlushRestPage)
	arg_12_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_12_0.FlushRestPage)
end

function var_0_0.SwitchPage(arg_13_0)
	for iter_13_0, iter_13_1 in pairs(arg_13_0.pages) do
		if iter_13_0 == arg_13_0.curPage then
			iter_13_1:ExecuteAction("Show")
		else
			iter_13_1:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnShow(arg_14_0)
	arg_14_0:BlurPanel()
	triggerToggle(arg_14_0.togglesTF:Find(var_0_0.PAGE_PROD), true)
	arg_14_0:FlushTips()
	setActive(arg_14_0.signInNoticeTF, getProxy(IslandProxy):GetIsland():GetSignInAgency():CanSignIn())
end

function var_0_0.FlushTips(arg_15_0)
	arg_15_0:FlushProdTip()
	arg_15_0:FlushRestTip()
end

function var_0_0.FlushProdTip(arg_16_0)
	local var_16_0 = IslandMainBtnTipHelper.IsPostProdTip()

	setActive(arg_16_0.togglesTF:Find("prod/unsel/tip"), var_16_0)
	setActive(arg_16_0.togglesTF:Find("prod/sel/tip"), var_16_0)
end

function var_0_0.FlushRestTip(arg_17_0)
	local var_17_0 = IslandMainBtnTipHelper.IsPostRestTip()

	setActive(arg_17_0.togglesTF:Find("rest/unsel/tip"), var_17_0)
	setActive(arg_17_0.togglesTF:Find("rest/sel/tip"), var_17_0)
end

function var_0_0.OnFlushProdPageAndShipExpDone(arg_18_0, arg_18_1)
	if arg_18_1.addShipExpData then
		local var_18_0 = {}
		local var_18_1 = arg_18_1.addShipExpData.addShipId
		local var_18_2 = arg_18_1.addShipExpData.addExp
		local var_18_3 = IslandShip.StaticGetPrefab(var_18_1)
		local var_18_4 = "island/IslandShipIcon/" .. var_18_3

		arg_18_0.awardDisplayPanel:ExecuteAction("ShowAwards", {
			shipExp = true,
			icon = var_18_4,
			num = var_18_2
		})
	end

	arg_18_0:FlushProdPage(arg_18_1)
end

function var_0_0.FlushProdPage(arg_19_0, arg_19_1)
	arg_19_0:FlushProdTip()
	arg_19_0.pages[var_0_0.PAGE_PROD]:ExecuteAction("FlushSlot", arg_19_1.slotId)
end

function var_0_0.FlushRestPage(arg_20_0)
	arg_20_0:FlushRestTip()
	arg_20_0.pages[var_0_0.PAGE_REST]:ExecuteAction("Flush")
end

function var_0_0.OnHide(arg_21_0)
	arg_21_0:UnBlurPanel()

	if arg_21_0.awardDisplayPanel then
		arg_21_0.awardDisplayPanel:Hide()
	end
end

function var_0_0.OnDisable(arg_22_0)
	arg_22_0:OnHide()
end

function var_0_0.OnDestroy(arg_23_0)
	for iter_23_0, iter_23_1 in pairs(arg_23_0.pages) do
		if iter_23_1 then
			iter_23_1:Destroy()

			iter_23_1 = nil
		end
	end

	if arg_23_0.awardDisplayPanel then
		arg_23_0.awardDisplayPanel:Destroy()

		arg_23_0.awardDisplayPanel = nil
	end
end

return var_0_0
