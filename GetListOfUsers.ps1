Clear-Host
echo "Here is the list of all users:"
Get-ADUser -Filter * | Format-Table -Property DistinguishedName,Name,Surname,ObjectClass,UserPrincipalName 
$OU = Read-Host "You can enter specific OU name and i will check it for you"
DO {
if($? -eq $OU){
    $ErrorActionPreference = "SilentlyContinue"
    Get-ADUser -Filter * -SearchBase “ou=$OU,dc=eleks,dc=local" | Format-Table -Property DistinguishedName,Name,Surname,ObjectClass,UserPrincipalName
    }
else{
    $ErrorActionPreference = "SilentlyContinue"
    echo "Didn't find specified OU..."
    $OU = Read-Host "Please try again or press 'Enter' to exit"
    Get-ADUser -Filter * -SearchBase “ou=$OU,dc=eleks,dc=local”
}
}
until($? -eq $OU)



