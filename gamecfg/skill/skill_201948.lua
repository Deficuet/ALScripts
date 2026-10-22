return {
	uiEffect = "",
	name = "2026风帆四期 剧情战 我方风帆蛋船",
	cd = 0,
	painting = 0,
	id = 201948,
	picture = "0",
	aniEffect = "",
	desc = "",
	effect_list = {
		{
			target_choise = "TargetNil",
			type = "BattleSkillSummon",
			arg_list = {
				delay = 0,
				spawnData = {
					monsterTemplateID = 16908211,
					buffList = {
						8001,
						8007
					},
					corrdinate = {
						-88,
						0,
						50
					},
					phase = {
						{
							switchParam = 1.5,
							switchTo = 1,
							index = 0,
							switchType = 1,
							setAI = 20006
						},
						{
							switchParam = 4,
							switchTo = 2,
							index = 1,
							switchType = 1,
							setAI = 70227
						},
						{
							index = 2,
							switchType = 1,
							switchTo = 0,
							switchParam = 300,
							addWeapon = {
								3099044,
								3099049,
								3099054,
								3099059
							}
						}
					}
				}
			}
		}
	}
}
