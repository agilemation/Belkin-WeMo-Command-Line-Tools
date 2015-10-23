# Belkin-WeMo-Command-Line-Tools

This package provides a 'wemo' command that can be used to controll your Belkin WeMo power switch (and can be easialy extended to cater for other similar devices or new methods not yet implemented).

For global installation of the package use:

  $ npm install -g belkin-wemo-command-line-tools

That will install the latest version of the package that has hit the NPM repository.

You can then run the command from anywhere (as long as you used the -g global flag) and doing so without any arguments will show you the usage page as such:

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


