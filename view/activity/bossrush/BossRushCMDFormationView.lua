local var_0_0 = class("LevelCMDFormationView", import("view.base.BaseUI"))

function var_0_0.getUIName(arg_1_0)
	return "LevelCommanderView"
end

function var_0_0.init(arg_2_0)
	arg_2_0.descFrameTF = arg_2_0:findTF("frame")
	arg_2_0.descPos1 = arg_2_0:findTF("commander1/frame/info", arg_2_0.descFrameTF)
	arg_2_0.descPos2 = arg_2_0:findTF("commander2/frame/info", arg_2_0.descFrameTF)
	arg_2_0.skillTFPos1 = arg_2_0:findTF("commander1/skill_info", arg_2_0.descFrameTF)
	arg_2_0.skillTFPos2 = arg_2_0:findTF("commander2/skill_info", arg_2_0.descFrameTF)
	arg_2_0.abilitysTF = UIItemList.New(arg_2_0:findTF("atttr_panel/abilitys/mask/content", arg_2_0.descFrameTF), arg_2_0:findTF("atttr_panel/abilitys/mask/content/attr", arg_2_0.descFrameTF))
	arg_2_0.talentsTF = UIItemList.New(arg_2_0:findTF("atttr_panel/talents/mask/content", arg_2_0.descFrameTF), arg_2_0:findTF("atttr_panel/talents/mask/content/attr", arg_2_0.descFrameTF))
	arg_2_0.abilityArr = arg_2_0:findTF("frame/atttr_panel/abilitys/arr")
	arg_2_0.talentsArr = arg_2_0:findTF("frame/atttr_panel/talents/arr")
	arg_2_0.restAllBtn = arg_2_0:findTF("rest_all", arg_2_0.descFrameTF)
	arg_2_0.quickBtn = arg_2_0:findTF("quick_btn", arg_2_0.descFrameTF)
	arg_2_0.recordPanel = arg_2_0:findTF("record_panel")
	arg_2_0.recordCommanders = {
		arg_2_0.recordPanel:Find("current/commanders/commander1/frame/info"),
		arg_2_0.recordPanel:Find("current/commanders/commander2/frame/info")
	}
	arg_2_0.reocrdSkills = {
		arg_2_0.recordPanel:Find("current/commanders/commander1/skill_info"),
		arg_2_0.recordPanel:Find("current/commanders/commander2/skill_info")
	}
	arg_2_0.recordList = UIItemList.New(arg_2_0.recordPanel:Find("record/content"), arg_2_0.recordPanel:Find("record/content/commanders"))

	onButton(arg_2_0, arg_2_0.restAllBtn, function()
		arg_2_0.callback({
			type = LevelUIConst.COMMANDER_OP_REST_ALL
		})
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.quickBtn, function()
		arg_2_0:OpenRecordPanel()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0.recordPanel:Find("back"), function()
		arg_2_0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(arg_2_0, arg_2_0._tf:Find("bg"), function()
		arg_2_0:onBackPressed()
	end, SFX_PANEL)
end

function var_0_0.didEnter(arg_7_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_7_0._tf)
end

function var_0_0.willExit(arg_8_0)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_8_0._tf)
end

function var_0_0.setCallback(arg_9_0, arg_9_1)
	arg_9_0.callback = arg_9_1
end

function var_0_0.updateFleet(arg_10_0, arg_10_1)
	arg_10_0.fleet = arg_10_1

	arg_10_0:updateDesc()
	arg_10_0:updateRecordFleet()
end

function var_0_0.setCommanderPrefabs(arg_11_0, arg_11_1)
	arg_11_0.prefabFleets = arg_11_1

	arg_11_0:updateRecordPanel()
end

function var_0_0.updateRecordFleet(arg_12_0)
	local var_12_0 = arg_12_0.fleet:getCommanders()

	for iter_12_0, iter_12_1 in ipairs(arg_12_0.recordCommanders) do
		local var_12_1 = var_12_0[iter_12_0]

		arg_12_0:updateCommander(iter_12_1, iter_12_0, var_12_1)
		arg_12_0:updateSkillTF(var_12_1, arg_12_0.reocrdSkills[iter_12_0])
	end
end

