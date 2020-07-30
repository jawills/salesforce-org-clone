#!/bin/sh

# Author : Justin Wills

if command -v sfdx > /dev/null 2>&1 ; then
    echo "sfdx found"
    echo "version: $(sfdx -v)"
else
    echo "sfdx not found"
    exit 1
fi

# Create Project
echo "Enter Project Directory: "
read PROJECT_DIR
echo "Enter Project Name: "
read PROJECT_NAME
sfdx force:project:create -n $PROJECT_NAME --template standard -d $PROJECT_DIR

# Copy base package.xml
cp package.xml $PROJECT_DIR/$PROJECT_NAME/package.xml
echo "package.xml copied successfully"

cd $PROJECT_DIR/$PROJECT_NAME/
# Set Org alias
echo "Set SFDX alias name:"
read ALIAS_NAME
sfdx force:auth:web:login --setalias $ALIAS_NAME

# Get metadata and convert to sfdx format
sfdx force:mdapi:retrieve -r ./mdapipkg -k package.xml -a 47.0 -u $ALIAS_NAME
cd mdapipkg
unzip unpackaged.zip
cd ..
sfdx force:mdapi:convert -r mdapipkg/unpackaged/
rm -rf mdapipkg