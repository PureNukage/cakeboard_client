var i, a, b, nameplateX, nameplateY, statusX, statusY, currentname, currentstatus, namesearch, statussearch,
currenttextbox, textboxsearch, textboxX, textboxY, currenttime, timesearch, timeX, timeY, checkmark, 
currentcheckbox, checkboxX, checkboxY

checkboxX = x+176
checkboxY = y+164
nameplateX = x+224
nameplateY = y+164
statusX = x+368
statusY = y+164
textboxX = x+512
textboxY = y+164
timeX = x+828
timeY = y+164

checkboxX = 176
checkboxY = 164
nameplateX = 224
nameplateY = 164
statusX = 368
statusY = 164
textboxX = 512
textboxY = 164
timeX = 828
timeY = 164

var _y_distance = 80

for (i=0;i < o_controller.totalusers;i++)
{
	//Checkmark Box
	currentcheckbox = instance_create_layer(checkboxX,checkboxY,"Instances",o_checkbox)
	checkmark = ds_list_find_value(o_controller.database_checkmark,i)
	with currentcheckbox
	{
		ID = i
		selected = checkmark
	}
	checkboxY += _y_distance
	
	//Nameplates
	currentname = instance_create_layer(nameplateX,nameplateY,"Instances",o_nameplate)
	namesearch = ds_list_find_value(o_controller.database_names,i)
	with currentname
	{	
		nameid = i
		username = namesearch
	}
	nameplateY += _y_distance
	
	//Status Plates
	currentstatus = instance_create_layer(statusX,statusY,"Instances",o_status)
	statussearch = ds_list_find_value(o_controller.database_statuses,i)
	with currentstatus
	{
		statusid = i
		status = statussearch
		if status == 5{
			chipotleSprite = o_controller.database_themes_burrito[o_controller.theme]
		}
	}
	statusY += _y_distance
	
	//Textboxes
	currenttextbox = instance_create_layer(textboxX,textboxY,"Instances",o_textbox)
	textboxsearch = ds_list_find_value(o_controller.database_textbox,i)
	with currenttextbox
	{
		textboxid = i
		text = textboxsearch
	}
	textboxY += _y_distance
	
	//Time
	currenttime = instance_create_layer(timeX,timeY,"Instances",o_time)
	timesearch = ds_list_find_value(o_controller.database_time,i)
	with currenttime
	{
		timeid = i
		time = timesearch
	}
	timeY += _y_distance
	
}

if o_controller.totalusers = 0
{
	instance_create_layer(224,164,"Instances",o_freshboard)
}


