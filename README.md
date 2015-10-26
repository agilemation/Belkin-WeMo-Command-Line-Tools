# Belkin-WeMo-Command-Line-Tools

Install with npm [Go to NPM package page...](https://www.npmjs.com/package/belkin-wemo-command-line-tools#star)

This package provides a 'wemo' command that can be used to control your Belkin WeMo power switch (and can be easily extended to cater for other similar devices or new methods not yet implemented).  Written entirely out of base tools (such as curl, sed and awk) that will be on any current flavour of Linux/Unix (inc. Mac OSX) so this is a package that requires no external dependancies to be provided prior to use!

## Installation
### Global
For global installation of the package use:
```
    $ npm install -g belkin-wemo-command-line-tools
```
That will install the latest version of the package that has hit the NPM repository, globally to your system, (usually in /usr/local/bin) which as long as that is in your PATH variable, you can then simply run the 'wemo' command whenever you want without having to worry about where it is.

### Local
For local installation, if you run `npm install belkin-wemo-command-line-tools` without the `-g` flag, it will install it into your project locally under `./node_modules/belkin-wemo-command-line-tools` - doing this will require you to prefix the wemo command with a path that can locate it.

# Basic Usage
## Getting started with the CLI
If you have globally installed the 'wemo' command, you can now run it in your terminal without any arguments, which will show you the usage page:
```
    $ wemo

    Belkin WeMo Command Line Tool v1.0.17

    Script to control the Belkin WeMo power switch written entirely in shell
    and constructed out of commands that every computer should already have.

    Copyright © 2015 James Borkowski, @github: agilemation
    Third-party trademarks mentioned are the property of their respective owners.

    Usage: wemo -h [ IP/HOSTNAME ] -a [ ACTION ]                         \
                [[ -ver ] | [ -? ]] | [ -s ] | [[ -v ] | [ -V ] | [ -t ] | 
                 [ -T ]] [[ -tt ]] 

    Arguments:
    [ -h | --host ]    IP_ADDRESS | HOSTNAME
    [ -a | --action ]  ON | OFF | GETSTATE | GETSIGNALSTRENGTH | GETNAME |
                       SETNAME NAME

    Optional Arguments: 
    [ -s | --silent ]        
    [ -v | --verbose ]        
    [ -V | --very-verbose ]   } 
    [ -t | --trace ]          } [ -tt | --trace-time ]  
    [ -T | --trace-raw ]      }
    [ -ver | --version ]
    [ -? | --help ]
```

## Getting the state
- To get the state you can use a command such as
```bash
$ wemo --host powerswitch1.lnd --action GETSTATE
```
With no other flags, as long as the switch can be contacted, the script should return either `ON` or `OFF` depending on its current state.

## Turning a switch ON or OFF
- To turn a switch ON or OFF you can use a command such as...
```bash
$ wemo --host powerswitch1.lnd --action ON
```
(or)
```bash
$ wemo --host powerswitch1.lnd --action OFF
```
## Getting the signal strength
- To get the signal strength of the switches WiFi connection you can use a command such as
```bash
$ wemo --host powerswitch1.lnd --action GETSIGNALSTRENGTH
```
With no other flags, as long as the switch can be contacted, the script should return a number that relates to the current signal strength.

## Getting the switch name
- To get the name that the switch is configured to think it is you can use a command such as
```bash
$ wemo --host powerswitch1.lnd --action GETNAME
```
This command should upon successful execution return the name that the switch believes it is called. 

## Setting the switch name
- To set the name that the switch is configured to think it is you can use a command such as
```bash
$ wemo --host powerswitch1.lnd --action SETNAME [NAME_TO_USE]
```
Personally (for sanitys sake) I always name any switches I setup with the same name as their DNS hostname.  I point that hostname at a fixed IP address, one that is issued by a DHCP server (and ensured static as it is reserved for the switches Ethernet MAC address).  However, you can call yours anything you like, this command should upon successful execution return the name that the switch believes it is now called.  This brings us nicely to...

## Networking
The Belkin WeMo switches that I have come across so far have all served their REST control interface on TCP port `49153`, however it is rumoured that there are some out there in the wild that use the TCP port `49152`.  If you have to access the switch from behind a firewall or need to connect to it from the internet (if your home network is using NAT on your internet connections router) then you will need to make sure that you either allow both of these ports to traverse, or identify which one it uses by using the `telnet` command to confirm it which is open.  For e.g.
```bash
$ telnet powerswitch1.lnd 49153
```
If it is not the port that it runs on you will get something such as:
```
telnet: connect to address 127.0.0.123: Connection refused
telnet: Unable to connect to remote host
```
...whereas if it is the port that your switch is listening on, you will get something like:
```
Trying 111.111.111.111...
Connected to powerswitch1.lnd.
Escape character is '^]'.
```

Enjoy!
