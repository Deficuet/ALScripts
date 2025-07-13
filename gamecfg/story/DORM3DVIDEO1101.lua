return {
	id = "DORM3DVIDEO1101",
	mode = 2,
	shipGroup = 10517,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "I felt your intense yearning from afar, so I called you just in time!",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone49",
			options = {
				{
					content = "It sounds more like you were the yearner.",
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
			say = "If I was, you'd be getting TONS of spam calls and texts from me.",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone50"
		},
		{
			say = "Pssh, I'm kidding. But it is true that I'm yearning for you!",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone51"
		},
		{
			say = "Anyway, the real reason I'm calling you is to remind you about our date tonight.",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone52"
		},
		{
			say = "Do you have any plans in store? Or... should I presume that you're looking forward to my plans?",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone53"
		},
		{
			say = "Oh, but maybe we should talk about \"indulgences\" in person, hmm?♡",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone54",
			options = {
				{
					content = "Indulgences, as in...?",
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
			say = "Something that's tons of fun for both of us, of course...♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone55"
		},
		{
			say = "Honey, come a little closer. Just come here... Yeah, good.",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone56"
		},
		{
			say = "Can... you... hear... me?",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone57",
			options = {
				{
					content = "I can, but why are we whispering?",
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
			say = "Because it suits the vibe better, duh!",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone58"
		},
		{
			say = "Just imagine... You and I, skin against skin...",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone59"
		},
		{
			say = "So close that we feel each other's warmth...",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone60"
		},
		{
			say = "Me feeding you the ice cream I made...",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone61"
		},
		{
			say = "Watching you go wild over its sweet, refreshing flavor...",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone62"
		},
		{
			say = "Doesn't the thought of it fill you with bliss?",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone63",
			options = {
				{
					content = "Is that fun for both of us?",
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
			say = "What answer are you expecting? Yes, or no?",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone64"
		},
		{
			say = "Haha, as for me, any time spent with you is tons of fun!",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone65"
		},
		{
			say = "Anyway, I gotta get ready for the date. I'll hang up now!",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone66"
		},
		{
			say = "We'll meet again tonight, my beloved honey!",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone67",
			options = {
				{
					content = "Yep. See you later.",
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
			say = "Mwah!",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone68"
		}
	}
}
