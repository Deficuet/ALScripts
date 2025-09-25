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
	arg_2_0.pages[var_0_0.PAGE_PROD] = IslandPostProdPanel.New(var_2_0, arg_2_0.event)
	arg_2_0.pages[var_0_0.PAGE_REST] = IslandPostRestPanel.New(var_2_0, arg_2_0.event)
	arg_2_0.togglesTF = arg_2_0._tf:Find("Adapt/types/content")

	setText(arg_2_0.togglesTF:Find("prod/unsel"), i18n("island_post_produce"))
	setText(arg_2_0.togglesTF:Find("prod/sel/content/Text"), i18n("island_post_produce"))
	setText(arg_2_0.togglesTF:Find("rest/unsel"), i18n("island_post_operate"))
	setText(arg_2_0.togglesTF:Find("rest/sel/content/Text"), i18n("island_post_operate"))

	arg_2_0.signInNoticeTF = arg_2_0._tf:Find("Adapt/signInBtn/notice")
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0._tf:Find("top/back"), function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("top/home"), function()
		arg_3_0:emit(BaseUI.ON_HOME)
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf:Find("Adapt/signInBtn"), function()
		arg_3_0:Hide()
		arg_3_0:emit(IslandBaseMediator.SWITCH_MAP, IslandConst.AGORA_MAP_ID, IslandConst.SIGNIN_SP)
	end, SFX_PANEL)
	eachChild(arg_3_0.togglesTF, function(arg_7_0)
		onToggle(arg_3_0, arg_7_0, function(arg_8_0)
			if arg_8_0 then
				arg_3_0.curPage = arg_7_0.name

				arg_3_0:SwitchPage()
			end
		end, SFX_PANEL)
	end)

	arg_3_0.buildingIds = pg.island_set.post_manage_produce.key_value_varchar
	arg_3_0.restIds = pg.island_set.post_manage_operate.key_value_varchar
end

function var_0_0.AddListeners(arg_9_0)
	arg_9_0:AddListener(GAME.ISLAND_START_DELEGATION_DONE, arg_9_0.FlushProdPage)
	arg_9_0:AddListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_9_0.FlushProdPage)
	arg_9_0:AddListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_9_0.FlushProdPage)
	arg_9_0:AddListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_9_0.FlushRestPage)
	arg_9_0:AddListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_9_0.FlushRestPage)
	arg_9_0:AddListener(IslandManageAgecny.ADD_RESTAURANT, arg_9_0.FlushRestPage)
	arg_9_0:AddListener(IslandManageAgecny.ADD_ASSISTANT, arg_9_0.FlushRestPage)
	arg_9_0:AddListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_9_0.FlushRestPage)
end

function var_0_0.RemoveListeners(arg_10_0)
	arg_10_0:RemoveListener(GAME.ISLAND_START_DELEGATION_DONE, arg_10_0.FlushProdPage)
	arg_10_0:RemoveListener(GAME.ISLAND_FINISH_DELEGATION_DONE, arg_10_0.FlushProdPage)
	arg_10_0:RemoveListener(GAME.ISLAND_GET_DELEGATION_AWARD_DONE, arg_10_0.FlushProdPage)
	arg_10_0:RemoveListener(GAME.ISLAND_OPEN_RESTAURANT_DONE, arg_10_0.FlushRestPage)
	arg_10_0:RemoveListener(GAME.ISLAND_CLOSE_RESTAURANT_DONE, arg_10_0.FlushRestPage)
	arg_10_0:RemoveListener(IslandManageAgecny.ADD_RESTAURANT, arg_10_0.FlushRestPage)
	arg_10_0:RemoveListener(IslandManageAgecny.ADD_ASSISTANT, arg_10_0.FlushRestPage)
	arg_10_0:RemoveListener(IslandManageAgecny.ON_DAILY_REFRESH, arg_10_0.FlushRestPage)
end

function var_0_0.SwitchPage(arg_11_0)
	for iter_11_0, iter_11_1 in pairs(arg_11_0.pages) do
		if iter_11_0 == arg_11_0.curPage then
			iter_11_1:ExecuteAction("Show")
		else
			iter_11_1:ExecuteAction("Hide")
		end
	end
end

function var_0_0.OnShow(arg_12_0)
	arg_12_0:BlurPanel()
	triggerToggle(arg_12_0.togglesTF:Find(var_0_0.PAGE_PROD), true)
	arg_12_0:FlushTips()
	setActive(arg_12_0.signInNoticeTF, getProxy(IslandProxy):GetIsland():GetSignInAgency():CanSignIn())
end

function var_0_0.FlushTips(arg_13_0)
	arg_13_0:FlushProdTip()
	arg_13_0:FlushRestTip()
end

function var_0_0.FlushProdTip(arg_14_0)
	local var_14_0 = IslandMainBtnTipHelper.IsPostProdTip()

	setActive(arg_14_0.togglesTF:Find("prod/unsel/tip"), var_14_0)
	setActive(arg_14_0.togglesTF:Find("prod/sel/tip"), var_14_0)
end

function var_0_0.FlushRestTip(arg_15_0)
	local var_15_0 = IslandMainBtnTipHelper.IsPostRestTip()

	setActive(arg_15_0.togglesTF:Find("rest/unsel/tip"), var_15_0)
	setActive(arg_15_0.togglesTF:Find("rest/sel/tip"), var_15_0)
end

function var_0_0.FlushProdPage(arg_16_0, arg_16_1)
	arg_16_0:FlushProdTip()
	arg_16_0.pages[var_0_0.PAGE_PROD]:ExecuteAction("FlushSlot", arg_16_1.slotId)
end

function var_0_0.FlushRestPage(arg_17_0)
	arg_17_0:FlushRestTip()
	arg_17_0.pages[var_0_0.PAGE_REST]:ExecuteAction("Flush")
end

function var_0_0.OnHide(arg_18_0)
	arg_18_0:UnBlurPanel()
end

function var_0_0.OnDisable(arg_19_0)
	arg_19_0:OnHide()
end

function var_0_0.OnDestroy(arg_20_0)
	for iter_20_0, iter_20_1 in pairs(arg_20_0.pages) do
		if iter_20_1 then
			iter_20_1:Destroy()

			iter_20_1 = nil
		end
	end
end

return var_0_0
