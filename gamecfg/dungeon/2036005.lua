return {
	id = 2036005,
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
						id = "SHENGYINQIANDETONGMENG32-1"
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
							monsterTemplateID = 16856102,
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
							monsterTemplateID = 16856103,
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
							monsterTemplateID = 16856102,
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
							monsterTemplateID = 16856101,
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
							monsterTemplateID = 16856104,
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
							monsterTemplateID = 16856101,
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
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16856102,
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
							monsterTemplateID = 16856103,
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
							monsterTemplateID = 16856105,
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
							monsterTemplateID = 16856103,
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
							monsterTemplateID = 16856102,
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
							monsterTemplateID = 16856103,
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
							monsterTemplateID = 16856103,
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
							monsterTemplateID = 16856104,
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
							monsterTemplateID = 16856104,
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
					triggerType = 0,
					key = true,
					waveIndex = 105,
					conditionType = 0,
					preWaves = {
						104
					},
					triggerParam = {},
					spawn = {
						{
							monsterTemplateID = 16856204,
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
									index = 0,
									switchType = 1,
									switchTo = 1,
									switchParam = 1.5
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 7,
									addWeapon = {
										3393001,
										3393002
									}
								},
								{
									index = 2,
									switchParam = 10,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3393003,
										3393004,
										3393005,
										3393006
									},
									removeWeapon = {
										3393001,
										3393002
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 2,
									removeWeapon = {
										3393003,
										3393004,
										3393005,
										3393006
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 15,
									addWeapon = {
										3393007,
										3393008
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 1,
									switchParam = 0.5,
									removeWeapon = {
										3393007,
										3393008
									}
								}
							}
						}
					},
					reinforcement = {
						{
							monsterTemplateID = 16856102,
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
							monsterTemplateID = 16856102,
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
					waveIndex = 503,
					preWaves = {
						900
					},
					triggerParams = {
						id = "SHENGYINQIANDETONGMENG32-2"
					}
				}
			}
		}
	},
	fleet_prefab = {
		vanguard_unitList = {
			{
				tmpID = 403174,
				configId = 403174,
				skinId = 403170,
				id = 1,
				level = 125,
				equipment = {
					43173,
					45253,
					46433
				},
				properties = {
					cannon = 400,
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
						id = 10720,
						level = 10
					},
					{
						id = 4021,
						level = 10
					},
					{
						id = 152360,
						level = 10
					},
					{
						id = 23212,
						level = 10
					}
				}
			},
			{
				tmpID = 401144,
				configId = 401144,
				skinId = 401140,
				id = 2,
				level = 125,
				equipment = {
					41173,
					45173,
					46353
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 500,
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
						id = 152270,
						level = 10
					},
					{
						id = 152280,
						level = 10
					},
					{
						id = 23022,
						level = 10
					}
				}
			},
			{
				tmpID = 401154,
				configId = 401154,
				skinId = 401150,
				id = 3,
				level = 125,
				equipment = {
					41173,
					45173,
					46353
				},
				properties = {
					cannon = 300,
					air = 0,
					antiaircraft = 200,
					torpedo = 500,
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
						id = 152310,
						level = 10
					},
					{
						id = 152320,
						level = 10
					},
					{
						id = 23022,
						level = 10
					}
				}
			}
		},
		main_unitList = {
			{
				tmpID = 405074,
				configId = 405074,
				skinId = 405070,
				id = 1,
				level = 125,
				equipment = {
					14513,
					22293,
					90633
				},
				properties = {
					cannon = 1500,
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
						id = 152330,
						level = 10
					},
					{
						id = 152340,
						level = 10
					},
					{
						id = 152350,
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
						id = 201774,
						level = 1
					}
				}
			}
		}
	}
}
