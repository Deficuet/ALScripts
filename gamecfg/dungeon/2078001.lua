return {
	id = 2078001,
	stages = {
		{
			stageIndex = 1,
			failCondition = 1,
			timeCount = 300,
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
					triggerType = 3,
					waveIndex = 501,
					preWaves = {
						100
					},
					triggerParams = {
						id = "JUFENGYUWUAIHUILANG6-1"
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
							monsterTemplateID = 16908002,
							delay = 0,
							corrdinate = {
								0,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908023,
							delay = 0,
							corrdinate = {
								-5,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908002,
							delay = 0,
							corrdinate = {
								0,
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
					key = true,
					waveIndex = 102,
					conditionType = 0,
					preWaves = {
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908021,
							delay = 0,
							corrdinate = {
								0,
								0,
								68
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908005,
							delay = 0,
							corrdinate = {
								-5,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908021,
							delay = 0,
							corrdinate = {
								0,
								0,
								32
							},
							buffList = {
								8001,
								8007
							}
						}
					}
				},
				{
					triggerType = 3,
					waveIndex = 502,
					preWaves = {
						102
					},
					triggerParams = {
						id = "JUFENGYUWUAIHUILANG6-2"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 103,
					conditionType = 0,
					preWaves = {
						502
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908002,
							delay = 0,
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
							monsterTemplateID = 16908023,
							delay = 0,
							corrdinate = {
								-12,
								0,
								62
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908004,
							delay = 0,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908023,
							delay = 0,
							corrdinate = {
								-12,
								0,
								38
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908002,
							delay = 0,
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
					key = true,
					waveIndex = 104,
					conditionType = 0,
					preWaves = {
						103
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908023,
							delay = 0,
							corrdinate = {
								-12,
								0,
								25
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908003,
							delay = 0,
							corrdinate = {
								-12,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908024,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-5,
								0,
								38
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908005,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-5,
								0,
								62
							},
							buffList = {
								8001,
								8007
							}
						}
					}
				},
				{
					triggerType = 3,
					waveIndex = 503,
					preWaves = {
						104
					},
					triggerParams = {
						id = "JUFENGYUWUAIHUILANG6-3"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 105,
					conditionType = 0,
					preWaves = {
						503
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908101,
							reinforceDelay = 6,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 50,
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
									switchParam = 6,
									addWeapon = {
										3320201,
										3320202
									}
								},
								{
									index = 2,
									switchParam = 5,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3320203,
										3320204
									},
									removeWeapon = {
										3320201,
										3320202
									}
								},
								{
									index = 3,
									switchParam = 10,
									switchTo = 4,
									switchType = 1,
									addWeapon = {
										3320205,
										3320206
									},
									removeWeapon = {
										3320203,
										3320204
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 1,
									switchParam = 3,
									removeWeapon = {
										3320205,
										3320206
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16908002,
							delay = 0,
							corrdinate = {
								5,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908002,
							delay = 0,
							corrdinate = {
								5,
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
					waveIndex = 900,
					preWaves = {
						105
					},
					triggerParams = {}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 504,
					preWaves = {
						900
					},
					triggerParams = {
						id = "JUFENGYUWUAIHUILANG6-4"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 900563,
				configId = 900563,
				skinId = 9600010,
				id = 1,
				level = 120,
				equipment = {
					3733,
					3733,
					100
				},
				properties = {
					cannon = 200,
					air = 0,
					antiaircraft = 200,
					torpedo = 0,
					durability = 50000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 16180,
						level = 10
					},
					{
						id = 29962,
						level = 10
					}
				}
			},
			{
				tmpID = 900564,
				configId = 900564,
				skinId = 9600180,
				id = 2,
				level = 120,
				equipment = {
					3733,
					3733,
					100
				},
				properties = {
					cannon = 200,
					air = 0,
					antiaircraft = 200,
					torpedo = 0,
					durability = 50000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 152910,
						level = 10
					},
					{
						id = 30732,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 900565,
				configId = 900565,
				skinId = 9600210,
				id = 1,
				level = 120,
				equipment = {
					3217501,
					150093,
					150093
				},
				properties = {
					cannon = 500,
					air = 0,
					antiaircraft = 250,
					torpedo = 0,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 200
				},
				skills = {
					{
						id = 152880,
						level = 10
					},
					{
						id = 152890,
						level = 10
					},
					{
						id = 152,
						level = 10
					},
					{
						id = 340,
						level = 10
					},
					{
						id = 201948,
						level = 1
					}
				}
			}
		}
	}
}
