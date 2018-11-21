# StuffAndThings

Collection of useful stuff and things

## Convert Redgate xml snippets to Azure Data Studio json snippet

Red Gate's SQL Prompt (<http://www.red-gate.com/products/sql-development/sql-prompt/>) is awesome, unfortunately at the moment there is no extension of the Prompt for Azure Data Studio, (there is no decent refactor extension either, the format document option is still green).
It seemed a waste to not use all the nice snippets of the SQL Prompt in Azure Data Studio, so I wrote a little script that takes all the xml snippets, extracts the most important information (shortcut, description and code) and creates a single json file containing all the snippets.

Basic Usage:

    RedgateSnippetsToJsonAzureDataStudio.ps1 -username _Developer_

The username parameter is mandatory, is used to search inside the directory

    C:\Users\Developer\AppData\Local\Red Gate\SQL Prompt 9\Snippets

The output will be a file named redgate.code-snippets, placed by default in

    C:\Users\Developer\AppData\Roaming\azuredatastudio\User\snippets

if the folder isn't found it will be used c:\temp\

Additional parameters:

* -snippetsfolder: allows to specify the folder that contains the snippets
* -outputfolder: allows to specify the folder in which the .code-snippets will be placed
