return {
	uiEffect = "",
	name = "",
	cd = 0,
	painting = 0,
	id = 115154,
	picture = "0",
	castCV = "",
	desc = "",
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
			target_choise = "TargetSelf",
			targetAniEffect = "",
			arg_list = {
				buff_id = 115157
			}
		},
		{
			type = "BattleSkillAddBuff",
			casterAniEffect = "",
			targetAniEffect = "",
			target_choise = {
				"TargetEntityUnit",
				"TargetAllHelp",
				"TargetShipTag",
				"TargetHighestHP"
			},
			arg_list = {
				buff_id = 115158,
				ship_tag_list = {
					"kuangsanfenshen"
				}
			}
		},
		{
			type = "BattleSkillTeleport",
			target_choise = {
				"TargetEntityUnit",
				"TargetAllHelp",
				"TargetShipTag"
			},
			arg_list = {
				ship_tag_list = {
					"kuangsanzibaofenshen"
				},
				targetRelativeCorrdinate = {
					hrz = 0,
					vrt = 0
				}
			}
		}
	}
}
