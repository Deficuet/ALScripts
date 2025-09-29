return {
	id = "ISLANDSIDE01205",
	mode = 10,
	map = {
		{
			101100,
			10050002
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
			animation = "embarrass",
			characterId = 101100,
			subName = "果园管理员",
			say = "啊哈哈……这么一说确实是这样呢……",
			face2Face = {
				{
					0,
					101100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果园管理员",
			characterId = 101100,
			say = "放心，等我忙完这一阵子之后肯定会去买新的！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "还有什么没完成的工作？我来帮你解决吧。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "clap",
			characterId = 101100,
			subName = "果园管理员",
			say = "呜哇！今天是被幸运眷顾的一天呢！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "果园管理员",
			characterId = 101100,
			say = "放心，我一定会给指挥官准备超级美味的水果的！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "不过要想种出美味的水果，在种植前还是要给土壤施肥才行，可以麻烦指挥官帮忙吗？",
			characterId = 101100,
			subName = "果园管理员",
			animation = "sad",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
