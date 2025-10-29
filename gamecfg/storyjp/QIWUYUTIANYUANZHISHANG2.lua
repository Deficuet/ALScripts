return {
	fadeOut = 1.5,
	mode = 2,
	id = "QIWUYUTIANYUANZHISHANG2",
	placeholder = {
		"playername"
	},
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			say = "門を越えると、景色は瞬く間に変わった。",
			bgm = "story-amahara-stage2",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			location = {
				"天の扉·？？？",
				3
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
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			say = "なんと、自分とヘレナは一面の金色の雲海の中を歩いていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 301920,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "指揮官？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 302270,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "ヘレナさん",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "ようこそ天の扉へ～！",
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
			}
		},
		{
			side = 2,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			say = "――――！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = true,
					name = "juqing02"
				}
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
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			say = "雲の中に隠れていたクラッカーが一斉に鳴り、紙吹雪が燐火のように舞い、輝いたと思いきや、跡形もなく消えていた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "わたしは伊404よ。横の二人は妙風と水無瀬。ここからはこの三人で案内するわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			effects = {
				{
					active = false,
					name = "juqing02"
				}
			}
		},
		{
			actor = 102059,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			nameColor = "#A9F548FF",
			say = "よ、よろしくね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "よろしく。ヘレナ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 301920,
			say = "よろしく～！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			say = "伊404一行がもたらした活気と情熱が、道中で張り詰めていた緊張を和らげてくれた。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――案内役がこれで三組目だな。なにかおもてなしリレーでもやってるのかな？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "おもてなしリレー？なかなか的を射てるじゃない！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――大山と四万十も天の扉に入れるのに、なぜこんな手筈になってるんだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "理由は二つあって、あの二人はまだ竜宮城で改修作業を行う必要があるの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 2,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "もう一つは今、天の扉で特別な儀式が準備されていて、環境の安定が求められるの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "だから、出入りする人が少なければ少ないほどいいってこと",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "なんにせよ、この儀式はあんたのために準備されたものだから、楽しみにしててちょうだい",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "そうだ。指揮官、ヘレナ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "この天の扉を実際に見て、どう思った？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――そうだな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――来る前にいくつか資料を調べてみたんだが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――伝承的なものなら、もっと暗くて閉鎖的で重苦しい空間とか…",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――原始的な石造りの建築物が多いのかと想像してたよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――実際は意外と広々として明るい場所なんだな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "あははは♪それ、わたしも最初はおんなじように思ってたよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "でもよく考えてみてよ。大和さんが住む場所が暗くて重苦しいわけがないでしょ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "閉鎖的というのは本当だけど、広々としてるかどうかは……それは後のお楽しみということで♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 5,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "ヘレナはどう思った？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			actor = 102059,
			say = "指揮官がの言う通り、広々として明るい感じね……それに、なんだか安心できる雰囲気があって、自然とリラックスできるような……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "そうそう！その「安心できる」って感じは紛れもなく本物よ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "天の扉の中にたくさんの法陣が設置されていて、中には明るい感情を用いて精神を安定させる効果のものもあるの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "知らず知らずのうちに精神を和らげ、心労を解消し、気分をずっと良くしてくれるわ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（なるほど、今感じた安心感は大和が設置した法陣のおかげなのか）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（ポジティブな感情で精神を安定させる、か……すごい）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "はぁ～、天の扉にいると本当に癒されるわ。なんだか帰りたくなくなっちゃう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――伊404はずっとここにいるんじゃないのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "違うわよ。わたしたちは、竜宮城側の門が修復されてから来たの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――ふむ。つまり「ナラク」事件が終わってから、徐々に仲間たちにも門戸が開かれたのか…？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "――伊404たちは何のためにここへ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "ふふん。あのお三方から割り当てられた仕事のために決まってるでしょ～",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 317020,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			say = "仕事の内容は、さっきの特別な儀式と同じで、まだ内緒♪",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_490",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 317020,
			say = "じゃあ指揮官、ヘレナ、ついてきて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
