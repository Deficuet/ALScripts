return {
	id = 296305,
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
							monsterTemplateID = 295305,
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
										2983026,
										2983031
									}
								},
								{
									index = 2,
									switchParam = 8,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										2983036,
										2983041
									},
									removeWeapon = {
										2983026,
										2983031
									}
								},
								{
									index = 3,
									switchParam = 19,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										2983046,
										2983051,
										2983056
									},
									removeWeapon = {
										2983036,
										2983041
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
										2983046,
										2983051,
										2983056
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 8,
									addWeapon = {
										2983061,
										2983066
									}
								},
								{
									index = 6,
									switchParam = 8,
									switchTo = 7,
									switchType = 1,
									addWeapon = {
										2983071
									},
									removeWeapon = {
										2983061,
										2983066
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
										2983076
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
