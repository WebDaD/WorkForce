# WorkForce

A Net of Dameon-Scripts, called workers, which is hihgly scalable and efficient.

More text follows here shortly

Also all text in res/ will be included here

## Dependencies

To other perl modules, and for the command-center, etc...

## Installation

- How to set up the controlcenter
- how to set up one or more workers on a server (copy /lib and the worker)

## Configuration

- how to set up workers

## Examples

Why do i need this?

### IP-Address-Manager
You want to permanenty scan your network and save the results in a mysql-database?
This is a simple thing to do, we need the following workers:
- scanw
- lookupw
- portw
- pingw
- mysqlw
- intercomw

what do we do:
- configure scanw with the subnets you want to have checked
- configure intercomw to make all other workers known to it (so scanw can just inform the gateway)
- configure intercomw to write results of scan to mysqlw
- now the service is up and running. to see your data use phpmyadmin or create a webgui

### Network-Health-Keeper
Check on the status of all items in your network and receive messages if something is down.

## License
GNU GENERAL PUBLIC LICENSE, see LICENSE
