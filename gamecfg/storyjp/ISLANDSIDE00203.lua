return {
	id = "ISLANDSIDE00203",
	mode = 10,
	map = {
		{
			100300,
			10020004
		}
	},
	look_weight = {
		{
			0.7,
			0
		},
		{
			0.3,
			0
		}
	},
	scripts = {
		{
			characterId = 0,
			animation = "hi",
			say = "――ステファン、今忙しい？",
			face2Face = {
				{
					0,
					100300
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "指揮官？い……依頼に何か問題でもあった？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――いや、依頼のことじゃないし、そんなに緊張しないで",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "――実は……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "えっ？スケッチ？絵のこと……？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "私、そういう芸術的なことはよくわからないんだよね……委託とか貨物のことばっかりだから",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――別に専門的なアドバイスがほしいわけじゃないんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――まだ何を描くか決まってないから、あちこち回ってみて、何か琴線に触れる景色や出来事がないか探してるんだ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "それならブレーメンに聞いてみるのはどう？あの子はいろんなこと知ってるし、物事の見方もかなり独特だからね～。きっと指揮官の役に立つと思うよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――ブレーメンか……よし、饅頭カフェに行ってみるとしよう",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
