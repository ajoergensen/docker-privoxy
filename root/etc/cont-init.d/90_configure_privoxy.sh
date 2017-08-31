#!/usr/bin/with-contenv bash
set -x

TMPL=/etc/privoxy/config.tmpl
CONFIG=/etc/privoxy/config

if [[ ! -f $CONFIG ]]
 then
	grep -q "@@CONFIG_TEMPLATE@@" $TMPL
	if [[ $? -eq 0 ]] 
	 then
		dockerize -template $TMPL > $CONFIG
	fi
fi
