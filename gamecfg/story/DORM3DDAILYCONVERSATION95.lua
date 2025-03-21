return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DDAILYCONVERSATION95",
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
			say = "因为{dorm3d}您总是加班处理工作文件，所以很少有机会能看到夕阳吧。",
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
							name = "sikao1",
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
			},
			options = {
				{
					content = "所以多少觉得有些可惜",
					flag = 1
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "可惜……？是因为错失了景色的可惜吗？天狼星不太明白。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "欸？您说夕阳是白天与晚上的重要分界线，错过了就觉得一天过得很混沌？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "那，天狼星可以之后去帮您处理工作，或者接您下班吗？",
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
							name = "dianshouzhi",
							time = 0,
							type = "action",
							skip = true
						},
						{
							param = "Play",
							name = "Face_haixiu",
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
			say = "天狼星想让您看到夕阳，我的{dorm3d}。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "哪怕只是工作途中片刻的休息，天狼星也想实现您的愿望。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "天狼星，想为您做些什么……我骄傲的{dorm3d}。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
