# Vivado project

## Files

* create_project.bat - Project creation batch file.
* create_project.tcl - Vivado tcl script to restore project.
* TOP.tcl - Saved project block design.
* ip_lib - Folder to store user IPs.
* constraints - Folder to store user constraints.

## Create project

Run create_project.bat

## Save project

* In Vivado GUI run "File"->"Export"->"Export Block Design..."
* Navigate to project home folder.
* Replace existing TOP.tcl file by new one.

## Build software

In Vivado
1. File -> Export -> Export Hardware...
2. Click "OK"
3. File -> Launch SDK 
4. Click "OK"

In SDK
1. File -> New -> Application Project...
2. Set "Project name" as "project_name"
3. Click "Next >"
4. Select "Empty Project" from "Available Templates"
5. Click "Finish"
6. Select project_name->src folder in "Project Explorer" tab
7. Select "Import..." from right-click menu
8. Select General->File System 
9. Click "Next >"
10. Click "Browse..."
11. Navigate to "sw\project_name" folder
12. Click "OK"
13. Select all files to import
14. Click "Finish"
15. Click "Yes"
16. Wait project to rebuild
