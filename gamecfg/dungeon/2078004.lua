return {
	id = 2078004,
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
						id = "JUFENGYUWUAIHUILANG19-1"
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
							monsterTemplateID = 16908104,
							delay = 0,
							corrdinate = {
								0,
								0,
								68
							},
							buffList = {}
						},
						{
							monsterTemplateID = 16908104,
							delay = 0,
							corrdinate = {
								0,
								0,
								32
							},
							buffList = {}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 102,
					conditionType = 0,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908103,
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
								200826
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
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 5,
									addWeapon = {
										3440601
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 3,
									removeWeapon = {
										3440601
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 2,
									addWeapon = {
										3440602,
										3440603
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 10,
									addWeapon = {
										3440604
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 2,
									removeWeapon = {
										3440602,
										3440603,
										3440604
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 2,
									addWeapon = {
										3440605
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 4,
									addWeapon = {
										3440606
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 8,
									addWeapon = {
										3440607
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5,
									removeWeapon = {
										3440605,
										3440606,
										344060
									}
								}
							}
						}
					}
				},
				{
					triggerType = 0,
					waveIndex = 103,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908002,
							delay = 3,
							corrdinate = {
								-15,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908003,
							delay = 3,
							corrdinate = {
								-20,
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
							delay = 3,
							corrdinate = {
								-15,
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
					waveIndex = 104,
					conditionType = 1,
					preWaves = {
						103
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16908003,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-15,
								0,
								60
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908003,
							reinforceDelay = 6,
							delay = 0,
							corrdinate = {
								-15,
								0,
								40
							},
							buffList = {
								8001,
								8007
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16908002,
							delay = 0,
							corrdinate = {
								-20,
								0,
								75
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908001,
							delay = 0,
							corrdinate = {
								-25,
								0,
								65
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16908001,
							delay = 0,
							corrdinate = {
								-25,
								0,
								35
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
								-20,
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
						id = "JUFENGYUWUAIHUILANG19-2"
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
				tmpID = 9600194,
				configId = 9600194,
				skinId = 9600190,
				id = 1,
				level = 120,
				equipment = {
					3217501,
					150093,
					150093
				},
				properties = {
					cannon = 300,
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
						id = 153010,
						level = 10
					},
					{
						id = 153020,
						level = 10
					},
					{
						id = 152,
						level = 10
					},
					{
						id = 340,
						level = 10
					}
				}
			},
			{
				tmpID = 900565,
				configId = 900565,
				skinId = 9600210,
				id = 2,
				level = 120,
				equipment = {
					3217501,
					150093,
					150093
				},
				properties = {
					cannon = 300,
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
					}
				}
			},
			{
				tmpID = 9600124,
				configId = 9600124,
				skinId = 9600120,
				id = 3,
				level = 120,
				equipment = {
					3217501,
					150093,
					150093
				},
				properties = {
					cannon = 300,
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
						id = 151750,
						level = 10
					},
					{
						id = 151760,
						level = 10
					},
					{
						id = 152,
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
