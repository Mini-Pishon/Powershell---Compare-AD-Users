# Compare Active Directory User Groups

This PowerShell script compares the group memberships of two Active Directory (AD) users. It identifies and categorizes:  
- **Groups in common** between the two users.  
- **Groups specific** to each user.

## Features
- Fetches and compares the AD groups of two users.
- Categorizes groups into common and user-specific groups.
- Provides clean, tabular output for easy interpretation.

## Prerequisites
- **Active Directory Module for PowerShell**: Ensure the module is installed on your machine. You can install it with:
  ```powershell
  Install-WindowsFeature -Name RSAT-AD-PowerShell
