local var_0_0 = class("WorldCruiseScene", import("view.base.BaseUI"))

var_0_0.optionsPath = {
	"top/home"
}
var_0_0.PAGE_AWARD = "award"
var_0_0.PAGE_TASK = "task"
var_0_0.PAGE_SHOP = "shop"

local var_0_1 = var_0_0.PAGE_AWARD

function var_0_0.getUIName(arg_1_0)
	return "WorldCruiseUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"ui/WorldCruiseUI",
		"ui/WorldCruiseAwardPage",
		"ui/WorldCruiseTaskPage",
		"ui/WorldCruiseShopPage",
		"ui/iconcolorful",
		"ui/worldcruiseui_atlas",
		"ui/item_duang5",
		"weaponframes"
	}
	local var_2_1 = getProxy(ActivityProxy):getAliveActivityByType(ActivityConst.ACTIVITY_TYPE_PT_CRUSING)

	local function var_2_2()
		local var_3_0 = {}
		local var_3_1 = pg.battlepass_event_pt[var_2_1.id]

		if var_3_1 then
			if noEmptyStr(var_3_1.bg) then
				table.insert(var_3_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.BG.Base, var_3_1.bg))
			end

			if noEmptyStr(var_3_1.bg_tips) then
				table.insert(var_3_0, ResPathSupport.CombinePath(ResPathSupport.ConstPath.BG.Base, var_3_1.bg_tips))
			end
		end

		return var_3_0
	end

	local function var_2_3(arg_4_0)
		if not arg_4_0 or arg_4_0.type ~= DROP_TYPE_SKIN then
			return {}
		end

		local var_4_0 = pg.ship_skin_template[arg_4_0.id]

		return ResPathSupport.GetPaintingSquareIconListByPaintingName(var_4_0.painting)
	end

	local function var_2_4(arg_5_0)
		if not arg_5_0 or arg_5_0.type ~= DROP_TYPE_SKIN then
			return {}
		end

		local var_5_0 = pg.ship_skin_template[arg_5_0.id]
		local var_5_1 = ResPathSupport.GetPaintingListByPaintingName(var_5_0.painting)
		local var_5_2 = ResPathSupport.GetPaintingFaceListByPaintingName(var_5_0.painting)

		return ResPathSupport.MergeLuaArr(var_5_1, var_5_2)
	end

	local function var_2_5()
		local var_6_0 = {}
		local var_6_1 = var_2_1:GetCrusingInfo()

		for iter_6_0, iter_6_1 in ipairs(var_6_1.awardList or {}) do
			local var_6_2 = {
				iter_6_1.award,
				iter_6_1.award_pay
			}

			for iter_6_2, iter_6_3 in ipairs(var_6_2) do
				if iter_6_3 then
					local var_6_3 = Drop.Create(iter_6_3)

					if var_6_3.type == DROP_TYPE_SKIN then
						table.insertto(var_6_0, var_2_3(var_6_3))
					end
				end
			end
		end

		return var_6_0
	end

	local function var_2_6()
		local var_7_0 = {}

		for iter_7_0, iter_7_1 in ipairs(var_2_1:getConfig("config_data") or {}) do
			local var_7_1 = pg.battlepass_task_group[iter_7_1]

			if var_7_1 then
				for iter_7_2, iter_7_3 in ipairs(var_7_1.task_group or {}) do
					for iter_7_4, iter_7_5 in ipairs(iter_7_3 or {}) do
						local var_7_2 = pg.task_data_template[iter_7_5]
						local var_7_3 = var_7_2 and var_7_2.award_display and var_7_2.award_display[1]
						local var_7_4 = Drop.Create(var_7_3)

						if var_7_4.type == DROP_TYPE_SKIN then
							table.insertto(var_7_0, var_2_3(var_7_4))
						end
					end
				end
			end
		end

		return var_7_0
	end

	local function var_2_7()
		local var_8_0 = {}
		local var_8_1 = {
			ShopArgs.CruiseSkin
		}
		local var_8_2 = pg.TimeMgr.GetInstance()

		for iter_8_0, iter_8_1 in ipairs(var_8_1) do
			for iter_8_2, iter_8_3 in ipairs(pg.shop_template.get_id_list_by_genre[iter_8_1] or {}) do
				local var_8_3 = pg.shop_template[iter_8_3]

				if var_8_3 and var_8_2:inTime(var_8_3.time) then
					local var_8_4 = Goods.Create({
						groupCount = 0,
						buy_count = 0,
						shop_id = iter_8_3
					}, Goods.TYPE_CRUISE):getDropInfo()

					if var_8_4 and var_8_4.type == DROP_TYPE_SKIN then
						table.insertto(var_8_0, var_2_4(var_8_4))
					end
				end
			end
		end

		return var_8_0
	end

	return ResPathSupport.MergeLuaArr(var_0_0.super.getResource(arg_2_0), var_2_0, var_2_2(), var_2_5(), var_2_6(), var_2_7())
