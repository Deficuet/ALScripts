return {
	map_id = 10001,
	id = 1895002,
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
							monsterTemplateID = 16705002,
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
								200825,
								200974,
								201297
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
									switchParam = 8,
									addWeapon = {
										3245201
									}
								},
								{
									index = 2,
									switchParam = 6,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3245202,
										3245203
									},
									removeWeapon = {
										3245201
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 2,
									addBuff = {
										201294
									}
								},
								{
									index = 4,
									switchParam = 9,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										3245204
									},
									removeWeapon = {
										3245202,
										3245203
									}
								},
								{
									index = 5,
									switchParam = 2,
									switchTo = 6,
									switchType = 1,
									addWeapon = {
										3245207,
										3245208
									},
									removeWeapon = {
										3245204
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 5.5,
									addWeapon = {
										3245209
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 0.5,
									removeWeapon = {
										3245209
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 5.5,
									addWeapon = {
										3245209
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 0.5,
									removeWeapon = {
										3245209
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 11,
									switchParam = 5.5,
									addWeapon = {
										3245209
									}
								},
								{
									index = 11,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5,
									removeWeapon = {
										3245207,
										3245208,
										3245209
									}
								},
								{
									index = 21,
									switchType = 1,
									switchTo = 22,
									switchParam = 3,
									addBuff = {
										201299
									}
								},
								{
									index = 22,
									switchType = 1,
									switchTo = 23,
									switchParam = 1,
									addWeapon = {
										3245210
									}
								},
								{
									index = 23,
									switchType = 1,
									switchTo = 24,
									switchParam = 6,
									addWeapon = {
										3245211
									}
								},
								{
									index = 24,
									switchParam = 3,
									switchTo = 25,
									switchType = 1,
									addWeapon = {
										3245212
									},
									removeWeapon = {
										3245210,
										3245211
									}
								},
								{
									index = 25,
									switchParam = 11,
									switchTo = 26,
									switchType = 1,
									addWeapon = {
										3245213
									},
									removeWeapon = {
										3245212
									}
								},
								{
									index = 26,
									switchParam = 3,
									switchTo = 22,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										3245213
									}
								},
								{
									index = 31,
									switchParam = 2,
									switchTo = 32,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {}
								},
								{
									index = 32,
									switchParam = 300,
									switchTo = 1,
									switchType = 1,
									addWeapon = {
										3245214,
										3245215
									},
									removeWeapon = {}
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
