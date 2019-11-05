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

locals {
  network_name = regex("\\/([a-z][-a-z0-9]*[a-z0-9])$", var.network)[0]
  peer_network_name = regex("\\/([a-z][-a-z0-9]*[a-z0-9])$", var.peer_network)[0]
}

resource "google_compute_network_peering" "network_peering" {
  name         = "${var.prefix}-${local.network_name}-${local.peer_network_name}"
  network      = "${var.network}"
  peer_network = "${var.peer_network}"
}

resource "google_compute_network_peering" "peer_network_peering" {
  name         = "${var.prefix}-${local.peer_network_name}-${local.network_name}"
  network      = "${var.peer_network}"
  peer_network = "${var.network}"

  depends_on = ["google_compute_network_peering.network_peering"]
}
