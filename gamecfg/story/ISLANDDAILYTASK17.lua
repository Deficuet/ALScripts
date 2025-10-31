return {
	id = "ISLANDDAILYTASK17",
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
			say = "Amerigo, I got them to calm down.",
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
			say = "Really? You did?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "nod",
			characterId = 0,
			say = "You just need to find their cozy place and comfort them patiently.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Manager of the Ranch",
			characterId = 100500,
			say = "But that's exactly what I tried...",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "doubt",
			characterId = 100500,
			subName = "Manager of the Ranch",
			say = "Was I just not patient enough? That can't be it, right?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "Take it easy. Try doing it nice and slow from now on.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
