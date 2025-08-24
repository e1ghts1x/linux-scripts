# Linux Scripts 🐧

This repository contains a collection of **scripts and Docker configurations** to help with Linux server administration, focusing on automation, monitoring, and infrastructure services.

---

## 📂 Repository Structure

### 🔹 `motd/`
Scripts for customizing the **MOTD (Message of the Day)** on different services and servers.

- `motd-docker.sh` – Displays information about Docker containers.  
- `motd-nginxdns.sh` – Shows status and data related to Nginx/DNS.  
- `motd-omada.sh` – Omada Controller information.  
- `motd-pihole.sh` – Pi-hole status.  
- `motd-printer.sh` – Printer monitoring.  
- `motd-proxmox.sh` – Displays data and metrics from Proxmox.  

---

### 🔹 `portainer/docker/`
Configurations related to **Portainer** and containerized services.

- `homer_data/`  
  - `app_dashboard.yaml` – Homer dashboard configuration file.  
  - `custom_css.css` – Custom styles.  
  - `custom_css.new.css` – Alternative/updated styles.  

---

### 🔹 `media_server/`
Media server environment.

- `docker-compose.yaml` – Docker configuration for media services.  

---

### 🔹 `n8n_data/`
Environment for **n8n** (workflow automation tool).

- `docker-compose.yaml` – Docker configuration for n8n.  

---

### 🔹 `snipe_it_data/`
Environment for **Snipe-IT** (IT asset management system).

- `docker-compose.yaml` – Docker configuration for Snipe-IT.  

---

### 🔹 `proxmox/`
Automation and integration scripts for **Proxmox**.

- `addNetContainerLXC.sh` – Script to add network settings to LXC containers.  
- `configureOmada.sh` – Script to automatically configure the Omada Controller.  

---

📌 *This README was generated with the help of ChatGPT.*  
