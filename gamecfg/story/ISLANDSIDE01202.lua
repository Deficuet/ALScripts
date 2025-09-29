return {
	id = "ISLANDSIDE01202",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			animation = "think",
			characterId = 100400,
			subName = "农田管理员",
			say = "露西的修枝剪坏了，所以想借用一下我的吗？",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "这倒是没问题……不过上次我就提醒过她要准备个新的来着……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "看样子她最近确实很忙呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "农田管理员",
			say = "来，给你。修枝剪可是很锋利的，要小心别割伤自己了哦？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "我知道了，谢谢。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "然后，那个……用完之后请记得还给我……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 0,
			say = "放心吧，我会督促她的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
