return {
	time = 0,
	name = "2026伯利欣根活动 EX 治疗窃取",
	init_effect = "",
	stack = 1,
	id = 201783,
	picture = "",
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffHealingCorrupt",
			trigger = {
				"onTakeHealing"
			},
			arg_list = {
				corruptRate = 1,
				damageRate = 0
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onTakeHealing"
			},
			arg_list = {
				skill_id = 201783,
				target = "TargetHarmNearest"
			}
		}
	}
}
