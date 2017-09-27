# TUIAPIS

A collection of scripts to get infotmation from APIs in [t-ui launcher](https://play.google.com/apps/testing/ohi.andre.consolelauncher) for Android.

## Setup

1. Download [JSON.sh](https://github.com/dominictarr/JSON.sh) into the /helper directory and give it execution rights (chmod +x helper/JSON.sh)
2. Copy all exiting config files from the folders under "apis" (just skip those without configs) to "config" and adjust the fields

## APIS
### Wikipedia
Command

```./tuiapis.sh wikipedia LANGUAGE QUERY```

Example

```./tuiapis.sh wikipedia en Berlin Wall```

Issues

- There are formating issues with some utf-8 characters
- The queries are case sensitive

### Weather (Darksky)
Command

```./tuiapis.sh weather-darksky```
