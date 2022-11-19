Write-Host "Creating cluster..."
kind create cluster --image kindest/node:v1.24.7@sha256:577c630ce8e509131eab1aea12c022190978dd2f745aac5eb1fe65c0807eb315
Write-Host "Installing flux..."
flux install
Write-Host "Creating SOPS secret..."
$key = Read-Host -Prompt "SOPS AGE Private Key" -AsSecureString
kubectl create secret generic sops-age --namespace=flux-system --from-literal=age.agekey=$(ConvertFrom-SecureString $key -AsPlainText)
Write-Host "Bootstrapping cluster..."
flux bootstrap github --owner=rupertbenbrook --repository=fluxtest --path=clusters/my-cluster --personal
Write-Host "Done"
