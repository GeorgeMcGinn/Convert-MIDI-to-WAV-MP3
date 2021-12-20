# Convert MIDI to WAV and MP3 File Types
[![Licence CC NC-SA](https://img.shields.io/badge/License-GNU%20GPL%20v3-brightgreen)](https://www.gnu.org/licenses/gpl-3.0.en.html) ![](https://img.shields.io/badge/Linux_Only-Any-critical) ![Zenity](https://img.shields.io/badge/Zenity-v3.32%2B-critical) ![](https://img.shields.io/badge/TiMidity++-v2.14+-critical) ![](https://img.shields.io/badge/ffmpeg-v4.2+-critical)

Linux-only Script to convert a MIDI file into both a .WAV and .MP3 audio formats. Uses Zenity as the GUI to retrieve the MIDI file, create the output files, show progress, and other messages. Requires tiMidity++ and ffmpeg to create the .WAV and .MP3 files.
&nbsp;

## Requirements
This script needs the following installed:
- **Zenity** - Script's GUI 
- **tiMidity++** - Converts the MIDI to a WAV format
- **ffmpeg** - Converts a MIDI/WAV to MP3 format (NOTE: ffmpeg must have `--enable-libmp3lame` set in order for it to create the MP3 file. You can check this by typing `ffmpeg -version` into a terminal session.)
&nbsp;

## Usage
This script can be invoked from a File Manager or from a terminal session. When started, it defaults to your $HOME/Music directory. Select the location of your MIDI file. You will be able to changg the directory. Select your MID or MIDI file then click the [OK] button. 
 
Next, the output for the WAV and MP3 files will also default to your `$HOME/Music` directory. You can change this location. Enter the file name ***WITHOUT*** any extensions. 
 
The .wav and .mp3 will be added to the file name you provide. The script will create both files.

If you select any directories that require ROOT access, the script will ask you for your password and then do the conversions as stated above. There is no need to start this script with sudo.

* * *
***Last updated: 12/19/2021 21:41***
