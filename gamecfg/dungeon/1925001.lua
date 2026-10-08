return {
	map_id = 10001,
	id = 1925001,
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
					key = true,
					waveIndex = 105,
					preWaves = {},
					triggerParams = {
						timeout = 1
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 104,
					conditionType = 0,
					preWaves = {
						500,
						102,
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16735001,
							delay = 0,
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
									switchParam = 1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 5,
									addWeapon = {
										3275001
									}
								},
								{
									index = 2,
									switchParam = 10,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3275002,
										3275003
									},
									removeWeapon = {
										3275001
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 3
								},
								{
									index = 4,
									switchParam = 5,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										3275004
									},
									removeWeapon = {
										3275002,
										3275003
									}
								},
								{
									index = 5,
									switchParam = 2,
									switchTo = 6,
									switchType = 1,
									addWeapon = {
										3275005
									},
									removeWeapon = {
										3275004
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 4,
									addWeapon = {
										3275006
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 9,
									addWeapon = {
										3275007
									}
								},
								{
									switchParam = 3,
									switchTo = 9,
									index = 8,
									switchType = 1,
									setAI = 70252,
									addBuff = {
										201371
									},
									removeWeapon = {
										3275005,
										3275006,
										3275007
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 10.5,
									addWeapon = {
										3275009
									}
								},
								{
									switchType = 1,
									switchTo = 1,
									index = 10,
									switchParam = 4.5,
									setAI = 75016,
									removeWeapon = {
										3275009
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					conditionType = 1,
					preWaves = {
						101
					},
					triggerParams = {}
				},
				{
					triggerType = 11,
					waveIndex = 4001,
					conditionType = 1,
					preWaves = {},
					triggerParams = {
						op = 0,
						key = "warning"
					}
				}
			}
		}
	},
	fleet_prefab = {}
}
