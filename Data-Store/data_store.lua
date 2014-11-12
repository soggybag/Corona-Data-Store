-----------------------------------------------------------------------------------------
-- 
-- data_store.lua 
-- 
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------
-- Define a variable to hold the functions and variables attached to this module. 
local M = {}
-----------------------------------------------
-- Require the json module 
local json = require( "json" )
-----------------------------------------------------------------------------------------
-- This will be the name of the file that will store the data. 
local FILE_NAME = "app_settings"
-- This file is saved in the "project sandbox" you can find it at Corona Simulator
-- File > Show Project Sandbox. Look in the Documents folder. 
-----------------------------------------------




-----------------------------------------------------------------------------------------
-- 
-- Public methods 
-- 
-----------------------------------------------------------------------------------------


-- saveTable 
-- Saves data as json. Pass in a table containing the data to save. 
-- This table is all of the data being saved. Saving here overwrites 
-- existing data. 
-----------------------------------------------------------------------------------------
function saveTable( the_file, t )
	-- Get a path to the project Documents directory
    local path = system.pathForFile( the_file, system.DocumentsDirectory)
    -- Open the file path with the (w)rite option. 
    local file = io.open(path, "w")
    -- If we were able to open the file. 
    if file then
    	-- Convert the (t)able to json
        local contents = json.encode(t)
        -- Write the file
        file:write( contents )
        -- Close the file connection. 
        io.close( file )
        -- Return true the operation was successful
        return true
    else
    	-- Return false, something is wrong, the operation was unsuccessful. 
        return false
    end
end
M.saveTable = saveTable



-- loadTable 
-- Load the contents of the file as json and 
-- convert to a Lua table. Pass the name of the file to load. 
-----------------------------------------------------------------------------------------
function loadTable( the_file )
	-- Get a path to the "app_settings" file in the projects Documents directory
    local path = system.pathForFile( the_file, system.DocumentsDirectory)
    local contents = ""
    local myTable = {}
    -- Open the file with the (r)ead option
    local file = io.open( path, "r" )
    -- If successful read the file. 
    if file then
         -- read all contents of file into a string
         local contents = file:read( "*a" )
         -- Convert the json text to a Lua table. 
         myTable = json.decode(contents)
         -- Close the file connection
         io.close( file )
         -- Return the table
         return myTable 
    end
    -- If the file connection was unsuccessful return nil
    return nil
end
M.loadTable = loadTable
------------------------------------------------



-- load_settings 
-- A helper method that loads the default file "app_settings"
-----------------------------------------------------------------------------------------
local function load_settings()
	-- Load the file name defined in FILE_NAME (above)
	return loadTable( FILE_NAME )
end 
M.load_settings = load_settings


-- save_settings
-- A helper function that saves a table to the file defined above as FILE_NAME
-----------------------------------------------------------------------------------------
local function save_settings( t )
	saveTable( FILE_NAME, t )
end 
M.save_settings = save_settings
-----------------------------------------------
return M