local var_0_0 = class("IslandActivitySpecialOrderPage", import("Mod.Island.View.page.activity.IslandBaseActivityPage"))

function var_0_0.OnInit(arg_1_0)
	local var_1_0 = arg_1_0._tf:GetComponent(typeof(ItemList)).prefabItem:ToTable()

	for iter_1_0, iter_1_1 in ipairs({
		"rtPages",
		"rtTitle",
		"rtTabs",
		"rtTabTpl"
	}) do
		arg_1_0[iter_1_1] = var_1_0[iter_1_0].transform
	end
end

function var_0_0.OnDataSetting(arg_2_0)
	return
end

function var_0_0.getTabTipMapList(arg_3_0)
	return {
		{
			"island_spoperation_btn_2509_1",
			"island_spoperation_tip_2509_3"
		},
		{
			"island_spoperation_btn_2509_2",
			"island_spoperation_tip_2509_2"
		},
		{
			"island_spoperation_btn_2509_3",
			"island_spoperation_tip_2509_1"
		}
	}
end

function var_0_0.getItemTipPrefix(arg_4_0)
	return "island_spoperation_item_2509_"
end

function var_0_0.OnFirstFlush(arg_5_0)
	local var_5_0 = arg_5_0:getTabTipMapList()

	UIItemList.StaticAlign(arg_5_0.rtTabs, arg_5_0.rtTabTpl, #var_5_0, function(arg_6_0, arg_6_1, arg_6_2)
		arg_6_1 = arg_6_1 + 1

		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0, var_6_1 = unpack(var_5_0[arg_6_1])

			setText(arg_6_2:Find("on/Text"), i18n(var_6_0))
			setText(arg_6_2:Find("off/Text"), i18n(var_6_0))
			setActive(arg_6_2:Find("line"), arg_6_1 < #var_5_0)
			onToggle(arg_5_0, arg_6_2, function(arg_7_0)
				if arg_7_0 then
					arg_5_0.index = arg_6_1

					eachChild(arg_5_0.rtPages, function(arg_8_0, arg_8_1)
						arg_8_1 = arg_8_1 + 1

						setActive(arg_8_0, arg_6_1 == arg_8_1)
					end)
					setText(arg_5_0.rtTitle:Find("Text"), i18n(var_6_1))
					eachChild(arg_5_0.rtPages:GetChild(arg_6_1 - 1):Find("content"), function(arg_9_0, arg_9_1)
						local var_9_0 = arg_9_0:Find("tpl")
						local var_9_1 = {}

						if arg_9_1 > 0 then
							table.insert(var_9_1, function(arg_10_0)
								setCanvasGroupAlpha(var_9_0, 0)
								LeanTween.delayedCall(arg_9_1 * 0.08, System.Action(arg_10_0))
							end)
						end

						seriesAsync(var_9_1, function()
							if arg_5_0._state == var_0_0.STATES.DESTROY then
								return
							end

							quickPlayAnimation(var_9_0, "Anim_IslandActivitySpecialOrderPageTPl_in")
						end)
					end)
				end
			end, SFX_PANEL)

			if arg_6_1 == 1 then
				triggerToggle(arg_6_2, true)
			end
		end
	end)
	setText(arg_5_0.rtTitle:Find("level/Text"), i18n("island_spoperation_level_2509_1"))
	eachChild(arg_5_0.rtPages:Find("page_2/content"), function(arg_12_0, arg_12_1)
		arg_12_1 = arg_12_1 + 1

		setText(arg_12_0:Find("tpl/name"), i18n(arg_5_0:getItemTipPrefix() .. arg_12_1))
	end)
end

function var_0_0.OnUpdateFlush(arg_13_0)
	return
end

function var_0_0.OnShowFlush(arg_14_0)
	quickPlayAnimation(arg_14_0._tf, "Anim_IslandActivitySpecialOrderPage_in")
	triggerToggle(arg_14_0.rtTabs:GetChild((arg_14_0.index or 1) - 1), true)
end

return var_0_0
