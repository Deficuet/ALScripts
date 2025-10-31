return {
	id = "ISLAND1001033",
	mode = 10,
	map = {
		{
			101000,
			10030008
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
			say = "Hi there, Elizabeth.",
			face2Face = {
				{
					0,
					101000
				}
			},
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Commander! Welcome to the Free Build Area.",
			characterId = 101000,
			animation = "hi",
			subName = "Get-Together Island Receptionist",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Get-Together Island Receptionist",
			characterId = 101000,
			say = "Would you like a drink?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "I'd love to serve you black tea. You must be tired from your travels.",
			characterId = 101000,
			animation = "talk",
			subName = "Get-Together Island Receptionist",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			animation = "shakehead",
			characterId = 0,
			say = "Thank you, but I'm fine.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "I just got this bus stop blueprint, and I'd like to put it here.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			say = "Let's see... Did Mary give you this? She's been badgering me about how much she wants one on this island.",
			characterId = 101000,
			animation = "think",
			subName = "Get-Together Island Receptionist",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			characterId = 0,
			say = "No wonder she was so insistent on it. Can I help with it?",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		},
		{
			subName = "Get-Together Island Receptionist",
			characterId = 101000,
			say = "Once you've chosen a location, just let me know where, and I'll do the rest.",
			typewriter = {
				speed = 0.05,
				speedUp = 0.01
			}
		}
	}
}
