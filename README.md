# Salesforce Org Clone

## Usage

<!-- prettier-ignore -->
After cloning the repo, run the following:
    sh ./backup.sh

<!-- prettier-ignore -->
Running this script will prompt the following:
    Enter Project Directory:
    Enter Project Name:
    Set SFDX Alias Name:

## What does this script do?

`backup.sh` is a wrapper script of the SFDX cli.
The script will copy all the metadata from a given Salesforce org, and convert it to the SFDX file structure.

## Dependencies

This script requires the following:

- [SFDX CLI](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_install_cli.htm "SFDX Installation Guide")
