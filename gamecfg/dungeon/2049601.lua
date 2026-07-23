return {
	id = 2049601,
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
						id = "GUAITANJISHI10-1"
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
							monsterTemplateID = 16876001,
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
							monsterTemplateID = 16876002,
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
							monsterTemplateID = 16876001,
							delay = 0,
							corrdinate = {
								-5,
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
							monsterTemplateID = 16876002,
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
							monsterTemplateID = 16876003,
							delay = 0,
							corrdinate = {
								-10,
								0,
								50
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16876002,
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
						},
						{
							monsterTemplateID = 16876001,
							delay = 0,
							corrdinate = {
								0,
								0,
								60
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16876001,
							delay = 0,
							corrdinate = {
								0,
								0,
								40
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
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16876004,
							delay = 0,
							corrdinate = {
								-8,
								0,
								60
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16876005,
							delay = 0,
							corrdinate = {
								-10,
								0,
								40
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16876003,
							delay = 0,
							corrdinate = {
								-10,
								0,
								72
							},
							buffList = {
								8001,
								8007
							}
						},
						{
							monsterTemplateID = 16876003,
							delay = 0,
							corrdinate = {
								-5,
								0,
								28
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
							monsterTemplateID = 16876101,
							delay = 0.1,
							sickness = 0.5,
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
									switchParam = 0.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 75016
								},
								{
									switchType = 1,
									switchTo = 2,
									index = 1,
									switchParam = 1,
									setAI = 70252,
									addWeapon = {
										3415401
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 6,
									addWeapon = {
										3415402
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 1,
									removeWeapon = {
										3415401,
										3415402
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 11,
									addWeapon = {
										3415403,
										3415404,
										3415405
									}
								},
								{
									switchType = 1,
									switchTo = 6,
									index = 5,
									switchParam = 1.5,
									setAI = 75016,
									removeWeapon = {
										3415403,
										3415404,
										3415405
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 14,
									addWeapon = {
										3415406,
										3415407,
										3415408
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 1,
									switchParam = 2,
									removeWeapon = {
										3415406,
										3415407,
										3415408
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
						id = "GUAITANJISHI10-2"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 102344,
				configId = 102344,
				skinId = 102341,
				id = 1,
				level = 125,
				equipment = {
					12213,
					11273,
					16493
				},
				properties = {
					cannon = 250,
					air = 0,
					antiaircraft = 200,
					torpedo = 250,
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
						id = 151020,
						level = 10
					},
					{
						id = 151030,
						level = 10
					},
					{
						id = 30432,
						level = 10
					}
				}
			},
			{
				tmpID = 401114,
				configId = 401114,
				skinId = 401112,
				id = 2,
				level = 125,
				equipment = {
					41173,
					45253,
					46433
				},
				properties = {
					cannon = 250,
					air = 0,
					antiaircraft = 200,
					torpedo = 250,
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
						id = 150730,
						level = 10
					},
					{
						id = 150740,
						level = 10
					},
					{
						id = 23022,
						level = 10
					}
				}
			},
			{
				tmpID = 299054,
				configId = 299054,
				skinId = 299052,
				id = 3,
				level = 125,
				equipment = {
					22293,
					25053,
					26673
				},
				properties = {
					cannon = 250,
					air = 0,
					antiaircraft = 200,
					torpedo = 250,
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
						id = 19530,
						level = 10
					},
					{
						id = 19540,
						level = 10
					},
					{
						id = 19002,
						level = 10
					},
					{
						id = 29892,
						level = 10
					}
				}
			}
		}
	}
}
