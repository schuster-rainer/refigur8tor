Setup
-----

Right now they are tested on an iPhone5s connecting to Reason 8.3 on Mac OS X Yesmite (10.10)

Feel free to change, ask questions, send pull requests.

MIT-License

A comprehensive setup guide is following later. For now here is a short list of
how to get started


Connect iOS to your host
++++++++++++++++++++++++

* Connect your iDevice to your Mac or PC to be able to receive MIDI messages

  * On my MAC I'm using MIDI over Bluetooth or MIDI over USB (low latency enough for me right now) with `midiLE for Mac and iOS <http://www.s-r-n.de/midile/>`_


USB
+++


* Start midiLE on your MAC (right click and open for the first time)
* Put it to the App folder
* Start midiLE (midimittr) on your iPhone

Bluetooth
+++++++++

* iOS with midimittr

  * Click the menu icon
  * Advertisement
  * Enter a name for your Device
  * Advertise MIDI Service

* MacOS

 * Open Audio MIDI Setup
 * Double Click the Bluetooth Icon
 * Wait for your Device name to appear in the list
 * hit the connect button when available

* Open midiLE On iOS

  * Open the Menu
  * Go to Routing and click the sources and the destinations, so that the messages are routed properly
  * Now the midiLE icon on your Mac should flash and show you a new connection


Lemur
+++++

* iOS

  * Start Lemur on the iDevice
  * Hit the settings button
  * Scroll down to MIDI Targets
  * Touch Add Target or use the existing one

    * The _From_ is left blank
    * Touch the _To_ field and select the destination

      * For USB it is: _YourPhoneName_ midiLE USB destination

  * Add a target for every connection type (USB and Bluetooth) when using them both

* MacOS

  * Double click the lemur template
  * Lemur opens
  * Click the _Play_ button

    * A connection window pops up
    * if Lemur runs on your phone and is connected to the same Wi-Fi iy will be listed here
    * Select it and hit _Connect_ if you wanna upload the template.
       
      * Be cautious here. It will replace whatever you have on your phone and is unsaved
       
    * Or click download first, to download the template from your phone to the Lemur on your MAC

Remote Codec
++++++++++++

Download the remote codec from https://github.com/schuster-rainer/refigur8tor/releases/

Extract the file and change into the directory. Execute ./macos-setup-reason-remote-code
This will copy the files under ./Reason/Remote to ~/Library/Application Support/Propellerhead Software/Remote/




Reason
++++++

For Reason you have to go into the preferences (cmd+,)

* Click Control Surfaces
* Click Add
* For Manufacturer select Lemur
* For model choose refigur8tor
* For name put in
   
  * Lemur refigur8tor midiLE USB
  * as we are using USB and the Surface driver here (or choose another Name, when using Bluetooth or something else. Just to distinguish your controller setup).

* For MIDI input

  * Click MIDI Input and select midiLE USB Source or your bluetooth connection
  * Alternatively click _Find_ and hit a knob, multiball or button to generate a midi message. Reason will receive it and select the INPUT based on this
