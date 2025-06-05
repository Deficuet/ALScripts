return {
	map_id = 10001,
	id = 1929004,
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
						id = "HUANYINGMITUZHEGUANQIAPIAN4-1"
					}
				},
				{
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 0,
					preWaves = {
						501
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16739101,
							delay = 0.1,
							corrdinate = {
								-10,
								0,
								50
							},
							bossData = {
								hpBarNum = 40,
								icon = ""
							},
							buffList = {},
							phase = {
								{
									switchType = 1,
									switchTo = 1,
									index = 0,
									switchParam = 0.5,
									setAI = 20006,
									addWeapon = {
										3023001
									},
									removeWeapon = {}
								},
								{
									index = 1,
									switchParam = 4.5,
									switchTo = 2,
									switchType = 1,
									addWeapon = {
										3023008
									},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 2,
									switchParam = 1.5,
									setAI = 10001,
									addWeapon = {
										3023005
									},
									removeWeapon = {
										3023007,
										3023008
									}
								},
								{
									index = 4,
									switchParam = 2,
									switchTo = 5,
									switchType = 1,
									addWeapon = {
										3023006,
										3023002
									},
									removeWeapon = {
										3023005
									}
								},
								{
									index = 5,
									switchParam = 1,
									switchTo = 6,
									switchType = 1,
									addWeapon = {},
									removeWeapon = {
										3023006
									}
								},
								{
									index = 6,
									switchParam = 4,
									switchTo = 7,
									switchType = 1,
									addWeapon = {
										3023003
									},
									removeWeapon = {}
								},
								{
									switchType = 1,
									switchTo = 8,
									index = 7,
									switchParam = 3,
									setAI = 90029,
									addWeapon = {},
									removeWeapon = {}
								},
								{
									index = 8,
									switchParam = 2,
									switchTo = 9,
									switchType = 1,
									addWeapon = {
										3023004
									},
									removeWeapon = {
										3023002
									}
								},
								{
									index = 9,
									switchParam = 3,
									switchTo = 1,
									switchType = 1,
									addWeapon = {
										3023007
									},
									removeWeapon = {
										3023004,
										3023003
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
						101
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
						id = "HUANYINGMITUZHEGUANQIAPIAN4-2"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 900507,
				configId = 900507,
				skinId = 299010,
				id = 1,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 300,
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
						id = 19010,
						level = 10
					},
					{
						id = 19020,
						level = 10
					},
					{
						id = 19002,
						level = 10
					},
					{
						id = 29232,
						level = 10
					}
				}
			},
			{
				tmpID = 900498,
				configId = 900498,
				skinId = 702080,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 300,
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
						id = 151100,
						level = 10
					},
					{
						id = 151110,
						level = 10
					},
					{
						id = 26112,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 900509,
				configId = 900509,
				skinId = 11200010,
				id = 1,
				level = 120,
				equipment = {
					false,
					false,
					false
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
					hit = 150
				},
				skills = {
					{
						id = 112010,
						level = 10
					},
					{
						id = 112030,
						level = 10
					},
					{
						id = 2,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900508,
				configId = 900508,
				skinId = 199040,
				id = 2,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 400,
					air = 200,
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
						id = 19660,
						level = 10
					},
					{
						id = 19670,
						level = 10
					},
					{
						id = 19680,
						level = 10
					},
					{
						id = 19002,
						level = 10
					},
					{
						id = 2,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900388,
				configId = 900388,
				skinId = 607020,
				id = 3,
				level = 120,
				equipment = {
					false,
					false,
					false
				},
				properties = {
					cannon = 200,
					air = 400,
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
						id = 15370,
						level = 10
					},
					{
						id = 15380,
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
