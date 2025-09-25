local var_0_0 = class("ClueBuffSelectLayer", import("view.base.BaseUI"))

var_0_0.SP_STRA_MIN_RANGE = 201308
var_0_0.SP_STRA_MAX_RANGE = 201320
var_0_0.SP_STRATEGY_ID = 201321
var_0_0.BOOST_ITEM_ID = 65562
var_0_0.PLYAER_PREF_KEY = "ClueBuffSelectedBySingleEnemyID_"

function var_0_0.getUIName(arg_1_0)
	return "ClueBuffSelectUI"
end

function var_0_0.preloadUIList(arg_2_0)
	return {
		arg_2_0:getUIName(),
		"BossSingleFleetSelectView"
	}
end

function var_0_0.init(arg_3_0)
	arg_3_0.closeBtn = arg_3_0:findTF("Top/BackBtn")

	onButton(arg_3_0, arg_3_0.closeBtn, function()
		arg_3_0:emit(var_0_0.ON_BACK_PRESSED)
	end)
	onButton(arg_3_0, arg_3_0:findTF("mask"), function()
		arg_3_0:emit(var_0_0.ON_BACK_PRESSED)
	end)

	arg_3_0.buffContainer = arg_3_0:findTF("Buff/buff_list")
	arg_3_0.buffTmp = arg_3_0.buffContainer:Find("buff")
	arg_3_0.buffTFs = {}
	arg_3_0.strategyList = {}
	arg_3_0.buffDescList = {}

	for iter_3_0 = 1, 4 do
		local var_3_0 = arg_3_0:findTF("Buff/buff_desc_list/buff_desc_" .. iter_3_0)

		table.insert(arg_3_0.buffDescList, var_3_0)
		setText(var_3_0:Find("unselect"), i18n("clue_buff_unselect"))
	end

	arg_3_0.stageName = arg_3_0:findTF("Stage/stage_name_text")
	arg_3_0.stageLV = arg_3_0:findTF("Stage/stage_level_text")

	setText(arg_3_0:findTF("Stage/text_stage_reserach"), i18n("clue_buff_research"))
	setText(arg_3_0:findTF("Stage/text_stage_loot"), i18n("clue_buff_stage_loot"))

	arg_3_0.awards = arg_3_0:findTF("Loot/awards")
	arg_3_0.awardTpl = arg_3_0:findTF("Loot/awards/award")
	arg_3_0.goBtn = arg_3_0:findTF("Combat/go_btn")

	onButton(arg_3_0, arg_3_0.goBtn, function()
		arg_3_0:emit(ClueBuffSelectMediator.ON_FLEET_SELECT, arg_3_0.singleID)
	end)

	arg_3_0.detailView = arg_3_0:findTF("Detail")
	arg_3_0.detailBtn = arg_3_0:findTF("BuffDetail")

	setActive(arg_3_0.detailBtn, false)

	arg_3_0.detailList = UIItemList.New(arg_3_0.detailView:Find("panel/list"), arg_3_0.detailView:Find("panel/list/item"))

	onButton(arg_3_0, arg_3_0.detailBtn, function()
		arg_3_0:openDetailView()
	end)

	arg_3_0.detailClose = arg_3_0.detailView:Find("btnBack")

	onButton(arg_3_0, arg_3_0.detailClose, function()
		arg_3_0:closeDetailView()
	end)
	onButton(arg_3_0, arg_3_0.detailView:Find("mask"), function()
		arg_3_0:closeDetailView()
	end)

	arg_3_0.ticket = arg_3_0:findTF("Ticket")
	arg_3_0.ticketTips = arg_3_0:findTF("ticketTips")
	arg_3_0.ticketCheckBox = arg_3_0.ticket:Find("checkbox")
	arg_3_0.useTicket = false

	onButton(arg_3_0, arg_3_0.ticket:Find("bg"), function()
		arg_3_0:UpdateTicket()
	end)
	setText(arg_3_0.ticketTips, i18n("clue_buff_ticket_tips"))

	arg_3_0.explore = arg_3_0:findTF("exploreTarget")

	setActive(arg_3_0.explore, true)
	BossSingleBattleFleetSelectViewComponent.AttachFleetSelect(arg_3_0, ClueBuffSelectMediator)
	pg.UIMgr.GetInstance():BlurPanel(arg_3_0._tf)
end

function var_0_0.didEnter(arg_11_0)
	arg_11_0:updateBuffView()
	arg_11_0:UpdateCluePanel()

	arg_11_0.contextData.selectedBuffList = {}

	for iter_11_0, iter_11_1 in ipairs(arg_11_0.preSelectedBuffList) do
		arg_11_0:selectBuff(iter_11_1)
	end

	if arg_11_0.contextData.editFleet then
		arg_11_0:ShowNormalFleet(arg_11_0.singleID)
	end
