//Also contains /obj/structure/closet/body_bag because I doubt anyone would think to look for bodybags in /object/structures

/obj/item/bodybag
//	name = "body bag"
//	desc = "A folded bag designed for the storage and transportation of cadavers."
	name = "bolsa para cadáveres"
	desc = "Una bolsa de plastico diseñada para el almacenamiento y transporte de cadáveres."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag_folded"
	w_class = 2

/obj/item/bodybag/attack_self(mob/user)
		var/obj/structure/closet/body_bag/R = new /obj/structure/closet/body_bag(user.loc)
		R.add_fingerprint(user)
		del(src)


/obj/item/weapon/storage/box/bodybags
	//name = "body bags"
	//desc = "The label indicates that it contains body bags."
	name = "bolsas para cadáveres"
	desc = "La etiqueta indica que contiene bolsas para cadáveres."
	icon_state = "bodybags"

	New()
		..()
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)
		new /obj/item/bodybag(src)


/obj/structure/closet/body_bag
	//name = "body bag"
	//desc = "A plastic bag designed for the storage and transportation of cadavers."
	name = "bolsa para cadáveres"
	desc = "Una bolsa de plastico diseñada para el almacenamiento y transporte de cadáveres."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "bodybag_closed"
	icon_closed = "bodybag_closed"
	icon_opened = "bodybag_open"
	density = 0


/obj/structure/closet/body_bag/attackby(obj/item/I, mob/user)
	if (istype(I, /obj/item/weapon/pen))
		//var/t = input(user, "What would you like the label to be?", name, null) as text
		var/t = input(user, "¿Qué etiqueta quieres ponerle a la bolsa?", name, null) as text
		if(user.get_active_hand() != I)
			return
		if(!in_range(src, user) && loc != user)
			return
		t = copytext(sanitize(t), 1, 53)	//max length of 64 - "body bag - " instead of MAX_MESSAGE_LEN, as per the hand labeler
		if(t)
			name = "bolsa para cadáveres - "
			name += t
			overlays += "bodybag_label"
		else
			name = "bolsa para cadáveres"
		return
	else if(istype(I, /obj/item/weapon/wirecutters))
		//user << "<span class='notice'>You cut the tag off of [src].</span>"
		//name = "body bag"
		user << "<span class='notice'>Has cortalo la etiqueta de [src].</span>"
		name = "bolsa para cadáveres"
		overlays.Cut()


/obj/structure/closet/body_bag/close()
	if(..())
		density = 0
		return 1
	return 0


/obj/structure/closet/body_bag/MouseDrop(over_object, src_location, over_location)
	..()
	if(over_object == usr && (in_range(src, usr) || usr.contents.Find(src)))
		if(!ishuman(usr))
			return 0
		if(opened)
			return 0
		if(contents.len)
			return 0
		//visible_message("<span class='notice'>[usr] folds up [src].</span>")
		visible_message("<span class='notice'>[usr] pliega [src].</span>")
		var/obj/item/bodybag/B = new /obj/item/bodybag(get_turf(src))
		usr.put_in_hands(B)
		del(src)


/obj/structure/closet/bodybag/update_icon()
	if(!opened)
		icon_state = icon_closed
	else
		icon_state = icon_opened
