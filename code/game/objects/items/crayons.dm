/obj/item/toy/crayon/red
	icon_state = "crayonred"
	colour = "#DA0000"
	shadeColour = "#810C0C"
	//colourName = "red"
	colourName = "rojo"

/obj/item/toy/crayon/orange
	icon_state = "crayonorange"
	colour = "#FF9300"
	shadeColour = "#A55403"
	//colourName = "orange"
	colourName = "naranja"

/obj/item/toy/crayon/yellow
	icon_state = "crayonyellow"
	colour = "#FFF200"
	shadeColour = "#886422"
	//colourName = "yellow"
	colourName = "amarillo"

/obj/item/toy/crayon/green
	icon_state = "crayongreen"
	colour = "#A8E61D"
	shadeColour = "#61840F"
	//colourName = "green"
	colourName = "verde"

/obj/item/toy/crayon/blue
	icon_state = "crayonblue"
	colour = "#00B7EF"
	shadeColour = "#0082A8"
	//colourName = "blue"
	colourName = "azul"

/obj/item/toy/crayon/purple
	icon_state = "crayonpurple"
	colour = "#DA00FF"
	shadeColour = "#810CFF"
	//colourName = "purple"
	colourName = "púrpura"

/obj/item/toy/crayon/mime
	icon_state = "crayonmime"
	//desc = "A very sad-looking crayon."
	desc = "Un lápiz con un aspecto muy triste."
	colour = "#FFFFFF"
	shadeColour = "#000000"
	//colourName = "mime"
	colourName = "mimo"
	uses = 0

/obj/item/toy/crayon/mime/attack_self(mob/living/user as mob) //inversion
	if(colour != "#FFFFFF" && shadeColour != "#000000")
		colour = "#FFFFFF"
		shadeColour = "#000000"
		//user << "You will now draw in white and black with this crayon."
		user << "Ahora dibujarás en blanco y negro con el lápiz"
	else
		colour = "#000000"
		shadeColour = "#FFFFFF"
		//user << "You will now draw in black and white with this crayon."
		user << "Ahora dibujarás en negro y blanco con el lápiz"
	return

/obj/item/toy/crayon/rainbow
	icon_state = "crayonrainbow"
	colour = "#FFF000"
	shadeColour = "#000FFF"
	//colourName = "rainbow"
	colourName = "arco iris"
	uses = 0

/obj/item/toy/crayon/rainbow/attack_self(mob/living/user as mob)
	//colour = input(user, "Please select the main colour.", "Crayon colour") as color
	//shadeColour = input(user, "Please select the shade colour.", "Crayon colour") as color
	colour = input(user, "Selecciona el color principal.", "Crayon colour") as color
	shadeColour = input(user, "Selecciona el color de la sombra.", "Crayon colour") as color
	return

/obj/item/toy/crayon/afterattack(atom/target, mob/user as mob)
	if(istype(target,/turf/simulated/floor))
		/*var/drawtype = input("Choose what you'd like to draw.", "Crayon scribbles") in list("graffiti","rune","letter")
				switch(drawtype)
			if("letter")
				drawtype = input("Choose the letter.", "Crayon scribbles") in list("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
				user << "You start drawing a letter on the [target.name]."
			if("graffiti")
				user << "You start drawing graffiti on the [target.name]."
			if("rune")
				user << "You start drawing a rune on the [target.name]."
		*/
		var/drawtype = input("Escoje que quieres dibujar.", "Garabatos") in list("graffiti","runa","letra")
		switch(drawtype)
			if("letra")
				drawtype = input("Escoje una letra.", "Garabatos") in list("a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z")
				user << "Comienzas a dibujar una letra en el [target.name]."
			if("graffiti")
				user << "Comienzas a dibujar una graffiti en el [target.name]."
			if("runa")
				user << "Comienzas a dibujar una runa en el [target.name]."

		if(instant || do_after(user, 50))
			new /obj/effect/decal/cleanable/crayon(target,colour,shadeColour,drawtype)
			//user << "You finish drawing."
			user << "Has acabado de dibujar."
			if(uses)
				uses--
				if(!uses)
					//user << "\red You used up your crayon!"
					user << "\red Ya no le quedan mas usos al lápiz!"
					del(src)
	return

/obj/item/toy/crayon/attack(mob/M as mob, mob/user as mob)
	if(M == user)
		//user << "You take a bite of the crayon. Delicious!"
		user << "Has mordido el lápiz. Delicioso!"
		user.nutrition += 5
		if(uses)
			uses -= 5
			if(uses <= 0)
				//user << "\red You ate your crayon!"
				user << "\red Te has comido el lápiz!"
				del(src)
	else
		..()