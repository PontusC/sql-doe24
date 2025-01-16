#!/bin/bash
# Just makes it easier to run .sql files against the db

mariadb sakila -h mariadb-server -u root --password=$(cat pw-mariadb)