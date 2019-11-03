provider rancher2 {
  api_url   = data.terraform_remote_state.rancher.outputs.api_url
  token_key = data.terraform_remote_state.rancher.outputs.token_key
}

provider acme {
  server_url = "https://acme-staging-v02.api.letsencrypt.org/directory"
}