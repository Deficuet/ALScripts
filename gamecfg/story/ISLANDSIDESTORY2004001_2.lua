return {
	id = "ISLANDSIDESTORY2004001_2",
	mode = 10,
	map = {
		{
			101200,
			10090008
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
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "欢迎回来，指挥官！",
			animation = "hi",
			face2Face = {
				{
					0,
					101200
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "需要用到的咖啡机和烤箱都已经调试完成。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "推荐的饮品菜单也都全部列好了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "啊……仓库的糖浆可能还需要稍微整理一下。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "idea",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "对了！还有面粉和鸡蛋，也都准备好了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
