local var_0_0 = class("GuildShowAssultShipPage", import(".GuildEventBasePage"))

function var_0_0.getUIName(arg_1_0)
	return "GuildShowAssultShipPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.scrollrect = arg_2_0._tf:Find("frame/scrollrect"):GetComponent("LScrollRect")
	arg_2_0.closeBtn = arg_2_0._tf:Find("frame/close")
	arg_2_0.progress = arg_2_0._tf:Find("frame/progress"):GetComponent(typeof(Text))
end

function var_0_0.OnAssultShipBeRecommanded(arg_3_0, arg_3_1)
	arg_3_0:InitList()
end

function var_0_0.OnRefreshAll(arg_4_0)
	arg_4_0:InitData()

	local var_4_0 = {}

	for iter_4_0, iter_4_1 in ipairs(arg_4_0.displays) do
		var_4_0[iter_4_1.ship.id] = iter_4_1
	end

	for iter_4_2, iter_4_3 in pairs(arg_4_0.cards) do
		local var_4_1 = var_4_0[iter_4_3.ship.id]

		if var_4_1 then
			iter_4_3:Flush(var_4_1.member, var_4_1.ship)
		end
	end
end

function var_0_0.OnInit(arg_5_0)
	onButton(arg_5_0, arg_5_0.closeBtn, function()
		arg_5_0:Hide()
	end, SFX_PANEL)

	arg_5_0.cards = {}

	function arg_5_0.scrollrect.onInitItem(arg_7_0)
		arg_5_0:OnInitItem(arg_7_0)
	end

	function arg_5_0.scrollrect.onUpdateItem(arg_8_0, arg_8_1)
		arg_5_0:OnUpdateItem(arg_8_0, arg_8_1)
	end
end

function var_0_0.GetRecommandShipCnt(arg_9_0)
	local var_9_0 = 0

	for iter_9_0, iter_9_1 in ipairs(arg_9_0.displays) do
		if iter_9_1.ship.guildRecommand then
			var_9_0 = var_9_0 + 1
		end
	end

	return var_9_0
end

function var_0_0.OnInitItem(arg_10_0, arg_10_1)
	local var_10_0 = GuildBossAssultCard.New(arg_10_1)

	onButton(arg_10_0, var_10_0.recommendBtn, function()
		local var_11_0 = var_10_0.ship
		local var_11_1 = var_11_0.guildRecommand and GuildConst.CANCEL_RECOMMAND_SHIP or GuildConst.RECOMMAND_SHIP

		arg_10_0:emit(GuildEventMediator.REFRESH_RECOMMAND_SHIPS, function()
			if var_11_1 == GuildConst.RECOMMAND_SHIP and arg_10_0:GetRecommandShipCnt() >= 9 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_recommend_limit"))

				return
			end

			local var_12_0 = var_11_0.guildRecommand and GuildConst.RECOMMAND_SHIP or GuildConst.CANCEL_RECOMMAND_SHIP

			if var_11_1 ~= var_12_0 then
				arg_10_0:emit(GuildEventMediator.ON_RECOMM_ASSULT_SHIP, var_11_0.id, var_11_1)
			elseif var_11_1 == GuildConst.RECOMMAND_SHIP then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_assult_ship_recommend_conflict"))
			elseif var_11_1 == GuildConst.CANCEL_RECOMMAND_SHIP then
				pg.TipsMgr.GetInstance():ShowTips(i18n("guild_cancel_assult_ship_recommend_conflict"))
			end
		end)
	end, SFX_PANEL)

	local function var_10_1()
		if IsNil(arg_10_0._tf) then
			return
		end

		pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
	end

	local function var_10_2()
		if IsNil(arg_10_0._tf) then
			return
		end

		pg.UIMgr.GetInstance():UnOverlayPanel(arg_10_0._tf, arg_10_0._parentTf)
	end

	onButton(arg_10_0, var_10_0.viewEquipmentBtn, function()
		local var_15_0 = var_10_0.ship
		local var_15_1 = var_10_0.member

		arg_10_0:emit(GuildEventLayer.SHOW_SHIP_EQUIPMENTS, var_15_0, var_15_1, var_10_1, var_10_2)
	end, SFX_PANEL)

	arg_10_0.cards[arg_10_1] = var_10_0
end

function var_0_0.OnUpdateItem(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0.cards[arg_16_2]

	if not var_16_0 then
		arg_16_0:OnInitItem(arg_16_2)

		var_16_0 = arg_16_0.cards[arg_16_2]
	end

	local var_16_1 = arg_16_0.displays[arg_16_1 + 1]

	var_16_0:Flush(var_16_1.member, var_16_1.ship)

	local var_16_2 = arg_16_0.totalPageCnt
	local var_16_3 = math.ceil((arg_16_0.scrollrect.value + 0.001) * var_16_2)

	arg_16_0.progress.text = var_16_3 .. "/" .. var_16_2
end

function var_0_0.OnShow(arg_17_0)
	arg_17_0:emit(GuildEventMediator.ON_GET_ALL_ASSULT_FLEET, function()
		arg_17_0:InitList()
	end)
end

function var_0_0.InitData(arg_19_0)
	local var_19_0 = arg_19_0.guild
	local var_19_1 = arg_19_0.player

	arg_19_0.displays = {}

	local var_19_2 = var_19_0:GetMembers()

	for iter_19_0, iter_19_1 in pairs(var_19_2) do
		local var_19_3 = iter_19_1:GetAssaultFleet():GetShipList()

		for iter_19_2, iter_19_3 in pairs(var_19_3) do
			table.insert(arg_19_0.displays, {
				ship = iter_19_3,
				member = iter_19_1
			})
		end
	end

	table.sort(arg_19_0.displays, function(arg_20_0, arg_20_1)
		return (arg_20_0.ship.guildRecommand and 1 or 0) > (arg_20_1.ship.guildRecommand and 1 or 0)
	end)
end

function var_0_0.InitList(arg_21_0)
	arg_21_0:InitData()

	arg_21_0.totalPageCnt = math.ceil(#arg_21_0.displays / 9)

	arg_21_0.scrollrect:SetTotalCount(#arg_21_0.displays)
end

function var_0_0.OnDestroy(arg_22_0)
	var_0_0.super.OnDestroy(arg_22_0)

	for iter_22_0, iter_22_1 in pairs(arg_22_0.cards) do
		iter_22_1:Dispose()
	end
end

return var_0_0
