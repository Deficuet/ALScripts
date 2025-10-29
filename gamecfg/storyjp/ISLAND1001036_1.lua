return {
	id = "ISLAND1001036_1",
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
			animation = "hi",
			characterId = 100800,
			subName = "商店街管理人",
			say = "指揮官、見てください！店舗が完成しました！あとは一番大事な……",
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
			subName = "商店街管理人",
			characterId = 100800,
			say = "みんなを呼び寄せる料理…それだけです！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "――そうだな。いくらお店が綺麗でも腹は膨れないからな",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――そこで、思わず舌鼓を打つような料理をたっぷり用意してきた",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "さすがです！それじゃあ販売ラインナップに追加すれば完成です！",
			characterId = 100800,
			subName = "商店街管理人",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "――ああ、任せておけ",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
