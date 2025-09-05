return {
	id = "ISLAND1001030",
	mode = 10,
	map = {
		{
			100400,
			10010040
		},
		{
			100500,
			10010063
		}
	},
	look_weight = {
		{
			0.9,
			0
		},
		{
			0.1,
			0
		}
	},
	scripts = {
		{
			subName = "牧场管理员",
			characterId = 100500,
			animation = "nod",
			say = "啊，指挥官快来！赫莫一直在说一些我听不懂的话！",
			face2Face = {
				{
					0,
					100500
				}
			},
			turnto = {
				{
					100400,
					0
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "听不懂的话？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "think",
			characterId = 100400,
			subName = "农田管理员",
			say = "指、指挥官，刚才梅莉告诉了我牧场产出的事情，我就和她聊了聊，嗯……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "关于您之前提到的，利用牧场有机肥料滋养农田的生态循环构想。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "哦？赫莫，你已经有结论了？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "农田管理员",
			say = "嗯。结合牧场的现状和农田的需求，我认为——牧场和农田的发展必须同步进行。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "单靠一只家禽还是远远不够支撑农场大规模种植需求的。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "牧场管理员",
			say = "嗯？简单来说就是我的牧场还需要更多的动物？好棒！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "不过这并不着急对吧？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "农田管理员",
			characterId = 100400,
			say = "嗯，目前农田里的土壤还很健康，梅莉可以慢慢来的……不着急……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "很好！只要这样稳步发展，不仅能还掉欠款，还能极大地丰富岛上的产出。",
			characterId = 0,
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "不过梅莉，往后可就要辛苦你了哦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 100500,
			subName = "牧场管理员",
			say = "包在我身上！指挥官，我一定会把所有动物都养得白白胖胖的！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "有自信就好……不过不知不觉都这么晚了，忙了一整天，岛屿上有什么好吃的吗？",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "牧场管理员",
			say = "啊！指挥官你是饿了吗？那一定要去港口的那家啾咖啡！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "啾咖啡……饿了去咖啡馆做什么？不会来了这里也要我熬夜工作吧？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "牧场管理员",
			characterId = 100500,
			say = "不是咖啡，是她家的苹果派啦！外皮烤得酥酥脆脆，里面的苹果馅也又香又软！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "hi",
			characterId = 100500,
			subName = "牧场管理员",
			say = "指挥官你一定要去尝尝！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100400,
			subName = "农田管理员",
			say = "嗯……听梅莉的描述，似乎确实……很诱人。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "好吧，那就听你们的，我去犒劳一下自己。",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "你们也早点休息，农场的未来可就要靠你们了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "hi",
			characterId = 100500,
			subName = "牧场管理员",
			say = "放心吧指挥官！快去快去！记得一定要点苹果派哦！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "hi",
			characterId = 100400,
			subName = "农田管理员",
			say = "指挥官慢走。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
