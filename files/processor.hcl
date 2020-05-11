path "restricted/data/ssn/claudegarlic" {
  capabilities = [ "read" ]
  control_group = {
    factor "authorizer" {
      identity {
        group_names = [ "controller-group" ]
        approvals = 1
      }
    }
  }
}
