# TUIAPIS

A collection of scripts to get information from APIs and print them out in [t-ui launcher](https://play.google.com/apps/testing/ohi.andre.consolelauncher) for Android.

## Setup

1. Download the latest release from https://github.com/juzim/tuiapis/releases and unzip/untar it
2. Download [JSON.awk](https://github.com/step-/JSON.awk) into the helper directory
3. Copy all exiting config files from the folders under "apis" (just skip those without configs) to "config" and adjust the fields

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
