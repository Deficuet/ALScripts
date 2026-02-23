return {
	id = 296312,
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
							monsterTemplateID = 295312,
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
									switchParam = 8,
									setAI = 70252,
									addWeapon = {
										2983028,
										2983033
									}
								},
								{
									index = 2,
									switchParam = 8,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										2983038,
										2983043
									},
									removeWeapon = {
										2983028,
										2983033
									}
								},
								{
									index = 3,
									switchParam = 19,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										2983048,
										2983053,
										2983058
									},
									removeWeapon = {
										2983038,
										2983043
									}
								},
								{
									switchParam = 4,
									switchTo = 5,
									index = 4,
									switchType = 1,
									setAI = 75016,
									addBuff = {
										201633,
										201636,
										200914
									},
									removeWeapon = {
										2983048,
										2983053,
										2983058
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 8,
									addWeapon = {
										2983063,
										2983068
									}
								},
								{
									index = 6,
									switchParam = 8,
									switchTo = 7,
									switchType = 1,
									addWeapon = {
										2983073
									},
									removeWeapon = {
										2983063,
										2983068
									}
								},
								{
									switchType = 1,
									switchTo = 8,
									index = 7,
									switchParam = 10,
									setAI = 70252,
									removeBuff = {
										200914
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									addWeapon = {
										2983078
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
							delay = 38,
							corrdinate = {
								-30,
								0,
								70
							},
							buffList = {
								201631
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
