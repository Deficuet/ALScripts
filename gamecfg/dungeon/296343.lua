return {
	id = 296343,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 80,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-70,
				20,
				90,
				70
			},
			playerArea = {
				-70,
				20,
				37,
				68
			},
			enemyArea = {},
			fleetCorrdinate = {
				-80,
				0,
				75
			},
			waves = {
				{
					triggerType = 1,
					waveIndex = 100,
					preWaves = {},
					triggerParams = {
						timeout = 0.5
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 295343,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							buffList = {},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 6,
									setAI = 70252,
									addWeapon = {
										2985004,
										2985201
									}
								},
								{
									index = 2,
									switchParam = 12,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										2985009,
										2985014
									},
									removeWeapon = {
										2985004
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 4,
									setAI = 75016,
									removeWeapon = {
										2985201
									}
								},
								{
									index = 4,
									switchParam = 14,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										2985019,
										2985024
									},
									removeWeapon = {
										2985009,
										2985014
									}
								},
								{
									index = 5,
									switchParam = 4,
									switchTo = 6,
									switchType = 1,
									removeWeapon = {
										2985019,
										2985024
									},
									addBuff = {
										201798
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 11,
									setAI = 70252,
									addWeapon = {
										2985029,
										2985034,
										2985201
									}
								},
								{
									switchType = 1,
									switchTo = 8,
									index = 7,
									switchParam = 1,
									setAI = 75016,
									removeWeapon = {
										2985029,
										2985034
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 6.5,
									addWeapon = {
										2985039,
										2985044
									}
								},
								{
									index = 9,
									switchParam = 2.5,
									switchTo = 10,
									switchType = 1,
									removeWeapon = {
										2985044,
										2985201
									},
									addWeapon = {
										2985049
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									addWeapon = {
										2985054
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 2001,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 295901,
							delay = 39,
							corrdinate = {
								-30,
								0,
								70
							},
							buffList = {
								201799
							}
						}
					}
				},
				{
					triggerType = 8,
					key = true,
					waveIndex = 900,
					preWaves = {
						101
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
