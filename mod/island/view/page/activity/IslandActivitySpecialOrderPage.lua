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

function var_0_0.OnFirstFlush(arg_3_0)
	local var_3_0 = {
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

	UIItemList.StaticAlign(arg_3_0.rtTabs, arg_3_0.rtTabTpl, #var_3_0, function(arg_4_0, arg_4_1, arg_4_2)
		arg_4_1 = arg_4_1 + 1

		if arg_4_0 == UIItemList.EventUpdate then
			local var_4_0, var_4_1 = unpack(var_3_0[arg_4_1])

			setText(arg_4_2:Find("on/Text"), i18n(var_4_0))
			setText(arg_4_2:Find("off/Text"), i18n(var_4_0))
			setActive(arg_4_2:Find("line"), arg_4_1 < #var_3_0)
			onToggle(arg_3_0, arg_4_2, function(arg_5_0)
				if arg_5_0 then
					arg_3_0.index = arg_4_1

					eachChild(arg_3_0.rtPages, function(arg_6_0, arg_6_1)
						arg_6_1 = arg_6_1 + 1

						setActive(arg_6_0, arg_4_1 == arg_6_1)
					end)
					setText(arg_3_0.rtTitle:Find("Text"), i18n(var_4_1))
					eachChild(arg_3_0.rtPages:GetChild(arg_4_1 - 1):Find("content"), function(arg_7_0, arg_7_1)
						local var_7_0 = arg_7_0:Find("tpl")
						local var_7_1 = {}

						if arg_7_1 > 0 then
							table.insert(var_7_1, function(arg_8_0)
								setCanvasGroupAlpha(var_7_0, 0)
								LeanTween.delayedCall(arg_7_1 * 0.08, System.Action(arg_8_0))
							end)
						end

						seriesAsync(var_7_1, function()
							if arg_3_0._state == var_0_0.STATES.DESTROY then
								return
							end

							quickPlayAnimation(var_7_0, "Anim_IslandActivitySpecialOrderPageTPl_in")
						end)
					end)
				end
			end, SFX_PANEL)
		end
	end)
	setText(arg_3_0.rtTitle:Find("level/Text"), i18n("island_spoperation_level_2509_1"))
	eachChild(arg_3_0.rtPages:Find("page_2/content"), function(arg_10_0, arg_10_1)
		arg_10_1 = arg_10_1 + 1

		setText(arg_10_0:Find("tpl/name"), i18n("island_spoperation_item_2509_" .. arg_10_1))
	end)
end

function var_0_0.OnUpdateFlush(arg_11_0)
	return
end

function var_0_0.OnShowFlush(arg_12_0)
	quickPlayAnimation(arg_12_0._tf, "Anim_IslandActivitySpecialOrderPage_in")
	triggerToggle(arg_12_0.rtTabs:GetChild((arg_12_0.index or 1) - 1), true)
end

return var_0_0
