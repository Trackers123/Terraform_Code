rg_name     = "my-resources1"
location = "East US"
#routetable= ["subnet1-rt","subnet2-rt"]

vnet = [
    {name = "hub-vnet" ,address_space= "10.0.0.0/16"}, 
    {name = "Spoke1-vnet",address_space= "20.0.0.0/16"}, 
    {name = "Spoke2-vnet",address_space= "30.0.0.0/16"} 
]

subnet = [
{name = "Spoke1-vnet", subnet_name = "Spoke1-subnet",address_prefix= "20.0.0.0/24"},
{name = "Spoke2-vnet", subnet_name = "Spoke2-subnet",address_prefix= "30.0.0.0/24"},
{name = "hub-vnet", subnet_name = "AzureFirewallSubnet" ,address_prefix= "10.0.0.0/24"}
]

FirewallRG = "Public_Firewall_RG"
publicIPname = "firewallpublicIP"
Firewall = "FirewallPriv"


route_table = ["routetable1","routetable2"]






route1 = [
 {name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"},
 {name = "spoke1tospoke2", address_prefix = "30.0.0.0/24", next_hop_type = "VirtualAppliance"}   
 #{name = "spoke2tospoke1",address_prefix = "20.0.0.0/24", next_hop_type = "VirtualAppliance"}
 
]


route2 = [
 {name = "default",address_prefix = "0.0.0.0/0", next_hop_type = "VirtualAppliance"},
 #{name = "spoke1tospoke2", address_prefix = "30.0.0.0/24", next_hop_type = "VirtualAppliance"}   
 {name = "spoke2tospoke1",address_prefix = "20.0.0.0/24", next_hop_type = "VirtualAppliance"}
 
]


