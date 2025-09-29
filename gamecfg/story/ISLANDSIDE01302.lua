return {
	id = "ISLANDSIDE01302",
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
			animation = "hi",
			characterId = 100300,
			subName = "货运管理员",
			say = "指挥官你好呀~有什么需要吗？",
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
			animation = "talk",
			characterId = 0,
			say = "拉科尼娅告诉我，她订购的薰衣草肥料，一直没有送到……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "是遇到什么麻烦了？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "哦！我正打算去找她呢……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "货运管理员",
			say = "我们运送货物经过农场的时候，突然冲出来好多奶牛！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "结果货物散落了一地……都混到一起了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "拉科尼娅的肥料，很有可能也在里面。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "这样么……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
