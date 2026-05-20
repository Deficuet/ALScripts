return {
	id = "SHENGYINQIANDETONGMENG7",
	mode = 2,
	fadeOut = 1.5,
	scripts = {
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "storymap_lianhediguo",
			hidePaintObj = true,
			say = "第二天，我们和龙骑兵·META，以及{namecode:564:伯利欣根}一行人一同乘坐审判号来到了雷根斯堡市的神之水道入口。",
			bgm = "theme-hrr",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "很明显，这是一套安蒂克丝留下的人工运河网络系统。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "运河网络不仅物理意义上连接着神圣联合帝国的各大城市，还在沿线设置了大量“神之通讯设施”，保障着帝国的情报交流能力。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "水道中设置有大型高速运输船，就算是审判号这样的大家伙也可以轻松停入其中。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "其所有权理论上属于神圣联合帝国皇帝本人，由多个专门的水域伯爵负责管理。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "至于水域伯爵是什么——在昨天尝试了解了一下神圣联合的爵位体系后我还是放弃了。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_2"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "从水网图上来看，要想从雷根斯堡市前往勃兰登堡，需要途经斯特拉斯堡市——",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "美因茨市——",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3",
					"1_4"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "以及马格德堡市——",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3",
					"1_4",
					"1_5"
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			say = "时间表上来看，我们预计傍晚时分抵达斯特拉斯堡市，{namecode:564:伯利欣根}团队中的剩下两人也会在那里与我们会合。",
			hidePaintObj = true,
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			canMarkNode = {
				"storymap_lianhediguo",
				{
					"1_1",
					"1_3",
					"1_4",
					"1_5",
					"1_6"
				}
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_518",
			hidePaintObj = true,
			dir = 1,
			nameColor = "#A9F548FF",
			actor = 102160,
			say = "指挥官，前方发来了可通行的信号，我们可以启动运输船了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashout = {
				black = true,
				dur = 0.5,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 0.5,
				dur = 0.5,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_518",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "那就让我们启程前往下一站吧——",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			mode = 1,
			stopbgm = true,
			asideType = 3,
			blackBg = true,
			flashout = {
				black = true,
				dur = 1,
				alpha = {
					0,
					1
				}
			},
			flashin = {
				delay = 1,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			},
			sequence = {
				{
					"神圣联合帝国",
					1
				},
				{
					"斯特拉斯堡市",
					2
				},
				{
					"傍晚时分",
					3
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			say = "在一片晚霞之中，我们的运输船顺利抵达了斯特拉斯堡市。",
			bgm = "story-hrr",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			},
			flashin = {
				delay = 0,
				dur = 1,
				black = true,
				alpha = {
					1,
					0
				}
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			say = "负责此处区域的水域伯爵{namecode:468:易北}已经提前收到消息来到了水道出口，{namecode:564:伯利欣根}团队的另外两人也一同来了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			nameColor = "#A9F548FF",
			side = 2,
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			say = "随之而来的，还有一个令人担忧的消息。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 401150,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神圣联合帝国",
			dir = 1,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "各位~我们完成调查回来了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 3,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神圣联合帝国",
			dir = 1,
			actor = 401150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "情况说实话有些糟糕……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 8,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神圣联合帝国",
			dir = 1,
			actor = 401150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "{namecode:558:U-2501}在水下发现黑境中正在酝酿一系列猛烈的攻势！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 4,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神圣联合帝国",
			dir = 1,
			actor = 401150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "而且在更深的地方，似乎还有某些更加不祥的东西在潜伏着……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 9706050,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神圣联合帝国",
			dir = 1,
			nameColor = "#FFC960",
			hidePaintObj = true,
			say = "欸……只是恶念残影的进攻还不够，局势要变得更加危险了……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			expression = 1,
			side = 2,
			bgName = "star_level_bg_557",
			factiontag = "神圣联合帝国",
			dir = 1,
			actor = 408150,
			nameColor = "#A9F548FF",
			hidePaintObj = true,
			say = "抱歉……带来了坏消息。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（水下……更不祥的东西？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（当初在博览会开幕式的时候，马可波罗好像也在水下弄了什么东西）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（因此才会出现那些源源不断的敌人……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（原理我记得是……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（嗯……似乎是将信仰浓度转换为了某种可量化的存在？）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			actor = 0,
			nameColor = "#A9F548FF",
			bgName = "star_level_bg_557",
			hidePaintObj = true,
			side = 2,
			portrait = "zhihuiguan",
			say = "（不知道这次会不会也与这种装置有关呢……）",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