function var_0_0.updateRecordPanel(arg_13_0)
	local var_13_0 = arg_13_0.fleet:getCommanders()

	arg_13_0.recordList:make(function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_0 == UIItemList.EventUpdate then
			local var_14_0 = arg_13_0.prefabFleets[arg_14_1 + 1]

			arg_13_0:UpdatePrefabFleet(var_14_0, arg_14_2, var_13_0)
		end
	end)
	arg_13_0.recordList:align(#arg_13_0.prefabFleets)
end

function var_0_0.UpdatePrefabFleet(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
	local var_15_0 = arg_15_2:Find("fleet_name")
	local var_15_1 = arg_15_1:getName()

	onInputEndEdit(arg_15_0, var_15_0, function()
		local var_16_0 = getInputText(var_15_0)

		arg_15_0.callback({
			type = LevelUIConst.COMMANDER_OP_RENAME,
			id = arg_15_1.id,
			str = var_16_0,
			onFailed = function()
				setInputText(var_15_0, var_15_1)
			end
		})
	end)
	setInputText(var_15_0, var_15_1)
	onButton(arg_15_0, arg_15_2:Find("use_btn"), function()
		arg_15_0.callback({
			type = LevelUIConst.COMMANDER_OP_USE_PREFAB,
			id = arg_15_1.id
		})
		arg_15_0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(arg_15_0, arg_15_2:Find("record_btn"), function()
		arg_15_0.callback({
			type = LevelUIConst.COMMANDER_OP_RECORD_PREFAB,
			id = arg_15_1.id
		})
	end, SFX_PANEL)

	local var_15_2 = {
		arg_15_2:Find("commander1/frame/info"),
		arg_15_2:Find("commander2/frame/info")
	}
	local var_15_3 = {
		arg_15_2:Find("commander1/skill_info"),
		arg_15_2:Find("commander2/skill_info")
	}

	for iter_15_0, iter_15_1 in ipairs(var_15_2) do
		local var_15_4 = arg_15_1:getCommanderByPos(iter_15_0)

		arg_15_0:updateCommander(iter_15_1, iter_15_0, var_15_4)
		arg_15_0:updateSkillTF(var_15_4, var_15_3[iter_15_0])
	end
end

function var_0_0.updateDesc(arg_20_0)
	local var_20_0 = arg_20_0.fleet:getCommanders()

	for iter_20_0 = 1, CommanderConst.MAX_FORMATION_POS do
		local var_20_1 = var_20_0[iter_20_0]

		arg_20_0:updateCommander(arg_20_0["descPos" .. iter_20_0], iter_20_0, var_20_1, true)
		arg_20_0:updateSkillTF(var_20_1, arg_20_0["skillTFPos" .. iter_20_0])
	end

	arg_20_0:updateAdditions()
end

function var_0_0.updateAdditions(arg_21_0)
	local var_21_0 = arg_21_0.fleet
	local var_21_1 = _.values(var_21_0:getCommandersTalentDesc())
	local var_21_2, var_21_3 = var_21_0:getCommandersAddition()

	arg_21_0.abilitysTF:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_21_2[arg_22_1 + 1]

			setText(arg_22_2:Find("name"), AttributeType.Type2Name(var_22_0.attrName))
			setText(arg_22_2:Find("Text"), string.format("%0.3f", var_22_0.value) .. "%")
			GetImageSpriteFromAtlasAsync("attricon", var_22_0.attrName, arg_22_2:Find("icon"), false)
			setImageAlpha(arg_22_2:Find("bg"), arg_22_1 % 2)
		end
	end)
	arg_21_0.abilitysTF:align(#var_21_2)
	setActive(arg_21_0.abilityArr, #var_21_2 > 4)
	arg_21_0.talentsTF:make(function(arg_23_0, arg_23_1, arg_23_2)
		if arg_23_0 == UIItemList.EventUpdate then
			local var_23_0 = var_21_1[arg_23_1 + 1]

			setScrollText(findTF(arg_23_2, "name_mask/name"), var_23_0.name)

			local var_23_1 = var_23_0.type == CommanderConst.TALENT_ADDITION_RATIO and "%" or ""

			setText(arg_23_2:Find("Text"), var_23_0.value .. var_23_1)
			setImageAlpha(arg_23_2:Find("bg"), arg_23_1 % 2)
		end
	end)
	arg_21_0.talentsTF:align(#var_21_1)
	setActive(arg_21_0.talentsArr, #var_21_1 > 4)
end

function var_0_0.updateSkillTF(arg_24_0, arg_24_1, arg_24_2)
	setActive(arg_24_2, arg_24_1)

	if arg_24_1 then
		local var_24_0 = arg_24_1:getSkills()[1]

		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. var_24_0:getConfig("icon"), "", arg_24_2:Find("icon"))
		setText(arg_24_2:Find("level"), "Lv." .. var_24_0:getLevel())
		onButton(arg_24_0, arg_24_2, function()
			arg_24_0.callback({
				type = LevelUIConst.COMMANDER_OP_SHOW_SKILL,
				skill = var_24_0
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_24_2)
	end
end

function var_0_0.updateCommander(arg_26_0, arg_26_1, arg_26_2, arg_26_3, arg_26_4)
	local var_26_0 = arg_26_1:Find("add")
	local var_26_1 = arg_26_1:Find("info")

	if arg_26_3 then
		local var_26_2 = arg_26_1:Find("info/mask/icon")
		local var_26_3 = arg_26_1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. arg_26_3:getPainting(), "", var_26_2)

		local var_26_4 = arg_26_1:Find("info/name")

		if var_26_4 then
			setText(var_26_4, arg_26_3:getName())
		end

		local var_26_5 = Commander.rarity2Frame(arg_26_3:getRarity())

		setImageSprite(var_26_3, GetSpriteFromAtlas("weaponframes", "commander_" .. var_26_5))
	end

	if arg_26_4 then
		onButton(arg_26_0, var_26_1, function()
			arg_26_0.callback({
				type = LevelUIConst.COMMANDER_OP_ADD,
				pos = arg_26_2
			})
		end, SFX_PANEL)
		onButton(arg_26_0, var_26_0, function()
			arg_26_0.callback({
				type = LevelUIConst.COMMANDER_OP_ADD,
				pos = arg_26_2
			})
		end, SFX_PANEL)
	end

	setActive(var_26_0, not arg_26_3)
	setActive(var_26_1, arg_26_3)
end

function var_0_0.OpenRecordPanel(arg_29_0)
	setActive(arg_29_0.descFrameTF, false)
	setActive(arg_29_0.recordPanel, true)
end

function var_0_0.CloseRecordPanel(arg_30_0)
	setActive(arg_30_0.descFrameTF, true)
	setActive(arg_30_0.recordPanel, false)
end

return var_0_0
