return {
	uiEffect = "",
	name = "2026虎UR活动 剧情战 我方潜艇小人",
	cd = 0,
	painting = 0,
	id = 201922,
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
					monsterTemplateID = 16896201,
					buffList = {},
					corrdinate = {
						-88,
						0,
						50
					},
					phase = {
						{
							switchType = 1,
							switchTo = 1,
							index = 0,
							switchParam = 180,
							setAI = 70263,
							addWeapon = {
								45453,
								25313
							}
						},
						{
							switchParam = -120,
							dive = "STATE_RETREAT",
							switchTo = 2,
							index = 1,
							switchType = 4
						},
						{
							index = 2,
							retreat = true
						}
					}
				}
			}
		}
	}
}
