return {
	map_id = 10001,
	id = 2079004,
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
						id = "TIANSHIMENDEBILANWUTAIZHANHUI1-1"
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
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16726001,
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
							monsterTemplateID = 16726004,
							delay = 0,
							corrdinate = {
								-5,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16726005,
							delay = 0,
							corrdinate = {
								-5,
								0,
								45
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16726001,
							delay = 0,
							corrdinate = {
								5,
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
					waveIndex = 102,
					conditionType = 1,
					preWaves = {
						101
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16726103,
							delay = 0,
							corrdinate = {
								0,
								0,
								55
							}
						},
						{
							monsterTemplateID = 16726002,
							delay = 0,
							corrdinate = {
								-5,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16726002,
							delay = 0,
							corrdinate = {
								-5,
								0,
								45
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16726001,
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
							monsterTemplateID = 16726001,
							delay = 0,
							corrdinate = {
								5,
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
					waveIndex = 103,
					conditionType = 1,
					preWaves = {
						102
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16726104,
							delay = 0,
							corrdinate = {
								0,
								0,
								45
							}
						},
						{
							monsterTemplateID = 16726105,
							delay = 0,
							corrdinate = {
								0,
								0,
								65
							}
						},
						{
							monsterTemplateID = 16726003,
							delay = 0,
							corrdinate = {
								-5,
								0,
								55
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16726002,
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
							monsterTemplateID = 16726002,
							delay = 0,
							corrdinate = {
								5,
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
					triggerType = 1,
					waveIndex = 201,
					preWaves = {
						501
					},
					triggerParams = {
						timeout = 12
					}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 502,
					preWaves = {
						201
					},
					triggerParams = {
						id = "TIANSHIMENDEBILANWUTAIZHANHUI1-2"
					}
				},
				{
					triggerType = 4,
					waveIndex = 301,
					preWaves = {
						502
					},
					triggerParams = {
						vanguard_unitList = {
							{
								tmpID = 403034,
								configId = 403034,
								skinId = 403030,
								id = 2,
								level = 150,
								equipment = {
									43173,
									45253,
									16493
								},
								properties = {
									cannon = 1500,
									air = 0,
									antiaircraft = 300,
									torpedo = 1200,
									durability = 30000,
									reload = 300,
									dodge = 30,
									speed = 30,
									luck = 99,
									hit = 150
								},
								skills = {
									{
										id = 23212,
										level = 10
									},
									{
										id = 201952,
										level = 1
									}
								}
							},
							{
								tmpID = 299034,
								configId = 299034,
								skinId = 299030,
								id = 3,
								level = 150,
								equipment = {
									23133,
									25053,
									16493
								},
								properties = {
									cannon = 1500,
									air = 0,
									antiaircraft = 300,
									torpedo = 1200,
									durability = 30000,
									reload = 300,
									dodge = 30,
									speed = 30,
									luck = 99,
									hit = 150
								},
								skills = {
									{
										id = 19280,
										level = 10
									},
									{
										id = 19270,
										level = 10
									},
									{
										id = 19002,
										level = 10
									},
									{
										id = 29552,
										level = 10
									},
									{
										id = 201954,
										level = 1
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					preWaves = {
						103
					},
					triggerParams = {}
				},
				{
					triggerType = 3,
					key = true,
					waveIndex = 503,
					preWaves = {
						900
					},
					triggerParams = {
						id = "TIANSHIMENDEBILANWUTAIZHANHUI1-3"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 11800024,
				configId = 11800024,
				skinId = 11800020,
				id = 1,
				level = 110,
				equipment = {
					32351,
					31251,
					16493
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 200,
					durability = 20000,
					reload = 300,
					armor = 0,
					dodge = 30,
					speed = 30,
					luck = 99,
					hit = 0
				},
				skills = {
					{
						id = 118050,
						level = 10
					},
					{
						id = 118060,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 11800014,
				configId = 11800014,
				skinId = 11800010,
				id = 1,
				level = 125,
				equipment = {
					37171,
					38151,
					16493
				},
				properties = {
					cannon = 200,
					air = 300,
					antiaircraft = 250,
					torpedo = 0,
					durability = 20000,
					reload = 600,
					armor = 0,
					dodge = 50,
					speed = 20,
					luck = 99,
					hit = 0
				},
				skills = {
					{
						id = 118010,
						level = 10
					},
					{
						id = 118020,
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
