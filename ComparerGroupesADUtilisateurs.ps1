function Compare-ADUserGroups {
    <#
    This script compares the AD groups between two users and displays the common and specific groups.
    #>

    param (
        [string]$User1,
        [string]$User2
    )

    # Retrieve groups for the first user
    $user1Groups = Get-ADUser -Identity $User1 -Properties MemberOf | Select-Object -ExpandProperty MemberOf

    # Retrieve groups for the second user
    $user2Groups = Get-ADUser -Identity $User2 -Properties MemberOf | Select-Object -ExpandProperty MemberOf

    # Find common groups
    $commonGroups = $user1Groups | Where-Object { $user2Groups -contains $_ }

    # Find groups specific to user 1
    $user1SpecificGroups = $user1Groups | Where-Object { $user2Groups -notcontains $_ }

    # Find groups specific to user 2
    $user2SpecificGroups = $user2Groups | Where-Object { $user1Groups -notcontains $_ }

    # Display the results
    Write-Host "`nCommon Groups:"
    if ($commonGroups) {
        $commonGroups | ForEach-Object { Get-ADGroup -Identity $_ | Select-Object Name } | Format-Table -AutoSize
    } else {
        Write-Host "No common groups."
    }

    Write-Host "`nGroups specific to $User1:"
    if ($user1SpecificGroups) {
        $user1SpecificGroups | ForEach-Object { Get-ADGroup -Identity $_ | Select-Object Name } | Format-Table -AutoSize
    } else {
        Write-Host "No groups specific to $User1."
    }

    Write-Host "`nGroups specific to $User2:"
    if ($user2SpecificGroups) {
        $user2SpecificGroups | ForEach-Object { Get-ADGroup -Identity $_ | Select-Object Name } | Format-Table -AutoSize
    } else {
        Write-Host "No groups specific to $User2."
    }
}

# Prompt the user to enter the names of the two users to compare
$user1 = Read-Host "Enter the first user's name (SamAccountName)"
$user2 = Read-Host "Enter the second user's name (SamAccountName)"
Compare-ADUserGroups -User1 $user1 -User2 $user2
