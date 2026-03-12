return {
	id = 296320,
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
							monsterTemplateID = 295320,
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
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 1,
									addWeapon = {
										2984001,
										2984006,
										2984011
									}
								},
								{
									switchParam = 12,
									switchTo = 3,
									index = 2,
									switchType = 1,
									setAI = 70252
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 0.5,
									removeWeapon = {
										2984001,
										2984006,
										2984011
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 2,
									addWeapon = {
										2984016
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 13,
									addWeapon = {
										2984021,
										2984026
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 2,
									setAI = 75016,
									removeWeapon = {
										2984016,
										2984021,
										2984026
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 2,
									addWeapon = {
										2984031,
										2984036
									}
								},
								{
									switchParam = 16,
									switchTo = 9,
									index = 8,
									switchType = 1,
									setAI = 70252
								},
								{
									switchType = 1,
									switchTo = 10,
									index = 9,
									switchParam = 2,
									setAI = 75016,
									removeWeapon = {
										2984031,
										2984036
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 11,
									switchParam = 2,
									addWeapon = {
										2984041
									}
								},
								{
									index = 11,
									switchType = 1,
									switchTo = 12,
									switchParam = 2,
									addWeapon = {
										2984046
									}
								},
								{
									index = 12,
									switchType = 1,
									switchTo = 13,
									switchParam = 3,
									addWeapon = {
										2984051
									}
								},
								{
									index = 13,
									switchType = 1,
									switchTo = 14,
									switchParam = 4,
									addWeapon = {
										2984056
									}
								},
								{
									index = 14,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									addWeapon = {
										2984061
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
