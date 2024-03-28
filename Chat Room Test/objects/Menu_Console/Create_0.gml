/// @description Insert description here
// You can write your code in this editor
lines = ds_list_create()
appState = 0;


PrintHelp(appState, lines)

canDraw = false
alarm[0] = 10
clientMessage = ""
enterReleased = true
clientFont = Font.cascadia
UID = -1;

enum State {
	INMENU, ISSERVER, ISCLIENT	
	
}

enum Font {
	wingdings1, wingdings2, wingdings3, timesnewroman, cascadia
}

enum Data {
	clientConnectedRespose, userMessage
}