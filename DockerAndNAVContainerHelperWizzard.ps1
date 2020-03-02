Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

$form = New-Object System.Windows.Forms.Form
$form.Text = 'Docker Command Wiki'
$form.Size = New-Object System.Drawing.Size(540,590)
$form.StartPosition = 'CenterScreen'


$TabControl = New-Object System.Windows.Forms.TabControl
$TabControl.Location = New-Object System.Drawing.Point(10,10)
$TabControl.Size = New-Object System.Drawing.Size(500,500)
$TabControl.Text = 'Enter Docker Image List'
$form.Controls.Add($TabControl)


$TabPageDocker = New-Object System.Windows.Forms.TabPage
$TabPageDocker.Location = New-Object System.Drawing.Point(10,10)
$TabPageDocker.Size = New-Object System.Drawing.Size(500,500)
$TabPageDocker.Text = 'Docker'
$TabControl.Controls.Add($TabPageDocker)


$TabPageNCH = New-Object System.Windows.Forms.TabPage
$TabPageNCH.Location = New-Object System.Drawing.Point(10,10)
$TabPageNCH.Size = New-Object System.Drawing.Size(500,500)
$TabPageNCH.Text = 'NCH Create Container'
$TabControl.Controls.Add($TabPageNCH)


$okButton = New-Object System.Windows.Forms.Button
$okButton.Location = New-Object System.Drawing.Point(75,520)
$okButton.Size = New-Object System.Drawing.Size(75,23)
$okButton.Text = 'OK'
$okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $okButton
$form.Controls.Add($okButton)

$cancelButton = New-Object System.Windows.Forms.Button
$cancelButton.Location = New-Object System.Drawing.Point(150,520)
$cancelButton.Size = New-Object System.Drawing.Size(75,23)
$cancelButton.Text = 'Cancel'
$cancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$form.CancelButton = $cancelButton
$form.Controls.Add($cancelButton)

$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Point(10,20)
$label.Size = New-Object System.Drawing.Size(280,20)
$label.Text = 'Enter Docker Image List'
$TabPageDocker.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(10,40)
$textBox.Size = New-Object System.Drawing.Size(260,20)
$TabPageDocker.Controls.Add($textBox)

$RadioButton1 = New-Object System.Windows.Forms.RadioButton
$RadioButton1.Location = New-Object System.Drawing.Point(10,60)
$RadioButton1.Size = New-Object System.Drawing.Size(280,20)
$RadioButton1.Text = "Docker Image List"
$TabPageDocker.Controls.Add($RadioButton1)


$RadioButton2 = New-Object System.Windows.Forms.RadioButton
$RadioButton2.Location = New-Object System.Drawing.Point(10,80)
$RadioButton2.Size = New-Object System.Drawing.Size(300,20)
$RadioButton2.Text = "Start Docker Container"
$TabPageDocker.Controls.Add($RadioButton2)

$RadioButton3 = New-Object System.Windows.Forms.RadioButton
$RadioButton3.Location = New-Object System.Drawing.Point(10,100)
$RadioButton3.Size = New-Object System.Drawing.Size(300,20)
$RadioButton3.Text = "Stop Docker Container"
$TabPageDocker.Controls.Add($RadioButton3)

$RadioButton4 = New-Object System.Windows.Forms.RadioButton
$RadioButton4.Location = New-Object System.Drawing.Point(10,120)
$RadioButton4.Size = New-Object System.Drawing.Size(300,20)
$RadioButton4.Text = "Remove Docker Container"
$TabPageDocker.Controls.Add($RadioButton4)

$RadioButton5 = New-Object System.Windows.Forms.RadioButton
$RadioButton5.Location = New-Object System.Drawing.Point(10,140)
$RadioButton5.Size = New-Object System.Drawing.Size(300,20)
$RadioButton5.Text = "Container Event Viewer"
$TabPageDocker.Controls.Add($RadioButton5)


$RadioButton6 = New-Object System.Windows.Forms.RadioButton
$RadioButton6.Location = New-Object System.Drawing.Point(10,10)
$RadioButton6.Size = New-Object System.Drawing.Size(300,20)
$RadioButton6.Text = "Create NAV Imange Container"
$TabPageNCH.Controls.Add($RadioButton6)

