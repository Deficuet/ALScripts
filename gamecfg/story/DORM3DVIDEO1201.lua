return {
	id = "DORM3DVIDEO1201",
	mode = 2,
	shipGroup = 30707,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "Oh, {dorm3d}, you finally picked up!",
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
			say = "I... I had the most awful dream!",
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
			say = "I was walking alone in the forest at night...",
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
			say = "Wind would blow through the trees, making scary noises and making their shadows sway...",
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
			say = "That was already creepy enough, but then, red eyes started staring at me from all over!",
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
			say = "I was too scared to look, and I wouldn't dare turn around... I just knew they were right behind me!",
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
			say = "Just before the dark could swallow me up, though, {dorm3d} appeared before my eyes!",
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
			say = "You drove off those red-eyed beasts and saved my life!",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone29/dorm3d_Taiho_telephone29"
		},
		{
			say = "I knew you'd never abandon me, my love... No matter what, you're always there.",
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
			say = "Even in my dreams, you're so wonderful that it sends my heart aflutter♡",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone31/dorm3d_Taiho_telephone31",
			options = {
				{
					content = "Is that when you woke up?",
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
			say = "Absolutely not! After that, I expressed my endless gratitude while you continued to protect me.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone32/dorm3d_Taiho_telephone32"
		},
		{
			say = "While we dashed through the forest, a single bead of sweat dropped from your brow and onto my lips...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone33/dorm3d_Taiho_telephone33"
		},
		{
			say = "Unable to bear waiting any longer, I tried to confess my love – but then came a gust of wind!",
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
			say = "How awful! That was what woke me up...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone35/dorm3d_Taiho_telephone35",
			options = {
				{
					content = "Was your window open when the rain started?",
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
			say = "I left my window open and waited patiently for you, {dorm3d}, but you never came...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone37/dorm3d_Taiho_telephone37"
		},
		{
			say = "I waited for so, so, so very long...",
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
			say = "{dorm3d}... You must come right away...",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone39/dorm3d_Taiho_telephone39",
			options = {
				{
					content = "I'm on my way. Don't catch a cold, okay?",
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
			say = "You always indulge me, my love, even in my most needy moments.",
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
			say = "At this rate, you're going to make me into a selfish person.",
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
			say = "You'll have to take responsibility... for letting this happen to me.",
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
			say = "I just cleaned up the rain that got inside. When you get here, I'll make sure to lock the windows and the door alike.",
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
			say = "After that... I expect you to take good care of me, {dorm3d}♡",
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
