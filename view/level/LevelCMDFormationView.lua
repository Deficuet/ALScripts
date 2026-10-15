local var_0_0 = class("LevelCMDFormationView", import("..base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "LevelCommanderView"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"attricon",
		"weaponframes"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.getLevelCMDFormationViewResList(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}

	local function var_3_1(arg_4_0)
		if not arg_4_0 then
			return
		end

		local var_4_0 = arg_4_0:getPainting()

		if noEmptyStr(var_4_0) then
			local var_4_1 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderHrz, var_4_0)

			table.insert(var_3_0, var_4_1)
		end

		local var_4_2 = arg_4_0:getSkills()[1]
		local var_4_3 = var_4_2 and var_4_2:getConfig("icon")

		if noEmptyStr(var_4_3) then
			local var_4_4 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderSkillIcon, var_4_3)

			table.insert(var_3_0, var_4_4)
		end
	end

	if arg_3_1 then
		_.each(arg_3_1:getCommanders(), var_3_1)
	end

	_.each(arg_3_2 or {}, function(arg_5_0)
		if arg_5_0 then
			for iter_5_0 = 1, CommanderConst.MAX_FORMATION_POS do
				var_3_1(arg_5_0:getCommanderByPos(iter_5_0))
			end
		end
	end)

	return var_3_0
end

