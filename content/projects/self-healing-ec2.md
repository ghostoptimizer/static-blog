---
title: "Self Healing EC2"
date: 2025-10-04
description: >
  A fully automated EC2-based infrastructure system that installs services, monitors health, heals failures, and sends Slack alerts. Built with Terraform, Bash, S3, and systemd.
tags: ["DevOps", "AWS", "Terraform", "Self-Healing", "CI/CD"]
repo: "https://github.com/ghostoptimizer/self-healing-ec2"
weight: 1
---

## Overview

This project provisions an EC2 instance using Terraform, installs NGINX and monitoring scripts via `cloud-init`, and includes a Bash-based self-healing system. It monitors service health and disk usage, restarts services when they fail, and sends alerts via Slack. Logs and uptime data are pushed to an S3 bucket.

## Technologies Used

- **Terraform** (AWS provider, cloud-init injection)
- **Bash** (health checks, logging, Slack alerts)
- **AWS EC2** (infrastructure layer)
- **S3** (log storage)
- **Slack Webhook** (alerting)
- **systemd** (timers for health checks)

## Features

- 💡 Auto-heals failing services
- 📦 Slack alert integration
- 🪵 S3 log backups
- 🔁 Cloud-init automation
- 🧪 Tested and validated with real AWS instances

## Repo

👉 [View on GitHub](https://github.com/ghostoptimizer/self-healing-ec2)

---

If you're interested in building something similar, check the `NOTES.md` files in the repo for lessons learned and architecture breakdowns.
