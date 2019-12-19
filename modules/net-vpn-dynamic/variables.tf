/**
 * Copyright 2019 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "create_address" {
  description = "Create gateway address resource instead of using external one, defaults to true."
  type        = bool
  default     = true
}

variable "create_router" {
  description = "Create router for Cloud NAT instead of using existing one."
  type        = bool
  default     = true
}

variable "gateway_address" {
  description = "Optional address assigned to the VPN, used if create_address is false."
  type        = string
  default     = ""
}

variable "name" {
  description = "VPN gateway name, and prefix used for dependent resources."
  type        = string
}

variable "network" {
  description = "VPC used for the gateway and routes."
  type        = string
}

variable "project_id" {
  description = "Project where resources will be created."
  type        = string
}

variable "region" {
  description = "Region used for resources."
  type        = string
}

variable "route_priority" {
  description = "Route priority, defaults to 1000."
  type        = number
  default     = 1000
}

variable "router_advertise_config" {
  description = "Router custom advertisement configuration, ip_ranges is a map of range as key and description as value."
  type = object({
    all_subnets = bool
    ip_ranges   = map(string)
  })
  default = null
}

variable "router_asn" {
  description = "Router ASN used for auto-created router."
  type        = number
  default     = 64514
}

variable "router_name" {
  description = "Name of the existing or auto-created router."
  type        = string
  default     = ""
}

variable "tunnels" {
  description = "VPN tunnel configurations."
  type = map(object({
    bgp_peer_address = string
    bgp_peer_asn     = number
    # each BGP session on the same Cloud Router must use a unique /30 CIDR
    # from the 169.254.0.0/16 block.
    bgp_session_range = string
    ike_version       = number
    peer_ip           = string
    shared_secret     = string
  }))
  default = {}
}
