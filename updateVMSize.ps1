# Purpose: Update a VM Size
# Date: 2016/11/26

# Connect the Azure subscription with tenant ID
$yourAssociatedSubscriptionTenantId = 'your tenant id'
$yourSubscriptionName = 'your subscription'
$selectSubscription = Get-AzureRmSubscription -SubscriptionName $yourSubscriptionName -TenantId $yourAssociatedSubscriptionTenantId

$vmName = ‘the VM name’
$vmResourceGroup =  ‘the resource group of the VM’

#check VM Size: https://docs.microsoft.com/en-us/azure/virtual-machines/virtual-machines-windows-sizes
$vmSize = "Standard_A3"
$vm = Get-AzureRmVM -ResourceGroupName $vmResourceGroup -Name $vmName
$vm.HardwareProfile.vmSize = $vmSize
Update-AzureRmVM -ResourceGroupName $vmResourceGroup -VM $vm