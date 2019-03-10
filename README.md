##DNS Parser

This simple console application provide command for parsing extracting domain names and related IP-addresses.
Each line of the input file must contain valid JSON document. For domains and IPs parser parser perform lookup in "data.answers" and "data.additionals" blocks.
From "data.answers" and "data.additionals" blocks extracted only items with of "A" type, all other items is ignored.
Also JSON document is fully ignored in next cases:
- if "status", "data", "data.answers" or "data.additionals" is not present in file;
- if "status" value is not "NOERROR"

Tests located in ``tests`` directory.

SQL dump with database schema and parser execution result can be found in ``sql`` directory.

File with input data can be found in ``input`` folder