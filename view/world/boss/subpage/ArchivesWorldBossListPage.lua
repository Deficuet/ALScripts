local var_0_0 = class("ArchivesWorldBossListPage", import("view.base.BaseSubView"))
local var_0_1 = 1
local var_0_2 = 2

function var_0_0.getUIName(arg_1_0)
	return "ArchivesWorldBossListUI"
end

function var_0_0.Setup(arg_2_0, arg_2_1)
	arg_2_0.proxy = arg_2_1
end

function var_0_0.OnSwitchArchives(arg_3_0)
	arg_3_0.isInit = false

	if arg_3_0.key then
		arg_3_0:Filter(arg_3_0.key)
	end
end

function var_0_0.OnGetMetaAwards(arg_4_0)
	if arg_4_0.prevCard then
		local var_4_0 = arg_4_0.prevCard.data

		arg_4_0:UpdateAwards(var_4_0)

		if arg_4_0.key and not var_4_0.progress.metaPtData:CanGetNextAward() then
			arg_4_0:OnSwitchArchives()
		end

		arg_4_0.prevCard:Update(arg_4_0.prevCard.data)
	end
end

function var_0_0.OnLoaded(arg_5_0)
	arg_5_0.toggles = {
		[var_0_2] = arg_5_0._tf:Find("filter/finish"),
		[var_0_1] = arg_5_0._tf:Find("filter/parse")
	}
	arg_5_0.filterTr = arg_5_0._tf:Find("filter")
	arg_5_0.mainTr = arg_5_0._tf:Find("main")
	arg_5_0.scrollRect = arg_5_0._tf:Find("main/list/scrollrect"):GetComponent("LScrollRect")
	arg_5_0.paintingTr = arg_5_0._tf:Find("main/paint")
	arg_5_0.openTr = arg_5_0._tf:Find("main/open")
	arg_5_0.ptIcon = arg_5_0._tf:Find("main/award/pt/icon")
	arg_5_0.ptTr = arg_5_0._tf:Find("main/award/pt/Text"):GetComponent(typeof(Text))
	arg_5_0.getAllBtn = arg_5_0._tf:Find("main/award/get_all")
	arg_5_0.awardScrollrect = arg_5_0._tf:Find("main/award/scrollrect"):GetComponent("LScrollRect")
	arg_5_0.awardArrTr = arg_5_0._tf:Find("main/award/arr")
	arg_5_0.emptyTr = arg_5_0._tf:Find("empty")
	arg_5_0.emptyFinishTr = arg_5_0._tf:Find("empty_finsih")
	arg_5_0.backBtn = arg_5_0._tf:Find("blur_panel/adapt/top/back")
	arg_5_0.msgBox = ArchivesWorldBossMsgboxPage.New(arg_5_0._parentTf.parent, arg_5_0.event)

	setText(arg_5_0._tf:Find("main/award/pt/label"), i18n("meta_syn_value_label"))
end

function var_0_0.OnInit(arg_6_0)
	onButton(arg_6_0, arg_6_0.backBtn, function()
		arg_6_0:emit(WorldBossScene.ON_QUIT_ARCHIVES_LIST)
	end, SFX_CANCEL)
	onButton(arg_6_0, arg_6_0._tf:Find("help"), function()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.world_archives_boss_list_help.tip
		})
	end, SFX_CANCEL)

	arg_6_0.cards = {}

	function arg_6_0.scrollRect.onInitItem(arg_9_0)
		arg_6_0:OnInitItem(arg_9_0)
	end

	function arg_6_0.scrollRect.onUpdateItem(arg_10_0, arg_10_1)
		arg_6_0:OnUpdateItem(arg_10_0, arg_10_1)
	end

	function arg_6_0.awardScrollrect.onInitItem(arg_11_0)
		arg_6_0:OnInitAwardItem(arg_11_0)
	end

	function arg_6_0.awardScrollrect.onUpdateItem(arg_12_0, arg_12_1)
		arg_6_0:OnUpdateAwardItem(arg_12_0, arg_12_1)
	end

	arg_6_0.awardScrollrect.onValueChanged:AddListener(function(arg_13_0)
		setActive(arg_6_0.awardArrTr, arg_13_0.x < 0.97)
	end)

	for iter_6_0, iter_6_1 in pairs(arg_6_0.toggles) do
		onToggle(arg_6_0, iter_6_1, function(arg_14_0)
			arg_6_0.isInit = false

			if arg_14_0 then
				arg_6_0:Filter(iter_6_0)
			end
		end, SFX_PANEL)
	end

	if arg_6_0._tf:Find("empty_finsih") then
		GetComponent(arg_6_0._tf:Find("empty_finsih"), typeof(Image)):SetNativeSize()
	end
end

