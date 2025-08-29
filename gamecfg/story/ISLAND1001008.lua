return {
	id = "ISLAND1001008",
	mode = 10,
	map = {
		{
			100600,
			10040032
		},
		{
			100700,
			10040031
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
			subName = "矿山管理员",
			characterId = 100600,
			say = "终于修好了，这样一来交通线就能恢复正常运转了。",
			animation = "talk",
			face2Face = {
				{
					0,
					100600
				}
			},
			turnto = {
				{
					100700,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "说不定还能赶在晚上前把货物送到呢。",
			characterId = 100700,
			subName = "林场管理员",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "嗯嗯，真是多亏指挥官了。",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 100600,
			subName = "矿山管理员",
			say = "对了，作为谢礼……啊，在这儿，这个送给你——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "好漂亮的矿石。",
					flag = 1
				}
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "是我采矿时发现的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "还有我的这份！是特别加工过的木材，上面的木纹是不是很像星星呀~",
			characterId = 100700,
			subName = "林场管理员",
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "谢谢~看来你们在这里待得还算开心。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "哼哼，车来啦~不过上面好像装满了货物，指挥官不急的话可以等下一班的。",
			characterId = 100700,
			subName = "林场管理员",
			animation = "elation",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "因为交通瘫痪的原因，这里堆积了很多需要加急送往码头的货物。",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "embarrass",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "没关系，由我来带着这些货物一起去码头就好。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "刚好我也很好奇现在这片区域的运作情况。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "那麻烦指挥官了，这是货物清单，等货物运到港口后帮忙交给帕特莉就好。",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "帕特莉？好的，交给我吧。",
					flag = 1
				}
			}
		},
		{
			say = "指挥官，车来啦~一路顺风哦~",
			characterId = 100700,
			subName = "林场管理员",
			animation = "hi",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "一路顺风。",
			characterId = 100600,
			subName = "矿山管理员",
			animation = "hi",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
