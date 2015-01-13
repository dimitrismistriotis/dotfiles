#!/bin/zsh

#
# Inspired from
# http://stackoverflow.com/questions/3327312/drop-all-tables-in-postgresql
# and modified for heroku CLI.
#

if [[ $# -ne 1 ]]; then
  echo "Supply heroku app as first argument" >&2
  return 1
fi

#
# tuples-only command line option is not supported for heroku pg:psql :-(.
# Prefixed with a '#' and then cut up to that.
#

RETRIEVE_TABLES_COMMAND="SELECT '#' || string_agg(table_name, ',') \
                         FROM information_schema.tables \
                         WHERE table_schema='public'"

TABLES=`heroku pg:psql --command $RETRIEVE_TABLES_COMMAND --app=$1 \
        | sed -n 's/[^#]*#//p'`

# echo "Retrieved: $TABLES"

for t ("${(s/,/)TABLES}"); do
  echo "Dropping ${t}"
  heroku pg:psql --command "DROP TABLE IF EXISTS ${t} CASCADE" --app=$1
done
