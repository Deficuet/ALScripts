return {
	fadeOut = 1.5,
	dialogbox = 2,
	hideRecord = true,
	mode = 2,
	alpha = 0,
	id = "DORM3DGIFTAVG12051",
	hideSkip = true,
	hideAuto = true,
	placeholder = {
		"dorm3d"
	},
	scripts = {
		{
			actorName = 30707,
			side = 2,
			wait = 1,
			hidePaintObj = true,
			nameColor = "#FFFFFF",
			say = "嗯？{dorm3d}！怎么走路没有声音呀~",
			voice = "event:/dorm/drom3d_Taiho_gift_timeline03_voice1/drom3d_Taiho_gift_timeline03_voice1",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "amazed_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_amazed_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "你在收拾衣柜吗？",
					flag = 1
				}
			}
		},
		{
			side = 2,
			actorName = 30707,
			wait = 1,
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFFFFF",
			say = "嘿嘿~呵呵~当然不是，{namecode:97}在拿新睡衣呢~",
			voice = "event:/dorm/drom3d_Taiho_gift_timeline03_voice2/drom3d_Taiho_gift_timeline03_voice2",
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
							name = "yandere_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_smile_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
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
			actorName = 30707,
			wait = 1,
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFFFFF",
			say = "是{dorm3d}从没见过的一身，呵呵~",
			voice = "event:/dorm/drom3d_Taiho_gift_timeline03_voice3/drom3d_Taiho_gift_timeline03_voice3",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "？可以说……很期待？",
					flag = 1
				}
			}
		},
		{
			actorName = 30707,
			side = 2,
			wait = 1,
			hidePaintObj = true,
			dir = 1,
			nameColor = "#FFFFFF",
			say = "当然要期待！因为……大凤要带指挥官大人参与到睡衣的换新仪式中呢♡",
			voice = "event:/dorm/drom3d_Taiho_gift_timeline03_voice4/drom3d_Taiho_gift_timeline03_voice4",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "satisfied_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_shy_start",
							type = "action"
						},
						{
							skip = false,
							time = 1.5,
							type = "wait"
						}
					}
				},
				callbackData = {
					hideUI = false,
					name = STORY_EVENT.TEST_DONE
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
