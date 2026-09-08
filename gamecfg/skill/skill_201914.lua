return {
	uiEffect = "",
	name = "2026虎UR活动 金鹿号旋涡发射器",
	cd = 0,
	painting = 0,
	id = 201914,
	picture = "0",
	aniEffect = "",
	desc = "",
	effect_list = {
		{
			type = "BattleSkillSummon",
			casterAniEffect = "",
			target_choise = "TargetNil",
			targetAniEffect = "",
			arg_list = {
				delay = 0,
				spawnData = {
					deadFX = "None",
					monsterTemplateID = 16566302,
					corrdinate = {
						-45,
						0,
						53
					},
					buffList = {},
					phase = {
						{
							switchParam = 1,
							switchTo = 1,
							index = 0,
							switchType = 1,
							setAI = 20006
						},
						{
							index = 1,
							switchParam = 15.5,
							switchTo = 2,
							switchType = 1,
							addBuff = {
								200638
							},
							addWeapon = {
								3096005
							}
						},
						{
							index = 2,
							switchType = 1,
							switchTo = 1,
							switchParam = 300,
							addBuff = {
								200440
							}
						}
					}
				}
			}
		}
	}
}
