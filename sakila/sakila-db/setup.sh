#!/bin/bash
mariadb -h mariadb-server -u root --password=$(cat pw-mariadb) < sakila-schema.sql
mariadb -h mariadb-server -u root --password=$(cat pw-mariadb) < sakila-data.sql