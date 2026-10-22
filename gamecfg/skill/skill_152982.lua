return {
	uiEffect = "",
	name = "",
	cd = 0,
	id = 152982,
	picture = "0",
	desc = "本舰被击破时，跳转到无敌",
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 152983
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			target_choise = "TargetShipTag",
			targetAniEffect = "",
			arg_list = {
				buff_id = 152986,
				ship_tag_list = {
					"Merkuriy"
				}
			}
		}
	}
}