end

function var_0_0.preload(arg_9_0, arg_9_1)
	local var_9_0 = getProxy(ShopsProxy)

	local function var_9_1()
		local var_10_0 = var_9_0:GetNormalList()
		local var_10_1 = var_9_0:GetNormalGroupList()

		arg_9_0.shop = CruiseShop.New(var_10_0, var_10_1)

		var_9_0:SetCruiseShop(arg_9_0.shop)
		arg_9_1()
	end

	if var_9_0:ShouldRefreshChargeList() then
		pg.m02:sendNotification(GAME.GET_CHARGE_LIST, {
			callback = var_9_1
		})
	else
		var_9_1()
	end
end

function var_0_0.setShop(arg_11_0, arg_11_1)
	arg_11_0.shop = arg_11_1
end

function var_0_0.setPlayer(arg_12_0, arg_12_1)
	arg_12_0.player = arg_12_1
end

function var_0_0.setActivity(arg_13_0, arg_13_1)
	arg_13_0.activity = arg_13_1

	for iter_13_0, iter_13_1 in pairs(arg_13_1:GetCrusingInfo()) do
		arg_13_0[iter_13_0] = iter_13_1
	end

	arg_13_0.contextData.phase = arg_13_0.phase
end

function var_0_0.init(arg_14_0)
	arg_14_0.topUI = arg_14_0._tf:Find("top")
	arg_14_0.titleTF = arg_14_0.topUI:Find("title/Text")
	arg_14_0.helpBtn = arg_14_0.topUI:Find("help")
	arg_14_0.gemResBtn = arg_14_0.topUI:Find("res/gem")
	arg_14_0.gemValue = arg_14_0.gemResBtn:Find("Text"):GetComponent(typeof(Text))
	arg_14_0.ticketResBtn = arg_14_0.topUI:Find("res/ticket")
	arg_14_0.ticketValue = arg_14_0.ticketResBtn:Find("Text"):GetComponent(typeof(Text))
	arg_14_0.dayTxt = arg_14_0.topUI:Find("day/Text"):GetComponent(typeof(Text))
	arg_14_0.phaseTF = arg_14_0._tf:Find("frame/phase")

	setText(arg_14_0.phaseTF:Find("progress"), i18n("cruise_phase_title"))

	arg_14_0.pages = {
		[var_0_0.PAGE_AWARD] = WorldCruiseAwardPage.New(arg_14_0._tf:Find("frame/award_container"), arg_14_0.event, arg_14_0.contextData),
		[var_0_0.PAGE_TASK] = WorldCruiseTaskPage.New(arg_14_0._tf:Find("frame/task_container"), arg_14_0.event, arg_14_0.contextData),
		[var_0_0.PAGE_SHOP] = WorldCruiseShopPage.New(arg_14_0._tf:Find("frame/shop_container"), arg_14_0.event, arg_14_0.contextData)
	}
	arg_14_0.togglesTF = arg_14_0._tf:Find("frame/toggles")

	eachChild(arg_14_0.togglesTF, function(arg_15_0)
		onButton(arg_14_0, arg_15_0, function()
			arg_14_0.contextData.page = arg_15_0.name

			arg_14_0:SwitchPage()
		end, SFX_PANEL)
	end)

	local var_14_0 = #arg_14_0.shop:GetCommodities() == 0
	local var_14_1 = arg_14_0.togglesTF:Find("shop")

	if var_14_0 then
		onButton(arg_14_0, var_14_1, function()
			pg.TipsMgr.GetInstance():ShowTips(i18n("cruise_shop_no_open"))
		end, SFX_PANEL)
	end

	setActive(var_14_1:Find("lock"), var_14_0)
	setText(var_14_1:Find("lock/Text"), i18n("cruise_shop_no_open"))

	arg_14_0.contextData.windowForCharge = WorldCruiseChargePage.New(arg_14_0._tf, arg_14_0.event)
	arg_14_0.contextData.prevChargePage = WorldCruiseChargePage4PrevPeriod.New(arg_14_0._tf, arg_14_0.event)

	arg_14_0:Hx4Channel()
