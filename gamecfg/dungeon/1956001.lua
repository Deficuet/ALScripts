return {
	id = 1956001,
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
						timeout = 0.1
					}
				},
				{
					triggerType = 3,
					waveIndex = 501,
					preWaves = {
						100
					},
					triggerParams = {
						id = "QIYUANXIADEMIMI13-1"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						501
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766002,
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
							monsterTemplateID = 16766003,
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
							monsterTemplateID = 16766002,
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
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766001,
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
							monsterTemplateID = 16766004,
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
							monsterTemplateID = 16766001,
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
					triggerType = 0,
					key = true,
					waveIndex = 103,
					conditionType = 0,
					preWaves = {
						102
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766002,
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
							monsterTemplateID = 16766003,
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
							monsterTemplateID = 16766005,
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
							monsterTemplateID = 16766003,
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
							monsterTemplateID = 16766002,
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
					conditionType = 1,
					preWaves = {
						103
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16766201,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-10,
								0,
								50
							},
							buffList = {}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16766002,
							delay = 2,
							corrdinate = {
								-10,
								0,
								62
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766002,
							delay = 2,
							corrdinate = {
								-10,
								0,
								38
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16766001,
							delay = 2,
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
							monsterTemplateID = 16766001,
							delay = 2,
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
					triggerType = 8,
					waveIndex = 900,
					preWaves = {
						104
					},
					triggerParams = {}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 502,
					preWaves = {
						900
					},
					triggerParams = {
						id = "QIYUANXIADEMIMI13-2"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 801054,
				configId = 801054,
				skinId = 801050,
				id = 1,
				level = 120,
				equipment = {
					21613,
					25053,
					26673
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
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
						id = 151490,
						level = 10
					},
					{
						id = 151500,
						level = 10
					},
					{
						id = 30512,
						level = 10
					}
				}
			},
			{
				tmpID = 9600084,
				configId = 9600084,
				skinId = 9600080,
				id = 2,
				level = 120,
				equipment = {
					3733,
					3733,
					100
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
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
						id = 150560,
						level = 10
					},
					{
						id = 150570,
						level = 10
					},
					{
						id = 30362,
						level = 10
					}
				}
			},
			{
				tmpID = 900462,
				configId = 900462,
				skinId = 9600040,
				id = 3,
				level = 120,
				equipment = {
					3733,
					3733,
					100
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
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
						id = 17160,
						level = 10
					},
					{
						id = 30132,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 804014,
				configId = 804014,
				skinId = 804010,
				id = 1,
				level = 120,
				equipment = {
					14473,
					21633,
					26673
				},
				properties = {
					cannon = 600,
					air = 0,
					antiaircraft = 250,
					torpedo = 600,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 151390,
						level = 10
					},
					{
						id = 151400,
						level = 10
					},
					{
						id = 2,
						level = 10
					},
					{
						id = 340,
						level = 10
					},
					{
						id = 201496,
						level = 1
					}
				}
			},
			{
				tmpID = 206084,
				configId = 206084,
				skinId = 206080,
				id = 2,
				level = 120,
				equipment = {
					27333,
					28413,
					29233
				},
				properties = {
					cannon = 600,
					air = 600,
					antiaircraft = 250,
					torpedo = 0,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 16400,
						level = 10
					},
					{
						id = 16410,
						level = 10
					},
					{
						id = 16420,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 807024,
				configId = 807024,
				skinId = 807020,
				id = 3,
				level = 120,
				equipment = {
					91231,
					91353,
					91253
				},
				properties = {
					cannon = 600,
					air = 600,
					antiaircraft = 250,
					torpedo = 0,
					durability = 50000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 16990,
						level = 10
					},
					{
						id = 17000,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			}
		}
	}
}
