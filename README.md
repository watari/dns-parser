## DNS Parser

This simple console application provide command for parsing extracting domain names and related IP-addresses.
Each line of the input file must contain valid JSON document. For domains and IPs parser parser perform lookup in "data.answers" and "data.additionals" blocks.
From "data.answers" and "data.additionals" blocks extracted only items with of "A" type, all other items is ignored.
Also JSON document is fully ignored in next cases:
- if "status", "data", "data.answers" or "data.additionals" is not present in file;
- if "status" value is not "NOERROR"

Tests located in ``tests`` directory.

SQL dump with database schema and parser execution result can be found in ``sql`` directory.

File with input data can be found in ``input`` folder

## Installation

1. Copy content of ``.env.dist`` to ``.env`` file.
2. Set appropriate environment by specifying ``dev`` or ``prod`` in ``APP_ENV``.
3. Specify correct credentials for database connection in environment variable ``DATABASE_URL``.
4. Run ``composer install`` command.


For database creation perform next steps:
1. Run ``./bin/console doctrine:database:create`` for database creation.
2. Run ``./bin/console doctrine:schema:create --dump-sql`` for getting SQL statements for database creation.
3. Execute SQL statements from previous step in Postgres database shell.

At this moment database created and configured.

For functional tests separate database is required. Create similar database with other name and specify it in 
``phpunit.xml.dist`` file in section with environment variables.

All project checks can be executed by running ``./bin/run-checks`` command. Before running of project checks files 
``phpunit.xml``, ``phpcs.xml`` and ``phpstan.neon`` must be created from ``dist`` versions of configs. This files must 
be placed in project root.

## Usage

For performing import operation use ``./bin/console parser:import {filepath}`` command. 
In case of sample file command will look in next way - ``./bin/console parser:import ./input/result.json``.
Verbosity of command can be changed by specifying one of the next options: ``-v``, ``-vv`` or ``-vvv``.
 