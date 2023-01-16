# SSIS_Daily_File_Load
ETL Solution for automatic data transfer from files in computer directory to a Database

<img width="790" alt="SSISMainPipeline" src="https://user-images.githubusercontent.com/118220804/211172805-c34dd08f-02d2-41f9-9a9b-d899b24eadbb.png">

<img width="1124" alt="VariableList" src="https://user-images.githubusercontent.com/118220804/211172825-93268b97-8c71-4aaa-acdd-69372fc9013e.png">

Daily Load directory

<img width="570" alt="DailyLoadFolder" src="https://user-images.githubusercontent.com/118220804/211172844-c186fc01-f322-470e-b801-5fa633d11730.png">

Folder containing txt and csv files (before package run)

<img width="601" alt="AmazonFolder" src="https://user-images.githubusercontent.com/118220804/211172858-c13e1733-333a-4b41-91f9-d929e8ac512b.png">

Folder containing excel files (before package run)

<img width="593" alt="ExcelFolder" src="https://user-images.githubusercontent.com/118220804/211172881-1ea38b67-c125-4f22-91d3-3184d6b5f516.png">

Database whare data will be loaded (load_data table)

<img width="158" alt="Maindatabase" src="https://user-images.githubusercontent.com/118220804/211173185-ff0f9f00-ce1d-470b-8fc0-7a202583de72.png">

Log table in database (table containing info about loaded files (filedate and company name will extracted from filename. Successfully loaded files will be moved to archive folder)

<img width="422" alt="LogDateTime" src="https://user-images.githubusercontent.com/118220804/211172944-a072a86d-1cf0-4e48-9d9d-eb5805326c7f.png">

ErrorLog table (If any file fails, there will be an entry here and the faulty file will be moved to faulty files directory)

<img width="716" alt="ErrorLog" src="https://user-images.githubusercontent.com/118220804/211172958-48cfae7d-5d23-432c-89cc-c2d59ed39916.png">

RunningLog table(for performance checking)

<img width="472" alt="RunningLog" src="https://user-images.githubusercontent.com/118220804/211172999-fd57a40e-184f-4648-a91e-fb2b98b18f1d.png">

Step 1: RunningLog table will be truncated.

Step 2: Foreach Loop Container for selecting files. (folder directory is hard coded). Fully qualified file path will be stored in filepath variable. Filename, company name, file type and file date will extracted and stored in 4 variables.

<img width="617" alt="ForEachLoop" src="https://user-images.githubusercontent.com/118220804/211173334-6afcbddd-d1c0-40c2-8604-b2e90582224b.png">

Step 3: SQL statement will check if file is loaded or not. If file is not loaded, count of filename in log table will be 0, this result will be stored is variable called isloaded. If isloaded = 0 and filetype != "xlsx" then left path will be followed.

<img width="548" alt="CheckingFileLoaded" src="https://user-images.githubusercontent.com/118220804/211173472-618773fd-ee44-40e6-92b5-f555c52905a1.png">

If isloaded = 0 and filetype = "xlsx" then then right path will be followed.

<img width="464" alt="excelpath" src="https://user-images.githubusercontent.com/118220804/211173551-68c2056b-4da9-4013-b8e5-c069c2b7165e.png">

Step 4: Data from flat file or Excel file will be loaded into database.

Step 5: If any file fails to load (failure in precedence constrain), faulty file will be moved to faulty file directory.

<img width="555" alt="failure" src="https://user-images.githubusercontent.com/118220804/211173696-1758fe56-e372-4339-8f3d-14cbf2e16468.png">

Step 6: After file is successfully loaded, There will be an entry in Log table.

<img width="533" alt="EntryinLogDataTable" src="https://user-images.githubusercontent.com/118220804/211173713-5d3f4971-40ff-408b-8604-51c67a8140dc.png">
<img width="436" alt="4Para" src="https://user-images.githubusercontent.com/118220804/211173726-075c0cc3-7b2a-46f8-87d0-c47b748d4b51.png">

Step 7: Successfully loaded files will be moved to archive folder. Then foreach loop will be repeated.

Event handlers: Package level event handlers are added at on_error, pre_execution and post_execution. SQL scripts will add entry in ErrorLog and RunningLog tables.

<img width="473" alt="OnErrorEvent" src="https://user-images.githubusercontent.com/118220804/211173851-934f1cf7-b89c-4a96-adb6-4a3893383dfb.png">
