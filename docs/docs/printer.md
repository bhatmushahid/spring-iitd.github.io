# Setting up HP Printer

Believe it or not, setting up a printer on Linux can be a bit tricky sometimes. This is one of those tasks that I have often been asked to help with. Here are the steps to set up an HP printer on a Linux system, specifically Ubuntu. Most of this page is taken from [this tutorial post](https://www.cyberciti.biz/faq/how-to-install-networked-hp-printer-and-scanner-on-ubuntu-linux/).

## Install HPLIP

HPLIP (HP Linux Imaging and Printing) is a set of drivers and utilities for HP printers. You can install it using the following commands:

```bash
sudo apt install hplip hplip-gui
```

## Why use hp-lip over the inbuilt printer and scanner option?

If you’re using a newer version of Ubuntu Linux, it may come with an automatic HP printer or scanner driver. However, this driver may not work properly with older or newer HP models. That’s where hp-lip comes in handy. By installing this open-source software, you’ll have access to more options and settings like duplex printing, firmware updates, and checking ink levels. It’s definitely worth your time to install hp-lip for a better printing and scanning experience.

## Configure HP printer on Ubuntu Linux

You need to run hp-setup command which set up HPLIP printers and faxes in the CUPS spooler. Tries to automatically determine the correct PPD file to use. Allows the printing of a test page. Performs basic fax parameters set up too. However, first turn on the printer. Set up HP printer in Ubuntu Linux using GUI, run.

```bash
hp-setup 192.168.2.250
```

> Make sure to replace `192.168.2.250` with the actual IP address of your printer. You can find this information on the printer's display panel or ask someone in the lab.

## How do I control my HP printer with “HP Device Manager”?

The HP Device Manager (aka “Toolbox”) for HPLIP supported devices such as printers and scanners. You can find the application by searching for it in your applications menu. It provides access to status of printer, tools, ink/supplies levels and more. If you do not find it, simplys type the following command:

```bash
hp-toolbox
```

## Using HP toolbox to scan

Open the HP toolbox (HP Device Manager) installed by the hp-lip. Choose your multi-functional all-in-one device > Click on Action tab > Choose Scan App.
