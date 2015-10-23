# Belkin-WeMo-Command-Line-Tools

This package provides a 'wemo' command that can be used to control your Belkin WeMo power switch (and can be easialy extended to cater for other similar devices or new methods not yet implemented).

## Installation
### Global
For global installation of the package use:

    $ npm install -g belkin-wemo-command-line-tools

That will install the latest version of the package that has hit the NPM repository, globally to your system, (usually in /usr/local/bin) which as long as that is in your PATH variable, you can then simply run the 'wemo' command whenever you want without having to worry about where it is.

### Local
For local installation, if you run `npm install belkin-wemo-command-line-tools` without the `-g` flag, it will install it into your project locally under `./node_modules/belkin-wemo-command-line-tools` - doing this will require you to prefix the wemo command with a path that can locate it.

# Basic Usage
## Getting started with the CLI
If you have globally installed the 'wemo' command, you can now run it in your terminal without any arguments, which will show you the usage page:

    $ wemo

    Usage: /usr/local/bin/wemo -h [ IP/HOSTNAME ]                             \
                               -a [ ACTION ]                                  \
                               [[ -s ] | [ -v ] | [ -V ] | [ -t ] | [ -T ]]   \
                               [[ -tt ]]

    Arguments:
        [ -h | --host ]    IP_ADDRESS | HOSTNAME
        [ -a | --action ]  ON | OFF | GETSTATE | GETSIGNALSTRENGTH | GETNAME | SETNAME NAME

    Optional Arguments: 
        [ -s | --silent ]        
        [ -v | --verbose ]        
        [ -V | --very-verbose ]   } 
        [ -t | --trace ]          } [ -tt | --trace-time ]  
        [ -T | --trace-raw ]      }

## Getting the state
- To get the state you can use a command such as

    `$ wemo --host powerswitch1.lnd --action GETSTATE`

## Turning a switch ON or OFF
- To turn a switch ON or OFF you can use a command such as...

    `$ wemo --host powerswitch1.lnd --action ON`  (or)

    `$ wemo --host powerswitch1.lnd --action OFF`
    
## Getting the signal strength
- To get the signal strength of the switches WiFi connection you can use a command such as

    `$ wemo --host powerswitch1.lnd --action GETSIGNALSTRENGTH`

## Getting the switch name
- To get the name that the switch is configured to think it is you can use a command such as

    `$ wemo --host powerswitch1.lnd --action GETNAME`

## Setting the switch name
- To set the name that the switch is configured to think it is you can use a command such as

    `$ wemo --host powerswitch1.lnd --action SETNAME [NAME_TO_USE]`

Enjoy!

