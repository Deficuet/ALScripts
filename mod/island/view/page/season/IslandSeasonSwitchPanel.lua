local var_0_0 = class("IslandSeasonSwitchPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonSwitchPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.frame = arg_2_0._tf:Find("frame")
	arg_2_0.uiList = UIItemList.New(arg_2_0._tf:Find("frame/filter_panel/list/content"), arg_2_0._tf:Find("frame/filter_panel/list/content/tpl"))
	arg_2_0.selectorPanel = arg_2_0._tf:Find("frame/filter_panel")
	arg_2_0.fliterBtn = arg_2_0._tf:Find("frame/filter")
	arg_2_0.filterTxt = arg_2_0.fliterBtn:Find("Text"):GetComponent(typeof(Text))
end

function var_0_0.OnInit(arg_3_0)
	onButton(arg_3_0, arg_3_0.fliterBtn, function()
		arg_3_0.isOpen = not arg_3_0.isOpen

		arg_3_0:UpdateSelector()
	end, SFX_PANEL)
	arg_3_0.uiList:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventInit then
			arg_3_0:UpdateItem(arg_5_1, arg_5_2)
		end
	end)
end

function var_0_0.Show(arg_6_0, arg_6_1, arg_6_2)
	var_0_0.super.Show(arg_6_0)

	arg_6_0.callback = arg_6_2
	arg_6_0.isOpen = false

	arg_6_0:UpdateSelector()

	local var_6_0 = pg.island_season[arg_6_1].name_short

	arg_6_0.filterTxt.text = var_6_0
end

function var_0_0.UpdateSelector(arg_7_0)
	if arg_7_0.isOpen then
		local var_7_0 = IslandSeasonAgency.GetCurrentSeason() - 1

		arg_7_0.uiList:align(var_7_0 or 0)
	end

	setActive(arg_7_0.selectorPanel, arg_7_0.isOpen)
end

function var_0_0.Hide(arg_8_0)
	var_0_0.super.Hide(arg_8_0)

	if arg_8_0.isOpen then
		arg_8_0.isOpen = false

		arg_8_0:UpdateSelector()
	end
end

function var_0_0.UpdateItem(arg_9_0, arg_9_1, arg_9_2)
	local var_9_0 = arg_9_1 + 1
	local var_9_1 = pg.island_season[var_9_0].name_short

	setText(arg_9_2, var_9_1)
	onButton(arg_9_0, arg_9_2, function()
		arg_9_0.filterTxt.text = var_9_1

		if arg_9_0.callback then
			arg_9_0.callback(var_9_0)
		end
	end, SFX_PANEL)
end

return var_0_0
