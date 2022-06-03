param
(
   [parameter(mandatory=$true)][string]$name,
   [parameter(mandatory=$true)][string]$age,
   [parameter(mandatory=$true)][string]$gender,
   [parameter(mandatory=$true)][string]$address,
   [parameter(mandatory=$true)][string]$contact,
   [parameter(mandatory=$true)][string]$email

)

$username = "pythonCA02@gmail.com"
$pass = "Pythonca@123"
$securepass = ConvertTo-SecureString $pass -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $username,$securepass
$subject = " $name Updated Details"
$date = get-date

$body = " 

  Hi $name,

  Please find the details as part of latest updation done by you at $date 

  
       Name           =  $name
       Age            =  $age,
       Gender         =  $gender,
       Address        =  $address,
       Contact        =  $contact,
       Email          =  $email


  
  Best Regards,
  Python CA

"
Send-MailMessage -From $username -to $email  -Subject $subject -SmtpServer "smtp.gmail.com" -Port 587 -body $body -UseSsl -Credential $credentials
write-host "Must be aware before clone my code..hack you!"
