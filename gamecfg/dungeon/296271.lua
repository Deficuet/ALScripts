return {
	id = 296271,
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
							monsterTemplateID = 295271,
							delay = 0,
							score = 0,
							sickness = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							buffList = {
								200280
							},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							phase = {
								{
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 2.5
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 11,
									setAI = 70252,
									addWeapon = {
										2981020,
										2981025
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 2,
									setAI = 75016,
									removeWeapon = {
										2981020,
										2981025
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 12,
									addWeapon = {
										2981030,
										2981035
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 3,
									addWeapon = {
										2981040
									}
								},
								{
									switchType = 1,
									switchTo = 6,
									index = 5,
									switchParam = 18,
									setAI = 70252,
									addWeapon = {
										2981045
									},
									removeWeapon = {
										2981030,
										2981035
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 4,
									setAI = 75016,
									removeWeapon = {
										2981040,
										2981045
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 2,
									addWeapon = {
										2981050,
										2981055
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 11,
									addWeapon = {
										2981060,
										2981065
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 0.5,
									removeWeapon = {
										2981060,
										2981065
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 11,
									switchParam = 11,
									addWeapon = {
										2981060,
										2981065
									}
								},
								{
									index = 11,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									removeWeapon = {
										2981060,
										2981065
									}
								}
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
