local var_0_0 = class("IslandAwardDisplay4ShipSkillWindow", import(".IslandAwardDisplayWindow"))

function var_0_0.getUIName(arg_1_0)
	return "IslandAwardDisplayForShipSkillUI"
end

function var_0_0.OnLoaded(arg_2_0)
	var_0_0.super.OnLoaded(arg_2_0)

	arg_2_0.nameTxt = arg_2_0:findTF("frame/bg/item/name"):GetComponent(typeof(Text))
	arg_2_0.levelTxt = arg_2_0:findTF("frame/bg/item/level"):GetComponent(typeof(Text))
	arg_2_0.descTxt = arg_2_0:findTF("frame/bg/item/desc"):GetComponent(typeof(Text))
	arg_2_0.iconTr = arg_2_0:findTF("frame/bg/item/icon")
	arg_2_0.uiNewStart = UIItemList.New(arg_2_0:findTF("frame/bg/starts"), arg_2_0:findTF("frame/bg/starts/tpl"))
end

function var_0_0.Show(arg_3_0, arg_3_1)
	arg_3_1.awards = {}

	var_0_0.super.Show(arg_3_0, arg_3_1)

	arg_3_0.title.text = i18n("island_unlock_skill")

	local var_3_0 = arg_3_1.skill

	arg_3_0.nameTxt.text = var_3_0:GetName()
	arg_3_0.levelTxt.text = "[Lv." .. var_3_0:GetLevel() .. "]"
	arg_3_0.descTxt.text = var_3_0:GetEffectDesc()

	GetImageSpriteFromAtlasAsync("island/IslandSkillIcon/" .. var_3_0:GetIcon(), "", arg_3_0.iconTr)
	arg_3_0:UpdateBreakLevel(arg_3_1.ship)
end

function var_0_0.UpdateBreakLevel(arg_4_0, arg_4_1)
	local var_4_0 = arg_4_1:GetBreakMaxLevel()

	arg_4_0.uiNewStart:make(function(arg_5_0, arg_5_1, arg_5_2)
		if arg_5_0 == UIItemList.EventUpdate then
			setActive(arg_5_2:Find("Image"), arg_5_1 < arg_4_1:GetBreakLevel())
		end
	end)
	arg_4_0.uiNewStart:align(var_4_0)
end

function var_0_0.OnDestroy(arg_6_0)
	return
end

return var_0_0
