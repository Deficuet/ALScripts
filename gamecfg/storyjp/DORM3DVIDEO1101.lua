return {
	id = "DORM3DVIDEO1101",
	mode = 2,
	shipGroup = 10517,
	label = "dorm3d_VIDEO_CHAT_LABEL",
	scripts = {
		{
			say = "ハニーがあたしを恋しく思ってるのをキャッチしたから、タイミングを狙って電話したよ～",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone49",
			options = {
				{
					content = "逆じゃないの？",
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
			say = "それなら、今頃ハニーはあたしに電話爆撃されちゃってるわね",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone50"
		},
		{
			say = "なんて、冗談よ～♪ 冗談だけど、ハニーが恋しいのは本当なんだから♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone51"
		},
		{
			say = "まあ、この電話は今夜のデートを忘れないでってリマインドしたかったの",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone52"
		},
		{
			say = "ハニー、プランは何かある？それとも⋯⋯あたしが用意したサプライズに期待してる？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone53"
		},
		{
			say = "あ、こういう「やっちゃおう」な話はここじゃ言えないわよ⋯⋯♡",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone54",
			options = {
				{
					content = "「やっちゃおう」な話って？",
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
			say = "それはもちろん⋯⋯お互いが最高に楽しめることをするって話よ～♡",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone55"
		},
		{
			say = "ハニー、ちょっとぉ⋯いいから、もうちょっと⋯⋯その調子ぃ～",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone56"
		},
		{
			say = "聞・こ・え・て・る？",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone57",
			options = {
				{
					content = "聞こえるけど⋯⋯なんで声を抑えてるの？",
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
			say = "だって、こうした方が雰囲気出るでしょ～！",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone58"
		},
		{
			say = "想像してみて⋯⋯こうしてべったりくっついて⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone59"
		},
		{
			say = "互いの温もりを一番感じられる距離で⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone60"
		},
		{
			say = "あたしが用意したアイスクリームをあーんって食べさせて⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone61"
		},
		{
			say = "甘くてふんわりした味わいにハニーが夢中になってる姿を見る⋯⋯",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone62"
		},
		{
			say = "聞いてるだけで幸せ～ってなってこない？",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone63",
			options = {
				{
					content = "それが「お互いが最高に楽しめること」かな？",
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
			say = "「はい」か「いいえ」、どっちの答えを期待してる～？",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone64"
		},
		{
			say = "あはは、あたし的にはハニーと一緒に過ごす時間が「最高に楽しめる」ことだよ～♪",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone65"
		},
		{
			say = "さて、そろそろ今夜のデートの準備をしないとね～。じゃあ、切るよ～！",
			wait = 1,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone66"
		},
		{
			say = "後で会いましょ、あたしの最愛のハニー！",
			wait = 2,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone67",
			options = {
				{
					content = "うん、また後で",
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
			say = "ちゅっ♡",
			wait = 0.5,
			voice = "event:/dorm/drom3d_NewJersey_other/dorm3d_newjersey_telephone68"
		}
	}
}
