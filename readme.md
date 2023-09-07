<div align="center">
<h1 align="center">
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/6/60/Nextcloud_Logo.svg/2560px-Nextcloud_Logo.svg.png" width="100" />
<br>nextcloud-infrastructure
</h1>
<h3>Nextcloud in GCP</h3>

<p align="center">
<img src="https://img.shields.io/badge/Terraform-7B42BC.svg?style&logo=Terraform&logoColor=white" alt="Terraform" />
<img src="https://img.shields.io/badge/GoogleCloud-%234285F4.svg?style&logo=google-cloud&logoColor=white" alt="Google Cloud Platform">
<img src="https://img.shields.io/badge/gitlab%20ci-%23181717.svg?style&logo=gitlab&logoColor=white" alt="Gitlab CI">
</p>
<img src="https://img.shields.io/github/languages/top/cdiaz2799/nextcloud-infrastructure?style&color=5D6D7E" alt="GitHub top language" />
<img src="https://img.shields.io/github/languages/code-size/cdiaz2799/nextcloud-infrastructure?style&color=5D6D7E" alt="GitHub code size in bytes" />
<img src="https://img.shields.io/github/commit-activity/m/cdiaz2799/nextcloud-infrastructure?style&color=5D6D7E" alt="GitHub commit activity" />
</div>

---

## 📒 Table of Contents
- [📒 Table of Contents](#-table-of-contents)
- [📍 Overview](#-overview)
- [⚙️ Features](#-features)
- [📂 Project Structure](#project-structure)
- [🧩 Modules](#modules)
- [🚀 Getting Started](#-getting-started)
- [👏 Acknowledgments](#-acknowledgments)

---


## 📍 Overview

The project aims to provide a scalable and secure infrastructure for hosting a Nextcloud instance on the Google Cloud Platform. It utilizes Terraform to define and manage the required Google Cloud resources, such as a VM instance, networking configurations, and a MySQL database. 

---

## ⚙️ Features

| Feature                | Description                                                                                                                                                           |
|------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **⚙️ Architecture**     | The codebase follows an infrastructure-as-code approach using Terraform to provision resources on Google Cloud Platform (GCP). It includes configurations for Google Compute Engine, Google Cloud SQL, and related networking components.                       |
| **🔗 Dependencies**    | The project depends on Terraform, HashiCorp's google-beta provider, and various Google Cloud services such as Compute Engine and Cloud SQL.                                                                                        |
| **🧩 Modularity**      | The codebase is organized into separate `.tf` files, each responsible for a specific task like provisioning compute resources, networking, database, and variables. This allows easy maintainability, code reuse, and customization.    |
| **🔀 Version Control** | The project relies on Git as the version control system. It appropriately uses repository branches (master) and documents file changes through commit history.                                                                           |
| **🔌 Integrations**    | The codebase primarily focuses on seamlessly integrating different Google Cloud services (Compute Engine, Cloud SQL) to deploy Nextcloud infrastructure.
| **📶 Scalability**     | The codebase provisions resources using Terraform, allowing easy scaling by adjusting the defined resource specifications. Due to the use of dynamic infrastructure provisioning, the system can effectively handle growth.                                 |

---


## 📂 Project Structure




---

## 🧩 Modules

<details closed><summary>Root</summary>

| File                                                                                           | Summary                                                                                                                                                                                                                                                                   |
| ---                                                                                            | ---                                                                                                                                                                                                                                                                       |
| [compute.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/compute.tf)       | This code creates a Nextcloud web server on Google Cloud Platform. It provisions a VM instance with a static IP, SSH key, and necessary configurations for compute engine. The server runs on Ubuntu and includes security features like shielded instance configuration. |
| [main.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/main.tf)             | This Terraform code defines the required provider and version for Google Cloud resources, specifically using the google-beta provider from HashiCorp.                                                                                                                     |
| [networking.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/networking.tf) | This code sets up a Google Compute Engine network with a subnet and a firewall rule to allow HTTP/HTTPS traffic on ports 22, 80, and 443. It ensures secure and controlled network connectivity for a Nextcloud deployment.                                               |
| [variables.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/variables.tf)   | This code defines variables for a Google Cloud project ID, region, zone, and SSH keys for Ansible. These variables can be used to customize and configure infrastructure through the Terraform tool.                                                                      |
| [provider.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/provider.tf)     | The code is for provisioning resources on Google Cloud Platform (GCP). It sets the project, region, and zone for creating and managing resources within a specific GCP project.                                                                                           |
| [cloudsql.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/cloudsql.tf)     | This code deploys a MySQL database instance on Google Cloud with Nextcloud database configurations. It specifies the instance details, network configurations, and additional users with built-in authentication.                                                         |
| [backend.tf](https://github.com/cdiaz2799/nextcloud-infrastructure/blob/main/backend.tf)       | The code is specifying that the backend storage for Terraform state files should use an HTTP server.                                                                                                                                                                      |

</details>

---

## 🚀 Getting Started

### ✔️ Prerequisites

Before you begin, ensure that you have the following prerequisites installed:
> `ℹ️ Terraform`

### 📦 Installation

1. Clone the nextcloud-infrastructure repository:
```sh
git clone https://github.com/cdiaz2799/nextcloud-infrastructure
```

2. Change to the project directory:
```sh
cd nextcloud-infrastructure
```

3. Install the dependencies:
```sh
terraform init
```

### 🎮 Using nextcloud-infrastructure

```sh
terraform apply
```

### 🧪 Running Tests
```sh
terraform plan
```


---

## 👏 Acknowledgments

> `ℹ️  readmeai - AI readme generation`

---
