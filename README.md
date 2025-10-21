# Mini SOC Platform – Wazuh

A **Mini Security Operations Center (SOC)** platform that leverages **Wazuh SIEM**, **Docker Swarm orchestration**, and **DevOps automation** through **GitHub Actions** and **Ansible**.  
This project is built for the **SOC Architect / DevOps Technical Challenge**, focusing on automation, security, and observability.


## Overview

The goal of this project is to build a secure, reproducible, and automated SOC stack using **Wazuh** and modern DevOps practices.  
It includes:
- Automated **Wazuh stack deployment** (Indexer, Manager, Dashboard)
- **CI/CD pipeline** with image scanning, testing, and controlled deployments
- **Custom Wazuh rule** to detect **SSH brute-force followed by suspicious logins**
- Infrastructure automation with **Ansible** and **Docker Swarm**

# Requirements
* ansible
* selenium

# Instruction to run Wazuh on Docker swarm
`./run.sh`
