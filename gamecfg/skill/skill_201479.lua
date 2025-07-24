return {
	effect_list = {},
	{
		effect_list = {
			{
				target_choise = "TargetNil",
				type = "BattleSkillSummon",
				arg_list = {
					spawnData = {
						monsterTemplateID = 16757301,
						corrdinate = {
							-88,
							0,
							58
						},
						phase = {
							{
								switchParam = 5,
								switchTo = 1,
								index = 0,
								switchType = 1,
								setAI = 70277
							},
							{
								switchType = 1,
								dive = "STATE_FLOAT",
								switchTo = 2,
								index = 1,
								switchParam = 50,
								addWeapon = {
									3733,
									3733
								}
							},
							{
								switchParam = -120,
								dive = "STATE_RETREAT",
								switchTo = 3,
								index = 2,
								switchType = 4
							},
							{
								index = 3,
								retreat = true
							}
						}
					}
				}
			}
		}
	},
	{
		effect_list = {
			{
				target_choise = "TargetNil",
				type = "BattleSkillSummon",
				arg_list = {
					spawnData = {
						monsterTemplateID = 16757301,
						corrdinate = {
							-88,
							0,
							58
						},
						phase = {
							{
								switchParam = 5,
								switchTo = 1,
								index = 0,
								switchType = 1,
								setAI = 70277
							},
							{
								switchType = 1,
								dive = "STATE_FLOAT",
								switchTo = 2,
								index = 1,
								switchParam = 50,
								addWeapon = {
									3733,
									3733
								}
							},
							{
								switchParam = -120,
								dive = "STATE_RETREAT",
								switchTo = 3,
								index = 2,
								switchType = 4
							},
							{
								index = 3,
								retreat = true
							}
						}
					}
				}
			},
			{
				target_choise = "TargetNil",
				type = "BattleSkillSummon",
				arg_list = {
					spawnData = {
						monsterTemplateID = 16757302,
						buffList = {},
						corrdinate = {
							-50,
							0,
							40
						},
						phase = {
							{
								switchParam = 20006,
								switchTo = 1,
								index = 0,
								switchType = 1,
								setAI = 70278
							}
						}
					}
				}
			},
			{
				target_choise = "TargetNil",
				type = "BattleSkillSummon",
				arg_list = {
					spawnData = {
						monsterTemplateID = 16757303,
						buffList = {},
						corrdinate = {
							-50,
							0,
							60
						},
						phase = {
							{
								switchParam = 300,
								switchTo = 1,
								index = 0,
								switchType = 1,
								setAI = 70278
							}
						}
					}
				}
			}
		}
	},
	id = 201479,
	name = "2025优米雅联动 剧情战 我方单位召唤",
	cd = 0,
	painting = 0
}
