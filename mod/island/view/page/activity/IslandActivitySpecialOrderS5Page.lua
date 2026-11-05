local var_0_0 = class("IslandActivitySpecialOrderS5Page", import(".IslandActivitySpecialOrderPage"))

function var_0_0.getTabTipMapList(arg_1_0)
	return {
		{
			"island_spoperation_btn_2611_2",
			"island_spoperation_tip_2611_3"
		},
		{
			"island_spoperation_btn_2611_1",
			"island_spoperation_tip_2611_2"
		},
		{
			"island_spoperation_btn_2611_3",
			"island_spoperation_tip_2611_1"
		}
	}
end

function var_0_0.getItemTipPrefix(arg_2_0)
	return "island_spoperation_item_2611_"
end

function var_0_0.OnFirstFlush(arg_3_0)
	var_0_0.super.OnFirstFlush(arg_3_0)
	setActive(arg_3_0.rtTitle:Find("level"), false)
end

function var_0_0.OnShowFlush(arg_4_0)
	quickPlayAnimation(arg_4_0._tf, "Anim_IslandActivitySpecialOrderS5Page_in")
	triggerToggle(arg_4_0.rtTabs:GetChild((arg_4_0.index or 1) - 1), true)
end

return var_0_0
