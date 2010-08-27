#!/bin/sh

out1=tmp/t01
mkdir -p tmp

must_include() {
    grep "$1" $out1 >/dev/null || exit 1
}
no_errors() {
    if grep error run/log/error.log
    then
        exit 10
    fi
}

echo >run/log/error.log

curl -s >$out1 --user admin:kaG2aeh5 'http://localhost:7179/index.php?page=ipv6space' 

must_include '2001:4830:1119::/48' 
must_include '2001:4830:1119:ffe1::/64' 
must_include 'Silly Test Network' 

no_errors