end

function var_0_0.show(arg_12_0)
	setActive(arg_12_0._tf, true)
	pg.UIMgr.GetInstance():BlurPanel(arg_12_0._tf)
end

function var_0_0.hide(arg_13_0)
	setActive(arg_13_0._tf, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_13_0._tf, arg_13_0._parentTf)
end

function var_0_0.openDetailView(arg_14_0)
	setActive(arg_14_0.detailView, true)
	arg_14_0:updateDetailView()
end

function var_0_0.closeDetailView(arg_15_0)
	setActive(arg_15_0.detailView, false)
end

function var_0_0.updateBuffView(arg_16_0)
	local var_16_0 = pg.activity_single_enemy[arg_16_0.singleID]
	local var_16_1 = var_16_0.strategy_id

	for iter_16_0, iter_16_1 in ipairs(var_16_1) do
		if not table.contains(arg_16_0.strategyList, iter_16_1) then
			setActive(arg_16_0.buffTFs[iter_16_1]:Find("selected"), false)
		end
	end

	local var_16_2 = pg.strategy_data_template

	for iter_16_2, iter_16_3 in ipairs(arg_16_0.buffDescList) do
		local var_16_3 = iter_16_3:Find("mask/desc")
		local var_16_4 = var_16_3:GetComponent("RectTransform")

		if iter_16_2 > var_16_0.strategy_num then
			iter_16_3:Find("bg"):GetComponent(typeof(CanvasGroup)).alpha = 0.05

			setActive(iter_16_3:Find("lock"), true)
			setActive(var_16_3, false)
			setActive(iter_16_3:Find("over_deco"), false)
			setActive(iter_16_3:Find("unselect"), false)
		else
			setActive(iter_16_3:Find("lock"), false)

			if arg_16_0.strategyList[iter_16_2] then
				setActive(var_16_3, true)

				local var_16_5 = var_16_2[arg_16_0.strategyList[iter_16_2]]

				iter_16_3:Find("bg"):GetComponent(typeof(CanvasGroup)).alpha = 1

				setText(var_16_3:Find("index"), iter_16_2)
				setText(var_16_3:Find("name"), var_16_5.name)
				setText(var_16_3:Find("desc"), var_16_5.desc)
				setActive(iter_16_3:Find("lock"), false)
				setActive(iter_16_3:Find("unselect"), false)
				Canvas.ForceUpdateCanvases()
				setActive(iter_16_3:Find("over_deco"), var_16_4.rect.width > 560)
			else
				setActive(var_16_3, false)

				iter_16_3:Find("bg"):GetComponent(typeof(CanvasGroup)).alpha = 0.2

				setActive(iter_16_3:Find("unselect"), true)
				setActive(iter_16_3:Find("lock"), false)
				setActive(iter_16_3:Find("over_deco"), false)
			end
		end
	end

	for iter_16_4, iter_16_5 in pairs(arg_16_0.buffTFs) do
		if table.contains(arg_16_0.strategyList, iter_16_4) then
			setActive(iter_16_5:Find("selected"), true)

			local var_16_6 = table.indexof(arg_16_0.strategyList, iter_16_4)

			setImageSprite(iter_16_5:Find("selected/counter"), LoadSprite("ui/cluebuffselectui_atlas", "buff_n_" .. var_16_6), true)
		else
			setActive(iter_16_5:Find("selected"), false)
		end
	end

	setActive(arg_16_0.detailBtn, #arg_16_0.strategyList > 0)

	if arg_16_0.ptAwardTF then
		setActive(arg_16_0.ptAwardTF:Find("boost"), #arg_16_0.strategyList > 0)
		setText(arg_16_0.ptAwardTF:Find("boost/boost"), "+" .. 5 * #arg_16_0.strategyList .. "%")
	end

	local var_16_7 = table.concat({
		unpack(arg_16_0.strategyList)
	}, "|")

	PlayerPrefs.SetString(var_0_0.PLYAER_PREF_KEY .. arg_16_0.singleID, var_16_7)
	setText(arg_16_0:findTF("Stage/text_stage_buff_count"), "(" .. #arg_16_0.strategyList .. "/" .. var_16_0.strategy_num .. ")")
end

function var_0_0.UpdateCluePanel(arg_17_0)
	local var_17_0 = ActivityConst.Valleyhospital_ACT_ID
	local var_17_1 = getProxy(PlayerProxy):getRawData().id
	local var_17_2 = PlayerPrefs.GetInt("investigatingGroupId_" .. var_17_0 .. "_" .. var_17_1, 0)
	local var_17_3 = true
	local var_17_4
	local var_17_5 = 0
	local var_17_6 = pg.activity_clue

	if var_17_2 ~= 0 then
		local var_17_7 = var_17_6.get_id_list_by_group[var_17_2]

		var_17_4 = {
			var_17_6[var_17_7[1]],
			var_17_6[var_17_7[2]],
			var_17_6[var_17_7[3]]
		}
		var_17_5 = getProxy(TaskProxy):getTaskVO(tonumber(var_17_4[3].task_id)):getProgress()

		for iter_17_0 = 1, 3 do
			if not getProxy(TaskProxy):getFinishTaskById(tonumber(var_17_4[iter_17_0].task_id)) then
				var_17_3 = false

				break
			end
		end
	end

	if var_17_3 then
		setText(arg_17_0:findTF("target/Text", arg_17_0.explore), i18n("clue_unselect_tip"))
	else
		setText(arg_17_0:findTF("target/Text", arg_17_0.explore), var_17_4[1].unlock_desc .. var_17_4[1].unlock_num .. "/" .. var_17_4[2].unlock_num .. "/" .. var_17_4[3].unlock_num .. i18n("clue_task_tip", var_17_5))
	end
end

function var_0_0.updateDetailView(arg_18_0)
	local var_18_0 = pg.activity_single_enemy[arg_18_0.singleID]
	local var_18_1 = {}

	for iter_18_0, iter_18_1 in ipairs(arg_18_0.strategyList) do
		table.insert(var_18_1, iter_18_1)
	end

	for iter_18_2, iter_18_3 in ipairs(arg_18_0.strategyList) do
		if iter_18_3 >= var_0_0.SP_STRA_MIN_RANGE and iter_18_3 <= var_0_0.SP_STRA_MAX_RANGE then
			table.insert(var_18_1, var_0_0.SP_STRATEGY_ID)

			break
		end
	end

	local var_18_2 = pg.strategy_data_template

	arg_18_0.detailList:make(function(arg_19_0, arg_19_1, arg_19_2)
		if arg_19_0 == UIItemList.EventUpdate then
			local var_19_0 = var_18_1[arg_19_1 + 1]
			local var_19_1 = var_18_2[var_19_0]

			GetImageSpriteFromAtlasAsync("strategyicon/" .. var_19_1.icon, "", arg_19_2:Find("icon"))
			setText(arg_19_2:Find("textBG/name"), var_19_1.name)
			setText(arg_19_2:Find("textBG/desc"), var_19_1.desc)
		end
	end)
	arg_18_0.detailList:align(#var_18_1)
end

function var_0_0.SetStageID(arg_20_0, arg_20_1)
	arg_20_0.singleID = arg_20_1

	local var_20_0 = pg.activity_single_enemy[arg_20_0.singleID]
	local var_20_1 = pg.strategy_data_template

	setText(arg_20_0.stageName, var_20_0.name)
	setText(arg_20_0.stageLV, var_20_0.level)
	setText(arg_20_0:findTF("Stage/text_stage_PTBoost"), i18n("clue_buff_pt_boost", var_20_0.strategy_num))

	local var_20_2 = var_20_0.strategy_id

	for iter_20_0, iter_20_1 in ipairs(var_20_2) do
		local var_20_3 = cloneTplTo(arg_20_0.buffTmp, arg_20_0.buffContainer)

		setActive(var_20_3, true)

		local var_20_4 = var_20_1[iter_20_1]

		GetImageSpriteFromAtlasAsync("strategyicon/" .. var_20_4.icon, "", var_20_3:Find("icon"))
		setActive(var_20_3:Find("selected"), false)
		onButton(arg_20_0, var_20_3, function()
			arg_20_0:onStrategyClick(iter_20_1)
		end)

		arg_20_0.buffTFs[iter_20_1] = var_20_3
	end

	setImageSprite(arg_20_0:findTF("Stage/stage_icon"), LoadSprite("ui/cluebuffselectui_atlas", var_20_0.icon), true)

	if var_20_0.type >= BossSingleVariableEnemyData.TYPE.SP then
		setActive(arg_20_0:findTF("Stage/stage_type_icon"), false)
		setActive(arg_20_0.ticket, true)
		setActive(arg_20_0.ticketTips, true)
		GetImageSpriteFromAtlasAsync(pg.item_virtual_data_statistics[var_20_0.enter_cost].icon, "", arg_20_0.ticket:Find("icon"), true)

		local var_20_5 = getProxy(ActivityProxy):getActivityById(ActivityConst.Valleyhospital_ACT_ID)

		setText(arg_20_0.ticket:Find("count"), var_20_5.data1)
	else
		setActive(arg_20_0:findTF("Stage/stage_type_icon"), true)
		setActive(arg_20_0.ticket, false)
		setActive(arg_20_0.ticketTips, false)
		setImageSprite(arg_20_0:findTF("Stage/stage_type_icon"), LoadSprite("ui/cluebuffselectui_atlas", "tier_" .. var_20_0.type), true)

		arg_20_0.useTicket = false

		setActive(arg_20_0.ticketCheckBox, arg_20_0.useTicket)

		arg_20_0.contextData.useTicket = arg_20_0.useTicket
	end

	local var_20_6 = pg.expedition_data_template[var_20_0.expedition_id].award_display

	arg_20_0:updateAwards(var_20_6, arg_20_0.awards, arg_20_0.awardTpl)
end

function var_0_0.UpdateTicket(arg_22_0)
	if getProxy(ActivityProxy):getActivityById(ActivityConst.Valleyhospital_ACT_ID).data1 <= 0 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("clue_buff_empty_ticket"))
	else
		arg_22_0.useTicket = not arg_22_0.useTicket

		setActive(arg_22_0.ticketCheckBox, arg_22_0.useTicket)

		arg_22_0.contextData.useTicket = arg_22_0.useTicket
	end
end

function var_0_0.SetPreSelectedBuff(arg_23_0, arg_23_1)
	arg_23_0.preSelectedBuffList = {}

	for iter_23_0, iter_23_1 in ipairs(arg_23_1) do
		table.insert(arg_23_0.preSelectedBuffList, iter_23_1)
	end
end

function var_0_0.onStrategyClick(arg_24_0, arg_24_1)
	for iter_24_0, iter_24_1 in ipairs(arg_24_0.strategyList) do
		if iter_24_1 == arg_24_1 then
			table.remove(arg_24_0.strategyList, iter_24_0)
			table.remove(arg_24_0.contextData.selectedBuffList, iter_24_0)
			arg_24_0:updateBuffView()

			return
		end
	end

	arg_24_0:selectBuff(arg_24_1)
end

function var_0_0.selectBuff(arg_25_0, arg_25_1)
	local var_25_0 = pg.activity_single_enemy[arg_25_0.singleID]

	if #arg_25_0.strategyList >= var_25_0.strategy_num then
		pg.TipsMgr.GetInstance():ShowTips(i18n("clue_buff_reach_max"))

		return
	end

	table.insert(arg_25_0.strategyList, arg_25_1)
	table.insert(arg_25_0.contextData.selectedBuffList, arg_25_1)
	arg_25_0:updateBuffView()
end

function var_0_0.updateAwards(arg_26_0, arg_26_1, arg_26_2, arg_26_3)
	for iter_26_0 = 1, #arg_26_1 do
		local var_26_0 = cloneTplTo(arg_26_3, arg_26_2)
		local var_26_1 = arg_26_1[iter_26_0]
		local var_26_2 = {
			type = var_26_1[1],
			id = var_26_1[2],
			count = var_26_1[3]
		}

		if var_26_1[2] == var_0_0.BOOST_ITEM_ID then
			arg_26_0.ptAwardTF = var_26_0
		end

		updateDrop(findTF(var_26_0, "mask"), var_26_2)
		onButton(arg_26_0, var_26_0, function()
			local var_27_0 = Item.getConfigData(var_26_1[2])
			local var_27_1 = {
				[99] = true
			}

			if var_27_0 and var_27_1[var_27_0.type] then
				local var_27_2 = var_27_0.display_icon
				local var_27_3 = {}

				for iter_27_0, iter_27_1 in ipairs(var_27_2) do
					local var_27_4 = iter_27_1[1]
					local var_27_5 = iter_27_1[2]

					var_27_3[#var_27_3 + 1] = {
						hideName = true,
						type = var_27_4,
						id = var_27_5
					}
				end

				arg_26_0:emit(var_0_0.ON_DROP_LIST, {
					item2Row = true,
					itemList = var_27_3,
					content = var_27_0.display
				})
			else
				arg_26_0:emit(BaseUI.ON_DROP, var_26_2)
			end
		end, SFX_PANEL)
	end
end

function var_0_0.willExit(arg_28_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_28_0._tf, arg_28_0._parentTf)
end

function var_0_0.onBackPressed(arg_29_0)
	if isActive(arg_29_0.detailView) then
		arg_29_0:closeDetailView()
	else
		arg_29_0:closeView()
	end
end

return var_0_0
