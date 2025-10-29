return {
	id = "DORM3DVIDEO1202",
	mode = 2,
	shipGroup = 30707,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "指揮官様、ようやく戻ってきてくださいましたのね〜！",
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
			say = "指揮官様と離れてる一分一秒は、大鳳にとっては耐え難い時間でしたわ……",
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
			say = "特に、眠りにつく頃合いになると……指揮官様の残り香をいくら貪ろうと……",
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
			say = "一人きりの夜になると思うと、寂しくてたまらないんです……！",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone4/dorm3d_Taiho_telephone4",
			options = {
				{
					content = "自分も同じ気持ちだから早く上がったよ",
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
			say = "あぁ、指揮官様の愛情……もっともっとほしいですわ～♡",
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
			say = "指揮官様の心を大鳳で埋め尽くすまで",
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
			say = "そのためにも大鳳、指揮官様のためにもっと精進しなきゃ……",
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
			say = "そういえば……ここへ来る途中で、余計な害虫にまとわりつかれたりしてませんよね？",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone8/dorm3d_Taiho_telephone8",
			options = {
				{
					content = "別になかったよ",
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
			say = "大鳳、指揮官様を信じております……ふふ、指揮官様の一挙手一投足はすべてしっかり見ていますから♡",
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
			say = "忌々しい害虫たちときたら、指揮官様の優しさに付け入って、隙あらばべったりとすり寄ろうと……",
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
			say = "ふふふ、やはり時間を見つけて、徹底的に片付けないと",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone11/dorm3d_Taiho_telephone11"
		},
		{
			say = "まあ、害虫駆除の話は一旦置いておいて……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone12/dorm3d_Taiho_telephone12"
		},
		{
			say = "画面越しでは、大鳳の想いはとても伝えきれません……",
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
			say = "今はただただ、指揮官様と二人だけの時間をじっくりと堪能したく…",
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
			say = "大鳳が指揮官様に全てをさらけ出しているのはご存知でしょうし…",
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
			say = "これから指揮官様を出迎えるというだけで、体がもう……火照ってきましたわ～",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone16/dorm3d_Taiho_telephone16"
		},
		{
			say = "さあ、大鳳のそばにいらっしゃって、その疲れを大鳳にほぐさせるか……大鳳にぶちまけて♡",
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
			say = "大鳳のそばでは、無理をなさる必要はありませんわ……",
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
			say = "ですから、指揮官様……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone19/dorm3d_Taiho_telephone19"
		},
		{
			say = "どうか、早く大鳳のもとへいらしてくださいませ♡",
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
			say = "この大鳳が、指揮官様を心から満たして差し上げますから～",
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
