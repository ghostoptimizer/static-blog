---
title: "My First Linux Setup Script"
date: 2025-10-07T21:58:35-05:00
draft: false
---

---
<img src="/images/bash.png" alt="Automate tasks with Bash scripts" style="border-radius: 12px; display: block; margin: 0 auto;" />

## Step 1: Project Structure

Before I touched a single line of code, I needed to at least have an organized folder structure for my project:

```
linuxSetup-script/
├── logs/              # For storing log output from the script
├── config/            # Optional: hostname or SSH config templates
├── scripts/           # Placeholder for future helper scripts
├── setup.sh           # Main Bash script
└── README.md          # Overview of the project
```

For me this makes it so much easier by having order to the project - no chaos.

---

## Step 2: Script Logic – Why the Order Matters

Believe it or not, order of operations is **very important** when configuring a system. 
 Messing up the order may not show up immediately, but it can create bugs, vulnerabilities, or hard-to-debug issues later.
1. Setting the hostname → identity comes first  
2. Set the timezone → system logs, SSH timestamps rely on this  
3. Installing packages → need tools before setting up users  
4. Create users → now that tools are available (like a proper shell)  
5. Configure SSH → last step, once user + security is in place

Definitely learned the hard way like when the SSH config is failing because the user didn’t exist yet...lesson learned.

---

## Step 3: VM Setup 

I personally like the ease of **VirtualBox** , I also decided to use the [Bridge Adapter](https://serverfault.com/questions/490043/differences-between-bridged-and-nat-networking) rather than NAT.

Why?

Bridged mode acts just like the interface you're bridging with is now a switch and the VM is plugged into a port on it. Everything acts the same as if it were another regular machine attached to that network. 

Just note: This isn't the most secure option for running sensitive services but for learning at home? It’s perfect.

---

## Step 4: What the Script Actually Does

Once copied into the VM and you ran the script, it has:

- ✅ Set the hostname  
- 🕒 Set the timezone  
- 📦 Installed basic tools like `vim`, `curl`, `git`, `ufw`, `htop`  
- 👤 Creates a user with sudo access  
- 🔐 Configures SSH security by disabling root login & password auth  

After that, I verified everything with commands like:

```bash
hostnamectl
timedatectl
which vim curl git
id newadmin
sudo systemctl status ssh
```

---

## Where I Messed Up

- I originally had SSH config changes at the top of the script…  
  → But SSH broke because the user wasn’t even created yet 
- Forgot to make the script executable (`chmod +x setup.sh`)  
- Assumed `sshd` was the service name — turns out it’s `ssh` on Ubuntu  
- Tried using NAT instead of Bridge — couldn’t SSH into my VM at all  

---

## What I’d Add Next Time

- Add SSH key injection (instead of password login)
- Let users pass in variables (like timezone or username)
- More logging (what if something silently fails?)
- Maybe use a `.env` file for config

---

## About SSH Setup

There are a few ways to handle SSH:

- You can **install it inside the script**, but then you need shared folders or VBox tools to get the script in first  
- You can **enable it during the OS install** (what I did), so you can `scp` right away  
- You can skip SSH and just drop the script into a shared folder (too clunky for me)

I chose to enable SSH up front to make it more realistic and why make things more complex?

---

## 🧠 Final Thoughts

This project might be basic, but it taught me a lot:

- How real systems are set up
- How to think/work in the right order
- How to write scripts that *don’t* break your system

If you’re new to Linux and Bash, this is definitely a cool starter project. Even if it’s totally blinding to the eyes at first, you’ll learn more from building than just copying someone else's setup or reading about it so get to it!

Let me know if this helped or if you’d do something differently, always open to learn more.
