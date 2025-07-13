return {
	id = "ACTRUYUE01",
	label = "dorm3d_VIDEO_CHAT_LABEL",
	shipGroup = 20220,
	scripts = {
		{
			say = "通话过程中背景会变为",
			wait = 3,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello1"
		},
		{
			say = "会结束当前播放",
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello2",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shuohua_buhaoyisi",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_xinxu",
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
			say = "播放结束后在下方出现",
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello3"
		},
		{
			say = "在挂断状态持",
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello4"
		},
		{
			say = "语音全部播放完",
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello5",
			options = {
				{
					content = "选项1",
					flag = 1
				},
				{
					content = "选项2",
					flag = 2
				}
			}
		},
		{
			say = "选项1",
			optionFlag = 1,
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello6"
		},
		{
			say = "选项2",
			optionFlag = 2,
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello7"
		},
		{
			say = "到语音列表",
			wait = 1,
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello9"
		}
	}
}
