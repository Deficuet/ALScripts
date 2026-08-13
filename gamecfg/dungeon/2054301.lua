return {
	id = 2054301,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
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
							monsterTemplateID = 16884201,
							reinforceDelay = 6,
							delay = 1,
							sickness = 0.1,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								8001,
								8007
							},
							phase = {
								{
									switchType = 1,
									dive = "STATE_RAID",
									switchTo = 2,
									index = 0,
									switchParam = 1,
									setAI = 70252
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 2,
									addWeapon = {
										3426401
									}
								},
								{
									switchParam = 0.5,
									dive = "STATE_FLOAT",
									switchTo = 4,
									index = 3,
									switchType = 1,
									setAI = 70252,
									addBuff = {
										8976
									}
								},
								{
									index = 4,
									switchParam = 1.5,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										3426402
									},
									removeWeapon = {
										3426401
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 5,
									addWeapon = {
										3426403
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 1,
									removeWeapon = {
										3426402,
										3426403
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 5,
									addWeapon = {
										3426404,
										3426405
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 4,
									switchParam = 0.5,
									removeWeapon = {
										3426404,
										3426405
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16884001,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								-5,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16884001,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								-5,
								0,
								25
							},
							buffList = {
								8001,
								8007
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
					spawn = {},
					reinforcement = {
						{
							monsterTemplateID = 16884007,
							moveCast = true,
							delay = 8,
							corrdinate = {
								5,
								0,
								60
							},
							buffList = {
								8001
							},
							phase = {
								{
									switchParam = 8,
									dive = "STATE_RAID",
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20005
								}
							},
							corrdinate = {
								5,
								0,
								40
							},
							buffList = {
								8001
							},
							phase = {
								{
									switchParam = 8,
									dive = "STATE_RAID",
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20005
								}
							}
						},
						reinforceDuration = 180
					}
				},
				{
					triggerType = 0,
					waveIndex = 2002,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {},
					reinforcement = {
						{
							monsterTemplateID = 16884006,
							delay = 4,
							sickness = 0.1,
							corrdinate = {
								5,
								0,
								66
							},
							buffList = {
								8001
							}
						},
						{
							monsterTemplateID = 16884006,
							delay = 4,
							sickness = 0.1,
							corrdinate = {
								5,
								0,
								34
							},
							buffList = {
								8001
							}
						},
						reinforceDuration = 180
					}
				},
				{
					triggerType = 0,
					waveIndex = 105,
					conditionType = 0,
					preWaves = {
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16695010,
							delay = 0,
							deadFX = "None",
							sickness = 0.1,
							corrdinate = {
								-30,
								0,
								50
							},
							buffList = {}
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
