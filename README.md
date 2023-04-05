## BitLocker Status Script for CW RMM and Command

1) Go to Settings > Custom Fields and add the following Custom Fields as Text Boxes on the Endpoint level and make sure they are Editable:

<ul><li>BitLocker Encryption Percentage</li>
<li>BitLocker Key ID</li>
<li>BitLocker Protection Status</li>
<li>BitLocker Recovery Password</li>
<li>BitLocker Status</li></ul>

They should look like this when you are done:
<img src="/screenshots/CustomFields.png">

2) Once those are in place, go to Automation > Tasks and create a new script called "BitLocker Status Check".  Give that a description and put it in a category like this:
<img src="/screenshots/ScriptSummary.png">

3) Now we will create the actual script logic.  On the Script Editor tab create the following stucture (we will add the actual functions in a moment):
<img src="/screenshots/ScriptOutline.png">

4) With the outline complete we will now start to fill things in.  Start by filling in the powershell script lines.  To do this we are going to expand out the  "Add Function" lines that will have powershell added to them starting with the first.  Next to the Function dropdown you will type powershell and select it like this: 
<img src="/screenshots/ScriptPowerShellLine.png">

5) In the PowerShell script window that opens you will paste in the contents of the ps1 file shown in this screenshot from the git repo:
<img src="/screenshots/ScriptPowershell.png">

6) Next up lets fill in those other two fields at the top (the second and third lines of the script).  
In line two we want to choose Set Custom Field and in the popup set "BitLocker Status" to %output% like this:
<img src="/screenshots/status_to_output.png">
:warning: NOTE: If you don't see BitLocker Status as an option then you probably need to go back to step 1 and add the custom fields!
</br>

7) Now we will fill in line 3 of the script.  Choose Set Pre-Defined Variable and in the Variable Name put in "status".  Then select the Custom Field radial option and choose BitLocker Status (you can type in there to filter the available list.)  It should look like this when you are done:
<img src="/screenshots/predefined_status.png">

8) Now we will set the IF section of the script.  This is fairly straight forward and you just need to set it like we have in the screenshot below.  Make sure you choose OR next to the condition fields.  The 4 Set Custom Fields are set the same way as the one we did on line 2.
<img src="/screenshots/If_section.png">

9) The last step is the to fill in the Set Custom Field options in the Else section of the scipt.  All of the custom fields will be set to %output% but be sure to set the correct field on the correct line.  It should look like this:
<img src="/screenshots/Custom_Field_Output.png">

