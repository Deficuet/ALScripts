return {
	id = "ISLANDSIDE00901",
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
			characterId = 0,
			animation = "hi",
			say = "斯蒂芬妮，听说你找我，有什么事？",
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
			animation = "nod",
			characterId = 100300,
			subName = "货运管理员",
			say = "啊！指挥官你来了，我正准备去找你呢！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "是这样的，我收到了一份神秘的委托。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "表面上只是一份普通的货运委托，却拒绝说明运输物资是什么。",
			characterId = 100300,
			subName = "货运管理员",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "只说明了去哪里找委托人，运输要求当面详谈。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "听上去是挺神秘的……",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "因为这是在岛内的运输，并不依托船运，所以不好要求对方说明。",
			characterId = 100300,
			subName = "货运管理员",
			animation = "think",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "货运管理员",
			characterId = 100300,
			say = "我想来想去……只能想到请指挥官帮忙接这个委托了！",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "行，这个委托我接了，去哪找委托人？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "talk",
			characterId = 100300,
			subName = "货运管理员",
			say = "我看看……“在原野的矿山旁等候”，指挥官你认得这个地方吧？",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "嗯，我出发了。",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
