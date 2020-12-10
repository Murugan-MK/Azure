# To Create a ResourceGroup:
New-Azresourcegroupname -Location "East US" -Name "RGStorage"


# To Create a storage account named "dec12psstorage"
$storage_account=New-AzStorageAccount -ResourceGroupName "RGStorage" -Name "dec12psstorage" -Location "East US" -Kind StorageV2 -SkuName Standard_LRS
$context=$storage_account=.context

# To create a container
New-AzureStorageContainer -Name "dec122020container" -Permission Container -Context $context

# To copy a file from Azure home directory to container
Set-AzureStorageBlobContent -File "/home/murugan_mk/ca-certificates.conf" -Container "dec12container2" -Context $ctx

# To create one more storage account 
New-AzureStorageContainer -Name "dec12container3" -Context $ctx -Permission Container

# To copy one storage account (dec12container2) to another (dec12container3)
Start-AzureStorageBlobCopy -SrcBlob "./ca-certificates.conf" -SourceContainer "dec12container2" -DestBlob "./ca-certificates.conf" -DestContainer "dec12container3" -Context $ctx

# To Remove a storage account
Remove-AzStorageAccount -ResourceGroupName "RGStorage" -Name "dec12psstorage" -Force

