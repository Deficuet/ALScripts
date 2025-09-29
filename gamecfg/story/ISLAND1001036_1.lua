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
			subName = "商区管理员",
			say = "指挥官你来啦，快看！店铺已经按计划建好了，现在只差最关键的……",
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
			subName = "商区管理员",
			characterId = 100800,
			say = "能够吸引大家到来的餐品了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯，你说得对，店铺修得再漂亮也没法填饱大家的肚子。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "所以我已经准备好了充足的、能够满足大家味蕾的食物。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "那接下来只要把它们都上架就好了。",
			characterId = 100800,
			subName = "商区管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "嗯，交给我就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
