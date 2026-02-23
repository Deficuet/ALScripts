local var_0_0 = class("IslandVisitorPage", import("...base.IslandBasePage"))
local var_0_1 = 1
local var_0_2 = 2

function var_0_0.getUIName(arg_1_0)
	return "IslandVisitorUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.kickAllBtn = arg_2_0._tf:Find("frame/public")
	arg_2_0.closeAccessBtn = arg_2_0._tf:Find("frame/onkey")
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/close")
	arg_2_0.peopleCntTxt = arg_2_0._tf:Find("frame/cnt/Text"):GetComponent(typeof(Text))
	arg_2_0.toggles = {
		arg_2_0._tf:Find("frame/toggles/1"),
		arg_2_0._tf:Find("frame/toggles/2")
	}
	arg_2_0.texts = {
		arg_2_0._tf:Find("frame/toggles/1/Text"):GetComponent(typeof(Text)),
		arg_2_0._tf:Find("frame/toggles/2/Text"):GetComponent(typeof(Text))
	}
	arg_2_0.names = {
		i18n("island_curr_visitor"),
		i18n("island_visitor_log")
	}
	arg_2_0._scrollrect = arg_2_0._tf:Find("frame/scrollrect"):GetComponent("LScrollRect")
	arg_2_0._scrollrectLog = arg_2_0._tf:Find("frame/scrollrect4Log"):GetComponent("LScrollRect")
	arg_2_0.scrollrects = {
		arg_2_0._scrollrect,
		arg_2_0._scrollrectLog
	}
	arg_2_0.cards = {}
	arg_2_0.logCards = {}
	arg_2_0.cardList = {
		arg_2_0.cards,
		arg_2_0.logCards
	}

	function arg_2_0._scrollrect.onInitItem(arg_3_0)
		arg_2_0:OnInitItem(arg_3_0)
	end

	function arg_2_0._scrollrect.onUpdateItem(arg_4_0, arg_4_1)
		arg_2_0:OnUpdateItem(arg_4_0, arg_4_1)
	end

	function arg_2_0._scrollrectLog.onInitItem(arg_5_0)
		arg_2_0:OnInitItem4Log(arg_5_0)
	end

	function arg_2_0._scrollrectLog.onUpdateItem(arg_6_0, arg_6_1)
		arg_2_0:OnUpdateItem4Log(arg_6_0, arg_6_1)
	end

	setText(arg_2_0._tf:Find("frame/public/Text"), i18n("island_kick_all"))
	setText(arg_2_0._tf:Find("frame/onkey/Text"), i18n("island_close_visit"))
	setText(arg_2_0._tf:Find("frame/cnt/label"), i18n("island_curr_people_cnt"))
end

function var_0_0.OnInit(arg_7_0)
	onButton(arg_7_0, arg_7_0._tf, function()
		arg_7_0:Hide()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.closeBtn, function()
		arg_7_0:Hide()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.kickAllBtn, function()
		local var_10_0 = _.map(arg_7_0.displays, function(arg_11_0)
			return arg_11_0.id
		end)

		if #var_10_0 <= 0 then
			return
		end

		arg_7_0:emit(IslandMediator.KICK_ALL_VISITOR, var_10_0)
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.closeAccessBtn, function()
		if not arg_7_0:GetIsland():GetAccessAgency():HasOpenFlag(IslandConst.OPEN_ALL) then
			pg.TipsMgr.GetInstance():ShowTips(i18n("island_close_access_state"))

			return
		end

		local var_12_0 = {}
		local var_12_1 = {
			IslandConst.OPEN_ALL
		}

		arg_7_0:emit(IslandMediator.SET_ACCESS_FLAG, var_12_0, var_12_1)
	end, SFX_PANEL)

	for iter_7_0, iter_7_1 in pairs(arg_7_0.toggles) do
		local var_7_0 = arg_7_0.texts[iter_7_0]
		local var_7_1 = arg_7_0.names[iter_7_0]

		onToggle(arg_7_0, iter_7_1, function(arg_13_0)
			if arg_13_0 then
				arg_7_0:SwitchPage(iter_7_0)
			end

			var_7_0.text = arg_13_0 and setColorStr(var_7_1, "#FEFEFE") or setColorStr(var_7_1, "#6B6E75")
		end, SFX_PANEL)

		var_7_0.text = setColorStr(var_7_1, "#6B6E75")
	end
end

function var_0_0.AddListeners(arg_14_0)
	arg_14_0:AddListener(IslandVisitorAgency.PLAYER_ADD, arg_14_0.OnFlush)
	arg_14_0:AddListener(IslandVisitorAgency.PLAYER_EXIT, arg_14_0.OnFlush)
end

function var_0_0.RemoveListeners(arg_15_0)
	arg_15_0:RemoveListener(IslandVisitorAgency.PLAYER_ADD, arg_15_0.OnFlush)
	arg_15_0:RemoveListener(IslandVisitorAgency.PLAYER_EXIT, arg_15_0.OnFlush)
end

