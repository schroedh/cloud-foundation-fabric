# Compute Engine VM module

## Example

```hcl
module "debian-test" {
  source     = "../modules/compute-vm"
  project_id = local.project
  region     = local.subnet.region
  zone       = "${local.subnet.region}-b"
  name       = "debian-test"
  network_interfaces = [{
    network    = local.network.self_link,
    subnetwork = local.subnet.self_link,
    nat        = false,
    addresses  = null
  }]
  instance_count = 1
  attached_disks = [
    { name = "disk-1", size = 10, image = null, options = null }
  ]
  # use_instance_template = true
}
```

<!-- BEGIN TFDOC -->
## Variables

| name | description | type | required | default |
|---|---|:---: |:---:|:---:|
| name | Instances base name. | <code title="">string</code> | ✓ |  |
| network_interfaces | Network interfaces configuration. Use self links for Shared VPC, set addresses to null if not needed. | <code title="list&#40;object&#40;&#123;&#10;nat        &#61; bool&#10;network    &#61; string&#10;subnetwork &#61; string&#10;addresses &#61; object&#40;&#123;&#10;internal &#61; list&#40;string&#41;&#10;external &#61; list&#40;string&#41;&#10;&#125;&#41;&#10;&#125;&#41;&#41;">list(object({...}))</code> | ✓ |  |
| project_id | Project id. | <code title="">string</code> | ✓ |  |
| region | Compute region. | <code title="">string</code> | ✓ |  |
| zone | Compute zone. | <code title="">string</code> | ✓ |  |
| *attached_disk_defaults* | Defaults for attached disks options. | <code title="object&#40;&#123;&#10;auto_delete &#61; bool&#10;mode        &#61; string&#10;type &#61; string&#10;source      &#61; string&#10;&#125;&#41;">object({...})</code> |  | <code title="&#123;&#10;auto_delete &#61; true&#10;source      &#61; null&#10;mode        &#61; &#34;READ_WRITE&#34;&#10;type &#61; &#34;pd-ssd&#34;&#10;&#125;">...</code> |
| *attached_disks* | Additional disks, if options is null defaults will be used in its place. | <code title="list&#40;object&#40;&#123;&#10;name  &#61; string&#10;image &#61; string&#10;size  &#61; string&#10;options &#61; object&#40;&#123;&#10;auto_delete &#61; bool&#10;mode        &#61; string&#10;source      &#61; string&#10;type &#61; string&#10;&#125;&#41;&#10;&#125;&#41;&#41;">list(object({...}))</code> |  | <code title="">[]</code> |
| *boot_disk* | Boot disk properties. | <code title="object&#40;&#123;&#10;image &#61; string&#10;size  &#61; number&#10;type &#61; string&#10;&#125;&#41;">object({...})</code> |  | <code title="&#123;&#10;image &#61; &#34;projects&#47;debian-cloud&#47;global&#47;images&#47;family&#47;debian-10&#34;&#10;type &#61; &#34;pd-ssd&#34;&#10;size  &#61; 10&#10;&#125;">...</code> |
| *hostname* | Instance FQDN name. | <code title="">string</code> |  | <code title="">null</code> |
| *instance_count* | Number of instances to create (only for non-template usage). | <code title="">number</code> |  | <code title="">1</code> |
| *instance_type* | Instance type. | <code title="">string</code> |  | <code title="">f1-micro</code> |
| *labels* | Instance labels. | <code title="map&#40;string&#41;">map(string)</code> |  | <code title="">{}</code> |
| *metadata* | Instance metadata. | <code title="map&#40;string&#41;">map(string)</code> |  | <code title="">{}</code> |
| *min_cpu_platform* | Minimum CPU platform. | <code title="">string</code> |  | <code title="">null</code> |
| *options* | Instance options. | <code title="object&#40;&#123;&#10;allow_stopping_for_update &#61; bool&#10;can_ip_forward            &#61; bool&#10;deletion_protection       &#61; bool&#10;preemptible               &#61; bool&#10;&#125;&#41;">object({...})</code> |  | <code title="&#123;&#10;allow_stopping_for_update &#61; true&#10;can_ip_forward            &#61; false&#10;deletion_protection       &#61; false&#10;preemptible               &#61; false&#10;&#125;">...</code> |
| *scratch_disks* | Scratch disks configuration. | <code title="object&#40;&#123;&#10;count     &#61; number&#10;interface &#61; string&#10;&#125;&#41;">object({...})</code> |  | <code title="&#123;&#10;count     &#61; 0&#10;interface &#61; &#34;NVME&#34;&#10;&#125;">...</code> |
| *service_account* | Service account email (leave empty to auto-create). | <code title="">string</code> |  | <code title=""></code> |
| *tags* | Instance tags. | <code title="list&#40;string&#41;">list(string)</code> |  | <code title="">["ssh"]</code> |
| *use_instance_template* | Create instance template instead of instances. | <code title="">bool</code> |  | <code title="">false</code> |

## Outputs

| name | description | sensitive |
|---|---|:---:|
| external_ips | Instance main interface external IP addresses. |  |
| instances | Instance resources. |  |
| internal_ips | Instance main interface internal IP addresses. |  |
| names | Instance names. |  |
| self_links | Instance self links. |  |
| template | Template resource. |  |
| template_name | Template name. |  |
<!-- END TFDOC -->