function var_0_0.Filter(arg_15_0, arg_15_1)
	local var_15_0 = WorldBossConst.GetAchieveBossList()

	arg_15_0.displays = {}

	local var_15_1 = {}

	for iter_15_0, iter_15_1 in pairs(var_15_0) do
		local var_15_2 = getProxy(MetaCharacterProxy):getMetaProgressVOByID(iter_15_1.meta_id)
		local var_15_3 = var_15_2:getMetaProgressPTState()
		local var_15_4 = not var_15_2.metaPtData:CanGetNextAward()

		if arg_15_1 == var_0_2 and var_15_4 then
			table.insert(arg_15_0.displays, {
				id = iter_15_1.id,
				progress = var_15_2
			})
		elseif arg_15_1 == var_0_1 and not var_15_4 then
			table.insert(arg_15_0.displays, {
				id = iter_15_1.id,
				progress = var_15_2
			})
		end

		var_15_1[iter_15_1.id] = var_15_3
	end

	local var_15_5 = WorldBossConst.GetArchivesId()

	table.sort(arg_15_0.displays, function(arg_16_0, arg_16_1)
		local var_16_0 = arg_16_0.id == var_15_5 and 1 or 0
		local var_16_1 = arg_16_1.id == var_15_5 and 1 or 0

		if var_16_0 == var_16_1 then
			local var_16_2 = var_15_1[arg_16_0.id]
			local var_16_3 = var_15_1[arg_16_1.id]

			if var_16_2 == var_16_3 then
				return arg_16_0.progress.configId < arg_16_1.progress.configId
			else
				return var_16_3 < var_16_2
			end
		else
			return var_16_1 < var_16_0
		end
	end)

	arg_15_0.key = arg_15_1

	local var_15_6 = #arg_15_0.displays <= 0

	setActive(arg_15_0.emptyTr, var_15_6 and arg_15_1 == var_0_1)
	setActive(arg_15_0.emptyFinishTr, var_15_6 and arg_15_1 == var_0_2)
	setActive(arg_15_0.mainTr, not var_15_6)
	arg_15_0.scrollRect:SetTotalCount(#arg_15_0.displays)
end

function var_0_0.Update(arg_17_0)
	arg_17_0:Show()
	triggerToggle(arg_17_0.toggles[var_0_1], true)
end

function var_0_0.OnInitItem(arg_18_0, arg_18_1)
	local var_18_0 = ArchivesWorldBossCard.New(arg_18_1)

	onButton(arg_18_0, var_18_0._tf, function()
		if arg_18_0.prevCard == var_18_0 and arg_18_0.isInit then
			return
		end

		if arg_18_0.prevCard then
			arg_18_0.prevCard:UnSelect()
		end

		var_18_0:Select()
		arg_18_0:ClickCard(var_18_0.data)

		arg_18_0.prevCard = var_18_0
		arg_18_0.prevBossId = var_18_0.bossId
	end, SFX_PANEL)

	arg_18_0.cards[arg_18_1] = var_18_0
end

function var_0_0.OnUpdateItem(arg_20_0, arg_20_1, arg_20_2)
	local var_20_0 = arg_20_0.cards[arg_20_2]

	if not var_20_0 then
		arg_20_0:OnInitItem(arg_20_2)

		var_20_0 = arg_20_0.cards[arg_20_2]
	end

	local var_20_1 = arg_20_0.displays[arg_20_1 + 1]

	var_20_0:Update(var_20_1)

	if arg_20_0.prevBossId and arg_20_0.prevBossId == var_20_0.bossId then
		var_20_0:Select()
	else
		var_20_0:UnSelect()
	end

	if arg_20_1 == 0 and not arg_20_0.isInit then
		triggerButton(var_20_0._tf)

		arg_20_0.isInit = true
	end
end

function var_0_0.ClickCard(arg_21_0, arg_21_1)
	arg_21_0:UpdateMain(arg_21_1)
	arg_21_0:UpdateAwards(arg_21_1)
end

function var_0_0.UpdateMain(arg_22_0, arg_22_1)
	local var_22_0 = arg_22_1.progress.id

	setMetaPaintingPrefabAsync(arg_22_0.paintingTr, var_22_0, "archives")

	local var_22_1 = WorldBossConst.GetArchivesId()
	local var_22_2 = arg_22_1.id == var_22_1 or arg_22_1.progress.metaPtData:IsMaxPt()

	setActive(arg_22_0.openTr, not var_22_2)

	if var_22_2 then
		removeOnButton(arg_22_0.openTr)
	else
		onButton(arg_22_0, arg_22_0.openTr, function()
			arg_22_0:Switch(arg_22_1)
		end, SFX_PANEL)
	end
end

function var_0_0.Switch(arg_24_0, arg_24_1)
	local var_24_0 = WorldBossConst.GetAchieveState()

	if var_24_0 == WorldBossConst.ACHIEVE_STATE_NOSTART then
		arg_24_0:emit(WorldBossMediator.ON_SWITCH_ARCHIVES, arg_24_1.id)
	elseif var_24_0 == WorldBossConst.ACHIEVE_STATE_STARTING then
		local var_24_1 = WorldBossConst.GetArchivesId()
		local var_24_2 = WorldBossConst.BossId2MetaId(var_24_1)
		local var_24_3 = pg.ship_strengthen_meta[var_24_2].ship_id
		local var_24_4 = pg.ship_data_statistics[var_24_3].name

		arg_24_0.msgBox:ExecuteAction("Show", {
			content = i18n("world_boss_switch_archives", var_24_4),
			onYes = function()
				arg_24_0:emit(WorldBossMediator.ON_SWITCH_ARCHIVES, arg_24_1.id)
			end
		})
	end
end

function var_0_0.UpdateAwards(arg_26_0, arg_26_1)
	local var_26_0 = arg_26_1.progress.metaPtData
	local var_26_1 = var_26_0.dropList
	local var_26_2 = var_26_0.targets

	setImageSprite(arg_26_0.ptIcon, LoadSprite(arg_26_1.progress:getPtIconPath()))

	arg_26_0.ptTr.text = var_26_0.count

	local var_26_3 = arg_26_1.progress.metaPtData:CanGetAward()

	setActive(arg_26_0.getAllBtn, var_26_3)

	if not var_26_3 then
		removeOnButton(arg_26_0.getAllBtn)
	else
		onButton(arg_26_0, arg_26_0.getAllBtn, function()
			local var_27_0, var_27_1 = arg_26_0:getOneStepPTAwardLevelAndCount(arg_26_1.progress)

			pg.m02:sendNotification(GAME.GET_META_PT_AWARD, {
				groupID = arg_26_1.progress.id,
				targetCount = var_27_1
			})
		end, SFX_PANEL)
	end

	arg_26_0.awardCards = {}
	arg_26_0.awardDisplays = {}

	for iter_26_0, iter_26_1 in ipairs(var_26_1) do
		table.insert(arg_26_0.awardDisplays, {
			itemInfo = iter_26_1,
			target = var_26_2[iter_26_0],
			level = var_26_0.level,
			count = var_26_0.count,
			unlockPTNum = arg_26_1.progress.unlockPTNum
		})
	end

	arg_26_0.awardScrollrect:SetTotalCount(#arg_26_0.awardDisplays)

	local var_26_4 = math.min(var_26_0.level, #var_26_2 - 5)
	local var_26_5 = arg_26_0.awardScrollrect:HeadIndexToValue(var_26_4)

	arg_26_0.awardScrollrect:ScrollTo(var_26_5)
end

function var_0_0.getOneStepPTAwardLevelAndCount(arg_28_0, arg_28_1)
	local var_28_0 = arg_28_1.metaPtData:GetResProgress()
	local var_28_1 = arg_28_1.metaPtData.targets
	local var_28_2 = arg_28_1:getStoryIndexList()
	local var_28_3 = arg_28_1.unlockPTLevel
	local var_28_4 = 0

	for iter_28_0 = 1, #var_28_1 do
		local var_28_5 = false
		local var_28_6 = false

		if var_28_0 >= var_28_1[iter_28_0] then
			var_28_5 = true
		end

		local var_28_7 = var_28_2[iter_28_0]

		if var_28_7 == 0 then
			var_28_6 = true
		elseif pg.NewStoryMgr.GetInstance():IsPlayed(var_28_7) then
			var_28_6 = true
		end

		if var_28_5 and var_28_6 then
			var_28_4 = iter_28_0
		else
			break
		end
	end

	print("calc max level", var_28_4, var_28_1[var_28_4])

	return var_28_4, var_28_1[var_28_4]
end

function var_0_0.OnInitAwardItem(arg_29_0, arg_29_1)
	local var_29_0 = ArchivesWorldBossAwardCard.New(arg_29_1)

	onButton(arg_29_0, var_29_0.itemTF, function()
		arg_29_0:emit(BaseUI.ON_DROP, var_29_0.dropInfo)
	end, SFX_PANEL)

	arg_29_0.awardCards[arg_29_1] = var_29_0
end

function var_0_0.OnUpdateAwardItem(arg_31_0, arg_31_1, arg_31_2)
	local var_31_0 = arg_31_0.awardCards[arg_31_2]

	if not var_31_0 then
		arg_31_0:OnInitAwardItem(arg_31_2)

		var_31_0 = arg_31_0.awardCards[arg_31_2]
	end

	local var_31_1 = arg_31_0.awardDisplays[arg_31_1 + 1]

	var_31_0:Update(var_31_1, arg_31_1 + 1)
end

function var_0_0.OnDestroy(arg_32_0)
	arg_32_0.scrollRect.onInitItem = nil
	arg_32_0.scrollRect.onUpdateItem = nil
	arg_32_0.awardScrollrect.onInitItem = nil
	arg_32_0.awardScrollrect.onUpdateItem = nil

	arg_32_0.awardScrollrect.onValueChanged:RemoveAllListeners()

	if arg_32_0.msgBox then
		arg_32_0.msgBox:Destroy()

		arg_32_0.msgBox = nil
	end

	for iter_32_0, iter_32_1 in pairs(arg_32_0.cards) do
		iter_32_1:Dispose()
	end

	arg_32_0.cards = nil

	for iter_32_2, iter_32_3 in pairs(arg_32_0.awardCards or {}) do
		iter_32_3:Dispose()
	end

	arg_32_0.awardCards = nil
end

return var_0_0
