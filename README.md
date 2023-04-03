Go to Settings > Custom Fields and add the following Custom Fields as Text Boxes on the Endpoint level and make sure they are Editable:

BitLocker Encryption Percentage
BitLocker Key ID
BitLocker Protection Status
BitLocker Recovery Password
BitLocker Status

They should look like this when you are done:
<img
  src="/screenshots/CustomFields.png"
  alt="Custom Fields"
  title="Custom Fields"
  style="display: inline-block; margin: 0 auto; max-width: 300px">

Once those are in place, go to Automation > Tasks and create a new script called "BitLocker Status Check".  Give that a description and put it in a category like this:
<img
  src="/screenshots/ScriptSummary.png"
  alt="Script Summary"
  title="Script Summary"
  style="display: inline-block; margin: 0 auto; max-width: 300px">

Now we will create the actual script logic.  On the Script Editor tab create the following stucture (we will add the actual functions in a moment):
<img
  src="/screenshots/ScriptOutline.png"
  alt="Script Summary"
  title="Script Summary"
  style="display: inline-block; margin: 0 auto; max-width: 300px">

With the outline complete we will now start to fill things in.  Start by filling in the powershell script lines.  To do this we are going to expand out the  "Add Function" lines that will have powershell added to them starting with the first.  Next to the Function dropdown you will type powershell and select it like this: 
<img
  src="/screenshots/ScriptPowerShellLine.png"
  alt="Script Summary"
  title="Script Summary"
  style="display: inline-block; margin: 0 auto; max-width: 300px">

In the PowerShell script window that opens you will paste in the contents of the ps1 file shown in this screenshot from the git repo:
<img
  src="/screenshots/ScriptPowershell.png"
  alt="Script Summary"
  title="Script Summary"
  style="display: inline-block; margin: 0 auto; max-width: 300px">