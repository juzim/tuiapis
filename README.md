# TUIAPIS

A collection of scripts to get information from APIs and print them out in [t-ui launcher](https://play.google.com/apps/testing/ohi.andre.consolelauncher) for Android.

Video walktrough: https://www.youtube.com/watch?v=mceulRDLyww

*** Needs root and busybox to install awk until we find a better solution ***


## Setup

1. Get the latest release by
    1. downloading the latest release from https://github.com/juzim/tuiapis/releases and unzip/untar it
    2. (recommended) use a git client for Android (for example mgit) and clone the repository https://github.com/juzim/tuiapis.git. This way you can just pull new changes without affecting your config
2. Download [JSON.awk](https://github.com/step-/JSON.awk) into the helper directory
3. Copy all exiting config files from the folders under "apis" (just skip those without configs) to the "config" folder and adjust the fields
4. Copy the file ```config_default.sh``` to your config folder, rename it to ```config.sh``` and modify the paths if necessary
5. (optional) if you used the zip method, you can protect your config files from being overwritten by updates by moving them to another directory outside of tuiapis and call the script with --config=YOURNEWDIRECTORY, for example: ```sh tuiapis.sh --config=/storage/emulated/0/mytuiapiconfig reddit news```. While this seems complicated to type, you should use aliases anyways where you can just copy&paste the command


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


### Reddit
Fetches top posts of a subreddit

Command

```./tuiapis.sh reddit SUBREDDIT```


Example

```./tuiapis.sh reddit news```

### Newsapi
Fetches headlines from news sources from newsapi.org

All sources are listed at https://newsapi.org/sources

Command

```./tuiapis.sh newsapi SOURCE```

Example

```./tuiapis.sh newsapi cnn```

## Aliases
The best way to use the script is by creating aliases. Using the ```alias -file``` command in t-ui allows you to copy&paste the commands easily.

Example:

```wen=sh /storage/emulated/0/repos/tuiapis.sh --config=/storage/emulated/0/mytuiapiconfig wikipedia en %
wde=sh /storage/emulated/0/repos/tuiapis.sh --config=/storage/emulated/0/mytuiapiconfig wikipedia de %
red=sh /storage/emulated/0/repos/tuiapis.sh --config=/storage/emulated/0/mytuiapiconfig reddit % 10```

## Troubleshooting
- The WORKDIR path should be absolute so the script can be run from any folder
- To download JSON.awk, go to the linked repository and click on the file "JSON.awk" and then on the button "raw"
- Use the ```--debug``` option to get more verbose output (only for curl atm)
- Check the content of the files in the tmp folder for the APIs response
