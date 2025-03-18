return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DDAILYCONVERSATION34",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actor = 0,
			side = 0,
			say = "要出去走走吗？",
			hidePaintObj = true
		},
		{
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "我很乐意，我的{dorm3d}。不过，您是觉得天狼星这里有些乏味……吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "单纯只是想和天狼星出门。",
					flag = 1
				},
				{
					content = "想要两个人一起去外面做些什么",
					flag = 2
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "dianshouzhi",
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
			side = 2,
			actorName = 20220,
			nameColor = "#FFFFFF",
			hidePaintObj = true,
			dir = 1,
			say = "您的意思，难道是约、约会？！天狼星明白了，一定会好好侍奉{dorm3d}，直到您彻底尽兴为止❤",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
