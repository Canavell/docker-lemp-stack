#!/bin/bash
_get_config() {
	local conf="$1"; shift
	"$@" --verbose --help 2>/dev/null | grep "^$conf" | awk '$1 == "'"$conf"'" { print $2; exit }'
}
DATADIR="$(_get_config 'datadir' "$@")"
if [ -z "$(ls -A $DATADIR)" ]; then
   echo "The mysql folder is empty, we will not copy my.cnf."
else
   echo "There are some files in mysql folder."
   cp /etc/my_original.cnf /etc/mysql/conf.d/my.cnf
   chmod 0644 /etc/mysql/conf.d/my.cnf
fi
exec docker-entrypoint.sh "$@"