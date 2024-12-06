This PowerShell script compares the group memberships of two Active Directory (AD) users. It provides an overview of:

Groups common to both users.
Groups specific to each user.
This can be particularly useful for administrators managing permissions and ensuring consistency across users in an AD environment.

Features
Fetches and compares AD group memberships for two specified users.
Categorizes groups into:
Common Groups
Groups Specific to User 1
Groups Specific to User 2
Outputs results in a readable tabular format.
Prerequisites
Active Directory Module for PowerShell
Ensure the Active Directory module is installed on the machine running the script. You can install it via:

powershell
Copy code
Install-WindowsFeature -Name RSAT-AD-PowerShell
Permissions
The user running the script must have sufficient permissions to query group memberships in Active Directory.

PowerShell Version
PowerShell 5.1 or later is recommended.

Installation
Clone or download this repository.
Save the script file (Compare-ADUserGroups.ps1) to a directory of your choice.
Usage
Open PowerShell with administrative privileges.
Import the script:
powershell
Copy code
.\Compare-ADUserGroups.ps1
Follow the prompts to enter the SamAccountName of the two users you wish to compare.
Alternatively, you can call the function directly within your session:

powershell
Copy code
Compare-ADUserGroups -User1 "User1_SamAccountName" -User2 "User2_SamAccountName"
Example
plaintext
Copy code
Write User 1 name (SamAccountName): John.Doe
Write User 2 name (SamAccountName): Jane.Smith
Output
The script will display:

Groups in Common: Groups both users belong to.
Specific Groups to User 1: Groups only the first user belongs to.
Specific Groups to User 2: Groups only the second user belongs to.
Example Output:
plaintext
Copy code
Groups in common:
Name
----
Domain Admins
IT Support

Specific groups to John.Doe:
Name
----
Finance

Specific groups to Jane.Smith:
Name
----
HR
Marketing
Error Handling
User Not Found: If a specified user does not exist in AD, the script will display an error message.
No Group Memberships: If a user has no groups, a warning will be displayed.
General Failures: Errors will be caught and displayed in the console for debugging.
Limitations
This script is designed to work only in Active Directory environments.
If either user has many group memberships, the output may take longer to generate.
License
This script is licensed under the MIT License. You are free to use, modify, and distribute it.

Contributing
Feel free to submit issues or pull requests to enhance the script's functionality or improve its performance.

Acknowledgements
This script was developed to assist system administrators in managing and comparing AD group memberships efficiently.
