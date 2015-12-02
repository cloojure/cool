#!/bin/bash
cp /home/prod_logs/productionlogs/abhcl01/htapi_archive/htapi_logs_$1_* .
tar xzvf htapi_logs_$1_*
