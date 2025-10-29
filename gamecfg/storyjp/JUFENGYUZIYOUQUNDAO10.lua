return {
	id = "JUFENGYUZIYOUQUNDAO10",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv3_1",
			hidePaintObj = true,
			say = "トレジャーハンターが全速力で自由群島に向かってる中、自由群島の某所――",
			bgm = "theme-tempest-light",
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
			bgName = "bg_jufengv3_1",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うぅ……この島にも超すごいお宝の気配がないから、ここでもない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv3_1",
			hidePaintObj = true,
			say = "ドルフィンは地図に島の輪郭を描き、続けてバツ印をつけた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600010,
			side = 2,
			bgName = "bg_jufengv3_1",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "21番目もないかー。じゃあ次は22番目だ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "bg_jufengv3_1",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "出発出発～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv3_1",
			hidePaintObj = true,
			say = "翌日の早朝になり、テンペスタ船団は二手に分かれて行動を始めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv3_1",
			hidePaintObj = true,
			say = "ゴールデン・ハインドとメアリー・セレストは復讐の女王船団との親睦を深め、ロイヤル・フォーチュンとドルフィンは各島の調査を始めた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv3_1",
			hidePaintObj = true,
			say = "数々の経験を経て、ロイヤル・フォーチュンでも一目でわかるほどの凄さが自由群島の遺跡にはあった。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "bg_jufengv3_1",
			hidePaintObj = true,
			say = "しかし……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "bg_jufengv3_1",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "こういう事に一番詳しい指揮官もいなければ、「たーみなる」も連れていかれちゃって……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "bg_jufengv3_1",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "テンペスタ船団が宝探しをするのに、ドルフィンの特殊能力で一つずつ探すしかないの！？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "bg_jufengv3_1",
			factiontag = "テンペスタ船団",
			dir = 1,
			fontsize = 60,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はあ————！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			action = {
				{
					type = "shake",
					y = 45,
					delay = 0,
					dur = 0.15,
					x = 0,
					number = 2
				}
			},
			effects = {
				{
					active = true,
					name = "speed"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			say = "小島の1番目から20番目、そして21番目から40番目と続き……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			},
			effects = {
				{
					active = false,
					name = "speed"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			say = "二人は丸一日を使い、なんとか夕食の前に島の五分の一を調査し終えた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600040,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "さあ～カンパイ！団長とドルフィンもおつかれさん！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_194",
			hidePaintObj = true,
			say = "復讐の女王船団が建てた酒場の中で、テンペスタ船団は豪勢な夕食を堪能していた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そうね……本当に大変な一日だったよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うっ……耳と頭が痛い……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600030,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今日は大変だったんだから、美味しいものをいっぱい食べたらいいわぁ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600030,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そういえば団長、調査で何かいい情報は掴めた？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600010,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "島の遺跡の中には、本当にお宝があるみたいだったよ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "小さい島にあるほぼ廃墟の遺跡でさえも何かしらあるから……本島と中規模の島にどんな宝物が眠ってるのか……考えるだけでワクワクするね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600030,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "あら？そこまで価値があるの？今回は大儲けね～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600030,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "それよりアンに譲ってもらう島はもう決めた？早くそれを見てみたいわぁ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "そっちはまだね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "今日は2割ぐらい調査できたよ。ただ、それぞれの島に宝物があっても、どれもドルフィンが感知した超すごいお宝じゃなかった",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600010,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "だからドルフィンと一緒に、全ての島を調べてから決めようと思って！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "はい！わたしたちは最初に到着した船団だから、一番いい島を選ばないと～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うぅ……でも頭が痛いよぉ………",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9600030,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "団長、先にドルフィンを部屋まで送ってくるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600010,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "ゆっくり休んでね！明日も頑張りましょ！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_194",
			factiontag = "テンペスタ船団",
			dir = 1,
			actor = 9600110,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "うん……絶対に超すごいお宝を見つけるんだから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
