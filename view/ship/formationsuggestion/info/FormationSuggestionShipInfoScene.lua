local var_0_0 = class("FormationSuggestionShipInfoScene", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "FormationSuggestionShipInfoUI"
end

function var_0_0.init(arg_2_0)
	setText(arg_2_0.uiTitleText, i18n("formation_suggestion_info_title"))
	setText(arg_2_0.uiLockText, i18n("formation_suggestion_info_not_get"))
	setText(arg_2_0.uiUnLockText, i18n("formation_suggestion_info_got"))
	setText(arg_2_0.uiGoDockText, i18n("formation_suggestion_info_go_dock"))
	setText(arg_2_0.uiEquipTitleText1, i18n("formation_suggestion_info_equip_recommend"))
	setText(arg_2_0.uiEquipTitleText2, i18n("formation_suggestion_info_equip_transitional"))
	setText(arg_2_0.uiEquipTipText, i18n("formation_suggestion_info_equip_tip"))
	setText(arg_2_0.uiBackText, i18n("formation_suggestion_info_back"))

	arg_2_0.shipView = FormationSuggestionShipItem.New(tf(arg_2_0.uiShipItem), arg_2_0)
	arg_2_0.equipView1 = FormationSuggestionShipEquipPanel.New(tf(arg_2_0.uiEquipPanel1), arg_2_0)
	arg_2_0.equipView2 = FormationSuggestionShipEquipPanel.New(tf(arg_2_0.uiEquipPanel2), arg_2_0, true)

	onButton(arg_2_0, arg_2_0.uiGoDockBtn, function()
		arg_2_0:emit(BaseUI.ON_GO_SCENE, SCENE.DOCKYARD, {
			mode = DockyardScene.MODE_OVERVIEW
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.uiBackBtn, function()
		arg_2_0:closeView()
	end, SOUND_BACK)

	arg_2_0.skillList = UIItemList.New(arg_2_0.uiSkillParent, arg_2_0.uiSkillItem)
	arg_2_0.obtainList = UIItemList.New(arg_2_0.uiObtainParent, arg_2_0.uiObtainItem)
end

function var_0_0.didEnter(arg_5_0)
	arg_5_0:OverlayPanel(arg_5_0._tf, {
		pbList = {
			arg_5_0.uiBlurTf
		}
	})

	arg_5_0.id = arg_5_0.contextData.id

	local var_5_0 = pg.chapter_suggestion_char[arg_5_0.id]

	arg_5_0.shipView:SetData(arg_5_0.id)
	arg_5_0.equipView1:SetData(var_5_0.wepaon)
	arg_5_0.equipView2:SetData(var_5_0.wepaon_2)

	local var_5_1 = Ship.New({
		id = arg_5_0.id,
		configId = var_5_0.char_id,
		level = var_5_0.char_lv
	})

	setText(arg_5_0.uiNameText, var_5_1:GetColorName())

	local var_5_2 = pg.ship_data_template[var_5_0.char_id].group_type
	local var_5_3 = getProxy(BayProxy):findShipsByGroup(var_5_2)

	for iter_5_0 = #var_5_3, 1, -1 do
		if var_5_0.remoulded == 1 and not var_5_3[iter_5_0]:isRemoulded() then
			table.remove(var_5_3, iter_5_0)
		end
	end

	local var_5_4 = #var_5_3 > 0

	setActive(arg_5_0.uiUnLockGo, var_5_4)
	setActive(arg_5_0.uiLockGo, not var_5_4)
	setActive(arg_5_0.uiLvGo, var_5_4)

	local var_5_5 = 1

	for iter_5_1, iter_5_2 in ipairs(var_5_3) do
		var_5_5 = var_5_5 < iter_5_2.level and iter_5_2.level or var_5_5
	end

	setText(arg_5_0.uiLevelText, i18n("formation_suggestion_info_level", var_5_5))
	arg_5_0.skillList:make(function(arg_6_0, arg_6_1, arg_6_2)
		if arg_6_0 == UIItemList.EventUpdate then
			local var_6_0 = var_5_0.skill_lv[arg_6_1 + 1]
			local var_6_1 = var_6_0[1]
			local var_6_2 = findTF(arg_6_2, "level")

			if var_5_4 then
				local var_6_3 = var_5_1:isBluePrintShip() and getProxy(TechnologyProxy):getBluePrintVOByGroupID(var_5_2)
				local var_6_4 = 1

				if var_6_3 then
					for iter_6_0, iter_6_1 in ipairs(var_5_3) do
						local var_6_5 = iter_6_1:fateSkillChange(var_6_1)

						if var_6_5 ~= var_6_1 then
							var_6_1 = var_6_5

							break
						end
					end
				end

				for iter_6_2, iter_6_3 in ipairs(var_5_3) do
					if var_5_0.remoulded == 0 then
						local var_6_6 = table.keyof(pg.ship_data_template[var_5_1.configId].buff_list_display, var_6_1)
						local var_6_7 = pg.ship_data_template[iter_6_3.configId].buff_list_display[var_6_6]

						if iter_6_3.skills[var_6_7] then
							local var_6_8 = iter_6_3.skills[var_6_7].level

							var_6_4 = var_6_4 < var_6_8 and var_6_8 or var_6_4
						end
					end

					if iter_6_3.skills[var_6_1] then
						local var_6_9 = iter_6_3.skills[var_6_1].level

						var_6_4 = var_6_4 < var_6_9 and var_6_9 or var_6_4
					end
				end

				if var_6_4 >= var_6_0[2] then
					setText(var_6_2, i18n("formation_suggestion_info_level_recommend", string.format("<color=#ffffff>Lv.%s</color>/%s", var_6_4, var_6_0[2])))
				else
					setText(var_6_2, i18n("formation_suggestion_info_level_recommend", string.format("<color=#d53333>Lv.%s</color>/%s", var_6_4, var_6_0[2])))
				end
			else
				setText(var_6_2, i18n("formation_suggestion_info_level_recommend", string.format("Lv.%s", var_6_0[2])))
			end

			local var_6_10 = getSkillConfig(var_6_1)

			LoadImageSpriteAsync("skillicon/" .. var_6_10.icon, findTF(arg_6_2, "icon"))
			setScrollText(findTF(arg_6_2, "mask/name"), getSkillName(var_6_10.id))
		end
	end)
	arg_5_0.skillList:align(#var_5_0.skill_lv)
	arg_5_0.obtainList:make(function(arg_7_0, arg_7_1, arg_7_2)
		if arg_7_0 == UIItemList.EventUpdate then
			local var_7_0 = var_5_0.source[arg_7_1 + 1]

			setScrollText(findTF(arg_7_2, "text/text"), i18n("formation_suggestion_info_obtain", var_7_0[2]))
			onButton(arg_5_0, findTF(arg_7_2, "goBtn"), function()
				arg_5_0:emit(FormationSuggestionShipInfoMediator.JUMP_TO_SCENE, var_7_0[1])
			end)
		end
	end)
	arg_5_0.obtainList:align(#var_5_0.source)
end

function var_0_0.willExit(arg_9_0)
	arg_9_0:UnOverlayPanel(arg_9_0._tf)
	arg_9_0.shipView:willExit()

	arg_9_0.shipView = nil

	arg_9_0.skillList:Dispose()

	arg_9_0.skillList = nil

	arg_9_0.obtainList:Dispose()

	arg_9_0.obtainList = nil

	arg_9_0.equipView1:willExit()

	arg_9_0.equipView1 = nil

	arg_9_0.equipView2:willExit()

	arg_9_0.equipView2 = nil

	pg.m02:sendNotification(GAME.FORMATION_SUGGESTION_EXIT_SHIP_INFO)
end

return var_0_0