end

function var_0_0.didEnter(arg_18_0)
	local var_18_0 = pg.battlepass_event_pt[arg_18_0.activity.id]

	LoadImageSpriteAtlasAsync("bg/" .. var_18_0.bg, "", arg_18_0._tf:Find("bg/bg_1"), true)

	local var_18_1 = arg_18_0._tf:Find("bg/bg_2")

	if var_18_0.bg_tips ~= "" then
		LoadImageSpriteAtlasAsync("bg/" .. var_18_0.bg_tips, "", var_18_1, true)
		setActive(var_18_1, true)
	else
		setActive(var_18_1, false)
	end

	onButton(arg_18_0, arg_18_0.topUI:Find("back"), function()
		arg_18_0:closeView()
	end, SFX_CANCEL)
	onButton(arg_18_0, arg_18_0.helpBtn, function()
		pg.NewStyleMsgboxMgr.GetInstance():Show(pg.NewStyleMsgboxMgr.TYPE_COMMON_HELP, {
			helps = i18n("battlepass_main_help_" .. pg.battlepass_event_pt[arg_18_0.activity.id].map_name)
		})
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.gemResBtn, function()
		pg.playerResUI:ClickGem()
	end, SFX_PANEL)
	onButton(arg_18_0, arg_18_0.ticketResBtn, function()
		shoppingBatchNewStyle(Goods.CRUISE_QUICK_TASK_TICKET_ID, {
			id = Item.QUICK_TASK_PASS_TICKET_ID
		}, 20, "build_ship_quickly_buy_stone")
	end, SFX_PANEL)

	local var_18_2 = arg_18_0.activity.stopTime - pg.TimeMgr.GetInstance():GetServerTime()

	arg_18_0.dayTxt.text = i18n("battlepass_main_time_title") .. i18n("battlepass_main_time", math.floor(var_18_2 / 86400), math.floor(var_18_2 % 86400 / 3600))

	arg_18_0:UpdateRes()
	arg_18_0:UpdatePhase()
	arg_18_0:UpdateAwardTip()
	triggerButton(arg_18_0.togglesTF:Find(arg_18_0.contextData.page or var_0_1))
end

function var_0_0.UpdateRes(arg_23_0)
	arg_23_0.gemValue.text = arg_23_0.player:getTotalGem()
	arg_23_0.ticketValue.text = getProxy(BagProxy):getItemCountById(Item.QUICK_TASK_PASS_TICKET_ID)
end

function var_0_0.UpdatePhase(arg_24_0)
	setText(arg_24_0.phaseTF:Find("Text"), "<size=27>lv.</size>" .. arg_24_0.phase)

	if arg_24_0.phase < #arg_24_0.awardList then
		local var_24_0 = arg_24_0.phase == 0 and 0 or arg_24_0.awardList[arg_24_0.phase].pt
		local var_24_1 = arg_24_0.pt - var_24_0
		local var_24_2 = arg_24_0.awardList[arg_24_0.phase + 1].pt - var_24_0

		setSlider(arg_24_0.phaseTF:Find("slider"), 0, var_24_2, var_24_1)
		setText(arg_24_0.phaseTF:Find("progress/Text"), var_24_1 .. "/" .. var_24_2)
	else
		setSlider(arg_24_0.phaseTF:Find("slider"), 0, 1, 1)
		setText(arg_24_0.phaseTF:Find("progress/Text"), "MAX")
	end

	arg_24_0.contextData.phase = arg_24_0.phase
end