function var_0_0.downloadLevelCMDFormationViewResList(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	SplitPackConst.DownloadByLuaArr(arg_6_0:getLevelCMDFormationViewResList(arg_6_1, arg_6_2), function()
		if arg_6_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_6_3()
	end)
end

function var_0_0.OnInit(arg_8_0)
	arg_8_0:InitUI()
end

function var_0_0.OnDestroy(arg_9_0)
	if arg_9_0:isShowing() then
		arg_9_0:Hide()
	end

	arg_9_0.callback = nil
end

function var_0_0.Show(arg_10_0)
	pg.UIMgr.GetInstance():BlurPanel(arg_10_0._tf)
	setActive(arg_10_0._tf, true)
end

function var_0_0.Hide(arg_11_0)
	setActive(arg_11_0._go, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(arg_11_0._tf, arg_11_0._parentTf)
end

function var_0_0.InitUI(arg_12_0)
	arg_12_0.descFrameTF = arg_12_0._tf:Find("frame")
	arg_12_0.descPos1 = arg_12_0.descFrameTF:Find("commander1/frame/info")
	arg_12_0.descPos2 = arg_12_0.descFrameTF:Find("commander2/frame/info")
	arg_12_0.skillTFPos1 = arg_12_0.descFrameTF:Find("commander1/skill_info")
	arg_12_0.skillTFPos2 = arg_12_0.descFrameTF:Find("commander2/skill_info")
	arg_12_0.abilitysTF = UIItemList.New(arg_12_0.descFrameTF:Find("atttr_panel/abilitys/mask/content"), arg_12_0.descFrameTF:Find("atttr_panel/abilitys/mask/content/attr"))
	arg_12_0.talentsTF = UIItemList.New(arg_12_0.descFrameTF:Find("atttr_panel/talents/mask/content"), arg_12_0.descFrameTF:Find("atttr_panel/talents/mask/content/attr"))
	arg_12_0.abilityArr = arg_12_0._tf:Find("frame/atttr_panel/abilitys/arr")
	arg_12_0.talentsArr = arg_12_0._tf:Find("frame/atttr_panel/talents/arr")
	arg_12_0.restAllBtn = arg_12_0.descFrameTF:Find("rest_all")
	arg_12_0.quickBtn = arg_12_0.descFrameTF:Find("quick_btn")
	arg_12_0.recordPanel = arg_12_0._tf:Find("record_panel")
	arg_12_0.recordCommanders = {
		arg_12_0.recordPanel:Find("current/commanders/commander1/frame/info"),
		arg_12_0.recordPanel:Find("current/commanders/commander2/frame/info")
	}
	arg_12_0.reocrdSkills = {
		arg_12_0.recordPanel:Find("current/commanders/commander1/skill_info"),
		arg_12_0.recordPanel:Find("current/commanders/commander2/skill_info")
	}
	arg_12_0.recordList = UIItemList.New(arg_12_0.recordPanel:Find("record/content"), arg_12_0.recordPanel:Find("record/content/commanders"))

	onButton(arg_12_0, arg_12_0.restAllBtn, function()
		arg_12_0.callback({
			type = LevelUIConst.COMMANDER_OP_REST_ALL
		})
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.quickBtn, function()
		arg_12_0:OpenRecordPanel()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0.recordPanel:Find("back"), function()
		arg_12_0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(arg_12_0, arg_12_0._tf:Find("bg"), function()
		arg_12_0:Hide()
	end, SFX_PANEL)
end

function var_0_0.setCallback(arg_17_0, arg_17_1)
	arg_17_0.callback = arg_17_1
end

function var_0_0.update(arg_18_0, arg_18_1, arg_18_2)
	arg_18_0:downloadLevelCMDFormationViewResList(arg_18_1, arg_18_2, function()
		arg_18_0:updateFleet(arg_18_1)
		arg_18_0:updatePrefabs(arg_18_2)
	end)
end

function var_0_0.updateFleet(arg_20_0, arg_20_1)
	arg_20_0.fleet = arg_20_1

	arg_20_0:updateDesc()
	arg_20_0:updateRecordFleet()
end

function var_0_0.updatePrefabs(arg_21_0, arg_21_1)
	arg_21_0.prefabFleets = arg_21_1

	arg_21_0:updateRecordPanel()
end

function var_0_0.updateRecordFleet(arg_22_0)
	local var_22_0 = arg_22_0.fleet:getCommanders()

	for iter_22_0, iter_22_1 in ipairs(arg_22_0.recordCommanders) do
		local var_22_1 = var_22_0[iter_22_0]

		arg_22_0:updateCommander(iter_22_1, iter_22_0, var_22_1)
		arg_22_0:updateSkillTF(var_22_1, arg_22_0.reocrdSkills[iter_22_0])
	end
end

function var_0_0.updateRecordPanel(arg_23_0)
	local var_23_0 = arg_23_0.fleet:getCommanders()

	arg_23_0.recordList:make(function(arg_24_0, arg_24_1, arg_24_2)
		if arg_24_0 == UIItemList.EventUpdate then
			local var_24_0 = arg_23_0.prefabFleets[arg_24_1 + 1]

			arg_23_0:UpdatePrefabFleet(var_24_0, arg_24_2, var_23_0)
		end
	end)
	arg_23_0.recordList:align(#arg_23_0.prefabFleets)
end

function var_0_0.UpdatePrefabFleet(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	local var_25_0 = arg_25_2:Find("fleet_name")
	local var_25_1 = arg_25_1:getName()

	onInputEndEdit(arg_25_0, var_25_0, function()
		local var_26_0 = getInputText(var_25_0)

		arg_25_0.callback({
			type = LevelUIConst.COMMANDER_OP_RENAME,
			id = arg_25_1.id,
			str = var_26_0,
			onFailed = function()
				setInputText(var_25_0, var_25_1)
			end
		})
	end)
	setInputText(var_25_0, var_25_1)
	onButton(arg_25_0, arg_25_2:Find("use_btn"), function()
		arg_25_0.callback({
			type = LevelUIConst.COMMANDER_OP_USE_PREFAB,
			id = arg_25_1.id
		})
		arg_25_0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(arg_25_0, arg_25_2:Find("record_btn"), function()
		arg_25_0.callback({
			type = LevelUIConst.COMMANDER_OP_RECORD_PREFAB,
			id = arg_25_1.id
		})
	end, SFX_PANEL)

	local var_25_2 = {
		arg_25_2:Find("commander1/frame/info"),
		arg_25_2:Find("commander2/frame/info")
	}
	local var_25_3 = {
		arg_25_2:Find("commander1/skill_info"),
		arg_25_2:Find("commander2/skill_info")
	}

	for iter_25_0, iter_25_1 in ipairs(var_25_2) do
		local var_25_4 = arg_25_1:getCommanderByPos(iter_25_0)

		arg_25_0:updateCommander(iter_25_1, iter_25_0, var_25_4)
		arg_25_0:updateSkillTF(var_25_4, var_25_3[iter_25_0])
	end
end

function var_0_0.updateDesc(arg_30_0)
	local var_30_0 = arg_30_0.fleet:getCommanders()

	for iter_30_0 = 1, CommanderConst.MAX_FORMATION_POS do
		local var_30_1 = var_30_0[iter_30_0]

		arg_30_0:updateCommander(arg_30_0["descPos" .. iter_30_0], iter_30_0, var_30_1, true)
		arg_30_0:updateSkillTF(var_30_1, arg_30_0["skillTFPos" .. iter_30_0])
	end

	arg_30_0:updateAdditions()
end

function var_0_0.updateAdditions(arg_31_0)
	local var_31_0 = arg_31_0.fleet
	local var_31_1 = _.values(var_31_0:getCommandersTalentDesc())
	local var_31_2, var_31_3 = var_31_0:getCommandersAddition()

	arg_31_0.abilitysTF:make(function(arg_32_0, arg_32_1, arg_32_2)
		if arg_32_0 == UIItemList.EventUpdate then
			local var_32_0 = var_31_2[arg_32_1 + 1]

			setText(arg_32_2:Find("name"), AttributeType.Type2Name(var_32_0.attrName))
			setText(arg_32_2:Find("Text"), string.format("%0.3f", var_32_0.value) .. "%")
			GetImageSpriteFromAtlasAsync("attricon", var_32_0.attrName, arg_32_2:Find("icon"), false)
			setImageAlpha(arg_32_2:Find("bg"), arg_32_1 % 2)
		end
	end)
	arg_31_0.abilitysTF:align(#var_31_2)
	setActive(arg_31_0.abilityArr, #var_31_2 > 4)
	arg_31_0.talentsTF:make(function(arg_33_0, arg_33_1, arg_33_2)
		if arg_33_0 == UIItemList.EventUpdate then
			local var_33_0 = var_31_1[arg_33_1 + 1]

			setScrollText(findTF(arg_33_2, "name_mask/name"), var_33_0.name)

			local var_33_1 = var_33_0.type == CommanderConst.TALENT_ADDITION_RATIO and "%" or ""

			setText(arg_33_2:Find("Text"), var_33_0.value .. var_33_1)
			setImageAlpha(arg_33_2:Find("bg"), arg_33_1 % 2)
		end
	end)
	arg_31_0.talentsTF:align(#var_31_1)
	setActive(arg_31_0.talentsArr, #var_31_1 > 4)
end

function var_0_0.updateSkillTF(arg_34_0, arg_34_1, arg_34_2)
	setActive(arg_34_2, arg_34_1)

	if arg_34_1 then
		local var_34_0 = arg_34_1:getSkills()[1]

		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. var_34_0:getConfig("icon"), "", arg_34_2:Find("icon"))
		setText(arg_34_2:Find("level"), "Lv." .. var_34_0:getLevel())
		onButton(arg_34_0, arg_34_2, function()
			arg_34_0.callback({
				type = LevelUIConst.COMMANDER_OP_SHOW_SKILL,
				skill = var_34_0
			})
		end, SFX_PANEL)
	else
		removeOnButton(arg_34_2)
	end
end

function var_0_0.updateCommander(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	local var_36_0 = arg_36_1:Find("add")
	local var_36_1 = arg_36_1:Find("info")

	if arg_36_3 then
		local var_36_2 = arg_36_1:Find("info/mask/icon")
		local var_36_3 = arg_36_1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. arg_36_3:getPainting(), "", var_36_2)

		local var_36_4 = arg_36_1:Find("info/name")

		if var_36_4 then
			setText(var_36_4, arg_36_3:getName())
		end

		local var_36_5 = Commander.rarity2Frame(arg_36_3:getRarity())

		setImageSprite(var_36_3, GetSpriteFromAtlas("weaponframes", "commander_" .. var_36_5))
	end

	if arg_36_4 then
		onButton(arg_36_0, var_36_1, function()
			arg_36_0.callback({
				type = LevelUIConst.COMMANDER_OP_ADD,
				pos = arg_36_2
			})
		end, SFX_PANEL)
		onButton(arg_36_0, var_36_0, function()
			arg_36_0.callback({
				type = LevelUIConst.COMMANDER_OP_ADD,
				pos = arg_36_2
			})
		end, SFX_PANEL)
	end

	setActive(var_36_0, not arg_36_3)
	setActive(var_36_1, arg_36_3)
end

function var_0_0.OpenRecordPanel(arg_39_0)
	setActive(arg_39_0.descFrameTF, false)
	setActive(arg_39_0.recordPanel, true)
end

function var_0_0.CloseRecordPanel(arg_40_0)
	setActive(arg_40_0.descFrameTF, true)
	setActive(arg_40_0.recordPanel, false)
end

return var_0_0
