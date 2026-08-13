return {
	id = 2056004,
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
						id = "CHENNIYUXINGGUANGZHICHENG41-1"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16886103,
							delay = 0,
							corrdinate = {
								-10,
								0,
								65
							},
							buffList = {}
						},
						{
							monsterTemplateID = 16886103,
							delay = 0,
							corrdinate = {
								-10,
								0,
								35
							},
							buffList = {}
						},
						{
							monsterTemplateID = 16886102,
							delay = 0,
							corrdinate = {
								0,
								0,
								50
							},
							buffList = {}
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
							monsterTemplateID = 16886104,
							delay = 0,
							corrdinate = {
								0,
								0,
								62
							},
							buffList = {}
						},
						{
							monsterTemplateID = 16886105,
							delay = 0,
							corrdinate = {
								0,
								0,
								38
							},
							buffList = {}
						}
					}
				},
				{
					triggerType = 5,
					waveIndex = 401,
					preWaves = {
						102
					},
					triggerParams = {
						bgm = "Beverly_short_inst"
					}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 502,
					preWaves = {
						401
					},
					triggerParams = {
						id = "CHENNIYUXINGGUANGZHICHENG41-2"
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
							monsterTemplateID = 16886202,
							reinforceDelay = 6,
							delay = 0.1,
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
								200789
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16886101,
							delay = 0,
							corrdinate = {
								0,
								0,
								70
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16886102,
							delay = 0,
							corrdinate = {
								0,
								0,
								30
							},
							buffList = {
								8001,
								8007
							}
						}
					}
				},
				{
					triggerType = 5,
					waveIndex = 402,
					preWaves = {
						103
					},
					triggerParams = {
						bgm = "theme-commander-ally"
					}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 503,
					preWaves = {
						402
					},
					triggerParams = {
						id = "CHENNIYUXINGGUANGZHICHENG41-3"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 104,
					conditionType = 0,
					preWaves = {
						503
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16886203,
							reinforceDelay = 6,
							delay = 0.1,
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
								200790
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16886102,
							delay = 0,
							corrdinate = {
								0,
								0,
								70
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16886101,
							delay = 0,
							corrdinate = {
								0,
								0,
								30
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
					waveIndex = 504,
					preWaves = {
						900
					},
					triggerParams = {
						id = "CHENNIYUXINGGUANGZHICHENG41-4"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 102364,
				configId = 102364,
				skinId = 102360,
				id = 1,
				level = 125,
				equipment = {
					22293,
					11273,
					16093
				},
				properties = {
					cannon = 500,
					air = 0,
					antiaircraft = 200,
					torpedo = 300,
					durability = 500000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 152580,
						level = 10
					},
					{
						id = 152590,
						level = 10
					},
					{
						id = 30682,
						level = 10
					},
					{
						id = 200826,
						level = 10
					}
				}
			},
			{
				tmpID = 101574,
				configId = 101574,
				skinId = 101570,
				id = 2,
				level = 125,
				equipment = {
					11273,
					15253,
					16093
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
					durability = 500000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 152600,
						level = 10
					},
					{
						id = 152610,
						level = 10
					},
					{
						id = 20042,
						level = 10
					},
					{
						id = 200826,
						level = 10
					}
				}
			},
			{
				tmpID = 101584,
				configId = 101584,
				skinId = 101580,
				id = 3,
				level = 125,
				equipment = {
					11273,
					15253,
					16093
				},
				properties = {
					cannon = 400,
					air = 0,
					antiaircraft = 200,
					torpedo = 400,
					durability = 500000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 152680,
						level = 10
					},
					{
						id = 152690,
						level = 10
					},
					{
						id = 20042,
						level = 10
					},
					{
						id = 200826,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 900406,
				configId = 900406,
				skinId = 900406,
				id = 1,
				level = 140,
				equipment = {
					17453,
					19313,
					18233
				},
				properties = {
					cannon = 600,
					air = 800,
					antiaircraft = 250,
					torpedo = 0,
					durability = 500000,
					reload = 400,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 150
				},
				skills = {
					{
						id = 340,
						level = 10
					},
					{
						id = 200826,
						level = 10
					},
					{
						id = 201879,
						level = 10
					},
					{
						id = 201881,
						level = 10
					},
					{
						id = 201884,
						level = 10
					}
				}
			},
			{
				tmpID = 107204,
				configId = 107204,
				skinId = 107200,
				id = 2,
				level = 125,
				equipment = {
					17353,
					19173,
					18073
				},
				properties = {
					cannon = 300,
					air = 400,
					antiaircraft = 250,
					torpedo = 0,
					durability = 500000,
					reload = 300,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 200
				},
				skills = {
					{
						id = 152620,
						level = 10
					},
					{
						id = 152630,
						level = 10
					},
					{
						id = 340,
						level = 10
					},
					{
						id = 200826,
						level = 10
					}
				}
			}
		}
	}
}
