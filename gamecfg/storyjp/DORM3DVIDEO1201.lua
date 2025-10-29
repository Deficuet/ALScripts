return {
	id = "DORM3DVIDEO1201",
	mode = 2,
	shipGroup = 30707,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "ううぅ…………指揮官様、ようやく出てくださったわ…………！",
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
			say = "大鳳は…………うぅ、恐ろしい夢を見てしまいました…………！",
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
			say = "そこでは一人で薄暗い森の小道をさまよってました…………",
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
			say = "時折吹き抜ける風で木々の影が揺れ、不気味な音を立てて…………",
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
			say = "薄気味悪い景色の中、無数の真紅の瞳が大鳳を見つめていました……！",
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
			say = "怖くて直視することも、振り返ることもできなくて…………ですが、それらは後ろに迫ってきていました…………！",
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
			say = "大鳳が闇に飲み込まれそうになったその時、指揮官様が目の前に現れましたわ！",
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
			say = "赤い目の化け物たちを追っ払い、大鳳を救ってくださった！",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone29/dorm3d_Taiho_telephone29"
		},
		{
			say = "やはり指揮官様は大鳳を見捨てたりはしませんでしたわ…………どんな時でもずっと大鳳のそばに…………",
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
			say = "例え夢の中でも、指揮官様は大鳳の心を震わせるほどに素敵ですわ♡",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone31/dorm3d_Taiho_telephone31",
			options = {
				{
					content = "そこまでなのか…それで起きたんだ？",
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
			say = "違いますわ～。そのあと指揮官様にしっかり守られて、感激も述べましたから～",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone32/dorm3d_Taiho_telephone32"
		},
		{
			say = "共に森を駆け抜けていた時、指揮官様の額から汗が一滴、大鳳の唇の端に落ちて…………",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone33/dorm3d_Taiho_telephone33"
		},
		{
			say = "愛を伝えるのを我慢できなくなった時、今度は強い風に襲われましたわ！",
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
			say = "もうなんてことでしょう！大鳳、そこで目が覚めてしまいました…………",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone35/dorm3d_Taiho_telephone35",
			options = {
				{
					content = "窓を閉め忘れてたのか…？",
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
			say = "…………",
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
			say = "大鳳は窓を開けっぱなしにして、窓辺で指揮官様が来るのを待っていました。でもどれだけ経っても指揮官様は現れなくて……",
			wait = 1,
			voice = "event:/dorm/dorm3d_Taiho_telephone37/dorm3d_Taiho_telephone37"
		},
		{
			say = "大鳳、ずっとずっとずっとずーーっと待っていました……",
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
			say = "指揮官様……大鳳は、今すぐ会いたいですわ……",
			wait = 2,
			voice = "event:/dorm/dorm3d_Taiho_telephone39/dorm3d_Taiho_telephone39",
			options = {
				{
					content = "今すぐ行くから風邪を引かないようにね",
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
			say = "指揮官様……いつもそうやって、大鳳のわがままを受け止めてくださって……",
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
			say = "このままでは大鳳、甘やかされてすぎて身勝手になってしまいますわよ……？",
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
			say = "大鳳をこんな風にした責任…指揮官様にしっかり取ってもらいませんと",
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
			say = "雨で濡れたところはもうちゃんと拭きましたし、指揮官様がいらっしゃったら窓も扉もしっかりと鍵をかけさせてもらいますから",
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
			say = "その後は指揮官様……大鳳を存分に可愛がってくださいませ♡",
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
