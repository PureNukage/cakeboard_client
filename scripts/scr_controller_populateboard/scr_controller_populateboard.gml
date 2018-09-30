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



for (i=0;i < o_controller.totalusers;i++)
{
	//Checkmark Box
	currentcheckbox = instance_create_layer(checkboxX,checkboxY,"Instances",o_checkbox)
	checkmark = ds_list_find_value(o_controller.checkmarklist,i)
	with currentcheckbox
	{
		ID = i
		selected = checkmark
	}
	checkboxY += 80
	
	//Nameplates
	currentname = instance_create_layer(nameplateX,nameplateY,"Instances",o_nameplate)
	namesearch = ds_list_find_value(o_controller.userlist,i)
	with currentname
	{	
		nameid = i
		username = namesearch
	}
	nameplateY += 80
	
	//Status Plates
	currentstatus = instance_create_layer(statusX,statusY,"Instances",o_status)
	statussearch = ds_list_find_value(o_controller.currentstatuslist,i)
	with currentstatus
	{
		statusid = i
		status = statussearch
	}
	statusY += 80
	
	//Textboxes
	currenttextbox = instance_create_layer(textboxX,textboxY,"Instances",o_textbox)
	textboxsearch = ds_list_find_value(o_controller.textboxlist,i)
	with currenttextbox
	{
		textboxid = i
		text = textboxsearch
	}
	textboxY += 80
	
	//Time
	currenttime = instance_create_layer(timeX,timeY,"Instances",o_time)
	timesearch = ds_list_find_value(o_controller.timelist,i)
	with currenttime
	{
		timeid = i
		time = timesearch
	}
	timeY += 80
	
}


