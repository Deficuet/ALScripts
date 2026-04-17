return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 106531,
	picture = "0",
	castCV = "",
	desc = "【金黄色的维纳斯饮料】：自身命中、装填属性提高",
	aniEffect = {
		effect = "jineng",
		offset = {
			0,
			-2,
			0
		}
	},
	effect_list = {
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetSelf"
			},
			arg_list = {
				buff_id = 106532
			}
		}
	}
}
