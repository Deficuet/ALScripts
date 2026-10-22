return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 152921,
	desc = "",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 152925,
				delay = 0.1
			}
		},
		{
			type = "BattleSkillTeleport",
			target_choise = {
				"TargetAllHarm",
				"TargetShipTag"
			},
			arg_list = {
				delay = 0.1,
				targetRelativeCorrdinate = {
					hrz = 8,
					vrt = 0
				},
				ship_tag_list = {
					"JernbardenAim"
				}
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 152928,
				delay = 0.1
			}
		}
	}
}
