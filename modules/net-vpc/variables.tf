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

variable "auto_create_subnetworks" {
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  type        = bool
  default     = false
}

variable "description" {
  description = "An optional description of this resource. The resource must be recreated to modify this field."
  type        = string
  default     = "Terraform-managed."
}

variable "iam_roles" {
  description = "List of IAM roles keyed by subnet."
  type        = map(list(string))
  default     = {}
}

variable "iam_members" {
  description = "List of IAM members keyed by subnet and role."
  type        = map(map(list(string)))
  default     = {}
}

variable "log_configs" {
  description = "Map of per-subnet optional configurations for flow logs when enabled."
  type        = map(map(string))
  default     = {}
}

variable "log_config_defaults" {
  description = "Default configuration for flow logs when enabled."
  type = object({
    aggregation_interval = string
    flow_sampling        = number
    metadata             = string
  })
  default = {
    aggregation_interval = "INTERVAL_5_SEC"
    flow_sampling        = 0.5
    metadata             = "INCLUDE_ALL_METADATA"
  }
}

variable "name" {
  description = "The name of the network being created"
  type        = string
}

variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}

variable "routing_mode" {
  description = "The network routing mode (default 'GLOBAL')"
  type        = string
  default     = "GLOBAL"
}

variable "shared_vpc_host" {
  description = "Makes this project a Shared VPC host if 'true' (default 'false')"
  type        = bool
  default     = false
}

variable "shared_vpc_service_projects" {
  description = "Shared VPC service projects to register with this host"
  type        = list(string)
  default     = []
}

variable "subnets" {
  description = "The list of subnets being created"
  type = map(object({
    ip_cidr_range      = string
    region             = string
    secondary_ip_range = map(string)
  }))
  default = {}
}

variable "subnet_descriptions" {
  description = "Optional map of subnet descriptions, keyed by subnet name."
  type        = map(string)
  default     = {}
}

variable "subnet_flow_logs" {
  description = "Optional map of boolean to control flow logs (default is disabled), keyed by subnet name."
  type        = map(bool)
  default     = {}
}

variable "subnet_private_access" {
  description = "Optional map of boolean to control private Google access (default is enabled), keyed by subnet name."
  type        = map(bool)
  default     = {}
}
