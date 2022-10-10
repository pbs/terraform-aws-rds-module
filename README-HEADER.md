# PBS TF RDS Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-rds-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

This module provisions a basic RDS cluster.

The only supported RDS type right now is Aurora Serverless.

When the RDS cluster is created, a sensitive output variable `db_admin_password` is present that can be used to connect to the database as the user specified by `db_admin_user` (it's `admin` by default). It is highly recommended that this password be rotated out as quickly as possible after provisioning the database, and that the value is not stored or used afterwards. Use this admin user to create a new database user with restricted permissions to a single database for application connectivity.

This module also assumes that connections are established through a private DNS record stored in the output variable `db_cluster_dns`. This makes it so that adjustments to the database can be made in a fashion that is transparent to application configurations.

Integrate this module like so:

```hcl
module "rds" {
  source = "github.com/pbs/terraform-aws-rds-module?ref=x.y.z"

  # Required Parameters
  private_hosted_zone = "example.local"

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs
