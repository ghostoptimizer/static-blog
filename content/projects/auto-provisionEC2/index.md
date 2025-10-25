---
title: "Auto Provisioning an EC2"
date: 2025-10-24T16:40:16-05:00
summary: ""
tags: []
draft: true
---

I started studying for the AWS Certified Cloud Practitioner and kept bumping into “user data,” “cloud-init,” and this promise that an instance can boot itself into usefulness. I wanted something reproducible, self-documenting, and clean enough to scale later but small enough to understand the process.

---

### What this project builds

- EC2 (Ubuntu 22.04 LTS)
- Security Group (HTTP open; optional SSH from /32)
- Key pair (optional)
- cloud-init bootstrap (nginx + html)
- Terraform outputs (IP/DNS/URL)

![nginx active](/images/status-nginx.png)
*systemd confirms nginx is running.*

![cloud-init status](/images/cloud-init-status.png)
*cloud-init finished successfully on first boot.*

![cloud-init log tail](/images/sudo-tail.png)
*cloud-init-output.log shows apt install + service enable.*

## Why I kept this simple

Complexity is a cost. For learning, I want the shortest path from apply → alive with the fewest moving parts. A single EC2, one SG, cloud-init, and a tiny HTML page is enough to see the whole life cycle: choose an AMI, lock down ingress, bootstrap, verify, and destroy. Once that muscle memory is real, layering on SSM, ALB, Packer, or CI feels like adding modules—not fighting unknowns.

## Final Thoughts

If you’re learning about DevOps/Cloud Engineering, I hope this gives you a nice small project to get your foot in the door. Take what’s useful, if you notice gaps or a cleaner pattern, feel free to share because I’m still learning as well, Ciao!
