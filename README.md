# geoip-cli

A simple command line utility to get the geolocation of an IP address written in the Crystal programming language.

![Screenshot](assets/screnshot.png)

### Prerequisites

Requires Crystal version 1.15 or higher installed on your system.

### Running the program

````bash
crystal run src/geoip-cli.cr -- [arguments] 
````

### Compiling

````bash
crystal build -O s -o bin/geoip-cli src/geoip-cli.cr
````
Compiled binary will be available in the bin directory.

### Usage

````bash
./geoip-cli [arguments]
    -i IP, --ip=IP                   Some IP address to fetch info for.
    -v, --version                    Show version
    -h, --help                       Show help
````
