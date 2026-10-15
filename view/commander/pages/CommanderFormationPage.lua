local var_0_0 = class("CommanderFormationPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "CommanderFormationUI"
end

function var_0_0.getResource(arg_2_0)
	local var_2_0 = {
		"attricon",
		"weaponframes"
	}

	return table.insertto(var_2_0, var_0_0.super.getResource(arg_2_0))
end

function var_0_0.getCommanderResList(arg_3_0, arg_3_1, arg_3_2)
	local var_3_0 = {}

	local function var_3_1(arg_4_0)
		if arg_4_0 then
			local var_4_0 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderHrz, arg_4_0:getPainting())

			table.insert(var_3_0, var_4_0)

			local var_4_1 = arg_4_0:getSkills()[1]

			if var_4_1 then
				local var_4_2 = ResPathSupport.CombinePath(ResPathSupport.ConstPath.Commander.CommanderSkillIcon, var_4_1:getConfig("icon"))

				table.insert(var_3_0, var_4_2)
			end
		end
	end

	if arg_3_1 then
		_.each(arg_3_1:getCommanders(), function(arg_5_0)
			var_3_1(arg_5_0)
		end)
	end

	_.each(arg_3_2 or {}, function(arg_6_0)
		for iter_6_0 = 1, CommanderConst.MAX_FORMATION_POS do
			var_3_1(arg_6_0:getCommanderByPos(iter_6_0))
		end
	end)

	return var_3_0
end

function var_0_0.OnInit(arg_7_0)
	setActive(arg_7_0.samllTF, true)

	arg_7_0.pos1 = arg_7_0.samllTF:Find("commander1")
	arg_7_0.pos2 = arg_7_0.samllTF:Find("commander2")

	setActive(arg_7_0.descPanel, false)

	arg_7_0.descFrameTF = arg_7_0.descPanel:Find("frame")
	arg_7_0.descPos1 = arg_7_0.descFrameTF:Find("commander1/frame/info")
	arg_7_0.descPos2 = arg_7_0.descFrameTF:Find("commander2/frame/info")
	arg_7_0.skillTFPos1 = arg_7_0.descFrameTF:Find("commander1/skill_info")
	arg_7_0.skillTFPos2 = arg_7_0.descFrameTF:Find("commander2/skill_info")
	arg_7_0.abilitysTF = UIItemList.New(arg_7_0.descFrameTF:Find("atttr_panel/abilitys/mask/content"), arg_7_0.descFrameTF:Find("atttr_panel/abilitys/mask/content/attr"))
	arg_7_0.talentsTF = UIItemList.New(arg_7_0.descFrameTF:Find("atttr_panel/talents/mask/content"), arg_7_0.descFrameTF:Find("atttr_panel/talents/mask/content/attr"))
	arg_7_0.abilityArr = arg_7_0.descPanel:Find("frame/atttr_panel/abilitys/arr")
	arg_7_0.talentsArr = arg_7_0.descPanel:Find("frame/atttr_panel/talents/arr")
	arg_7_0.restAllBtn = arg_7_0.descFrameTF:Find("rest_all")
	arg_7_0.quickBtn = arg_7_0.descFrameTF:Find("quick_btn")
	arg_7_0.recordCommanders = {
		arg_7_0.recordPanel:Find("current/commanders/commander1/frame/info"),
		arg_7_0.recordPanel:Find("current/commanders/commander2/frame/info")
	}
	arg_7_0.reocrdSkills = {
		arg_7_0.recordPanel:Find("current/commanders/commander1/skill_info"),
		arg_7_0.recordPanel:Find("current/commanders/commander2/skill_info")
	}
	arg_7_0.recordList = UIItemList.New(arg_7_0.recordPanel:Find("record/content"), arg_7_0.recordPanel:Find("record/content/commanders"))

	onButton(arg_7_0, arg_7_0.samllTF, function()
		arg_7_0:openDescPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.quickBtn, function()
		arg_7_0:OpenRecordPanel()
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0._tf:Find("bg"), function()
		if isActive(arg_7_0.recordPanel) then
			arg_7_0:CloseRecordPanel()
		elseif isActive(arg_7_0.descPanel) then
			arg_7_0:closeDescPanel()
		end
	end, SFX_PANEL)
	onButton(arg_7_0, arg_7_0.restAllBtn, function()
		arg_7_0:emit(FormationMediator.COMMANDER_FORMATION_OP, {
			FleetType = LevelUIConst.FLEET_TYPE_SELECT,
			data = {
				type = LevelUIConst.COMMANDER_OP_REST_ALL
			},
			fleetId = arg_7_0.fleet.id
		})
	end, SFX_PANEL)
	setText(arg_7_0.descPanel:Find("frame/atttr_panel/abilitys/title/Text"), i18n("commander_subtile_ablity"))
	setText(arg_7_0.descPanel:Find("frame/atttr_panel/talents/title/Text"), i18n("commander_subtile_talent"))
	setText(arg_7_0.recordPanel:Find("current/title/Text"), i18n("commander_formation_prefab_fleet"))
