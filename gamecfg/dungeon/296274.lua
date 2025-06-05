return {
	id = 296274,
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
							monsterTemplateID = 295274,
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
										2981021,
										2981026
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 2,
									setAI = 75016,
									removeWeapon = {
										2981021,
										2981026
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 12,
									addWeapon = {
										2981031,
										2981036
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 3,
									addWeapon = {
										2981041
									}
								},
								{
									switchType = 1,
									switchTo = 6,
									index = 5,
									switchParam = 18,
									setAI = 70252,
									addWeapon = {
										2981046
									},
									removeWeapon = {
										2981031,
										2981036
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 4,
									setAI = 75016,
									removeWeapon = {
										2981041,
										2981046
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 2,
									addWeapon = {
										2981051,
										2981056
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 11,
									addWeapon = {
										2981061,
										2981066
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 0.5,
									removeWeapon = {
										2981061,
										2981066
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 11,
									switchParam = 11,
									addWeapon = {
										2981061,
										2981066
									}
								},
								{
									index = 11,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									removeWeapon = {
										2981061,
										2981066
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
