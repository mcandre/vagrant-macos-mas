#!/bin/sh
curl -OL https://github.com/mas-cli/mas/releases/download/v1.3.1/mas-cli.zip &&
    unzip mas-cli.zip &&
    sudo cp mas /bin/mas &&
    rm mas-cli.zip
