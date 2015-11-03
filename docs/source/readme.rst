refigur8tor
===========

About
-----

ReFigur8tor - initially ReFigur8thor (with puns intended of course) - is a control template for a Reason Combinator.
Right now it has two Multiballs controlling the Knobs on the combinator, the 4 buttons as well as Pitch Bend and Modulation Wheel.

I will soon enhance it for the Performance controls like breath and so on. I'm very happy right now with the performance.
Either start from scratch and create an own combinator or use a well crafted one, that's balanced for tweaking.

For example Thors Hammer created by hydlide. See the :ref:`ReFills <REFILLS>` section at the end.
Or just use your favourite ones. If you have some good free ones, or recommended commercial ones with a demo. Add it to the document and create a pull request.


Usage
-----

refigur8tor unidirectional communication atm. This means only midi messages are sent to Reason. If you change a value in Reason, it won't be displayed on the touch device. For the buttons this means they won't necessarily the current state.

The left MultiBall controls Rotary 1 and 2, the right one 3 and. The range sliders to the left and bottom side control the values sent to Reason. Think of if as a zoom control where the Multiball control is the view. If the Range is set to MIN and MAX you have the full range. If set to specific locations it is zoomed in and will just produce values relative to this region. The Numbers in the brackets in the Multiball controls are monitors which show you the MIDI CC Value for the x/y axis transmitted to their corresponding Knobs 1,2,3,4.

Button 1 to 4 switches the according knobs on and off. Pitch and Wheel does the same with its counterparts.


The lemur folder contains templates for the Liine Lemur app

* `iOS <https://itunes.apple.com/app/lemur/id481290621?mt=8>`_
* `Android <https://play.google.com/store/apps/details?id=net.liine.lemurapp>`_

There is also a  md12 folder containing templates for `Midi Designer 12 <https://itunes.apple.com/app/midi-designer-12-professional/id685657174?mt=8>`_ from which I started of several weeks 
ago
It is not as feature rich and the instructions here will only guide you through with Lemur.
But it's even easier to start. For the connection Just click the template on your phone
(it will open up in Midi Designer). And go to setup entering the IP of your host.
Follow the Connection guide for MIDI and Reason.

If you want to have a working template in `TouchOSC <https://itunes.apple.com/app/touchosc/id288120394>`_ you have to donate it. I'm willing to create one. 


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

Reason
++++++

For Reason you have to go into the preferences (cmd+,)

* Click Control Surfaces
* Click Add
* For Manufacturer select _Other_
* For model choose MIDI Control Surface (or Keyboard)
* I name mine distinct to the connection type and create a new Control Surfaces for every connection type, as I sometimes use USB Midi, sometimes Bluetooth MIDI
* For name I put in
   
  * iPhone USB MIDI Control Surface
  * as I'm using USB and the Surface driver here

* For MIDI input

  * Click MIDI Input and select midiLE USB Source or your bluetooth connection
  * Alternatively click _Find_ and hit a knob, multiball or button to generate a midi message. Reason will receive it and select the INPUT based on this


Troubleshooting
---------------

Seems a lot to do, but once setup, you just have to do the connection thing (start midiLE and connect to USB or open Audio MIDI setup and connect your iPhone) and launch lemur on your touch device. 


If there are any problems in the setup there check your connectivity first. USB Midi is the easiest one. It won't timeout and has superior latency. In case there is no controller moving in Reason:

Open Midi Monitor and move some controls on your touch device. If no message shows up here there is a connection issue. From time to time (happens for me when using Bluetooth and the connection times out) You have to close the Midi Monitor Window (cmd+q) and create a new one (cmd+n) because it won't register any messages. So make sure that this is not  the case and you are trapped into believing it is a connection issue.

For Midi Monitor or a Windows alternative have a look at 
https://www.native-instruments.com/de/support/knowledge-base/show/998/how-to-monitor-the-input-of-a-midi-controller/


If you are running windows and want to use it there have a look at `rtpMidi <http://www.tobias-erichsen.de/software/rtpmidi.html>`_.



TIPS
----

* If you want to preserver some tweaks on your phone save the template with a new name
* If you want to save the parameter settings on your phone


.. _REFILLS:

ReFills
-------

* `Reason Experts <http://www.reasonexperts.com/refills-and-patches/reason-refills/>`_


Developing
----------

* `Reason Help <https://www.propellerheads.se/support/downloads/reason-documentation-and-help-files/>`_
* `Reason 8.3 MIDI Implementation Chart <http://cdn.propellerheads.se/Reason8/Manuals/Reason_83_MIDI_Implementation_Chart.pdf>`_
