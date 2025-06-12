return {
	id = "DORM3DVIDEO1101",
	mode = 2,
	shipGroup = 10517,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "感应到Honey正在想我，所以我瞅准时机打来电话了~",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone49",
			options = {
				{
					content = "听起来更像是你突然想起我了。",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "talk_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_happy_start",
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
			say = "听起来不赖，不过Honey你就得接收我的通讯轰炸了~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone50"
		},
		{
			say = "好了，开玩笑的~虽然是开玩笑，不过想你也是真的哦~♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone51"
		},
		{
			say = "提醒你别忘记晚上的约会，才是我这通电话的主要目的呢。",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone52"
		},
		{
			say = "Honey你对行程安排有想法吗？或者说……更期待我专门为你准备的惊喜呢？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone53"
		},
		{
			say = "不过，这种放纵的事情，可不能在通讯里说明哦……♡",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone54",
			options = {
				{
					content = "放纵……是指？。",
					flag = 1
				}
			},
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
							name = "face_amazed_start",
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
			say = "当然是……做些会让我们都很开心的事情~♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone55"
		},
		{
			say = "Honey靠过来一点！乖~这个距离还不够近，再过来一些~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone56"
		},
		{
			say = "能…听…到…吗？",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone57",
			options = {
				{
					content = "能听到，不过为什么要压低声音说话……？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "talk_02-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_smile_start",
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
			say = "那当然是因为这样比较有氛围啦~！",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone58"
		},
		{
			say = "想象一下……就我们两个人紧紧靠在一起……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone59"
		},
		{
			say = "在最适合感受到彼此体温的距离下……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone60"
		},
		{
			say = "让我喂你吃那些我准备好的冰淇淋~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone61"
		},
		{
			say = "看着你投入地、愉悦地……融化在冰淇淋甜腻轻盈的味道中~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone62"
		},
		{
			say = "是不是听起来就很幸福~？",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone63",
			options = {
				{
					content = "这就是你说的，让我们两个都开心的事么？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "excited_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_smile_start",
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
			say = "是或不是，你比较期待哪个答案呢~♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone64"
		},
		{
			say = "不过我觉得，与你共度的时间才是最开心的~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone65"
		},
		{
			say = "好啦~我要去为晚上的约会做准备了~就先挂电话了哦~！",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone66"
		},
		{
			say = "等会直接见面吧~我最爱的Honey！",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone67",
			options = {
				{
					content = "嗯，等下见",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shy_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "face_smile_start",
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
			say = "mua~（Kiss音）",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone68"
		}
	}
}
