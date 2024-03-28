/// @description Insert description here
// You can write your code in this editor
switch (clientFont)
{
	case Font.wingdings1:
		draw_set_font(Wingdings1)
	break;
	case Font.wingdings2:
		draw_set_font(Wingdings2)
	break;
	case Font.wingdings3:
		draw_set_font(Wingdings3)
	break;
	case Font.timesnewroman:
		draw_set_font(TimesNewRoman)
	break;
	case Font.cascadia:
		draw_set_font(Cascadia)
	break;
	
}



if (canDraw)
{
	for (var i = 0; i < ds_list_size(lines); i++)
	{
		draw_text(30, room_height - 110 - (55 * i), ds_list_find_value(lines, i))
		draw_text(30, room_height - 55, clientMessage)
		//canDraw = false
	}
}
