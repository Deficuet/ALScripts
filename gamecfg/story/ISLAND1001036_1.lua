return {
	id = "ISLAND1001036_1",
	mode = 10,
	map = {
		{
			100800,
			10060002
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
			animation = "hi",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			say = "Look, Commander! The storefront is already done! Now we just need the most important part...",
			face2Face = {
				{
					0,
					100800
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Commercial Area Supervisor",
			characterId = 100800,
			say = "The food that will bring everyone here in droves!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "You've got that right. Can't fill your stomach if the restaurant doesn't serve food.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "On that note, I brought plenty of food to satisfy everyone's tastes.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Impressive! Once we put them on store shelves, our work is done!",
			characterId = 100800,
			subName = "Commercial Area Supervisor",
			animation = "clap",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Fantastic. Shall we?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
