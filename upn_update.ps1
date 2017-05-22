################ CREATE A LIST OF EMAIL ADDRESSES ($myOU == sales, marketing, etc...) AND SAVE IT HERE: "C:temp\$myOU+email_addresses.csv" ###################
function createEmailList($myOU) {
Set-Location c:\
Get-ADUser -Filter * -Properties Name, SamAccountName, EmailAddress -SearchBase "OU=$myOU,DC=microsoft,DC=com" | select Name, SamAccountName, EmailAddress | Export-Csv "C:temp\$myOU+email_addresses.csv"
}
################ CREATE A LIST OF EMAIL ADDRESSES ($myOU == sales, marketing, etc...) AND SAVE IT HERE: "C:temp\$myOU+email_addresses.csv" ###################


################ UPDATE "userPrincipalName" PROPERTY (e.g., from "jdoe@microsoft.com" to "john.doe@microsoft.com") ###################
$listOfEmails = Import-Csv C:\temp\sales+email_addresses.csv
foreach ($user in $listOfEmails){
    Set-ADUser -Identity $user.SamAccountName -UserPrincipalName $user.EmailAddress
}
################ UPDATE "userPrincipalName" PROPERTY (e.g., from "jdoe@microsoft.com" to "john.doe@microsoft.com") ###################
