return {
	id = "ISLANDSIDE01105",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			say = "――木材、石炭、鉄鉱石、全部用意したよ",
			animation = "hi",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100800,
			subName = "商店街管理人",
			say = "お疲れ様です。こちらの店舗の建設も、もうすぐ終わりそうです。ただ……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――どうしたの？何か問題が起きたのか？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100800,
			subName = "商店街管理人",
			say = "はい…店舗はもうすぐ完成しますが、基本的な設備しかなくて、少し困っています",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "商店街管理人",
			characterId = 100800,
			say = "飲食業の魂と言えば、やはり新鮮な食材になります。ですので開業するまでにたくさん用意したいんですが……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――食材か……分かった、探してみるよ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 100800,
			subName = "商店街管理人",
			say = "食材の良し悪しは、今後の経営に関わる重要なものですので、できる限り良いものでお願いします",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――任せて！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
