return {
	map_id = 10001,
	id = 1855002,
	stages = {
		{
			stageIndex = 1,
			backGroundStageID = 1,
			timeCount = 300,
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
			stageBuff = {
				{
					id = 201250,
					level = 1
				},
				{
					id = 295023,
					level = 1
				},
				{
					id = 295028,
					level = 1
				}
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
					key = true,
					waveIndex = 105,
					preWaves = {},
					triggerParams = {
						timeout = 1
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
							deadFX = "none",
							monsterTemplateID = 16665011,
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
								201103,
								200974
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
									switchParam = 5,
									setAI = 10001,
									addWeapon = {
										3205101
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 2.5,
									addWeapon = {
										3205102
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 6,
									addWeapon = {
										3205103
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 1,
									setAI = 70188,
									addWeapon = {
										3205106
									},
									removeWeapon = {
										3205101,
										3205102,
										3205103
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 16,
									addWeapon = {
										3205104,
										3205105
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 1,
									switchParam = 2.5,
									removeWeapon = {
										3205104,
										3205105,
										3205106
									}
								},
								{
									switchParam = 300,
									switchTo = 1,
									index = 999,
									switchType = 1,
									setAI = 20006
								}
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
							monsterTemplateID = 16665012,
							delay = 0.5,
							sickness = 0.1,
							corrdinate = {
								-10,
								0,
								65
							},
							bossData = {
								hpBarNum = 50,
								icon = ""
							},
							buffList = {
								200914,
								201105,
								201106,
								201140
							},
							phase = {
								{
									switchParam = 0.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 8,
									addWeapon = {
										3205108
									}
								},
								{
									index = 2,
									switchParam = 17,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3205111
									},
									removeWeapon = {
										3205108
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 2,
									setAI = 70271,
									removeWeapon = {
										3205111
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 21,
									setAI = 70273,
									addWeapon = {
										3205113,
										3205115
									}
								},
								{
									switchType = 1,
									switchTo = 1,
									index = 5,
									switchParam = 1,
									setAI = 70271,
									removeWeapon = {
										3205113,
										3205115
									}
								}
							}
						},
						{
							monsterTemplateID = 16665013,
							delay = 0.5,
							sickness = 0.1,
							corrdinate = {
								-10,
								0,
								39
							},
							bossData = {
								hpBarNum = 50,
								icon = ""
							},
							buffList = {
								200914,
								201105,
								201106,
								201140
							},
							phase = {
								{
									switchParam = 0.5,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 2,
									switchParam = 8,
									addWeapon = {
										3205109
									}
								},
								{
									index = 2,
									switchParam = 17,
									switchTo = 3,
									switchType = 1,
									addWeapon = {
										3205112
									},
									removeWeapon = {
										3205109
									}
								},
								{
									switchType = 1,
									switchTo = 4,
									index = 3,
									switchParam = 2,
									setAI = 70272,
									removeWeapon = {
										3205112
									}
								},
								{
									switchType = 1,
									switchTo = 5,
									index = 4,
									switchParam = 21,
									setAI = 70273,
									addWeapon = {
										3205114,
										3205116
									}
								},
								{
									switchType = 1,
									switchTo = 1,
									index = 5,
									switchParam = 2,
									setAI = 70272,
									removeWeapon = {
										3205114,
										3205116
									}
								}
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
							monsterTemplateID = 16665014,
							delay = 0.5,
							sickness = 0.1,
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
									setAI = 20006
								},
								{
									index = 1,
									switchParam = 8,
									switchTo = 2,
									switchType = 1,
									addBuff = {
										201108
									},
									addWeapon = {
										3205117
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 2,
									removeWeapon = {
										3205117
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 1,
									addBuff = {
										201109
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 1,
									switchParam = 300,
									addWeapon = {
										3205118,
										3205119,
										3205120,
										3205121,
										3205122,
										3205125
									}
								}
							}
						}
					}
				},
				{
					triggerType = 8,
					waveIndex = 900,
					conditionType = 1,
					preWaves = {
						103
					},
					triggerParams = {}
				},
				{
					triggerType = 11,
					waveIndex = 4001,
					conditionType = 1,
					preWaves = {},
					triggerParams = {
						op = 0,
						key = "warning"
					}
				}
			}
		}
	},
	fleet_prefab = {}
}
