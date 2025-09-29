return {
	id = "ISLANDSIDE00902",
	mode = 10,
	map = {
		{
			100600,
			10040022
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
			say = "……乔安，你已经偷偷看我5分钟了，有什么事？",
			face2Face = {
				{
					0,
					100600
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 100600,
			subName = "矿山管理员",
			say = "啊……我在，我在等人，刚好指挥官在这里……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "……你就是那个神秘的委托人吧？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100600,
			subName = "矿山管理员",
			say = "欸……指挥官是接了那个委托的人吗！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "呜啊……我早该猜到的……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "需要我运输的是什么东西？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100600,
			subName = "矿山管理员",
			say = "……如果是指挥官的话，应该是可以说的吧……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "嗯……其实是我前几天发现的一些稀有矿石，因为比较贵重就没公布……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "本来是想找人秘密运输的，不过是指挥官的话就可以放心啦。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "原来如此，那这个矿石是要送到谁那里？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100600,
			subName = "矿山管理员",
			say = "嗯……因为这个矿石比较贵重，所以要先去拿给奥布莱恩包装。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "矿山管理员",
			characterId = 100600,
			say = "这次的委托其实也是奥布莱恩发布的，她会告诉你送到哪的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "行，我知道了，我现在去找她。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
