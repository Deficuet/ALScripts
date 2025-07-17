return {
	id = "DORM3DVIDEO1102",
	mode = 2,
	shipGroup = 10517,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "嗯？Honey接电话的速度真快~~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone25",
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
							name = "face_yihuo_start",
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
			say = "难道是……一直在那边默默地等着我的电话嘛~♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone26",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "idle",
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
			say = "咦，Honey你这是认真地在等我？对不起，是我来迟了~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone27",
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
			say = "但是好开心~乖乖期待着我的电话的Honey……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone28",
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
			say = "以静制动，等待我主动出击的Honey……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone29",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "idle",
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
			say = "怎么想都可爱过头了吧~♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone30",
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
			say = "说起来，我的表现也值得夸奖吧？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone31",
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
			say = "精心地筹划，又辛辛苦苦地忍耐了这么久……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone32"
		},
		{
			say = "就为了在Honey最想我的时候，闪耀登场——",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone33",
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
			say = "呼呼，这番表现也很惊艳吧！",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone34",
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
			say = "Honey的视线要牢牢地锁定在我身上，绝对不能移开哦~♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone35"
		},
		{
			say = "既然我们配合得这么默契——",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone36"
		},
		{
			say = "那我也要好好想想怎么奖励你才行呢~~",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone37",
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
							name = "face_think_start",
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
			say = "要怎么办呢……奖励的话，好像只能我亲自上了嘛~？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone38",
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
			say = "想对Honey你做些，这样的……那样的事情……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone39",
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
							name = "face_shy_start",
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
			say = "再像甜甜的冰淇淋一样，包裹着你……",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone40"
		},
		{
			say = "呼呼，要融化了~♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone41",
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
			say = "Honey现在的表情好有趣，好想录下来啊",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone42",
			options = {
				{
					content = "我也很喜欢你现在的表情。",
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
			say = "咦，竟然被你抓到了反击点？",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone43",
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
							name = "face_yihuo_start",
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
			say = "不愧是Honey，从不放过任何战略机会啊~♪",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone44",
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
							name = "face_yihuo_start",
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
			say = "不过呢，现在还有一个更好的机会摆在你面前哦……",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone45",
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
			say = "我可是特地为稍后的约会，安排了奖励的kiss和……更甜蜜的环节~♡",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone46",
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
			say = "所以，快点来见我吧~！",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone47",
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
			say = "否则……我就要主动出击了！",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone48",
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
							name = "face_helpless_start",
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
