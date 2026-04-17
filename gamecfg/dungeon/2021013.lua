return {
	id = 2021013,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 180,
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
				50,
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
					waveIndex = 202,
					preWaves = {},
					triggerParams = {
						timeout = 18
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
							monsterTemplateID = 16841001,
							delay = 0,
							corrdinate = {
								10,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16841101,
							delay = 0,
							deadFX = "youeryuan_bomb",
							corrdinate = {
								0,
								0,
								55
							}
						},
						{
							monsterTemplateID = 16841001,
							delay = 0,
							corrdinate = {
								10,
								0,
								35
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
					waveIndex = 102,
					conditionType = 1,
					preWaves = {
						101,
						202
					},
					triggerParam = {},
					spawn = {
						{
							deadFX = "youeryuan_bomb",
							reinforceDelay = 6,
							monsterTemplateID = 16841102,
							delay = 0,
							corrdinate = {
								-5,
								0,
								55
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16841001,
							delay = 0,
							corrdinate = {
								10,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16841002,
							delay = 0,
							corrdinate = {
								3,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16841002,
							delay = 0,
							corrdinate = {
								3,
								0,
								45
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16841001,
							delay = 0,
							corrdinate = {
								10,
								0,
								35
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
							monsterTemplateID = 16841301,
							reinforceDelay = 6,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							buffList = {},
							bossData = {
								hpBarNum = 20,
								icon = ""
							},
							phase = {
								{
									switchType = 1,
									dive = "STATE_RAID",
									switchTo = 2,
									index = 0,
									switchParam = 1,
									setAI = 10007
								},
								{
									index = 2,
									switchParam = 2.5,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3381002
									},
									removeWeapon = {}
								},
								{
									index = 3,
									switchParam = 2.5,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3381001,
										3381003
									},
									removeWeapon = {
										3381002
									}
								},
								{
									switchParam = 0.5,
									dive = "STATE_FLOAT",
									switchTo = 11,
									index = 4,
									switchType = 1,
									removeWeapon = {
										3381001,
										3381003
									},
									addBuff = {
										8976
									}
								},
								{
									switchType = 1,
									switchTo = 12,
									index = 11,
									switchParam = 2,
									setAI = 75016,
									addWeapon = {
										3381004,
										3381006
									},
									removeWeapon = {}
								},
								{
									index = 12,
									switchParam = 4,
									switchTo = 13,
									switchType = 1,
									addWeapon = {
										3381005
									},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 14,
									index = 13,
									switchParam = 2,
									setAI = 70252,
									addWeapon = {},
									removeWeapon = {}
								},
								{
									index = 14,
									switchParam = 6,
									switchTo = 15,
									switchType = 1,
									addWeapon = {
										3381007,
										3381008
									},
									removeWeapon = {
										3381004,
										3381006
									}
								},
								{
									index = 15,
									switchParam = 1.5,
									switchTo = 11,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										3381007,
										3381008
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16841001,
							delay = 0,
							corrdinate = {
								12,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16841001,
							delay = 0,
							corrdinate = {
								12,
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
