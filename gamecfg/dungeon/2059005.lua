return {
	id = 2059005,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 300,
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
						timeout = 0.5
					}
				},
				{
					triggerType = 1,
					waveIndex = 200,
					preWaves = {},
					triggerParams = {
						timeout = 2
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
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16889004,
							delay = 0,
							corrdinate = {
								-5,
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
									switchParam = 1.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 2,
									addWeapon = {
										3429301,
										3429302
									}
								},
								{
									switchParam = 7,
									switchTo = 3,
									index = 2,
									switchType = 1,
									setAI = 70252
								},
								{
									index = 3,
									switchParam = 10,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3429303,
										3429304
									},
									removeWeapon = {
										3429301,
										3429302
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 2,
									setAI = 75016,
									removeWeapon = {
										3429303,
										3429304
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 22,
									addWeapon = {
										3429305,
										3429306,
										3429307,
										3429308
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 3,
									removeWeapon = {
										3429305,
										3429306,
										3429307,
										3429308
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 6,
									addWeapon = {
										3429309
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 1,
									switchParam = 1,
									removeWeapon = {
										3429309
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 2001,
					conditionType = 0,
					preWaves = {
						200
					},
					triggerParams = {},
					spawn = {},
					airFighter = {
						{
							interval = 10,
							onceNumber = 5,
							formation = 10006,
							delay = 0,
							templateID = 3429501,
							totalNumber = 40,
							weaponID = {
								3429503
							},
							attr = {
								airPower = 40,
								maxHP = 15,
								attackRating = 23
							}
						},
						{
							interval = 10,
							onceNumber = 5,
							formation = 10006,
							delay = 5,
							templateID = 3429502,
							totalNumber = 40,
							weaponID = {
								3429504
							},
							attr = {
								airPower = 40,
								maxHP = 15,
								attackRating = 23
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
