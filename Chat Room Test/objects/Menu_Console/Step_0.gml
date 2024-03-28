/// @description Insert description here
// You can write your code in this editor
clientMessage = keyboard_string

if (keyboard_check(vk_enter))
{
	if (enterReleased)
	{
		enterReleased = false
		if (clientMessage != "")
		{

			var splitMessage = string_split(clientMessage, " ", true, 5)
			switch (appState)
			{
				case State.INMENU:
					switch (splitMessage[0]) // menu commands
					{
						case "/create":
					
							socket = network_create_server(network_socket_tcp, splitMessage[1], splitMessage[2])
					
							if (socket < 0) // error message
					
								ds_list_insert(lines, 0, "Failed to create server")
							else {
								ds_list_insert(lines, 0, "Server created succesfully")
								keyboard_string = "";
								appState = State.ISSERVER
								PrintHelp(appState, lines)
								clients = ds_list_create()
								clientSocket = ds_list_create()
							}


						break;
		
						case "/join":
							socket = network_create_socket(network_socket_tcp)
							res = network_connect(socket, splitMessage[1], splitMessage[2])
					
							if (res < 0) // error message
								ds_list_insert(lines, 0, "Failed to connect to server")
							else {
								ds_list_insert(lines, 0, "Joined server")
								keyboard_string = "";
								appState = State.ISCLIENT
								}
						
							keyboard_string = "";
						break;
						
						case "/font":
							clientFont = splitMessage[1]
							keyboard_string = "";
						break; // end font
		
						default:
							ds_list_insert(lines, 0, clientMessage)
							keyboard_string = "";
						break;
					}
				break;
				
				case State.ISCLIENT:
					switch (splitMessage[0])
					{
						case "/leave":
							network_destroy(socket) // destroys socket disconnecting from server
							appState = State.INMENU
							PrintHelp(appState, lines)
							keyboard_string = "";
						break;
						
						default:
						
						break;
					}
				break;
				
				case State.ISSERVER:	
					switch (splitMessage[0])
					{
						case "/close":
							network_destroy(socket) // destroys server socket closing server
							appState = State.INMENU
							PrintHelp(appState, lines)
							keyboard_string = "";
						break;
						
						default:
							ds_list_insert(lines, 0, clientMessage)
							keyboard_string = "";
						break;
					}
				break;
				
			}
			if (ds_list_size(lines) > 13)
				ds_list_delete(lines, ds_list_size(lines) - 1)
		}
	}
}