function var_0_0.OnFlush(arg_16_0)
	arg_16_0:FlushList()
end

function var_0_0.GetDisplayData(arg_17_0, arg_17_1)
	local var_17_0 = {}

	if arg_17_1 == var_0_1 then
		local var_17_1 = arg_17_0:GetIsland():GetVisitorAgency():GetPlayerList()

		for iter_17_0, iter_17_1 in pairs(var_17_1) do
			if not iter_17_1:IsSelf() then
				table.insert(var_17_0, iter_17_1)
			end
		end
	elseif arg_17_1 == var_0_2 then
		local var_17_2 = getProxy(IslandProxy):GetIsland():GetAccessAgency():GetVisitorLogList()
		local var_17_3 = {}

		for iter_17_2, iter_17_3 in ipairs(var_17_2) do
			if not iter_17_3:IsSelf() then
				table.insert(var_17_3, iter_17_3)
			end
		end

		table.sort(var_17_3, function(arg_18_0, arg_18_1)
			return arg_18_0.time > arg_18_1.time
		end)

		if #var_17_3 <= 1 then
			return {}
		end

		table.insert(var_17_0, var_17_3[1])

		local var_17_4 = var_17_3[1].time

		for iter_17_4 = 2, #var_17_3 do
			local var_17_5 = var_17_3[iter_17_4].time

			if not pg.TimeMgr.GetInstance():IsSameDay(var_17_4, var_17_5) then
				table.insert(var_17_0, IslandVisitorLog.New({
					id = -1,
					time = var_17_5
				}))
			end

			table.insert(var_17_0, var_17_3[iter_17_4])

			var_17_4 = var_17_5
		end
	end

	return var_17_0
end

function var_0_0.SwitchPage(arg_19_0, arg_19_1)
	arg_19_0.pageIndex = arg_19_1

	arg_19_0:FlushList()
end

function var_0_0.OnInitItem(arg_20_0, arg_20_1)
	local var_20_0 = IslandVisitorCard.New(arg_20_1)

	onButton(arg_20_0, var_20_0.btn, function()
		arg_20_0:emit(IslandMediator.ON_KICK_PLAYER, IslandConst.ACCESS_OP_KICK, var_20_0.player.id)
	end, SFX_PANEL)
	onButton(arg_20_0, var_20_0.cardBtn, function()
		arg_20_0:emit(IslandMediator.OPEN_PAGE, "IslandOtherCardPage", {
			var_20_0.player.id
		})
	end, SFX_PANEL)

	arg_20_0.cardList[arg_20_0.pageIndex][arg_20_1] = var_20_0
end

function var_0_0.OnUpdateItem(arg_23_0, arg_23_1, arg_23_2)
	local var_23_0 = arg_23_0.cardList[arg_23_0.pageIndex][arg_23_2]

	if not var_23_0 then
		arg_23_0:OnInitItem(arg_23_2)

		var_23_0 = arg_23_0.cardList[arg_23_0.pageIndex][arg_23_2]
	end

	local var_23_1 = arg_23_0.displays[arg_23_1 + 1]

	var_23_0:Update(var_23_1)
end

function var_0_0.OnInitItem4Log(arg_24_0, arg_24_1)
	local var_24_0 = IslandVisitorLogCard.New(arg_24_1)

	arg_24_0.cardList[arg_24_0.pageIndex][arg_24_1] = var_24_0
end

function var_0_0.OnUpdateItem4Log(arg_25_0, arg_25_1, arg_25_2)
	local var_25_0 = arg_25_0.cardList[arg_25_0.pageIndex][arg_25_2]

	if not var_25_0 then
		arg_25_0:OnInitItem(arg_25_2)

		var_25_0 = arg_25_0.cardList[arg_25_0.pageIndex][arg_25_2]
	end

	local var_25_1 = arg_25_0.displays[arg_25_1 + 1]

	var_25_0:Update(var_25_1)
end

function var_0_0.Show(arg_26_0)
	var_0_0.super.Show(arg_26_0)
	triggerToggle(arg_26_0.toggles[var_0_1], true)
end

function var_0_0.FlushList(arg_27_0)
	arg_27_0.displays = arg_27_0:GetDisplayData(arg_27_0.pageIndex)

	arg_27_0.scrollrects[arg_27_0.pageIndex]:SetTotalCount(#arg_27_0.displays)
	arg_27_0:FlushPeopleCnt()
end

function var_0_0.FlushPeopleCnt(arg_28_0)
	arg_28_0.peopleCntTxt.text = #arg_28_0.displays .. "/10"
end

function var_0_0.OnDestroy(arg_29_0)
	ClearLScrollrect(arg_29_0._scrollrect)
	ClearLScrollrect(arg_29_0._scrollrectLog)

	for iter_29_0, iter_29_1 in pairs(arg_29_0.cardList) do
		for iter_29_2, iter_29_3 in pairs(iter_29_1) do
			iter_29_3:Dispose()
		end
	end

	arg_29_0.cardList = nil
end

return var_0_0
