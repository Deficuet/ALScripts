return {
	id = 2077001,
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
				60,
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
					triggerType = 0,
					key = true,
					waveIndex = 101,
					conditionType = 1,
					preWaves = {
						100
					},
					triggerParams = {},
					spawn = {
						{
							monsterTemplateID = 16907002,
							delay = 0,
							sickness = 0.1,
							corrdinate = {
								-10,
								0,
								54
							},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							buffList = {
								200825,
								201940
							},
							phase = {
								{
									switchParam = 0.1,
									switchTo = 1,
									index = 0,
									switchType = 1,
									setAI = 20006
								},
								{
									index = 1,
									switchType = 1,
									switchTo = 0,
									switchParam = 300,
									addBuff = {
										201946
									}
								}
							}
						},
						{
							monsterTemplateID = 16907001,
							delay = 0,
							corrdinate = {
								-10,
								0,
								53
							},
							bossData = {
								hpBarNum = 100,
								icon = ""
							},
							buffList = {
								200825,
								201945
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
									switchParam = 4,
									addWeapon = {
										3445001,
										3445002
									}
								},
								{
									index = 2,
									switchType = 1,
									switchTo = 3,
									switchParam = 4,
									addWeapon = {
										3445003
									}
								},
								{
									index = 3,
									switchType = 1,
									switchTo = 4,
									switchParam = 6,
									addWeapon = {
										3445004
									}
								},
								{
									index = 4,
									switchType = 1,
									switchTo = 5,
									switchParam = 1,
									removeWeapon = {
										3445001,
										3445002,
										3445003,
										3445004
									}
								},
								{
									index = 5,
									switchType = 1,
									switchTo = 6,
									switchParam = 2,
									addWeapon = {
										3445005,
										3445006
									}
								},
								{
									index = 6,
									switchType = 1,
									switchTo = 7,
									switchParam = 14.8,
									addWeapon = {
										3445007
									}
								},
								{
									index = 7,
									switchType = 1,
									switchTo = 8,
									switchParam = 2,
									removeWeapon = {
										3445005,
										3445006,
										3445007
									}
								},
								{
									index = 8,
									switchType = 1,
									switchTo = 9,
									switchParam = 3,
									addWeapon = {
										3445008
									}
								},
								{
									index = 9,
									switchType = 1,
									switchTo = 10,
									switchParam = 1,
									addWeapon = {
										3445009
									}
								},
								{
									index = 10,
									switchType = 1,
									switchTo = 11,
									switchParam = 1,
									addWeapon = {
										3445010
									}
								},
								{
									index = 11,
									switchType = 1,
									switchTo = 12,
									switchParam = 1,
									addWeapon = {
										3445011
									}
								},
								{
									index = 12,
									switchType = 1,
									switchTo = 13,
									switchParam = 8,
									addWeapon = {
										3445012
									}
								},
								{
									index = 13,
									switchType = 1,
									switchTo = 14,
									switchParam = 1,
									removeWeapon = {
										3445008,
										3445009
									}
								},
								{
									index = 14,
									switchType = 1,
									switchTo = 15,
									switchParam = 1,
									removeWeapon = {
										3445010
									}
								},
								{
									index = 15,
									switchType = 1,
									switchTo = 16,
									switchParam = 1,
									removeWeapon = {
										3445011
									}
								},
								{
									index = 16,
									switchType = 1,
									switchTo = 1,
									switchParam = 1,
									removeWeapon = {
										3445012
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
				}
			}
		}
	},
	fleet_prefab = {}
}
