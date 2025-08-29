local var_0_0 = class("IslandSeasonSwitchPanel", import("view.base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "IslandSeasonSwitchPanel"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.titleToggle = arg_2_0._tf:Find("toggle")
	arg_2_0.titleTF = arg_2_0.titleToggle:Find("Text")
	arg_2_0.uiList = UIItemList.New(arg_2_0._tf:Find("list"), arg_2_0._tf:Find("list/tpl"))
end

function var_0_0.OnInit(arg_3_0)
	arg_3_0.uiList:make(function(arg_4_0, arg_4_1, arg_4_2)
		if arg_4_0 == UIItemList.EventInit then
			arg_3_0:UpdateItem(arg_4_1, arg_4_2)
		end
	end)
	arg_3_0.uiList:align(arg_3_0.contextData.count or 0)
end

function var_0_0.Show(arg_5_0)
	var_0_0.super.Show(arg_5_0)

	arg_5_0.selectedIdx = arg_5_0.contextData.defaultSelId or 1

	triggerToggle(arg_5_0.uiList.container:Find(tostring(arg_5_0.selectedIdx)), true)
end

function var_0_0.UpdateItem(arg_6_0, arg_6_1, arg_6_2)
	local var_6_0 = arg_6_1 + 1

	arg_6_2.name = var_6_0

	setText(arg_6_2:Find("content/Text"), var_6_0)
	onToggle(arg_6_0, arg_6_2, function(arg_7_0)
		if arg_7_0 then
			arg_6_0.selectedIdx = var_6_0

			arg_6_0:UpdateTitle()
			existCall(arg_6_0.contextData.onSelected, var_6_0)
		end

		triggerToggle(arg_6_0.titleToggle, false)
	end, SFX_PANEL)
end

function var_0_0.UpdateTitle(arg_8_0)
	setText(arg_8_0.titleTF, string.format("第%d赛季", arg_8_0.selectedIdx))
end

return var_0_0
