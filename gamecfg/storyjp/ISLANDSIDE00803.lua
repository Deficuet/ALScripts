return {
	id = "ISLANDSIDE00803",
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
			say = "――ステファン、頼まれた木材を取ってきた",
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
			say = "うわぁぁ、指揮官！こんなタイミングで悪いけど、緊急のお願いがあるの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "さっき出荷する荷物をカウントしてたら、倉庫から石炭が一山なくなってたの！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "なくなった原因を調べることよりも今はとにかく石炭を補充しないと！",
			characterId = 100300,
			subName = "物流スタッフ",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "物流スタッフ",
			characterId = 100300,
			say = "だから……お願い、指揮官！さっきの依頼に上乗せして報酬は倍払うから！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "――石炭はどこから取ってくればいい？",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "鉱山に行って。さっき指揮官が行った伐採場のすぐ隣！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――戻ってきたばかりで、また引き返すことになるのか……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "weep",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "うぅ、お願い指揮官！今はもうあなたしか頼れないの！あなたがいなかったら、私……！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――わかったわかった、行ってくるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100300,
			subName = "物流スタッフ",
			say = "やった！じゃあ、いいお知らせを待ってるからね！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
