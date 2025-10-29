local var_0_0 = class("PublicGuildTechnologyCard", import("..cards.GuildTechnologyCard"))

function var_0_0.Update(arg_1_0, arg_1_1)
	local var_1_0 = arg_1_1.group.id
	local var_1_1 = arg_1_1.group
	local var_1_2 = arg_1_1:getConfig("name")

	arg_1_0.titleImg.text = var_1_2
	arg_1_0.iconImag.sprite = GetSpriteFromAtlas("GuildTechnology", var_1_0)

	local var_1_3 = arg_1_1:GetMaxLevel()
	local var_1_4 = arg_1_1:GetLevel()

	if arg_1_1:IsGuildMember() then
		arg_1_0.levelTxt.text = "Lv." .. var_1_4
	else
		arg_1_0.levelTxt.text = "Lv." .. var_1_4 .. "/" .. var_1_3
	end

	arg_1_0.descTxt.text = arg_1_1:GetDesc()

	setActive(arg_1_0.maxTF, var_1_3 <= var_1_4)
	setActive(arg_1_0.upgradeTF, var_1_4 < var_1_3)

	local var_1_5 = true

	removeOnButton(arg_1_0._tf)

	if var_1_4 < var_1_3 then
		local var_1_6, var_1_7 = arg_1_1:GetConsume()

		arg_1_0.guildResTxt.text = var_1_6
		arg_1_0.goldResTxt.text = var_1_7

		onButton(arg_1_0, arg_1_0._tf, function()
			if var_1_4 >= var_1_3 then
				return
			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("guild_tech_consume_tip", var_1_6, var_1_7, var_1_2),
				onYes = function()
					arg_1_0.view:emit(PublicGuildMainMediator.UPGRADE_TECH, var_1_0)
				end
			})
		end, SFX_PANEL)
	end

	setActive(arg_1_0.guildRes, var_1_5)
	setActive(arg_1_0.goldRes, var_1_5)
	setActive(arg_1_0.upgradeBtn, var_1_5)
	setActive(arg_1_0.livnessTF, not var_1_5)

	local var_1_8 = true

	setActive(arg_1_0.breakoutSlider.gameObject, var_1_8)

	if var_1_8 then
		local var_1_9 = var_1_1:GetTargetProgress()
		local var_1_10 = var_1_1:GetProgress()

		arg_1_0.breakoutSlider.value = var_1_10 / var_1_9
		arg_1_0.breakoutTxt.text = var_1_10 .. "/" .. var_1_9
	end
end

return var_0_0