end

function var_0_0.Update(arg_12_0, arg_12_1, arg_12_2)
	arg_12_0.fleet = arg_12_1
	arg_12_0.prefabFleets = arg_12_2

	local var_12_0 = arg_12_0:getCommanderResList(arg_12_1, arg_12_2)

	SplitPackConst.DownloadByLuaArr(var_12_0, function()
		if arg_12_0._state == var_0_0.STATES.DESTROY then
			return
		end

		arg_12_0:updateAfterResDownload()
	end)
end

function var_0_0.updateAfterResDownload(arg_14_0)
	local var_14_0 = arg_14_0.fleet:getCommanders()

	for iter_14_0 = 1, CommanderConst.MAX_FORMATION_POS do
		local var_14_1 = var_14_0[iter_14_0]

		assert(arg_14_0["pos" .. iter_14_0], "pos tf can not nil")
		arg_14_0:updateCommander(arg_14_0["pos" .. iter_14_0], iter_14_0, var_14_1)
	end

	arg_14_0:updateDesc()
	arg_14_0:updateRecordPanel()
end

function var_0_0.openDescPanel(arg_15_0, arg_15_1)
	local var_15_0 = arg_15_1 or 0.2

	if LeanTween.isTweening(go(arg_15_0.samllTF)) or LeanTween.isTweening(go(arg_15_0.descFrameTF)) then
		return
	end

	setAnchoredPosition(arg_15_0.samllTF, {
		x = 0
	})
	LeanTween.moveX(arg_15_0.samllTF, 800, var_15_0):setOnComplete(System.Action(function()
		setActive(arg_15_0.descPanel, true)
		setActive(arg_15_0.descBg, true)
		pg.UIMgr.GetInstance():OverlayPanel(arg_15_0._tf)
		setAnchoredPosition(arg_15_0.descFrameTF, {
			x = 800
		})
		LeanTween.moveX(arg_15_0.descFrameTF, 0, var_15_0)
	end))

	arg_15_0.contextData.inDescPage = true
end

function var_0_0.closeDescPanel(arg_17_0, arg_17_1)
	local var_17_0 = arg_17_1 or 0.2

	if LeanTween.isTweening(go(arg_17_0.samllTF)) or LeanTween.isTweening(go(arg_17_0.descFrameTF)) then
		return
	end

	setAnchoredPosition(arg_17_0.descFrameTF, {
		x = 0
	})
	LeanTween.moveX(arg_17_0.descFrameTF, 800, var_17_0):setOnComplete(System.Action(function()
		setActive(arg_17_0.descPanel, false)
		setActive(arg_17_0.descBg, false)
		pg.UIMgr.GetInstance():UnOverlayPanel(arg_17_0._tf, arg_17_0._parentTf)
		setAnchoredPosition(arg_17_0.samllTF, {
			x = 800
		})
		LeanTween.moveX(arg_17_0.samllTF, 0, var_17_0)
	end))

	arg_17_0.contextData.inDescPage = false
end

function var_0_0.updateDesc(arg_19_0)
	local var_19_0 = arg_19_0.fleet:getCommanders()

	for iter_19_0 = 1, CommanderConst.MAX_FORMATION_POS do
		local var_19_1 = var_19_0[iter_19_0]

		assert(arg_19_0["pos" .. iter_19_0], "pos tf can not nil")
		arg_19_0:updateCommander(arg_19_0["descPos" .. iter_19_0], iter_19_0, var_19_1, true)
		arg_19_0:updateSkillTF(var_19_1, arg_19_0["skillTFPos" .. iter_19_0])
	end

	arg_19_0:updateAdditions()
