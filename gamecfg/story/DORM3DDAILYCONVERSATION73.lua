return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DDAILYCONVERSATION73",
	alpha = 0,
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "这间宿舍的感觉怎么样……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "toukan",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 2.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "很好哦……因为和您的见面频率和独处时间都大大增加了，所以天狼星觉得很幸福。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "不过还是有一点不太方便呢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shy",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			},
			options = {
				{
					content = "不太方便是指？",
					flag = 1
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "就是……夜间想要侍奉{dorm3d}的话……（小声）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "…………？",
					flag = 1
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "……不，好像没什么不方便的，是天狼星没想明白。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "yaotou",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "……呵呵。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
