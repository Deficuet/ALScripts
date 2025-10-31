return {
	id = "ISLANDSIDE01008",
	mode = 10,
	map = {
		{
			100400,
			10010040
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
			say = "(If we're talking fresh carrots, the farm should have heaps of them.)",
			face2Face = {
				{
					0,
					100400
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Commander? I just got back from the fields. Do you need any ingredients?",
			characterId = 100400,
			subName = "Manager of the Farm",
			animation = "talk",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I'm looking for some fresh carrots.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Carrots, you say? Luckily, we just harvested a bunch today.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 100400,
			subName = "Manager of the Farm",
			say = "Here you go. Juicy and just pulled out of the ground.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Farm",
			characterId = 100400,
			say = "Don't be modest. Take as many as you need!",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
