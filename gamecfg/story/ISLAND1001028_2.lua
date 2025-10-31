return {
	id = "ISLAND1001028_2",
	mode = 10,
	map = {
		{
			100500,
			10010003
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
			say = "Amerigo, I brought some feed! Think this will do?",
			animation = "hi",
			face2Face = {
				{
					0,
					100500
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "amaze",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Holy cow, Commander! Yeah, this will more than do!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Don't forget to let Homeric know before you run out of feed next time.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "I will, I will! Hey, wanna get a feel for feeding clucky?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "I've been told she'll lay some eggs once her stomach's full.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Eggs, you say? I'll give it a try.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
