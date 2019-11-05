# Copyright 2019 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

variable "hub_project_id" {
  description = "Hub Project id. Same project can be used for hub and spokes."
  type        = string
}

variable "spoke_1_project_id" {
  description = "Spoke 1 Project id. Same project can be used for hub and spokes."
  type        = string
}

variable "spoke_2_project_id" {
  description = "Spoke 2 Project id. Same project can be used for hub and spokes."
  type        = string
}

variable "spoke_to_spoke_route_advertisement" {
  description = "Use custom route advertisement in hub routers to advertise all spoke subnets."
  type        = bool
  default     = true
}

variable "hub_bgp_asn" {
  description = "Hub BGP ASN."
  type        = number
  default     = 64515
}

variable "spoke_1_bgp_asn" {
  description = "Spoke 1 BGP ASN."
  type        = number
  default     = 64516
}

variable "spoke_2_bgp_asn" {
  description = "Spoke 2 BGP ASN."
  type        = number
  default     = 64517
}

variable "hub_subnets" {
  description = "Hub VPC subnets configuration."
  type = list(object({
    subnet_name   = string
    subnet_ip     = string
    subnet_region = string
  }))
  default = [{
    subnet_name   = "subnet-a"
    subnet_ip     = "10.10.10.0/24"
    subnet_region = "europe-west1"
    },
    {
      subnet_name   = "subnet-b"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "europe-west2"
    },
  ]
}

variable "spoke_1_subnets" {
  description = "Spoke 1 VPC subnets configuration."
  default = [{
    subnet_name   = "spoke-1-subnet-a"
    subnet_ip     = "10.20.10.0/24"
    subnet_region = "europe-west1"
    },
    {
      subnet_name   = "spoke-1-subnet-b"
      subnet_ip     = "10.20.20.0/24"
      subnet_region = "europe-west2"
    },
  ]
}

variable "spoke_2_subnets" {
  description = "Spoke 2 VPC subnets configuration."
  default = [{
    subnet_name   = "spoke-2-subnet-a"
    subnet_ip     = "10.30.10.0/24"
    subnet_region = "europe-west1"
    },
    {
      subnet_name   = "spoke-2-subnet-b"
      subnet_ip     = "10.30.20.0/24"
      subnet_region = "europe-west2"
    },
  ]
}

variable "private_dns_zone_name" {
  description = "Private DNS Zone Name."
  type        = string
  default     = "gcp-local"
}

variable "private_dns_zone_domain" {
  description = "Private DNS Zone Domain."
  type        = string
  default     = "gcp.local."
}

variable "forwarding_dns_zone_name" {
  description = "Forwarding DNS Zone Name."
  type        = string
  default     = "on-prem-local"
}

variable "forwarding_dns_zone_domain" {
  description = "Forwarding DNS Zone Domain."
  type        = string
  default     = "on-prem.local."
}

variable "forwarding_zone_server_addresses" {
  description = "Forwarding DNS Zone Server Addresses"
  type        = list(string)
  default     = ["8.8.8.8", "8.8.4.4"]
}
