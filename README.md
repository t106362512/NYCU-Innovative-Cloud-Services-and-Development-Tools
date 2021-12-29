# t10-deploy-testing

## 簡述

這是我大 Terrible(Terraform + Ansible) 部署方式，預期部署時僅需打 gitlab-ci api 就能全自動部署 VM 與應用程式

## 前置需求

- 需先產生一對公私金鑰，並且要放在位置 keys/ansible-key

  ```bash
  cd keys
  ssh-keygen -f ansible-key
  ```

## Terraform 建立 VM

- 說明

  - 使用 Terraform 建立 VM 後，他也會將 Ansible 要部署的應用也一起部下去~

- 準備 gitlab backend

  - 參考[連結](https://docs.gitlab.com/ee/user/infrastructure/iac/terraform_state.html)建立相關資源

  - 然後開發使用該後端來處理

  ```bash
  cd terraform
  terraform init \
    -backend-config="username=<YOUR-USERNAME>" \
    -backend-config="password=<YOUR-ACCESS-TOKEN>"
  ```

  - 實際於 ci 使用的指令，以管理個別 server 的狀態

  ```bash
  cd terraform
  terraform init \
    -backend-config="address=http://gl-cloud.mylabs.space/api/v4/projects/4/terraform/state/${ID}-tfstate" \
    -backend-config="lock_address=http://gl-cloud.mylabs.space/api/v4/projects/4/terraform/state/${ID}-tfstate/lock" \
    -backend-config="unlock_address=http://gitlab.com/api/v4/projects/4/terraform/state/${ID}-tfstate/lock" \
    -backend-config="username=<YOUR-USERNAME>" \
    -backend-config="password=<YOUR-ACCESS-TOKEN>"
  ```

- 部署

  - 部署 IP 等變數設置方式

    - 先參考 `terraform/variables.tf` 的內容後，可用以下方式將變數值帶給 `terraform`
      - 環境變數
      - 變數檔案，可寫在 `terraform/terraform.tfvars`

  - 一般部署

    ```bash
    cd terraform
    terraform plan -out terraform.tfplan
    terraform apply "terraform.tfplan"
    ```

  - 開發時走 ssh_tunnel 部署(不知道為何不能使用 tfplan 部署)

    ```bash
    cd terraform
    terraform apply
    ```

## Ansible 部署

- 說明

  - 這是拆分出來設定檔變數應用，它可以很方便的動態部署應用

- 設定檔變數位置為 `ansible/group_vars/all/vars.yml`
- 單獨部署方式

  ```bash
  cd ansible
  ansible-playbook -i 192.168.114.50, setup-application.yml
  ```
