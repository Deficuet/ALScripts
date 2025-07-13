return {
	id = "YUQIHANGZHIQIAN3",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			stopbgm = true,
			mode = 1,
			sequence = {
				{
					"出航せよ母港クルーズ\n\n<size=45>三 好奇心、刺激されて</size>",
					1
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_story_task",
			portrait = 106014,
			dir = 1,
			actorName = "ロング・アイランド",
			bgm = "story-richang-11",
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふはああああ…早く退勤したい……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_story_task",
			portrait = 106014,
			dir = 1,
			actorName = "ロング・アイランド",
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うぅ、なんで始業時間がこんなに早いの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "bg_story_task",
			portrait = 106014,
			dir = 1,
			actorName = "ロング・アイランド",
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "まあいっかー。マンガでも読んで頭脳体操でもするの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "「クルーズ準備会」――ドアの前に今日もやってきてしまった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "ドアの向こうからロング・アイランドの堂々としたサボり宣言が聞こえる。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "今日はマンガ…？とりあえず聞き耳を立ててみよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "電話",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "プルルルルル――",
			soundeffect = "event:/ui/bell",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "えーちょうど盛り上がってきたところなのにぃ～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "もうお仕事の電話のタイミングが悪いの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "電話",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "プルルルルル――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "はい、こちら総務担当のロング・アイランドだよ～。何か手伝いが必要なの～？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "うんうん。内装準備委員会の質問、しかと承ったの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "えーちょっと待っててね～。統括委員会に聞いてみるね～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "電話",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ガチャッ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "ふぅ。んじゃあマンガの続きぃ～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			say = "しばらくして――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			side = 2,
			actorName = "電話",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "プルルルルル――",
			soundeffect = "event:/ui/bell",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "はい、こちら総務担当のロング・アイランドだよ～。何か手伝いが必要なの～？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "ん……え？内装準備委員会？ええと、質問は……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "うん！…うんうん！回答はもうもらったの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "えー「クルーズ船内の空間が十分だから、どんな内装も試して大丈夫。統一感がなくてもオッケー」って言われたの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "そうそう。どんな感じのでも大丈夫～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "客室エリアも同じ感じにしなくても大丈夫だよ～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 106014,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "宴会ルームは昔ながらのゴージャスに？別に平気なの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "その隣のダンスホールはオシャレモダンに…？もちろん大丈夫だよ～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "とにかく、どんな感じでも問題ナッシング、なの！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "バイバ～イ、聞きたいことがあったらまたいつでも電話して～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "電話",
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ガチャッ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 106014,
			say = "ふぅ一件落着～。んじゃあマンガの続きぃ～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "……ドアから離れた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "――ふむ。相変わらずロング・アイランドは適当な仕事をしているな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "クルーズの準備は着々と進んでいるものの、流石にこのままじゃ不安になる。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "かといってハルビンと約束した以上、直接見に行ったり聞いたりすることもできない。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			say = "ただ何かはした方がいいか――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "サボる幽霊さんに制裁を下す",
					flag = 1
				},
				{
					content = "幽霊さんの心意気を褒めてあげる",
					flag = 2
				},
				{
					content = "やっぱり執務室に帰る",
					flag = 3
				}
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "――昨日はゲーム、今日は勤務時間中に堂々とマンガを読むなんて…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 1,
			say = "――そんなサボる幽霊さんには…制裁っ…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			optionFlag = 1,
			say = "ドアをこっそり開けて中に忍び込み、ロング・アイランドが読んでいるマンガの次の巻を隠した。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			optionFlag = 1,
			say = "しばらくして――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 1,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "へぇまさかこんな展開になるなんて…事件をどう解決するのかな～？えへへ、さて次の巻を…",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 1,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "………あれ？ない？…次の巻がない……？？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 1,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ええええ！？どうしてぇええ？！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			optionFlag = 2,
			say = "いや、一人で机に向かって一日を過ごすのはそもそも大変だ。そりゃサボりたくもなるさ。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			optionFlag = 2,
			say = "――マンガを読みたいんだな？ならばもっとマンガをあげよう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_story_task",
			hidePaintObj = true,
			optionFlag = 2,
			say = "ドアをこっそり開けて中に忍び込み、部屋の隅にマンガをいっぱい置いた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_169",
			hidePaintObj = true,
			optionFlag = 2,
			say = "しばらくして――",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふぅ……面白かった～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "むぅ、もう結構読んだし、さすがにちょっと仕事したほうが……",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ん？置いた覚えのない漫画があるのー。一体どこから出てきたの…？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はっ！まさかサボりの神さまから、一日サボった幽霊さんへのご褒美……！？",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			dialogShake = {
				speed = 0.08,
				x = 15,
				number = 2
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 2,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "えへへ～、じゃあ終業時間まで読みまくるよ～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 3,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ふぅ……面白かった～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 3,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今日も一日サボっちゃったの～",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_169",
			dir = 1,
			optionFlag = 3,
			actor = 106014,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あれ？もうこんな時間？いぇーい、お仕事終わり、なの～！",
			painting = {
				alpha = 0.3,
				time = 1
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
