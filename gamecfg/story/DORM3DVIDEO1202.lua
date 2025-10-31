return {
	id = "DORM3DVIDEO1202",
	mode = 2,
	shipGroup = 30707,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "{dorm3d}, you've finally returned to me!",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone1/dorm3d_Taiho_telephone1",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "hello_01-start",
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
			say = "Every minute and every second of your absence is just unbearable.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone2/dorm3d_Taiho_telephone2",
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
							name = "Face_shame_start",
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
			say = "Especially when it's time to go to bed... No matter how greedily I inhale your lingering scent...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone3/dorm3d_Taiho_telephone3",
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
			say = "The thought of a night alone is just too dreadful to bear!",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone4/dorm3d_Taiho_telephone4",
			options = {
				{
					content = "I missed you, too, so I left early.",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "refuse_01-start",
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
			say = "Ah, my dear {dorm3d}'s love... I want more and more of it♡",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone5/dorm3d_Taiho_telephone5",
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
							name = "Face_smile_start",
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
			say = "Until your heart is occupied by nothing but me...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone6/dorm3d_Taiho_telephone6",
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
			say = "I'll have to endeavor more than ever for your sake.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone7/dorm3d_Taiho_telephone7",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "encourage_01-start",
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
			say = "Incidentally... I'm hoping those pests didn't bother you on your way back to me?",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone8/dorm3d_Taiho_telephone8",
			options = {
				{
					content = "Not especially.",
					flag = 1
				}
			},
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "enquire_01-start",
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
			say = "I trust you, {dorm3d}... Heehee, because I know every little thing you do♡",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone9/dorm3d_Taiho_telephone9",
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
			say = "Those damn pests always take advantage of your sweet nature and cling to you every opportunity they get...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone10/dorm3d_Taiho_telephone10",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "doubt_01-start",
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
			say = "Heehee. I'd better find an opportunity to deal with them.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone11/dorm3d_Taiho_telephone11"
		},
		{
			say = "Now, idle talk of chores aside...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone12/dorm3d_Taiho_telephone12"
		},
		{
			say = "My longing for you won't be sated through a screen.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone13/dorm3d_Taiho_telephone13",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "sad_01-start",
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
			say = "I so desperately need to have alone time with you, {dorm3d}...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone14/dorm3d_Taiho_telephone14",
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
			say = "You know that I'm always open and honest with you.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone15/dorm3d_Taiho_telephone15",
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
			say = "And, being honest, the thought of your arrival... already has me heating up.",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone16/dorm3d_Taiho_telephone16"
		},
		{
			say = "Come to my side, dear, and let me soothe your fatigue. Or... release it all over me♡",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone17/dorm3d_Taiho_telephone17",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "happy_01-start",
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
			say = "There's no need to force yourself when you're with me...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone18/dorm3d_Taiho_telephone18",
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
			say = "So please, {dorm3d}...",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone19/dorm3d_Taiho_telephone19"
		},
		{
			say = "Come to me as soon as possible♡",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone20/dorm3d_Taiho_telephone20",
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
							name = "Face_shame_start",
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
			say = "And I will fulfill every last one of your needs.",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_Taiho_telephone21/dorm3d_Taiho_telephone21",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "happy_01-start",
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
		}
	}
}
