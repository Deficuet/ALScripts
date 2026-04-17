return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 106534,
	picture = "0",
	castCV = "",
	desc = "【柯梦波丹】：同时获得所有种类【维纳斯饮料】的效果",
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
				buff_id = 106535
			}
		}
	}
}
