# Software soundboard like Elgato Deck

## Overview of my setup
Voicemeeter allows me to mix inputs and provide them to multiple outputs. I use 3 inputs (thus basic Voicemeeter is not enough):
- hardware - your phisical microphone,
- software aux - your pc sound,
- software input - your soundboard app.
And two outputs:
- headphones - collecting sound from software input and aux (letting me hear soundboard and games),
- virtual cable - collecting sound from microphone and software input (letting other to hear me and soundboard).

For aux to work I need to change either each game or windows default output aux cable, for this reason powershell script was written. As a bonus is starts the applications.

## Installation
1. Download and install [Soundboard app](https://github.com/Kalejin/DCSB).
2. Download and install [Voicemeeter app, either banana or potato versions](https://vb-audio.com/Voicemeeter/banana.htm) (you need to have at least two virtual inputs.)
3. Reboot pc according to voicemeeter instructions.
4. Download and install [Virtual Audio Cable](https://vb-audio.com/Cable/index.htm).
5. Reboot pc according to virtual cable instructions.

## Configuration
### Soundboard
THe only important setting is output - set it to `VoiceMeeter Input (not aux). Rest is all up to you.

### VoiceMeeteer
* Hardware In 1
  * Physical microphone or Nvidia RTX Voice microphone
  * Outputs only to A2
* Hardware In 2 & 3 not set
* Virtual In 1 (VoiceMetter VAIO)
  * Outputs both to A1 & A2
* Virtual In 2 (VoiceMetter AUX)
  * Outputs only to A1
* Hardware Out 1
  * Set to your physical headphones/speakers
* Hardware Out 2
  * Set to `Cable Input (VB-Audio Virtual Cable)`
* In case of issues with bad and choppy audio from mixer go to `Menu` -> `System Settings / Options` and set Buffering WDM to `1024`

### Discord
* Set Audio Input to `Cable Output (VB-Audio Virtual Cable)`
* Set Audio Output to `VoiceMeeter AUX Input (VB-Audio Virtual Cable)`
* Disable automatically determining input sensitivity and set it relatively low - discord has a problem with quiet Soundboard app input.