#-->>
$GroupBox1 = New-Object System.Windows.Forms.GroupBox
$GroupBox1.Location = New-Object System.Drawing.Point(10,30)
$GroupBox1.Size = New-Object System.Drawing.Size(460,400)
$GroupBox1.Text = "Create NAV Imange Container Parameter"
$TabPageNCH.Controls.Add($GroupBox1)

$Label1 = New-Object System.Windows.Forms.Label
$Label1.Location = New-Object System.Drawing.Point(10,20)
$Label1.Size = New-Object System.Drawing.Size(150,20)
$Label1.Text = "NAV Image Link"
$GroupBox1.Controls.Add($Label1);

$textBox2 = New-Object System.Windows.Forms.TextBox
$textBox2.Location = New-Object System.Drawing.Point(160,20)
$textBox2.Size = New-Object System.Drawing.Size(200,20)
$textBox2.Text = "mcr.microsoft.com/businesscentral/onprem:w1-ltsc2016"
$GroupBox1.Controls.Add($textBox2);

$Label2 = New-Object System.Windows.Forms.Label
$Label2.Location = New-Object System.Drawing.Point(10,40)
$Label2.Size = New-Object System.Drawing.Size(150,20)
$Label2.Text = "New Container Name"
$GroupBox1.Controls.Add($Label2);

$textBox3 = New-Object System.Windows.Forms.TextBox
$textBox3.Location = New-Object System.Drawing.Point(160,40)
$textBox3.Size = New-Object System.Drawing.Size(200,20)
$GroupBox1.Controls.Add($textBox3);

$Label3 = New-Object System.Windows.Forms.Label
$Label3.Location = New-Object System.Drawing.Point(10,60)
$Label3.Size = New-Object System.Drawing.Size(150,20)
$Label3.Text = "My License File"
$GroupBox1.Controls.Add($Label3);

$textBox4 = New-Object System.Windows.Forms.TextBox
$textBox4.Location = New-Object System.Drawing.Point(160,60)
$textBox4.Size = New-Object System.Drawing.Size(200,20)
$textBox4.Text = "C:\Navision\Licencia\ToBC.flf"
$GroupBox1.Controls.Add($textBox4);






#<<--

$form.Topmost = $true

$form.Add_Shown({$textBox.Select()})
$result = $form.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::OK)
{
    $containerName = $textBox.Text
    
    if ($RadioButton1.Checked)
    {
      docker ps -a        
    }
        
    if ($RadioButton2.Checked)
    {
        
        if($textBox.Text.Length -EQ 0)
        {
            write-host "Please Enter Docker Image Name"            
            return;
        }
                
        Start-NavContainer -containerName $containerName

    }

    if ($RadioButton3.Checked)
    {
        
        if($textBox.Text.Length -EQ 0)
        {
            write-host "Please Enter Docker Image Name"            
            return;
        }
                
        Stop-NavContainer -containerName $containerName

    }

    if ($RadioButton4.Checked)
    {        
        if($textBox.Text.Length -EQ 0)
        {
            write-host "Please Enter Docker Image Name"            
            return;
        }
                
        Remove-NavContainer -containerName $containerName
    }

    if ($RadioButton5.Checked)
    {        
        if($textBox.Text.Length -EQ 0)
        {
            write-host "Please Enter Docker Image Name"            
            return;
        }
                
        Get-NavContainerEventLog -containerName $containerName
    }

    if ($RadioButton6.Checked)
    {        
          write-host "Creating Container"

          
          $mylicense = $textBox4.Text
          $imageName = $textBox2.Text
          $containerName = $textBox3.Text 
          
          write-host "mylicense" + $mylicense

          write-host "imageName" + $imageName

          write-host "containerName" + $containerName

          $credential = ([PSCredential]::new("NavAdmin", (ConvertTo-SecureString -String "123" -AsPlainText -Force)))
          
          #Install-Module navcontainerhelper -Force

          Import-Module navcontainerhelper -Force -Verbose

          #$Command = " -accept_eula " + "-containerName " + $containerName + " -imageName " + $imageName + " -licensefile " + $mylicense + " -includeAL " + " -shortcuts " + "'Desktop'" + " -auth " + "'Windows'" + " -updateHosts "+"-alwaysPull"
          
          #write-host $Command
          New-NavContainer -accept_eula -containerName $containerName -imageName $imageName -doNotExportObjectsToText -shortcuts "Desktop" -alwaysPull -licensefile $mylicense -updateHosts -Credential $credential -auth NAVUserPassword 
         #New-NavContainer $Command
        }

}