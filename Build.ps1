kind create cluster --image kindest/node:v1.24.7@sha256:577c630ce8e509131eab1aea12c022190978dd2f745aac5eb1fe65c0807eb315
flux install
flux bootstrap github --owner=rupertbenbrook --repository=fluxtest --path=clusters/my-cluster --personal
