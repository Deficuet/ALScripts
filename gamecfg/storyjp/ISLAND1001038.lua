return {
	id = "ISLAND1001038",
	mode = 10,
	map = {
		{
			101100,
			10050000
		},
		{
			101400,
			10050003
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
			say = "――ラコニア、これが用意してくれた……巣箱？",
			characterId = 0,
			face2Face = {
				{
					0,
					101100
				}
			},
			turnto = {
				{
					101400,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "そうです。全部ラコニアが作りました！これに巣を入れてあげてください！",
			characterId = 101100,
			subName = "果樹園管理人",
			animation = "hi",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "ん？……ミツバチの巣！",
			characterId = 101400,
			subName = "農園管理人",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "指揮官、すごい……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――運よく近くの森で見つけたんだ。無事に持ってこれて助かったよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ラコニアの作ってくれた箱もちょうどいいな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "新しい仲間には……一番いいお家をあげる……",
			characterId = 101400,
			subName = "農園管理人",
			animation = "shy",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101400,
			subName = "農園管理人",
			say = "指揮官……気をつけて入れてね……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			style = 2,
			sequence = {
				{
					"<size=45>二人で慎重に、蜂の群れが作った巣を大きな巣箱へと移した。</size>",
					2
				},
				{
					"<size=45>警戒して飛び出した蜂が数匹いたが、攻撃してくることはなかった。</size>",
					4
				},
				{
					"<size=45>しかし、新しい環境に移った群れの羽音は明らかに前より騒がしかった。</size>",
					6
				}
			}
		},
		{
			characterId = 0,
			say = "――なんだ？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "しっ……みんな……怖がってる……",
			characterId = 101400,
			subName = "農園管理人",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "慣れない環境だから……甘い贈り物をあげれば落ち着くと思う……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "甘い贈り物？",
			characterId = 101100,
			subName = "果樹園管理人",
			animation = "doubt",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "…ほんの少し……蜂蜜があれば……",
			characterId = 101400,
			subName = "農園管理人",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――わかった、すぐに採ってくる。それで静まるといいが",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "農園管理人",
			characterId = 101400,
			say = "うん……指揮官……気をつけて……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
