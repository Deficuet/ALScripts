return {
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				skill_id = 151920,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				skill_id = 151921,
				target = "TargetSelf"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				skill_id = 151922,
				target = "TargetPlayerFlagShip"
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				minTargetNumber = 1,
				target = "TargetNationalityFriendly",
				nationality = 1,
				exceptCaster = true,
				skill_id = 151923
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
	desc_get = "",
	name = "",
	init_effect = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 151920,
	icon = 151920,
	last_effect = ""
}
