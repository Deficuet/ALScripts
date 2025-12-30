return {
	id = "DORM3DVIDEO1402",
	mode = 2,
	shipGroup = 49905,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "あら、随分早く出たわね",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone25/dorm3d_aegir_telephone25",
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
			say = "……もしかして、ずっと応答ボタンに指を置いてたんじゃない？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone26/dorm3d_aegir_telephone26",
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
							name = "Empty",
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
			say = "素直に認めたら？私からの電話をニヤニヤ待ってたって",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone27/dorm3d_aegir_telephone27",
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
			say = "……そんな、あっさり認めすぎよ！",
			wait = 2,
			voice = "event:/dorm/dorm3d_aegir_telephone28/dorm3d_aegir_telephone28",
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
			}
		},
		{
			say = "……もうちょっといじってやろうと思ったのに",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone29/dorm3d_aegir_telephone29",
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
			say = "考えてた冗談も出番なしなんて……残念だわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone30/dorm3d_aegir_telephone30",
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
			say = "……ああ、電話した理由？……んー……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone31/dorm3d_aegir_telephone31",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "think_01-start",
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
			say = "お前の声を聞きたくなった。いつもより聞きたくなった。それだけよ",
			wait = 2,
			voice = "event:/dorm/dorm3d_aegir_telephone32/dorm3d_aegir_telephone32",
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
			say = "そっちこそ何してたの？",
			wait = 2,
			voice = "event:/dorm/dorm3d_aegir_telephone33/dorm3d_aegir_telephone33",
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
			say = "まさか仕事中に私とのツーショットをこっそり眺めてたりしてないでしょうね？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone34/dorm3d_aegir_telephone34",
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
			say = "ふふふ……いいわ。許してやる",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone35/dorm3d_aegir_telephone35"
		},
		{
			say = "ただ、そんな写真より――本物のほうがずっと魅力的でしょ？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone36/dorm3d_aegir_telephone36"
		},
		{
			say = "……まあ、それは私にとっても同じだけど",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone37/dorm3d_aegir_telephone37",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "anger_01-start",
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
			say = "だから――顔を出しなさい。今すぐによ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone38/dorm3d_aegir_telephone38",
			dispatcher = {
				name = STORY_EVENT.TEST,
				data = {
					op_list = {
						{
							param = "Play",
							name = "stare_01-start",
							time = 0,
							type = "action",
							skip = true
						},
						{
							skip = true,
							name = "Face_angry_start",
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
			say = "もちろん、そっちから来るか、こっちが会いに行くかは選ばせてやるけど",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone39/dorm3d_aegir_telephone39",
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
			say = "選ぶ前にちゃんと考えてから決めたほうがいいわよ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone40/dorm3d_aegir_telephone40"
		},
		{
			say = "どっちを選べばご褒美が出るか、どっちを選べばオシオキが待ってるか……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone41/dorm3d_aegir_telephone41",
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
			say = "……分かってるわよね？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone42/dorm3d_aegir_telephone42",
			options = {
				{
					content = "今行くよ",
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
							name = "Face_angry_start",
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
			say = "ふふ…ずいぶん自信あるじゃない",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone43/dorm3d_aegir_telephone43"
		},
		{
			say = "それなら、ご褒美かオシオキか、会った時に教えてやるわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone44/dorm3d_aegir_telephone44",
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
			say = "だってそういう「焦らされる感じ」って……一番そそるでしょ",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone45/dorm3d_aegir_telephone45",
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
							name = "Face_common",
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
			say = "分かったなら…早く来なさい",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone46/dorm3d_aegir_telephone46",
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
			say = "答えを聞いた時、お前がどんな顔するのか……",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone47/dorm3d_aegir_telephone47",
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
			say = "ふふ、想像しただけでゾクソクするわ……",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone48/dorm3d_aegir_telephone48",
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
