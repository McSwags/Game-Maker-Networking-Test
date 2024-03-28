/// @description Insert description here
// You can write your code in this editor
var type = async_load[? "type"]

if (type == network_type_connect)
{
	if (appState == State.ISSERVER)
	{
		var connectedSocket = async_load[? "socket"]
	
	
		var connectionBuffer = buffer_create(2, buffer_fixed, 1)
	
		buffer_write(connectionBuffer, buffer_u8, Data.clientConnectedRespose)
		buffer_write(connectionBuffer, buffer_u8, ds_list_size(clients)) 
	
		network_send_packet(connectedSocket, connectionBuffer, buffer_get_size(connectionBuffer))
	
		buffer_delete(connectionBuffer)
		ds_list_add(clients, ds_list_size(clients))
		ds_list_add(clientSocket, connectedSocket)
		
		
		var buffer = buffer_create(2, buffer_grow, 1)
		buffer_write(buffer, buffer_u8, Data.userMessage)
		buffer_write(buffer, buffer_string, "User has joined the server")
		
	}
	
}
else if (type == network_type_data)
{
	var buffer = async_load[? "buffer"]
	buffer_seek(buffer, buffer_seek_start, 0)
	
	var packetType = buffer_read(buffer, buffer_u8)
	
	
	
	if (packetType == Data.clientConnectedRespose)
	{
		UID = buffer_read(buffer, buffer_u8)	
	}
	else if (packetType == Data.userMessage)
	{
		ds_list_insert(lines, 0, buffer_read(buffer, buffer_string))	
		if (appState == State.ISSERVER)
		{
			for (var i = 0; i < ds_list_size(clients); i++)
			{
				network_send_packet(ds_list_find_value(clientSocket, i), buffer, buffer_sizeof(buffer))	
			}
		}
	}
	
	
	
	else
	{
		
	}
}
else if (type == network_type_disconnect)
{
	
}