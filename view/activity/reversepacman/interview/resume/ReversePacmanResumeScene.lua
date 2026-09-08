local var_0_0 = class("ReversePacmanResumeScene", import("view.base.BasePanel"))

function var_0_0.Ctor(arg_1_0, arg_1_1, arg_1_2)
	arg_1_0._go = arg_1_1.gameObject

	var_0_0.super.Ctor(arg_1_0, arg_1_0._go)

	arg_1_0._parentClass = arg_1_2

	arg_1_0:attach(arg_1_2)
	arg_1_0:Init()
end

function var_0_0.Init(arg_2_0)
	onButton(arg_2_0, arg_2_0.uiCloseBtn, function()
		arg_2_0:emit(ReversePacmanInterviewScene.ON_CLOSE_RESUME)
	end, SOUND_BACK)
	setText(arg_2_0.uiSpeedTitleText, i18n("reverse_pacman_resume_speed"))
	setText(arg_2_0.uiTypeTitleText, i18n("reverse_pacman_resume_ai_type"))
	setText(arg_2_0.uiTypeDescTitleText, i18n("reverse_pacman_resume_ai_desc"))
	setText(arg_2_0.uiCloseText, i18n("reverse_pacman_resume_close_1"))
end

function var_0_0.didEnter(arg_4_0, arg_4_1)
	local var_4_0 = pg.activity_chasing_character[arg_4_1]
	local var_4_1 = ShipGroup.getDefaultShipConfig(pg.ship_skin_template[var_4_0.skin_id].ship_group).id
	local var_4_2 = Ship.New({
		id = var_4_1,
		configId = var_4_1,
		skin_id = var_4_0.skin_id
	})

	GetImageSpriteFromAtlasAsync("shipYardIcon/" .. var_4_2:getPainting(), var_4_2:getPainting(), arg_4_0.uiIconImage)

	local var_4_3 = 0
	local var_4_4 = ReversePacmanTools.GetFavorabilityValue(arg_4_1)

	for iter_4_0, iter_4_1 in ipairs(var_4_0.love_level) do
		if var_4_4 >= iter_4_1[2] then
			setFillAmount(arg_4_0[string.format("uiHeartImage%s", iter_4_0)], 1)
		else
			local var_4_5 = var_4_4 - var_4_3

			if var_4_5 < 0 then
				var_4_5 = 0
			end

			setFillAmount(arg_4_0[string.format("uiHeartImage%s", iter_4_0)], var_4_5 / (iter_4_1[2] - var_4_3))
		end

		var_4_3 = iter_4_1[2]
	end

	setText(arg_4_0.uiNameText, HXSet.hxLan(var_4_0.name))

	local var_4_6 = ReversePacmanHomeConst.GetSpeedLevel(var_4_0.base_speed)

	setText(arg_4_0.uiSpeedText, i18n("reverse_pacman_speed_level", var_4_6.color, var_4_6.value))

	local var_4_7
	local var_4_8 = var_4_0.ai_type == ReversePacmanHomeConst.ROLE_TYPE.CHASER and "reverse_pacman_type_chaser_1" or var_4_0.ai_type == ReversePacmanHomeConst.ROLE_TYPE.AMBUSHER and "reverse_pacman_type_ambusher_1" or "reverse_pacman_type_planner_1"

	setText(arg_4_0.uiTypeText, i18n(var_4_8))
	setText(arg_4_0.uiTypeDescText, var_4_0.trait_text)
	setText(arg_4_0.uiDescText, var_4_0.resume_text)
end

function var_0_0.willExit(arg_5_0)
	arg_5_0:detach()
end

return var_0_0
