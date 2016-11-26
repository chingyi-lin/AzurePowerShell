# Purpose: Add a NIC to an Azure VM
# Date: 2016/11/26
# Notes: 
# Virtual machines with multiple network interfaces and virtual machines with a single network interface 
# are not supported in the same availability set, also a virtual machine having a single network interface 
# cannot be updated to have multiple network interfaces and vice-versa.


# Connect the Azure subscription with tenant ID
$yourAssociatedSubscriptionTenantId = 'your tenant id'
$yourSubscriptionName = 'your subscription'
$selectSubscription = Get-AzureRmSubscription -SubscriptionName $yourSubscriptionName -TenantId $yourAssociatedSubscriptionTenantId

$vmName = ‘the VM name’
$vmResourceGroup =  ‘the resource group of the VM’
$NICName = 'the NIC mame'
$NICResourceGroup = ‘the resource group of the NIC’

# Get the VM
$vm = Get-AzureRmVM -Name $vmName -ResourceGroupName $vmResourceGroup

# Add the second NIC
$NewNIC =  Get-AzureRmNetworkInterface -Name $NICName -ResourceGroupName $NICResourceGroup
$vm = Add-AzureRmVMNetworkInterface -VM $vm -Id $NewNIC.Id

# Show the Network interfaces
$vm.NetworkProfile.NetworkInterfaces

# Set one of the NICs to Primary
$vm.NetworkProfile.NetworkInterfaces.Item(0).Primary = $true

# Update the VM configuration (The VM will be restarted)
Update-AzureRmVM -VM $vm -ResourceGroupName $vmResourceGroup