function var_0_0.OnChargeSuccess(arg_25_0, arg_25_1, arg_25_2)
	if arg_25_0.contextData.prevChargePage:GetLoaded() then
		arg_25_0.contextData.prevChargePage:ExecuteAction("ShowUnlockWindow", arg_25_1, arg_25_2)
	else
		arg_25_0.contextData.windowForCharge:ExecuteAction("ShowUnlockWindow", arg_25_1, arg_25_2)
	end
end

function var_0_0.UpdateAwardTip(arg_26_0)
	setActive(arg_26_0.togglesTF:Find("award/tip"), #arg_26_0.activity:GetCrusingUnreceiveAward() > 0)
end

function var_0_0.SwitchPage(arg_27_0)
	for iter_27_0, iter_27_1 in pairs(arg_27_0.pages) do
		if iter_27_0 == arg_27_0.contextData.page then
			iter_27_1:ExecuteAction("Flush")
		else
			iter_27_1:ExecuteAction("Hide")
		end
	end

	eachChild(arg_27_0.togglesTF, function(arg_28_0)
		setActive(arg_28_0:Find("unselected"), arg_28_0.name ~= arg_27_0.contextData.page)
		setActive(arg_28_0:Find("selected"), arg_28_0.name == arg_27_0.contextData.page)
	end)

	local var_27_0 = arg_27_0.contextData.page == var_0_0.PAGE_SHOP

	setActive(arg_27_0._tf:Find("shop_bg"), var_27_0)
	setActive(arg_27_0.phaseTF, not var_27_0)

	local var_27_1 = pg.battlepass_event_pt[arg_27_0.activity.id].map_name

	setText(arg_27_0.titleTF, var_27_0 and i18n("cruise_shop_title") or i18n("cruise_title_" .. var_27_1))
end

function var_0_0.UpdateView(arg_29_0)
	arg_29_0.pages[arg_29_0.contextData.page]:ExecuteAction("Flush")
end

function var_0_0.UpdateAwardPage(arg_30_0)
	arg_30_0:UpdateAwardTip()
	arg_30_0.pages[var_0_0.PAGE_AWARD]:ExecuteAction("UpdateActivity", arg_30_0.activity)
end

function var_0_0.UpdateTaskPage(arg_31_0)
	arg_31_0.pages[var_0_0.PAGE_TASK]:ExecuteAction("UpdateActivity", arg_31_0.activity)
end

function var_0_0.UpdateShopPage(arg_32_0)
	arg_32_0.pages[var_0_0.PAGE_SHOP]:ExecuteAction("UpdateShop", arg_32_0.shop)
	arg_32_0:UpdateView()
end

function var_0_0.onBackPressed(arg_33_0)
	if arg_33_0.contextData.windowForCharge and arg_33_0.contextData.windowForCharge:GetLoaded() and arg_33_0.contextData.windowForCharge:isShowing() then
		arg_33_0.contextData.windowForCharge:Hide()

		return
	end

	if arg_33_0.contextData.prevChargePage and arg_33_0.contextData.prevChargePage:GetLoaded() and arg_33_0.contextData.prevChargePage:isShowing() then
		arg_33_0.contextData.prevChargePage:Hide()

		return
	end

	var_0_0.super.onBackPressed(arg_33_0)
end

function var_0_0.willExit(arg_34_0)
	if arg_34_0.contextData.windowForCharge then
		arg_34_0.contextData.windowForCharge:Destroy()

		arg_34_0.contextData.windowForCharge = nil
	end

	if arg_34_0.contextData.prevChargePage then
		arg_34_0.contextData.prevChargePage:Destroy()

		arg_34_0.contextData.prevChargePage = nil
	end

	for iter_34_0, iter_34_1 in pairs(arg_34_0.pages) do
		iter_34_1:Destroy()

		iter_34_1 = nil
	end
end

local function var_0_2(arg_35_0)
	local var_35_0 = pg.SdkMgr.GetInstance():GetChannelUIDIncludeHarmony()

	return (arg_35_0._tf:Find("bg/bg_1/hx_ch" .. var_35_0))
end

function var_0_0.Hx4Channel(arg_36_0)
	local var_36_0 = var_0_2(arg_36_0)

	if not IsNil(var_36_0) then
		setActive(var_36_0, HXSet.isHx())
	end
end

return var_0_0
