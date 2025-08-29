return {
	effect_list = {
		{
			type = "BattleBuffCleanse",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id_list = {
					801203,
					801204,
					801209
				}
			}
		},
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				buff_id = 801202,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 801202,
				minWeaponNumber = 1,
				check_weapon = true,
				index = {
					3
				},
				type = {
					9
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onAttach",
				"onStack"
			},
			arg_list = {
				skill_id = 801205,
				maxWeaponNumber = 0,
				check_weapon = true,
				index = {
					3
				},
				type = {
					9
				}
			}
		}
	},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	{},
	init_effect = "",
	name = "",
	time = 6,
	color = "red",
	picture = "",
	desc = "",
	stack = 3,
	id = 801205,
	icon = 801200,
	last_effect = ""
}
