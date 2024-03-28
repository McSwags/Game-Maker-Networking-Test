// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PrintHelp(appState, lines){

	switch (appState)
	{
		case 0: // in menu
			ds_list_insert(lines, 0, "Welcome to my chat room test")
			ds_list_insert(lines, 0,  "Type \"/create <port> <max clients>\" to create lan server");
			ds_list_insert(lines, 0, "Type \"/join <ip> <port>\" to join a lan server")
			
		break;
		
		case 1: // is server
			ds_list_insert(lines, 0, "You are currently hosting a server")
			ds_list_insert(lines, 0,  "Type \"/close\" to close the server and return to menu");
		break;
		
		case 2: // is client
			ds_list_insert(lines, 0, "You have joined a server")
			ds_list_insert(lines, 0,  "Type \"/leave\" to leave the server and return to the menu");
		break;
	}

}