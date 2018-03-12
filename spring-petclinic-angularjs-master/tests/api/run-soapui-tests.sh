#!/bin/bash
soapuiHome=$1
testServer=$2
soapuiProject=$3
reportFolder=$4



$soapuiHome\bin\testrunner.sh $soapuiProject -a -A -f$reportFolder -j -J -r -a -GbaseURL=$testServer


