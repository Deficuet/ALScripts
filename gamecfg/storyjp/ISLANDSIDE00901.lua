return {
	id = "ISLANDSIDE00901",
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
			say = "――自分を呼んでるって聞いたけど、どうかしたの？",
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
			animation = "nod",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "あっ！指揮官、ちょうど探しに行こうと思ってたの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "実はね、私のところにちょっと不思議な依頼が届いたの",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "一見普通の貨物輸送なんだけど、中身が何なのかを頑なに教えてくれなくて",
			characterId = 100300,
			subName = "物流スタッフ",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "どこで依頼主に会うかだけ書かれてて、詳しい輸送条件は直接会ってから教えるとだけ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ずいぶんと謎めいてるな……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "これは島の中だけの輸送で船便じゃないから、相手に説明を求めるのも難しくて……",
			characterId = 100300,
			subName = "物流スタッフ",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "いろいろと考えたんだけど……結局この依頼をお願いできるのは指揮官しかいないって思ったの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――わかった。引き受けよう。依頼主はどこにいる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "えっと……「原野の鉱山のそばで待っている」って書いてあるけど、場所はわかる？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ああ、じゃあ行ってくる",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
