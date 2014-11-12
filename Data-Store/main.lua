-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
-- Require the widget and data_store modules 
local widget = require("widget")
local data_store = require("data_store")

-----------------------------------------------------------------------------------------
-- Make a text object to display text that is loaded
local display_txt = display.newText({
	text="ABCDEF",
	font="Helvetica",
	fontSize=16,
	width=300
})

display_txt.x = 160
display_txt.y = 360

-----------------------------------------------------------------------------------------
-- Make a couple text fields to input data
local name_field = native.newTextField( 160, 250, 220, 36)

local age_field = native.newTextField( 160, 300, 220, 36)
age_field.inputType = "number"


-----------------------------------------------------------------------------------------
-- A function to retrieve data from data_store
local function get_data()
	-- Read data from data_store. This is a table containing two properties name and age. 
	local t = data_store.load_settings()
	-- Display name and age in display_txt
	display_txt.text = t.name .. " " .. t.age
end	

-----------------------------------------------------------------------------------------
-- Save data. You must save all of the data the data that you wish to store 
local function save_data()
	-- Make a table with properties name and age. Get the values from the text fields
	local t = {name=name_field.text, age=age_field.text}
	-- Save the table 
	data_store.save_settings( t )
end 

-----------------------------------------------------------------------------------------
-- Make a couple buttons to get and save data 

-- Make a get button
local get_button = widget.newButton({
	label="Get Data", 
	onRelease = function() 
		get_data()
	end 
})

get_button.x = display.contentCenterX
get_button.y = 120

-- Make a save button
local save_button = widget.newButton({
	label="Save Data", 
	onRelease = function() 
		save_data()
	end 
})

save_button.x = display.contentCenterX
save_button.y = 160







