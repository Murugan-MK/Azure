# PowerShell commands to create custom image

# Stopping VM forcibliy before Generalizing
Stop-AzureRmVM -ResourceGroupName "RGImage" -Name "GoldenVM" -Force

# Generalize the VM
Set-AzureRmVM -ResourceGroupName "RGImage" -Name "GoldenVM" -Generalized

# Setting VMName
$GoldenVM=Get-AzureRmVM -ResourceGroupName "RGImage" -Name "GoldenVM"

# Setting VM ID
 $image=New-AzImageConfig -Location "East US" -SourceVirtualMachineId $GoldenVM.id

 # Creating a new Azure Image
 New-AzImage -Image $image -ImageName "MK_W2019_Datacenter" -ResourceGroupName "RGImage"

