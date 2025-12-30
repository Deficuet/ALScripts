return {
	id = 1983004,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-75,
				20,
				90,
				70
			},
			playerArea = {
				-75,
				20,
				42,
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
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16793304,
							delay = 0.1,
							sickness = 0.5,
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
									switchParam = 0.5
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 4,
									addWeapon = {
										3333305
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 9,
									setAI = 70252,
									addWeapon = {
										3333306,
										3333307
									},
									removeWeapon = {
										3333305
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 6,
									setAI = 75016,
									addWeapon = {
										3333308,
										3333309
									},
									removeWeapon = {
										3333306,
										3333307
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 3,
									addWeapon = {
										3333310
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 10,
									addWeapon = {
										3333311
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 3,
									removeWeapon = {
										3333310
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 1,
									switchParam = 0.5,
									removeWeapon = {
										3333308,
										3333309,
										3333311
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
