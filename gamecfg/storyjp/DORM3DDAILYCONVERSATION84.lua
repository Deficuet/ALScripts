return {
	hideRecord = true,
	dialogbox = 2,
	mode = 2,
	id = "DORM3DDAILYCONVERSATION84",
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
			say = "{dorm3d}，您的黑眼圈好像又加重了。要处理的工作很多所以很辛苦吧。",
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
							name = "danyou",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 2,
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
			say = "如果天狼星能帮上您的忙就好了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "对了，就用一杯果蔬汁让{dorm3d}您恢复精神吧，也能够补充营养。",
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
							name = "rentong",
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
					content = "不用麻烦了",
					flag = 1
				},
				{
					content = "有你在我身边就可以恢复精神",
					flag = 2
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "虽然您这么说了……",
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
			say = "但是为了您的健康着想的话，天狼星还是为您……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "有没有除了果蔬汁以外的方法？",
					flag = 1
				}
			}
		},
		{
			actorName = 20220,
			nameColor = "#FFFFFF",
			say = "那、那么，就请用天狼星的身体来……!",
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
							name = "ganjin",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = false,
							time = 1,
							type = "wait"
						},
						{
							param = "Play",
							name = "Face_jingxi",
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
			say = "{dorm3d}？您为什么突然后退了呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
