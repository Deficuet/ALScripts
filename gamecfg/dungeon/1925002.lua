return {
	map_id = 10001,
	id = 1925002,
	stages = {
		{
			stageIndex = 1,
			backGroundStageID = 1,
			timeCount = 300,
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
			stageBuff = {
				{
					id = 201250,
					level = 1
				},
				{
					id = 295023,
					level = 1
				},
				{
					id = 295028,
					level = 1
				}
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
							monsterTemplateID = 16735011,
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
							buffList = {
								200974
							},
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
										3275201
									}
								},
								{
									index = 2,
									switchParam = 10,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3275202,
										3275203
									},
									removeWeapon = {
										3275201
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
										3275204
									},
									removeWeapon = {
										3275202,
										3275203
									}
								},
								{
									index = 5,
									switchParam = 2,
									switchTo = 6,
									switchType = 1,
									addWeapon = {
										3275205
									},
									removeWeapon = {
										3275204
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 4,
									addWeapon = {
										3275206
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 9,
									addWeapon = {
										3275207,
										3275208
									}
								},
								{
									switchParam = 3,
									switchTo = 9,
									index = 8,
									switchType = 1,
									setAI = 70252,
									addBuff = {
										201372
									},
									removeWeapon = {
										3275205,
										3275206,
										3275207,
										3275208
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 10.5,
									addWeapon = {
										3275209
									}
								},
								{
									switchType = 1,
									switchTo = 1,
									index = 10,
									switchParam = 4.5,
									setAI = 75016,
									removeWeapon = {
										3275209
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
