return {
	id = "ISLAND1001018",
	mode = 10,
	map = {
		{
			3120100,
			10070005
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
			say = "这样就好了？",
			face2Face = {
				{
					0,
					3120100
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "happy",
			characterId = 3120100,
			say = "嗯，没错喵！现在这座岛屿相关的一切都完全交给指挥官了喵~呜呜，终于可以松口气了喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "那这些岛屿建设用贷款也都交给指挥官还了喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "什么贷款？",
					flag = 1
				},
				{
					content = "你贷这么多钱做什么？！",
					flag = 2
				}
			}
		},
		{
			characterId = 3120100,
			say = "友情提示，债务详情可以点进去查看具体账单喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "港口扩建……新开发农场、牧场、商场、种植园？下面居然还有个海滩开发计划？！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "难怪帕特莉说最近的港口繁忙了不少……不过你贷款开发这么多地方做什么？",
			characterId = 0,
			animation = "nod",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "embarrass",
			characterId = 3120100,
			say = "我……我只是想赚钱赚得更快些喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 3120100,
			say = "而且这些贷款可是按外部时间来结算利息的喵~几乎可以说是零利率呢喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "只要指挥官努努力，总能赚回来的喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			options = {
				{
					content = "（总感觉哪里有问题……）",
					flag = 1
				},
				{
					content = "（{namecode:98:明石}真的会这么好心？）",
					flag = 2
				}
			}
		},
		{
			characterId = 0,
			say = "……我好像明白了，你不会是等这些地方都开发完才发现自己人手不够的吧？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 3120100,
			say = "喵呜？！被、被发现了喵……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "这就好办了，那我怎么才能带人进来？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "elation",
			characterId = 3120100,
			say = "哼哼，这就要用到我最新研发的岛屿权限认证函了喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 3120100,
			say = "指挥官快过来喵~",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
