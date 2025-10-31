local var_0_0 = class("CmdLevelFormationPanel", import("..base.BasePanel"))

function var_0_0.init(arg_1_0)
	arg_1_0.descPanel = arg_1_0._tf:Find("desc")
	arg_1_0.descFrameTF = arg_1_0._tf:Find("desc/frame")
	arg_1_0.descPos1 = arg_1_0.descFrameTF:Find("commander1/frame/info")
	arg_1_0.descPos2 = arg_1_0.descFrameTF:Find("commander2/frame/info")
	arg_1_0.skillTFPos1 = arg_1_0.descFrameTF:Find("commander1/skill_info")
	arg_1_0.skillTFPos2 = arg_1_0.descFrameTF:Find("commander2/skill_info")
	arg_1_0.abilitysTF = UIItemList.New(arg_1_0.descFrameTF:Find("atttr_panel/abilitys/mask/content"), arg_1_0.descFrameTF:Find("atttr_panel/abilitys/mask/content/attr"))
	arg_1_0.talentsTF = UIItemList.New(arg_1_0.descFrameTF:Find("atttr_panel/talents/mask/content"), arg_1_0.descFrameTF:Find("atttr_panel/talents/mask/content/attr"))
	arg_1_0.abilityArr = arg_1_0._tf:Find("desc/frame/atttr_panel/abilitys/arr")
	arg_1_0.talentsArr = arg_1_0._tf:Find("desc/frame/atttr_panel/talents/arr")
	arg_1_0.animtion = arg_1_0.descPanel:GetComponent("Animation")
	arg_1_0.animtionEvent = arg_1_0._tf:Find("desc"):GetComponent(typeof(DftAniEvent))
end

function var_0_0.update(arg_2_0, arg_2_1, arg_2_2)
	arg_2_0.callback = arg_2_2

	assert(arg_2_1)

	arg_2_0.fleet = arg_2_1

	arg_2_0:updateDesc()
end

function var_0_0.attach(arg_3_0, arg_3_1)
	var_0_0.super.attach(arg_3_0, arg_3_1)
	setActive(arg_3_0._go, false)
	onButton(arg_3_0, arg_3_0._tf, function()
		arg_3_0:close()
	end, SFX_PANEL)
end

function var_0_0.playAnim(arg_5_0, arg_5_1)
	arg_5_0.animtion:Play(arg_5_1)
end

function var_0_0.open(arg_6_0)
	arg_6_0:playAnim("cmdopen")
	setActive(arg_6_0._go, true)
	setParent(arg_6_0._go, pg.UIMgr.GetInstance().OverlayMain)
	arg_6_0._tf:SetAsLastSibling()
end

function var_0_0.close(arg_7_0)
	arg_7_0:playAnim("cmdclose")
	setActive(arg_7_0._go, false)
end

function var_0_0.updateDesc(arg_8_0)
	local var_8_0 = arg_8_0.fleet:getCommanders()

	for iter_8_0 = 1, CommanderConst.MAX_FORMATION_POS do
		local var_8_1 = var_8_0[iter_8_0]

		arg_8_0:updateCommander(arg_8_0["descPos" .. iter_8_0], iter_8_0, var_8_1)
		arg_8_0:updateSkillTF(var_8_1, arg_8_0["skillTFPos" .. iter_8_0])
	end

	arg_8_0:updateAdditions()
end

function var_0_0.updateAdditions(arg_9_0)
	local var_9_0 = arg_9_0.fleet
	local var_9_1 = _.values(var_9_0:getCommandersTalentDesc())
	local var_9_2, var_9_3 = var_9_0:getCommandersAddition()

	arg_9_0.abilitysTF:make(function(arg_10_0, arg_10_1, arg_10_2)
		if arg_10_0 == UIItemList.EventUpdate then
			local var_10_0 = var_9_2[arg_10_1 + 1]

			setText(arg_10_2:Find("name"), AttributeType.Type2Name(var_10_0.attrName))
			setText(arg_10_2:Find("Text"), string.format("%0.3f", var_10_0.value) .. "%")
			GetImageSpriteFromAtlasAsync("attricon", var_10_0.attrName, arg_10_2:Find("icon"), false)
			setActive(arg_10_2:Find("bg"), arg_10_1 % 2 ~= 0)
		end
	end)
	arg_9_0.abilitysTF:align(#var_9_2)
	setActive(arg_9_0.abilityArr, #var_9_2 > 4)
	arg_9_0.talentsTF:make(function(arg_11_0, arg_11_1, arg_11_2)
		if arg_11_0 == UIItemList.EventUpdate then
			local var_11_0 = var_9_1[arg_11_1 + 1]

			setScrollText(findTF(arg_11_2, "name_mask/name"), var_11_0.name)

			local var_11_1 = var_11_0.type == CommanderConst.TALENT_ADDITION_RATIO and "%" or ""

			setText(arg_11_2:Find("Text"), var_11_0.value .. var_11_1)
			setActive(arg_11_2:Find("bg"), arg_11_1 % 2 ~= 0)
		end
	end)
	arg_9_0.talentsTF:align(#var_9_1)
	setActive(arg_9_0.talentsArr, #var_9_1 > 4)
end

function var_0_0.updateSkillTF(arg_12_0, arg_12_1, arg_12_2)
	setActive(arg_12_2, arg_12_1)

	if arg_12_1 then
		local var_12_0 = arg_12_1:getSkills()[1]

		GetImageSpriteFromAtlasAsync("CommanderSkillIcon/" .. var_12_0:getConfig("icon"), "", arg_12_2:Find("icon"))
		setText(arg_12_2:Find("level"), "Lv." .. var_12_0:getLevel())
	end
end

function var_0_0.updateCommander(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
	local var_13_0 = arg_13_1:Find("add")
	local var_13_1 = arg_13_1:Find("info")

	if arg_13_3 then
		local var_13_2 = arg_13_1:Find("info/mask/icon")
		local var_13_3 = arg_13_1:Find("info/frame")

		GetImageSpriteFromAtlasAsync("CommanderHrz/" .. arg_13_3:getPainting(), "", var_13_2)

		local var_13_4 = arg_13_1:Find("info/name")

		if var_13_4 then
			setText(var_13_4, arg_13_3:getName())
		end

		local var_13_5 = Commander.rarity2Frame(arg_13_3:getRarity())

		setImageSprite(var_13_3, GetSpriteFromAtlas("weaponframes", "commander_" .. var_13_5))
	end

	onButton(arg_13_0, var_13_1, function()
		if arg_13_0.callback then
			arg_13_0.callback(arg_13_2)
		end
	end, SFX_PANEL)
	onButton(arg_13_0, var_13_0, function()
		if arg_13_0.callback then
			arg_13_0.callback(arg_13_2)
		end
	end, SFX_PANEL)
	setActive(var_13_0, not arg_13_3)
	setActive(var_13_1, arg_13_3)
end

function var_0_0.enable(arg_16_0, arg_16_1)
	setActive(arg_16_0._go, arg_16_1)
end

function var_0_0.clear(arg_17_0)
	setActive(arg_17_0._go, false)
	setParent(arg_17_0._go, arg_17_0.parent.topPanel)
end

return var_0_0
