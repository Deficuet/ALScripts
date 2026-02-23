return {
	id = 1999903,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
			passCondition = 1,
			backGroundStageID = 1,
			totalArea = {
				-75,
				20,
				90,
				70
			},
			playerArea = {
				-75,
				20,
				42,
				68
			},
			enemyArea = {},
			mainUnitPosition = {
				{
					Vector3(-105, 0, 58),
					Vector3(-105, 0, 78),
					Vector3(-105, 0, 38)
				},
				[-1] = {
					Vector3(15, 0, 58),
					Vector3(15, 0, 78),
					Vector3(15, 0, 38)
				}
			},
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
					waveIndex = 202,
					preWaves = {},
					triggerParams = {
						timeout = 20
					}
				},
				{
					triggerType = 1,
					waveIndex = 203,
					preWaves = {},
					triggerParams = {
						timeout = 40
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
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								30
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								70
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							monsterTemplateID = 16589302,
							delay = 0,
							deadFX = "chengbao_yanhua_stg",
							corrdinate = {
								-5,
								0,
								50
							}
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 102,
					conditionType = 1,
					preWaves = {
						101,
						202
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								30
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 1,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								60
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 1,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								40
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								70
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							monsterTemplateID = 16589302,
							delay = 0,
							deadFX = "chengbao_yanhua_stg",
							corrdinate = {
								-5,
								0,
								50
							}
						}
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 103,
					conditionType = 1,
					preWaves = {
						102,
						203
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								30
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								50
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							deadFX = "chengbao_yanhua_stg",
							delay = 0,
							monsterTemplateID = 16589301,
							sickness = 0.5,
							corrdinate = {
								30,
								0,
								70
							},
							buffList = {
								8001,
								8002
							}
						},
						{
							monsterTemplateID = 16589302,
							delay = 0,
							deadFX = "chengbao_yanhua_stg",
							corrdinate = {
								-5,
								0,
								40
							}
						},
						{
							monsterTemplateID = 16589302,
							delay = 0,
							deadFX = "chengbao_yanhua_stg",
							corrdinate = {
								-5,
								0,
								60
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 104,
					conditionType = 0,
					preWaves = {
						101,
						102,
						103
					},
					triggerParams = {},
					spawn = {
						{
							score = 0,
							moveCast = true,
							delay = 0,
							monsterTemplateID = 16814903,
							corrdinate = {
								-5,
								0,
								50
							},
							bossData = {
								hpBarNum = 80,
								icon = ""
							},
							phase = {
								{
									switchParam = 1.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 2.5,
									setAI = 70252,
									addWeapon = {
										3359301
									}
								},
								{
									switchParam = 1,
									switchTo = 3,
									index = 2,
									switchType = 1,
									setAI = 70125
								},
								{
									index = 3,
									switchParam = 8,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3359302,
										3359303
									},
									removeWeapon = {
										3359301
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 1,
									removeWeapon = {
										3359303
									}
								},
								{
									index = 5,
									switchParam = 3,
									switchTo = 6,
									switchType = 1,
									addWeapon = {
										3359304,
										3359305
									},
									removeWeapon = {
										3359302
									}
								},
								{
									switchType = 1,
									switchTo = 7,
									index = 6,
									switchParam = 12,
									setAI = 70252,
									addWeapon = {
										3359306
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 1,
									switchParam = 2,
									removeWeapon = {
										3359304,
										3359305,
										3359306
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
						104
					},
					triggerParams = {}
				}
			}
		}
	},
	fleet_prefab = {}
}
