return {
	id = "ISLANDSIDE01102",
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
			characterId = 0,
			say = "布莱梅！商区想增加新的餐饮店，阿莫玛托我来问问大家的想法。",
			animation = "talk",
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
			characterId = 0,
			say = "你觉得大家还想要什么？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "欸，阿莫玛的商区要开新店了吗？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "不过我的想法么……就我个人观察和客人们的闲聊来说……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "开一家奶茶店感觉很不错。",
			characterId = 101200,
			subName = "啾咖啡店员",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "奶茶店？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，因为时常会有人来啾咖啡问有没有奶茶。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "啾咖啡店员",
			characterId = 101200,
			say = "有时候还挺困扰的……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "嗯……我记得港区也有不少人喜欢喝奶茶的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "是不错的建议。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "一家专注品质、环境舒适的奶茶店，在开发区应该会很受欢迎。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "sad",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "而且……这样应该就不会有人来找我买奶茶了吧……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "放心吧，有了确切购买的地方就不会再有这种事了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "好了，我再去码头那边调查一下。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "bye",
			characterId = 101200,
			subName = "啾咖啡店员",
			say = "嗯，指挥官再见~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
