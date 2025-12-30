return {
	id = "DORM3DVIDEO1401",
	mode = 2,
	shipGroup = 49905,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "……はあ、やっと出たわね",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone1/dorm3d_aegir_telephone1",
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
			say = "遅すぎて空の星という星を全部数え尽くしちゃったわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone2/dorm3d_aegir_telephone2",
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
			say = "あまりに遅いから、そっちに行って縛り上げて連れ戻してやろうかとも考えたけど……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone3/dorm3d_aegir_telephone3",
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
			say = "……まあ、やめといてやるわ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone4/dorm3d_aegir_telephone4",
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
			say = "せっかくこっちから連絡してやってるのに……何か私に言うことはないの？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone5/dorm3d_aegir_telephone5",
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
							name = "Face_shame_start",
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
			say = "というか……いつまで私を見つめてるわけ？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone6/dorm3d_aegir_telephone6",
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
			say = "はぁ……なんだかイライラしてきたわ……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone7/dorm3d_aegir_telephone7",
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
			say = "……じっとしてなさい。そう、そのままよ",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone8/dorm3d_aegir_telephone8"
		},
		{
			say = "一方的に見られるのは癪だから",
			wait = 2,
			voice = "event:/dorm/dorm3d_aegir_telephone9/dorm3d_aegir_telephone9",
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
			say = "だったらこっちだって、お前をじっと見つめてやる……",
			wait = 2,
			voice = "event:/dorm/dorm3d_aegir_telephone10/dorm3d_aegir_telephone10",
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
			say = "……ああもう！お前……なんでそんなに平然と目をそらさずにいられるの……！",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone11/dorm3d_aegir_telephone11"
		},
		{
			say = "ふん……そんなに見たいなら、好きなだけ見せてやる",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone12/dorm3d_aegir_telephone12"
		},
		{
			say = "……あのね、こういう時って何か言うものじゃないの？",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone13/dorm3d_aegir_telephone13",
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
			say = "……言い出しっぺなのに、結局私がドキドキしてるじゃない……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone14/dorm3d_aegir_telephone14",
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
			say = "くっ……なんだか負けた気分……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone15/dorm3d_aegir_telephone15",
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
			say = "もう一回よ。見つめてやるからそのままじっとしていなさい",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone16/dorm3d_aegir_telephone16"
		},
		{
			say = "……ふぅ。さっきよりは少し慣れてきたかしら……",
			wait = 1,
			voice = "event:/dorm/dorm3d_aegir_telephone17/dorm3d_aegir_telephone17",
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
			say = "そういえば……お前、なんだかちょっと疲れてるように見えるわね",
			wait = 2,
			voice = "event:/dorm/dorm3d_aegir_telephone18/dorm3d_aegir_telephone18",
			options = {
				{
					content = "最近、ちょっと仕事が立て込んでて",
					flag = 1
				}
			},
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
			say = "最近？毎日そんな感じでしょ？気の毒なこと",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone19/dorm3d_aegir_telephone19",
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
			say = "だったら……ちょっとくらい癒やしてやらなくもないわ",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone20/dorm3d_aegir_telephone20",
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
			say = "……笑うな！たださっきのドキドキ感が…ちょっと新鮮なだけよ…",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone21/dorm3d_aegir_telephone21",
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
			say = "でもそうね…癒しってなると、こうして喋ってるだけじゃ無理があるわ",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone22/dorm3d_aegir_telephone22",
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
			say = "……わかったわね？",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone23/dorm3d_aegir_telephone23",
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
			say = "私、ここで待ってるから♪",
			wait = 0.5,
			voice = "event:/dorm/dorm3d_aegir_telephone24/dorm3d_aegir_telephone24",
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
