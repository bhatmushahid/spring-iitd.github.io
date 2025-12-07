# VNC Setup Guide

Using CLI is great, but sometimes you need a full desktop environment to work with, especially for graphical applications. VNC (Virtual Network Computing) allows you to remotely access and control your desktop environment from another computer. This guide is adapted from [this DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-20-04).
If you are on [PowerEdge server](server_setup.md), jump to step 4.

## Step 1: Install a Desktop Environment

XFCE provides a good lightweight Desktop Environment and works well with VNC. Install it using the following commands:

```bash
sudo apt install xfce4 xfce4-goodies
```

## Step 2: Install a VNC Server

We prefer using tightvncserver for its simplicity and performance. Install it using:

```bash
sudo apt install tightvncserver
```

## Step 3: Initial VNC Server Setup

Start the VNC server to set up a password and create initial configuration files:

```bash
vncserver
```

You will be prompted to set a password. This password will be required when you connect to the VNC server. You can also set a view-only password if desired.
After setting the password, the VNC server will start, and you will see output indicating the display number (e.g., `:1`).

To access it remotely, you can use a VNC client (like RealVNC, TigerVNC, etc.) and connect to `your_server_ip:5901`.

## Step 4: Configure the VNC Server

First, stop the VNC server:

```bash
vncserver -kill :1
```

Next, create or edit the `xstartup` file to start the XFCE desktop environment when you connect via VNC:

```bash
mv ~/.vnc/xstartup ~/.vnc/xstartup.bak
nano ~/.vnc/xstartup
```

Add the following lines to the `xstartup` file:

```bash
#!/bin/bash
xrdb $HOME/.Xresources
startxfce4 &
```

Make the `xstartup` file executable:

```bash
chmod +x ~/.vnc/xstartup
```

## Step 5: Restart the VNC Server

Now, start the VNC server again:

```bash
vncserver
```

You can now connect to your VNC server using a VNC client and the address `your_server_ip:5901`.

---

You can read about connecting to your VNC host securely on this [DigitalOcean tutorial](https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-vnc-on-ubuntu-22-04#step-3-connecting-to-the-vnc-desktop-securely).