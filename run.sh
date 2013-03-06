#!/bin/bash

#----------------------------------------------
# Run Script for CU Boulder Data Ingests
#
#----------------------------------------------

#Import Passwords for system processes
source ../syspwd

#Set Date, Default Folder, Data Folders, Backup File Prefix
ROOT=~/Source
DATE=$(date +"%Y%m%d")
OLD=cub-old-data
NEW=cub-new-data
TARFILE=cub-update
INSTITUTE=CUB


# Call Oracle Database - Pass Script File and Recieve Files
echo exit | /Library/Oracle/instantclient_11_2/sqlplus $OR_USER/$OR_PWD@FACDB @../oracle-scripts/vivo_extract_cub.sql

# Move files into position for review from Laon
rm -rf $ROOT/$OLD/*
cp -R $ROOT/$NEW/ $ROOT/$OLD/
rm -rf $ROOT/$NEW/*
scp laon:/tmp/fis_* $ROOT/$NEW/

# Create backup of output files
tar -cvzf '$TARFILE'-'$DATE'.tar.gz $Root/$New/fis_*


# Run Comparison program based on last run





# Based on Last run and Changes Run individual Script Files against Setup




# Verify




# Move to Production