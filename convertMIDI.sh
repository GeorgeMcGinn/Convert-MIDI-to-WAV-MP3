#!/bin/bash
#
# MIDI to WAV and MP3 Converter -- Shell Script -- George McGinn 2021
#Version 1.0 -- December 19, 2021
#
# convertMIDI - Script to convert a MIDI file into both a .WAV and .MP3
#               audio formats. Uses Zenity to retrieve the MIDI file,
#               create the output files, show progress, and other messages.
#
# NOTES: This script needs the following installed:
#        Zenity - Script's GUI 
#        timidity - Converts the MIDI to a WAV format
#        ffmpeg - Converts a MIDI/WAV to MP3 format
#
# USEAGE:
#   This script can be invoked from a File Manager or from a terminal
#   session. When started, it defaults to your $HOME/Music directory.
#   Select the location of your MIDI file. You will be able to change
#   the directory. Select your MID or MIDI file then click [OK]. Next
#   The output for the WAV and MP3 files will default to your $HOME/Music
#   directory. You can change this location. Enter the file name WITHOUT
#   any extensions. The .wav and .mp3 will be added to the file name
#   you provide. The script will create both files.
#
#   If you select directory(ies) that require ROOT access, the script will
#   ask you for your password and then do the conversions as stated above.
#   There is no need to start this script with sudo.
#

# Change directory to Home/Music

cd $HOME/Music

# Get the MIDI path/file name
mid=$(zenity --file-selection)
if [ $? = 1 ];
	then exit
fi


# Get save path/file name
wav=$(zenity --file-selection --save --confirm-overwrite)
if [ $? = 1 ];
	then exit
fi

# see if current user has write permissions by creating an empty file
> "$wav:".wav
> "$wav".mp3

# if so, delete the empty files and do the conversion and show progress bar
if [ $?  -eq 0 ]; then
	rm "$wav:".wav
	rm "$wav".mp3

	timidity "$mid" -Ow -o "$wav".wav  | zenity --progress --pulsate --auto-close --text "Converting to WAV..."
	timidity "$mid" -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "$wav".mp3 | zenity --progress --pulsate --auto-close --text "Converting to MP3..." 

# Tell us the conversion is done
	zenity --info --text "Conversion complete!"

# if not, get root password, run command as root
else
# Get the users password
	passwd=$(zenity --password)

# Do the conversion and show a progress bar
	echo $passwd|sudo -S timidity "$mid" -Ow -o "$wav".wav | zenity --progress --pulsate --auto-close --text "Converting to WAV..."
	echo $passwd|sudo -S timidity "$mid" -Ow -o - | ffmpeg -i - -acodec libmp3lame -ab 64k "$wav".mp3 | zenity --progress --pulsate --auto-close --text "Converting to MP3..." 

	if [ $? = 1 ];
		then exit
	fi

# Tell us the conversion is done
	zenity --info --text "Conversion complete!"
fi
