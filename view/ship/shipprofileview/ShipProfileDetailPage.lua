local var_0_0 = class("ShipProfileDetailPage", import("...base.BaseSubView"))

function var_0_0.getUIName(arg_1_0)
	return "ShipProfileDetailPage"
end

function var_0_0.OnLoaded(arg_2_0)
	arg_2_0.detailRightBlurRect = arg_2_0._tf:Find("bg")
	arg_2_0.propertyTF = arg_2_0._tf:Find("bg/property_panel/frame")
	arg_2_0.skillRect = arg_2_0._tf:Find("bg/skill_panel/frame/skills_rect")
	arg_2_0.skillPanel = arg_2_0.skillRect:Find("skills")
	arg_2_0.skillTpl = arg_2_0.skillRect:Find("skilltpl")
	arg_2_0.skillArrLeft = arg_2_0._tf:Find("bg/skill_panel/frame/arrow1")
	arg_2_0.skillArrRight = arg_2_0._tf:Find("bg/skill_panel/frame/arrow2")
end

function var_0_0.OnInit(arg_3_0)
	return
end

function var_0_0.EnterAnim(arg_4_0, arg_4_1, arg_4_2)
	LeanTween.moveX(rtf(arg_4_0._tf), 0, arg_4_1):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
		if arg_4_2 then
			arg_4_2()
		end
	end))
end

function var_0_0.ExistAnim(arg_6_0, arg_6_1, arg_6_2)
	LeanTween.moveX(rtf(arg_6_0._tf), 1000, arg_6_1):setEase(LeanTweenType.easeInOutSine):setOnComplete(System.Action(function()
		if arg_6_2 then
			arg_6_2()
		end

		arg_6_0:Hide()
	end))
end

function var_0_0.Update(arg_8_0, arg_8_1, arg_8_2, arg_8_3)
	arg_8_0:Show()

	arg_8_0.shipGroup = arg_8_1
	arg_8_0.showTrans = arg_8_2

	arg_8_0:InitSkills()
	arg_8_0:InitProperty()

	if arg_8_3 then
		arg_8_3()
	end
end

function var_0_0.InitProperty(arg_9_0)
	arg_9_0.propertyPanel = PropertyPanel.New(arg_9_0.propertyTF)

	arg_9_0.propertyPanel:initProperty(arg_9_0.shipGroup.shipConfig.id)

	if arg_9_0.showTrans and arg_9_0.shipGroup.trans then
		arg_9_0.propertyPanel:initRadar(arg_9_0.shipGroup.groupConfig.trans_radar_chart)
	end
end

function var_0_0.InitSkills(arg_10_0)
	local var_10_0 = pg.ship_data_template[arg_10_0.shipGroup:getShipConfigId(arg_10_0.showTrans)]
	local var_10_1 = 0
	local var_10_2 = Clone(var_10_0.buff_list_display)

	if not arg_10_0.showTrans then
		_.each(arg_10_0.shipGroup.groupConfig.trans_skill, function(arg_11_0)
			table.removebyvalue(var_10_2, arg_11_0)
		end)
	end

	local var_10_3 = arg_10_0.skillPanel.childCount
	local var_10_4 = #var_10_2 < 3 and 3 or #var_10_2

	for iter_10_0 = var_10_3 + 1, var_10_4 do
		cloneTplTo(arg_10_0.skillTpl, arg_10_0.skillPanel)
	end

	local var_10_5 = arg_10_0.skillPanel.childCount

	for iter_10_1 = 1, var_10_5 do
		local var_10_6 = arg_10_0.skillPanel:GetChild(iter_10_1 - 1)

		if iter_10_1 <= #var_10_2 then
			local var_10_7 = var_10_2[iter_10_1]

			arg_10_0:UpdateSkill(var_10_6, var_10_7)
		else
			setActive(var_10_6:Find("icon"), false)
			setActive(var_10_6:Find("add"), true)
		end

		setActive(var_10_6, iter_10_1 <= var_10_4)
	end

	setActive(arg_10_0.skillArrLeft, #var_10_2 > 3)
	setActive(arg_10_0.skillArrRight, #var_10_2 > 3)

	if #var_10_2 > 3 then
		onScroll(arg_10_0, arg_10_0.skillRect, function(arg_12_0)
			setActive(arg_10_0.skillArrLeft, arg_12_0.x > 0.01)
			setActive(arg_10_0.skillArrRight, arg_12_0.x < 0.99)
		end)
	else
		GetComponent(arg_10_0.skillRect, typeof(ScrollRect)).onValueChanged:RemoveAllListeners()
	end

	setAnchoredPosition(arg_10_0.skillPanel, {
		x = 0
	})
end

function var_0_0.UpdateSkill(arg_13_0, arg_13_1, arg_13_2)
	if arg_13_0.shipGroup:isBluePrintGroup() then
		for iter_13_0, iter_13_1 in ipairs(arg_13_0.shipGroup:getBluePrintChangeSkillList()) do
			if iter_13_1[1] == arg_13_2 then
				arg_13_2 = iter_13_1[2]

				break
			end
		end
	end

	local var_13_0 = findTF(arg_13_1, "icon")
	local var_13_1 = getSkillConfig(arg_13_2)

	LoadImageSpriteAsync("skillicon/" .. var_13_1.icon, var_13_0)
	setActive(arg_13_1:Find("icon"), true)
	setActive(arg_13_1:Find("add"), false)
	onButton(arg_13_0, arg_13_1, function()
		arg_13_0:emit(ShipProfileScene.SHOW_SKILL_INFO, var_13_1.id, {
			id = var_13_1.id,
			level = pg.skill_data_template[var_13_1.id].max_level
		})
	end, SFX_PANEL)
end

function var_0_0.OnDestroy(arg_15_0)
	return
end

return var_0_0
