return {
	fadeOut = 1.5,
	mode = 2,
	id = "SHISHANGTEKANNILUOHEWENHUAZHAN1",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_303",
			say = "文化展の入り組んだ廊下を進んでいくうちに突然光が閃いた。どうやら尋常ならざる場所へ足を踏み入れてしまったようだ。",
			bgm = "story-egypt-mystic",
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
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_303",
			say = "辺りで微かな香りが漂う中、突如こっちに向かって呼びかける声が聞こえてきた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？",
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			dir = 1,
			hidePainting = true,
			say = "ふっふっふー♥…聖殿に迷い込んだ「ネズミ」が一匹♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			side = 2,
			actorName = "？？？",
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			dir = 1,
			hidePainting = true,
			say = "ここの守護者として、招かれざる客をお仕置きしないと～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = "login",
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "声のした方を見ると、そこには華やかな衣装に身を包み、品定めをするようにこっちを見つめているラファエロの姿があった。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――招かれざる客って、自分のこと？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "こっちの戸惑いを見て取ったのか、ラファエロは矢継ぎ早に説明した。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			side = 2,
			say = "ん？今回は「イマーシブ」のイベントだって忘れたの？さあさあ君も早く役になりきって！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "（…確かにこのナイル文化展に来た時、それっぽい説明を受けたような）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "（それにしても、まさかロールプレイ体験型とは…）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = "main1",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "…およ？およよよ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "不届き者め、守護者を前にして上の空とは…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			side = 2,
			say = "この罰当たりを石像に変えてやらないと～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "（いきなり始まったか…とりあえずノリを合わせてみよう）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "許しを乞う",
					flag = 1
				},
				{
					content = "文化展の動線の不備を指摘する",
					flag = 2
				}
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――守護者様！自分は聖殿に迷い込んでしまっただけの観光客です！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			optionFlag = 1,
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――ただの事故ですから、どうかお許しを…！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = "headtouch",
			dir = 1,
			optionFlag = 1,
			nameColor = "#A9F548FF",
			say = "ふふ、その態度に免じて見逃してやらなくもない",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_303",
			dir = 1,
			optionFlag = 1,
			actor = 605081,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "でも君の教訓になるよう、ひとつ条件を出させてもらおうZO☆",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――普通に道なりに進んだだけなのに、ここに迷い込んだってことは",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			optionFlag = 2,
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――動線設計にそもそも問題があるからでは？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_303",
			dir = 1,
			optionFlag = 2,
			actor = 605081,
			nameColor = "#A9F548FF",
			live2d = "mission",
			say = "そそそそれは…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_303",
			dir = 1,
			optionFlag = 2,
			actor = 605081,
			nameColor = "#A9F548FF",
			live2d = true,
			say = "見逃せなくはないけど、一つ条件を出させてもらおう！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――条件って？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = "touch",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "簡単だよ！この壺にある「永遠酒」を飲み干せば帰してあげる！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "ラファエロはそう言いながら、精巧な酒壺を取り出した。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "壺にはくすんだ金色の模様が彫り込まれていて、中の液体は仄かな光を放っている。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			side = 2,
			say = "さあ〜飲み干すがいい！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "どこからともなく杯を出し、酒壺の中の液体を注ぎ始めた――",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "一杯、また一杯…何杯飲んでも、壺の中身はちっとも減らなかった。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――…あれ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 7,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = "main4",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "えへへ…やっと気付いた？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "困惑する自分を楽しんでいるのか、ラファエロは優雅に体を伸ばし、意地悪な笑みを浮かべた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "これは神の恩寵を受けた壺なの。その恵みは無尽蔵なんだから☆",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			side = 2,
			say = "さて侵入者よ、どうする？潔く観念する？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			portrait = "zhihuiguan",
			side = 2,
			bgName = "star_level_bg_303",
			nameColor = "#A9F548FF",
			hideRecordIco = true,
			actor = 605081,
			actorName = "{playername}",
			live2d = true,
			say = "――…なるほど。だがあいにくこっちは諦めが悪くてな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "意地の悪い「神」に抗うように、意固地に更に何杯か飲み干した。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "しかしその抵抗も虚しく、壺の中身は減る気配すら見せない。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = "main3",
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "んふふ…こんなに完璧なネタなんて初めて♪簡単に見逃すわけがないでしょ♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 6,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "でも心配しないで〜。石像なんかにしないよ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			side = 2,
			say = "だってあたしは「愛と美の守護者」…完璧な芸術品である君を傷つけるなんてごめんだから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 605081,
			say = "だから君を……ここに留め置かせる。それも永遠にね",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			side = 2,
			bgName = "star_level_bg_303",
			live2d = true,
			withoutActorName = true,
			nameColor = "#A9F548FF",
			say = "ラファエロは声を潜めこっちに近づき、そして勝ち誇ったかの表情を見せた。",
			hideRecordIco = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 605081,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_303",
			live2d = true,
			dir = 1,
			side = 2,
			say = "君の全てが、永遠に描き続けるに値するんだから♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
