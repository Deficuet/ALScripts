return {
	id = "ACTRUYUE01",
	bgName = "bg_bianzhihua_cg4",
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
			voice = "event:/dorm/drom3d_noshiro_other/drom3d_Noshiro_hello2"
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
