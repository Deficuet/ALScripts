return {
	id = "DORM3DVIDEO1201",
	mode = 2,
	shipGroup = 30707,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "呜呜呜……{dorm3d}，终于找到您了……！",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone22/dorm3d_Taiho_telephone22",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shake_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
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
			say = "{namecode:97}……呜，{namecode:97}做了一个可怕的噩梦……！",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone23/dorm3d_Taiho_telephone23",
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
							name = "Face_helpless_start",
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
			say = "梦里，{namecode:97}独自走在昏暗的林间小道中……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone24/dorm3d_Taiho_telephone24",
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
			}
		},
		{
			say = "偶尔刮过的风摇晃着树影，发出让人害怕的声响……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone25/dorm3d_Taiho_telephone25",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "emotion_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
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
			say = "在那片幽绿的世界中，{namecode:97}看到了无数双猩红的眼睛……！…",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone26/dorm3d_Taiho_telephone26",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shake_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
							type = "action"
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
			say = "{namecode:97}不敢细看，也不敢回头！{namecode:97}知道，它们就紧紧跟在我的身后！",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone27/dorm3d_Taiho_telephone27",
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
							name = "Face_helpless_start",
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
			say = "就在黑暗几乎完全吞噬{namecode:97}的前一秒——{dorm3d}，您就像奇迹般出现在我的面前！",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone28/dorm3d_Taiho_telephone28",
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
							name = "Face_helpless_start",
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
			say = "是您击退了那些红眼的怪物，救出了{namecode:97}！",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone29/dorm3d_Taiho_telephone29"
		},
		{
			say = "果然，{dorm3d}是不会抛下{namecode:97}的……无论何时，您都会陪伴在我身边~",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone30/dorm3d_Taiho_telephone30",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "invite_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
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
			say = "梦中的您，也会让{namecode:97}激动到颤抖~♡",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone31/dorm3d_Taiho_telephone31",
			options = {
				{
					content = "颤抖……有没有被吓醒呢？",
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
							name = "Face_happy_start",
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
			say = "才没有呢~梦中的{namecode:97}受到{dorm3d}的保护，还在感谢您的这份怜爱——",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone32/dorm3d_Taiho_telephone32"
		},
		{
			say = "您带着我在树林里飞驰，还有一滴汗水落在了我的唇边~",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone33/dorm3d_Taiho_telephone33"
		},
		{
			say = "我正要对{dorm3d}倾诉我的爱意，一阵狂风吹了过来！~~",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone34/dorm3d_Taiho_telephone34",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "nod_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_think_start",
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
			say = "啊，真讨厌~！！{namecode:97}就这么醒了过来……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone35/dorm3d_Taiho_telephone35",
			options = {
				{
					content = "是睡觉的时候，没有关窗户……然后下雨了？",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "shake_01",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_helpless_start",
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
			say = "……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone36/dorm3d_Taiho_telephone36",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "Idle",
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
			}
		},
		{
			say = "是{namecode:97}特意打开窗，在窗边等{dorm3d}来着~可是您迟迟不到。",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone37/dorm3d_Taiho_telephone37"
		},
		{
			say = "{namecode:97}等啊等啊~等啊~等啊~",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone38/dorm3d_Taiho_telephone38",
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
							name = "Face_think_start",
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
			say = "{dorm3d}……{namecode:97}，现在就想见您……",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone39/dorm3d_Taiho_telephone39",
			options = {
				{
					content = "身上擦干了吗？别着凉，我现在就过来看看情况。",
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
			say = "{dorm3d}……您总是这样，愿意包容这{namecode:97}的任性和无理取闹……",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_Taiho_telephone40/dorm3d_Taiho_telephone40",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "Idle",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
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
			say = "{namecode:97}会不会就这样，被您纵容成一个过分的人了呢……？",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_Taiho_telephone41/dorm3d_Taiho_telephone41",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "Idle",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_happy_start",
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
			say = "让{namecode:97}变得这样情不自禁……{dorm3d}可不能逃避责任。",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_Taiho_telephone42/dorm3d_Taiho_telephone42",
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
							name = "Face_helpless_start",
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
			say = "{namecode:97}已经擦干了雨水，等您到来时门窗一定都会锁好。",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_Taiho_telephone43/dorm3d_Taiho_telephone43",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "invite_01-start",
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
			say = "之后，就拜托{dorm3d}……好好地疼爱{namecode:97}吧~♡",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_Taiho_telephone44/dorm3d_Taiho_telephone44",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "happy_01-start1",
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
			}
		}
	}
}
