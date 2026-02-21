local var_0_0 = class("AttireAchievementPanel", import("...base.BaseSubView"))

local function var_0_1(arg_1_0)
	local var_1_0 = {}

	local function var_1_1(arg_2_0)
		arg_2_0._go = arg_1_0
		arg_2_0._tf = arg_2_0._go.transform
		arg_2_0.info = arg_2_0._tf:Find("info")
		arg_2_0.empty = arg_2_0._tf:Find("empty")
		arg_2_0.icon = arg_2_0._tf:Find("info/icon")
		arg_2_0.now = arg_2_0._tf:Find("info/now")
		arg_2_0.selected = arg_2_0._tf:Find("info/selected")
		arg_2_0.nameTxt = arg_2_0._tf:Find("info/label/Text")
		arg_2_0.tags = {
			arg_2_0._tf:Find("info/tags/new"),
			arg_2_0._tf:Find("info/tags/e")
		}
		arg_2_0.print5 = arg_2_0._tf:Find("prints/line5")
		arg_2_0.print6 = arg_2_0._tf:Find("prints/line6")
	end

	function var_1_0.Update(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
		arg_3_0.trophy = arg_3_1

		if arg_3_0.trophy then
			local var_3_0 = arg_3_0.trophy:isLoverLetter()

			setActive(arg_3_0.icon, not var_3_0)
			setActive(arg_3_0.now, var_3_0)

			if var_3_0 then
				setLoveLetterMedal(arg_3_0.now:Find("medal"), arg_3_0.trophy, {
					hideMark = true
				})
				setText(arg_3_0.nameTxt, arg_3_1:getName())
			else
				LoadImageSpriteAsync("medal/" .. arg_3_1:getConfig("icon"), arg_3_0.icon, true)
				setText(arg_3_0.nameTxt, arg_3_1:getConfig("name"))
			end

			setActive(arg_3_0.tags[1], arg_3_1:isNew())
			arg_3_0:UpdateSelected(arg_3_2)
		end

		setActive(arg_3_0.print5, not arg_3_3)
		setActive(arg_3_0.print6, not arg_3_3)
		setActive(arg_3_0.info, arg_3_0.trophy)
		setActive(arg_3_0.empty, not arg_3_0.trophy)
	end

	function var_1_0.UpdateSelected(arg_4_0, arg_4_1)
		setActive(arg_4_0.selected, arg_4_1)
		setActive(arg_4_0.tags[2], arg_4_1)
	end

	function var_1_0.Dispose(arg_5_0)
		if arg_5_0.now:Find("medal").childCount > 0 then
			returnLoveLetterMedal(arg_5_0.now:Find("medal"):GetChild(0))
		end
	end

	var_1_1(var_1_0)

	return var_1_0
end

local function var_0_2(arg_6_0)
	local var_6_0 = {}

	local function var_6_1(arg_7_0)
		arg_7_0._tf = arg_6_0
		arg_7_0.uiList = UIItemList.New(arg_7_0._tf:Find("list"), arg_7_0._tf:Find("list/tpl"))
	end

	function var_6_0.Update(arg_8_0, arg_8_1)
		arg_8_0.uiList:make(function(arg_9_0, arg_9_1, arg_9_2)
			if arg_9_0 == UIItemList.EventUpdate then
				local var_9_0 = arg_8_1[arg_9_1 + 1]
				local var_9_1 = var_9_0 > 1000000000 and LoveLetterTrophy.New({
					id = var_9_0
				}) or Trophy.New({
					id = var_9_0
				})
				local var_9_2 = findTF(arg_9_2, "icon")
				local var_9_3 = arg_9_2:Find("now")
				local var_9_4 = var_9_1:isLoverLetter()

				setActive(var_9_2, not var_9_4)
				setActive(var_9_3, var_9_4)

				if var_9_4 then
					setLoveLetterMedal(var_9_3:Find("medal"), var_9_1, {
						hideMark = true
					})
				else
					LoadImageSpriteAsync("medal/s_" .. var_9_1:getConfig("icon"), var_9_2, true)
				end
			end
		end)
		arg_8_0.uiList:align(#arg_8_1)
	end

	function var_6_0.Dispose(arg_10_0)
		arg_10_0.uiList:each(function(arg_11_0, arg_11_1)
			if arg_11_1:Find("now/medal").childCount > 0 then
				returnLoveLetterMedal(arg_11_1:Find("now/medal"):GetChild(0))
			end
		end)
	end

	var_6_1(var_6_0)

	return var_6_0
end

function var_0_0.getUIName(arg_12_0)
	return "AttireAchievementUI"
end

function var_0_0.OnInit(arg_13_0)
	arg_13_0.listPanel = arg_13_0._tf:Find("list_panel")
	arg_13_0.scolrect = arg_13_0.listPanel:Find("scrollrect/content"):GetComponent("LScrollRect")
	arg_13_0.totalCount = arg_13_0._tf:Find("total_count/Text"):GetComponent(typeof(Text))
	arg_13_0.selectedTxt = arg_13_0.listPanel:Find("selected_bg/Text"):GetComponent(typeof(Text))
	arg_13_0.toggle = arg_13_0.listPanel:Find("toggle")

	function arg_13_0.scolrect.onInitItem(arg_14_0)
		arg_13_0:OnInitItem(arg_14_0)
	end

	function arg_13_0.scolrect.onUpdateItem(arg_15_0, arg_15_1)
		arg_13_0:OnUpdateItem(arg_15_0, arg_15_1)
	end

	arg_13_0.confirmBtn = arg_13_0._tf:Find("list_panel/confirm")

	onButton(arg_13_0, arg_13_0.confirmBtn, function()
		if #arg_13_0.contextData.selectedMedalList == #arg_13_0.playerVO.displayTrophyList and underscore.all(underscore.keys(arg_13_0.contextData.selectedMedalList), function(arg_17_0)
			return arg_13_0.contextData.selectedMedalList[arg_17_0] == arg_13_0.playerVO.displayTrophyList[arg_17_0]
		end) then
			return
		end

		arg_13_0.event:emit(AttireMediator.ON_CHANGE_MEDAL_DISPLAY, arg_13_0.contextData.selectedMedalList)
	end, SFX_PANEL)

	arg_13_0.descPanel = var_0_2(arg_13_0._tf:Find("desc_panel"))
	arg_13_0.selectMaxLevel = true

	onToggle(arg_13_0, arg_13_0.toggle, function(arg_18_0)
		arg_13_0.selectMaxLevel = arg_18_0

		arg_13_0:Filter()
	end)

	arg_13_0.cards = {}
	arg_13_0.emptyPage = BaseEmptyListPage.New(arg_13_0.listPanel, arg_13_0.event)
end

function var_0_0.UpdateselectedTxt(arg_19_0)
	local var_19_0 = arg_19_0.contextData.selectedMedalList or {}

	arg_19_0.selectedTxt.text = #var_19_0 .. "/5"
end

function var_0_0.OnInitItem(arg_20_0, arg_20_1)
	local var_20_0 = var_0_1(arg_20_1)

	arg_20_0.cards[arg_20_1] = var_20_0

	onButton(arg_20_0, var_20_0._go, function()
		if not var_20_0.trophy then
			return
		end

		local var_21_0 = arg_20_0.contextData.selectedMedalList or {}
		local var_21_1 = var_20_0.trophy.id

		if table.contains(var_21_0, var_21_1) then
			table.removebyvalue(var_21_0, var_21_1)
			var_20_0:UpdateSelected(false)
		elseif #var_21_0 >= 5 then
			return
		else
			table.insert(var_21_0, var_21_1)
			var_20_0:UpdateSelected(true)
		end

		arg_20_0.contextData.selectedMedalList = var_21_0

		arg_20_0.descPanel:Update(arg_20_0.contextData.selectedMedalList)
		arg_20_0:UpdateselectedTxt()
	end, SFX_PANEL)
end

function var_0_0.OnUpdateItem(arg_22_0, arg_22_1, arg_22_2)
	local var_22_0 = arg_22_0.cards[arg_22_2]

	if not var_22_0 then
		arg_22_0:OnInitItem(arg_22_2)

		var_22_0 = arg_22_0.cards[arg_22_2]
	end

	local var_22_1 = arg_22_0.displayVOs[arg_22_1 + 1]
	local var_22_2 = arg_22_1 < arg_22_0.scolrect.content:GetComponent(typeof(GridLayoutGroup)).constraintCount

	if var_22_1 then
		local var_22_3 = table.contains(arg_22_0.contextData.selectedMedalList, var_22_1.id)

		var_22_0:Update(var_22_1, var_22_3, var_22_2)
	else
		var_22_0:Update(var_22_1, false, var_22_2)
	end
end

function var_0_0.Update(arg_23_0, arg_23_1, arg_23_2)
	arg_23_0.playerVO = arg_23_2
	arg_23_0.trophys = arg_23_1.trophys

	for iter_23_0, iter_23_1 in ipairs(arg_23_1.loveTrophys) do
		arg_23_0.trophys[iter_23_1.id] = iter_23_1
	end

	arg_23_0.contextData.selectedMedalList = Clone(arg_23_0.playerVO.displayTrophyList) or {}

	arg_23_0.descPanel:Update(arg_23_0.contextData.selectedMedalList)
	arg_23_0:UpdateselectedTxt()
	arg_23_0:Filter()

	arg_23_0.totalCount.text = arg_23_0:getTotalCnt()

	local var_23_0 = arg_23_0:getTotalCnt()

	if var_23_0 <= 0 then
		arg_23_0.emptyPage:ExecuteAction("ShowOrHide", true)
		arg_23_0.emptyPage:ExecuteAction("SetEmptyText", i18n("decoration_medal_placeholder"))
		arg_23_0.emptyPage:ExecuteAction("SetPosY", {
			x = 0,
			y = 22
		})
		setActive(arg_23_0.listPanel:Find("scrollrect"), false)
	elseif var_23_0 > 0 and arg_23_0.emptyPage:GetLoaded() then
		arg_23_0.emptyPage:ExecuteAction("ShowOrHide", false)
		setActive(arg_23_0.listPanel:Find("scrollrect"), true)
	end
end

function var_0_0.getTotalCnt(arg_24_0)
	local var_24_0 = 0

	for iter_24_0, iter_24_1 in pairs(arg_24_0.trophys) do
		if iter_24_1:isClaimed() and not iter_24_1:isHide() then
			var_24_0 = var_24_0 + 1
		end
	end

	return var_24_0
end

function var_0_0.Filter(arg_25_0)
	arg_25_0.displayVOs = {}

	local function var_25_0(arg_26_0)
		local var_26_0 = arg_25_0.trophys[arg_26_0:getConfig("next")]

		return var_26_0 and var_26_0:isClaimed() and not var_26_0:isHide()
	end

	for iter_25_0, iter_25_1 in pairs(arg_25_0.trophys) do
		if iter_25_1:isClaimed() and not iter_25_1:isHide() and (not arg_25_0.selectMaxLevel or not var_25_0(iter_25_1)) then
			table.insert(arg_25_0.displayVOs, iter_25_1)
		end
	end

	table.sort(arg_25_0.displayVOs, CompareFuncs({
		function(arg_27_0)
			return arg_27_0.id
		end
	}))

	local var_25_1 = arg_25_0.scolrect.content:GetComponent(typeof(GridLayoutGroup)).constraintCount
	local var_25_2 = var_25_1 - #arg_25_0.displayVOs % var_25_1

	if var_25_2 == var_25_1 then
		var_25_2 = 0
	end

	local var_25_3 = var_25_1 * arg_25_0:GetColumn()

	if var_25_3 > #arg_25_0.displayVOs then
		var_25_2 = var_25_3 - #arg_25_0.displayVOs
	end

	for iter_25_2 = 1, var_25_2 do
		table.insert(arg_25_0.displayVOs, false)
	end

	arg_25_0.scolrect:SetTotalCount(#arg_25_0.displayVOs, -1)
end

function var_0_0.GetColumn(arg_28_0)
	return 2
end

function var_0_0.OnDestroy(arg_29_0)
	arg_29_0.descPanel:Dispose()

	if arg_29_0.emptyPage then
		arg_29_0.emptyPage:Destroy()

		arg_29_0.emptyPage = nil
	end

	if arg_29_0.cards then
		for iter_29_0, iter_29_1 in pairs(arg_29_0.cards) do
			iter_29_1:Dispose()
		end

		arg_29_0.cards = nil
	end
end

return var_0_0
