local var_0_0 = class("CommanderHomeLevelInfoPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderHomeLevelUI"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.close = arg_2_0._tf:Find("bg/frame/close_btn")
	arg_2_0.scrollrect = arg_2_0._tf:Find("bg/frame/scrollrect"):GetComponent("LScrollRect")
	arg_2_0.levelTxt = arg_2_0._tf:Find("bg/frame/level/Text"):GetComponent(typeof(Text))
	arg_2_0.descPanel = arg_2_0._tf:Find("desc_panel")
	arg_2_0.descLevelTxt = arg_2_0.descPanel:Find("frame/level"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0.descPanel:Find("frame/Text"):GetComponent(typeof(Text))
	arg_2_0.expTxt = arg_2_0._tf:Find("bg/frame/level/exp"):GetComponent(typeof(Text))

	setText(arg_2_0._tf:Find("bg/frame/level/label"), i18n("commander_home_level_label"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.cards = {}

	function arg_3_0.scrollrect.onInitItem(arg_4_0)
		arg_3_0:OnInitItem(arg_4_0)
	end

	function arg_3_0.scrollrect.onUpdateItem(arg_5_0, arg_5_1)
		arg_3_0:OnUpdateItem(arg_5_0, arg_5_1)
	end

	onButton(arg_3_0, arg_3_0.descPanel, function()
		arg_3_0:CloseDescWindow()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
	onButton(arg_3_0, arg_3_0.close, function()
		arg_3_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.OnInitItem(arg_9_0, arg_9_1)
	local var_9_0 = CommanderHomeLevelCard.New(arg_9_1, arg_9_0)

	arg_9_0.cards[arg_9_1] = var_9_0
end

function var_0_0.OnUpdateItem(arg_10_0, arg_10_1, arg_10_2)
	local var_10_0 = arg_10_0.cards[arg_10_2]

	if not var_10_0 then
		arg_10_0:OnInitItem(arg_10_2)

		var_10_0 = arg_10_0.cards[arg_10_2]
	end

	local var_10_1 = arg_10_0.displays[arg_10_1 + 1]

	var_10_0:Update(arg_10_0.home, var_10_1)
end

function var_0_0.Show(arg_11_0, arg_11_1)
	var_0_0.super.Show(arg_11_0)

	arg_11_0.home = arg_11_1

	arg_11_0:InitMainView()
end

function var_0_0.InitMainView(arg_12_0)
	local var_12_0 = arg_12_0.home

	arg_12_0.levelTxt.text = "LV." .. var_12_0:GetLevel()

	if var_12_0:IsMaxLevel() then
		arg_12_0.expTxt.text = "EXP MAX"
	else
		arg_12_0.expTxt.text = "EXP " .. var_12_0.exp .. "/" .. var_12_0:GetNextLevelExp()
	end

	local var_12_1 = var_12_0:GetAllLevel()

	arg_12_0.displays = {}

	local var_12_2 = var_12_0:bindConfigTable()

	for iter_12_0, iter_12_1 in ipairs(var_12_1) do
		local var_12_3 = var_12_2[iter_12_1]
		local var_12_4 = var_12_0:GetTargetExpForLevel(iter_12_1)

		table.insert(arg_12_0.displays, {
			level = var_12_3.level,
			totalExp = var_12_4,
			tail = iter_12_0 == #var_12_1,
			exp = var_12_3.home_exp,
			desc = var_12_2[iter_12_1].desc
		})
	end

	arg_12_0.scrollrect:SetTotalCount(#arg_12_0.displays)
end

function var_0_0.ShowDescWindow(arg_13_0, arg_13_1, arg_13_2)
	setActive(arg_13_0.descPanel, true)

	arg_13_0.descTxt.text = arg_13_1
	arg_13_0.descLevelTxt.text = "LV." .. arg_13_2
end

function var_0_0.CloseDescWindow(arg_14_0)
	setActive(arg_14_0.descPanel, false)
end

function var_0_0.OnDestroy(arg_15_0)
	for iter_15_0, iter_15_1 in pairs(arg_15_0.cards) do
		iter_15_1:Dispose()
	end
end

return var_0_0
