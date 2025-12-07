---
authors:
  - Anupam Sobti
date: 2024-03-15
---

# Connecting to Wifi on a Raspberry Pi

Connecting to raspberry pi is a great way to get rid of using the monitor everytime you need to access the Raspberry Pi. I have tested these with Raspian stretch on Raspian 3B+. Follow these steps to get started:

- Open the file `/etc/wpa_supplicant/wpa_supplicant.conf` as root.

```bash
sudo gedit /etc/wpa_supplicant/wpa_supplicant.conf
```

- Append the following network info:

```txt
	network={
		ssid="IITD_WIFI"
		scan_ssid=1
		key_mgmt=WPA-EAP
		group=CCMP TKIP
		eap=PEAP
		identity=""
		password=""
		phase1="peapver=0"
		phase2="MSCHAPV2"
	}
```

- Enter your identity and password which is your kerberos id and password.
- Save the file and reboot.
- You should be connected.
