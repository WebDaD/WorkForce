# Nassa Ablatorum

A Net of Dameon-Scripts, called ablati, which is hihgly scalable and efficient.

More text follows here shortly

Also all text in res/ will be included here

## Dependencies

To other perl modules, and for the command-center, etc...

## Installation

- How to set up the controlcenter
- how to set up one or more ablati on a server (copy /lib and the ablatus)

## Configuration

- how to set up ablati

## Examples

Why do i need this?

### IP-Address-Manager
You want to permanenty scan your network and save the results in a mysql-database?
This is a simple thing to do, we need the following ablati:
- scana
- lookupa
- porta
- pinga
- mysqla
- intercoma

what do we do:
- configure scana with the subnets you want to have checked
- configure intercoma to make all other ablati known to it (so scana can just call the gateway)
- configure intercoma to write results of scan to mysqla
- now the service is up and running. to see your data use phpmyadmin or create a webgui

### Network-Health-Keeper
Check on the status of all items in your network and receive messages if something is down.

## License
GNU GENERAL PUBLIC LICENSE, see LICENSE
