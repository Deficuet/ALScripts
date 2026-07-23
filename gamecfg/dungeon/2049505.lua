return {
	map_id = 10001,
	id = 2049505,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-80,
				20,
				90,
				70
			},
			playerArea = {
				-80,
				20,
				45,
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
						timeout = 0.1
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
							monsterTemplateID = 16874305,
							delay = 0.1,
							sickness = 0.5,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							buffList = {},
							phase = {
								{
									switchParam = 0.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 75016
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 1,
									setAI = 70252,
									addWeapon = {
										3415401
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 6,
									addWeapon = {
										3415402
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 1,
									removeWeapon = {
										3415401,
										3415402
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 11,
									addWeapon = {
										3415403,
										3415404,
										3415405
									}
								},
								{
									switchType = 1,
									switchTo = 6,
									index = 5,
									switchParam = 1.5,
									setAI = 75016,
									removeWeapon = {
										3415403,
										3415404,
										3415405
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 14,
									addWeapon = {
										3415406,
										3415407,
										3415408
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 1,
									switchParam = 2,
									removeWeapon = {
										3415406,
										3415407,
										3415408
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
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
