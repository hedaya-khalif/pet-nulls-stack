# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  inputs = {
    prefix           = "simple"
    instances        = 2
  }
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
}

deployment_auto_approve "no_pet_changes" {
  reason = "Auto-approve when pet component has no changes"
  
  check {
    # check that the pet component has no changes
    condition = context.plan.component_changes["component.pet"].total == 0
  }
}
