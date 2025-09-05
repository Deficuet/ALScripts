return {
	id = 296294,
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
							monsterTemplateID = 295294,
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
									switchParam = 6,
									setAI = 70252,
									addWeapon = {
										2982007,
										2982012,
										2982017
									}
								},
								{
									switchType = 1,
									switchTo = 3,
									index = 2,
									switchParam = 1,
									setAI = 75016,
									removeWeapon = {
										2982007,
										2982012,
										2982017
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 12,
									addWeapon = {
										2982022,
										2982027
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 1,
									setAI = 70252,
									removeWeapon = {
										2982022,
										2982027
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 12,
									addWeapon = {
										2982032,
										2982037
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 1.5,
									setAI = 75016,
									removeWeapon = {
										2982032,
										2982037
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 12,
									addWeapon = {
										2982042,
										2982047,
										2982052
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 2.5,
									removeWeapon = {
										2982042,
										2982047,
										2982052
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 3.5,
									addWeapon = {
										2982057
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 11,
									switchParam = 2.5,
									addBuff = {
										200974
									}
								},
								{
									index = 11,
									switchParam = 1.5,
									switchTo = 12,
									switchType = 1,
									addWeapon = {
										2982062,
										2982067
									},
									removeWeapon = {
										2982057
									}
								},
								{
									index = 12,
									switchType = 1,
									switchTo = 13,
									switchParam = 3,
									addWeapon = {
										2982077
									}
								},
								{
									index = 13,
									switchType = 1,
									switchTo = 14,
									switchParam = 4,
									addWeapon = {
										2982072
									}
								},
								{
									index = 14,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									addWeapon = {
										2982082
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
