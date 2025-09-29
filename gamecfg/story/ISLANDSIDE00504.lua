return {
	id = "ISLANDSIDE00504",
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
			characterId = 0,
			say = "赫莫，你听我说……",
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
			animation = "doubt",
			characterId = 100400,
			subName = "农田管理员",
			say = "指挥官……你查到什么了吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯，查到了，你听到的金属碰撞声，大概是哞哞牛脖子上的铜铃发出来的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "农田管理员",
			say = "你是说……我之前晚上看到的红眼睛……其实是哞哞牛？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没错，声音来自它脖子上的铃铛，因为有些松动，所以才会发出那种奇怪的声音。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "至于红眼睛……应该只是光正好照到它的眼睛，反射出来的红光。",
			characterId = 0,
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "它见到突然出现的人，估计也蒙了，就站着不动盯着你看。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 100400,
			subName = "农田管理员",
			say = "啊……是这样么……原来一直是我在自己吓自己啊。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "既然找到了原因，那我就能安心种地了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "农田管理员",
			say = "不过，指挥官，除了我听到的铜铃声外，梅莉也听到过奇怪的声音……而且跟我遇到的情况好像也不太一样。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "你可以再去问问她，农场里可能还有别的事情。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "还有别的声音啊……好，我这就去问问。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
