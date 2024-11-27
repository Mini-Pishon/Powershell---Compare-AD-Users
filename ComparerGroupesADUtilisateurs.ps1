function Compare-ADUserGroups {
    <#
    Ce script permet de comparer les groupes AD entre deux utilisateurs et affiche les groupes communs et specifiques.
    #>

    param (
        [string]$User1,
        [string]$User2
    )

    # Recuperer les groupes du premier utilisateur
    $user1Groups = Get-ADUser -Identity $User1 -Properties MemberOf | Select-Object -ExpandProperty MemberOf

    # Recuperer les groupes du deuxième utilisateur
    $user2Groups = Get-ADUser -Identity $User2 -Properties MemberOf | Select-Object -ExpandProperty MemberOf

    # Trouver les groupes communs
    $commonGroups = $user1Groups | Where-Object { $user2Groups -contains $_ }

    # Trouver les groupes specifiques a l'utilisateur 1
    $user1SpecificGroups = $user1Groups | Where-Object { $user2Groups -notcontains $_ }

    # Trouver les groupes specifiques a l'utilisateur 2
    $user2SpecificGroups = $user2Groups | Where-Object { $user1Groups -notcontains $_ }

    # Afficher les resultats
    Write-Host "`nGroupes communs :"
    if ($commonGroups) {
        $commonGroups | ForEach-Object { Get-ADGroup -Identity $_ | Select-Object Name } | Format-Table -AutoSize
    } else {
        Write-Host "Aucun groupe commun."
    }

    Write-Host "`nGroupes specifiques a $User1 :"
    if ($user1SpecificGroups) {
        $user1SpecificGroups | ForEach-Object { Get-ADGroup -Identity $_ | Select-Object Name } | Format-Table -AutoSize
    } else {
        Write-Host "Aucun groupe specifique a $User1."
    }

    Write-Host "`nGroupes specifiques a $User2 :"
    if ($user2SpecificGroups) {
        $user2SpecificGroups | ForEach-Object { Get-ADGroup -Identity $_ | Select-Object Name } | Format-Table -AutoSize
    } else {
        Write-Host "Aucun groupe specifique a $User2."
    }
}

# Demander a l'utilisateur de saisir les noms des deux utilisateurs a comparer
$user1 = Read-Host "Ecrire le nom du premier utilisateur (SamAccountName)"
$user2 = Read-Host "Ecrire le nom du deuxième utilisateur (SamAccountName)"
Compare-ADUserGroups -User1 $user1 -User2 $user2