end

function var_0_0.updateAdditions(arg_20_0)
	local var_20_0 = arg_20_0.fleet
	local var_20_1 = _.values(var_20_0:getCommandersTalentDesc())
	local var_20_2, var_20_3 = var_20_0:getCommandersAddition()

	arg_20_0.abilitysTF:make(function(arg_21_0, arg_21_1, arg_21_2)
		if arg_21_0 == UIItemList.EventUpdate then
			local var_21_0 = var_20_2[arg_21_1 + 1]

			setText(arg_21_2:Find("name"), AttributeType.Type2Name(var_21_0.attrName))
			setText(arg_21_2:Find("Text"), ("+" .. math.floor(var_21_0.value * 1000) / 1000) .. "%")
			GetImageSpriteFromAtlasAsync("attricon", var_21_0.attrName, arg_21_2:Find("icon"), false)
			setImageAlpha(arg_21_2:Find("bg"), arg_21_1 % 2)
		end
	end)
	arg_20_0.abilitysTF:align(#var_20_2)
	setActive(arg_20_0.abilityArr, #var_20_2 > 4)
	arg_20_0.talentsTF:make(function(arg_22_0, arg_22_1, arg_22_2)
		if arg_22_0 == UIItemList.EventUpdate then
			local var_22_0 = var_20_1[arg_22_1 + 1]

			setScrollText(findTF(arg_22_2, "name_mask/name"), var_22_0.name)

			local var_22_1 = var_22_0.type == CommanderConst.TALENT_ADDITION_RATIO and "%" or ""

			setText(arg_22_2:Find("Text"), (var_22_0.value > 0 and "+" or "") .. var_22_0.value .. var_22_1)
			setImageAlpha(arg_22_2:Find("bg"), arg_22_1 % 2)
		end
	end)
	arg_20_0.talentsTF:align(#var_20_1)
	setActive(arg_20_0.talentsArr, #var_20_1 > 4)
	Canvas.ForceUpdateCanvases()
end

function var_0_0.updateSkillTF(arg_23_0, arg_23_1, arg_23_2)
	setActive(arg_23_2, arg_23_1)

	if arg_23_1 then
		local var_23_0 = arg_23_1:getSkills()[1]

		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. var_23_0:getConfig("icon"), "", arg_23_2:Find("icon"))
		setText(arg_23_2:Find("level"), "Lv." .. var_23_0:getLevel())
		onButton(arg_23_0, arg_23_2, function()
			arg_23_0:emit(FormationMediator.ON_CMD_SKILL, var_23_0)
		end, SFX_PANEL)
	else
		removeOnButton(arg_23_2)
	end
end

function var_0_0.updateCommander(arg_25_0, arg_25_1, arg_25_2, arg_25_3, arg_25_4)
	local var_25_0 = arg_25_1:Find("add")
	local var_25_1 = arg_25_1:Find("info")

	if arg_25_3 then
		local var_25_2 = arg_25_1:Find("info/mask/icon")
		local var_25_3 = arg_25_1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. arg_25_3:getPainting(), "", var_25_2)

		local var_25_4 = arg_25_1:Find("info/name")

		if var_25_4 then
			setText(var_25_4, arg_25_3:getName())
		end

		local var_25_5 = Commander.rarity2Frame(arg_25_3:getRarity())

		setImageSprite(var_25_3, GetSpriteFromAtlas("weaponframes", "commander_" .. var_25_5))
	end

	if arg_25_4 then
		onButton(arg_25_0, var_25_1, function()
			arg_25_0:emit(FormationMediator.ON_SELECT_COMMANDER, arg_25_2, arg_25_0.fleet.id)
		end, SFX_PANEL)
		onButton(arg_25_0, var_25_0, function()
			arg_25_0:emit(FormationMediator.ON_SELECT_COMMANDER, arg_25_2, arg_25_0.fleet.id)
		end, SFX_PANEL)
	end

	setActive(var_25_0, not arg_25_3)
	setActive(var_25_1, arg_25_3)
end

function var_0_0.OpenRecordPanel(arg_28_0)
	setActive(arg_28_0.descFrameTF, false)
	setActive(arg_28_0.recordPanel, true)
end

function var_0_0.updateRecordPanel(arg_29_0)
	local var_29_0 = arg_29_0.fleet:getCommanders()

	for iter_29_0, iter_29_1 in ipairs(arg_29_0.recordCommanders) do
		local var_29_1 = var_29_0[iter_29_0]

		arg_29_0:updateCommander(iter_29_1, iter_29_0, var_29_1)
		arg_29_0:updateSkillTF(var_29_1, arg_29_0.reocrdSkills[iter_29_0])
	end

	arg_29_0.recordList:make(function(arg_30_0, arg_30_1, arg_30_2)
		if arg_30_0 == UIItemList.EventUpdate then
			local var_30_0 = arg_29_0.prefabFleets[arg_30_1 + 1]

			arg_29_0:UpdatePrefabFleet(var_30_0, arg_30_2, var_29_0)
		end
	end)
	arg_29_0.recordList:align(#arg_29_0.prefabFleets)
end

function var_0_0.UpdatePrefabFleet(arg_31_0, arg_31_1, arg_31_2, arg_31_3)
	local var_31_0 = arg_31_2:Find("fleet_name")
	local var_31_1 = arg_31_1:getName()

	onInputEndEdit(arg_31_0, var_31_0, function()
		local var_32_0 = getInputText(var_31_0)

		arg_31_0:emit(FormationMediator.COMMANDER_FORMATION_OP, {
			FleetType = LevelUIConst.FLEET_TYPE_SELECT,
			data = {
				type = LevelUIConst.COMMANDER_OP_RENAME,
				id = arg_31_1.id,
				str = var_32_0,
				onFailed = function()
					setInputText(var_31_0, var_31_1)
				end
			},
			fleetId = arg_31_0.fleet.id
		})
	end)
	setInputText(var_31_0, var_31_1)
	onButton(arg_31_0, arg_31_2:Find("use_btn"), function()
		arg_31_0:emit(FormationMediator.COMMANDER_FORMATION_OP, {
			FleetType = LevelUIConst.FLEET_TYPE_SELECT,
			data = {
				type = LevelUIConst.COMMANDER_OP_USE_PREFAB,
				id = arg_31_1.id
			},
			fleetId = arg_31_0.fleet.id
		})
		arg_31_0:CloseRecordPanel()
	end, SFX_PANEL)
	onButton(arg_31_0, arg_31_2:Find("record_btn"), function()
		arg_31_0:emit(FormationMediator.COMMANDER_FORMATION_OP, {
			FleetType = LevelUIConst.FLEET_TYPE_SELECT,
			data = {
				type = LevelUIConst.COMMANDER_OP_RECORD_PREFAB,
				id = arg_31_1.id
			},
			fleetId = arg_31_0.fleet.id
		})
	end, SFX_PANEL)

	local var_31_2 = {
		arg_31_2:Find("commander1/frame/info"),
		arg_31_2:Find("commander2/frame/info")
	}
	local var_31_3 = {
		arg_31_2:Find("commander1/skill_info"),
		arg_31_2:Find("commander2/skill_info")
	}

	for iter_31_0, iter_31_1 in ipairs(var_31_2) do
		local var_31_4 = arg_31_1:getCommanderByPos(iter_31_0)

		arg_31_0:updateCommander(iter_31_1, iter_31_0, var_31_4)
		arg_31_0:updateSkillTF(var_31_4, var_31_3[iter_31_0])
	end
end

function var_0_0.CloseRecordPanel(arg_36_0)
	setActive(arg_36_0.descFrameTF, true)
	setActive(arg_36_0.recordPanel, false)
end

function var_0_0.OnDestroy(arg_37_0)
	if arg_37_0:isShowing() then
		LeanTween.cancel(go(arg_37_0.samllTF))
		LeanTween.cancel(go(arg_37_0.descFrameTF))

		if isActive(arg_37_0.descPanel) then
			pg.UIMgr.GetInstance():UnOverlayPanel(arg_37_0._tf, arg_37_0._parentTf)
		end
	end
end

return var_0_0
