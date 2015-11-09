refigur8tor
===========

.. _ABOUT:

About
-----

ReFigur8tor - initially ReFigur8thor (with puns intended of course) - started as a control template for a Reasons Combinator and will
eventually grow into a Remote Codec and templates for all Devices.

Right now it has two Multiballs controlling the Knobs on the combinator, the 4 buttons as well as Pitch Bend and Modulation Wheel.
I will soon enhance it for the Performance controls like breath and so on. I'm very happy right now with the performance.
Either start from scratch and create an own combinator or use a well crafted one, that's balanced for tweaking.

For example Thors Hammer created by hydlide. See the :ref:`ReFills <REFILLS>` section at the end.
Or just use your favourite ones. If you have some good free ones, or recommended commercial ones with a demo. Add it to the document and create a pull request.

The `source code for refigur8tor <https://github.com/schuster-rainer/refigur8tor>`_ is hosted on github.

Download
--------

Find any of the `releases <https://github.com/schuster-rainer/refigur8tor/releases>`_ on github.



.. _USAGE:

Usage
-----

refigur8tor can send and receive MIDI messages.

The left MultiBall controls Rotary 1 and 2, the right one 3 and 4. The range sliders to the left and bottom side control the values sent to Reason. Think of if as a zoom control where the Multiball control is the view. If the Range is set to MIN and MAX you have the full range. If set to specific locations it is zoomed in and will just produce values relative to this region. The Numbers in the brackets in the Multiball controls are monitors which show you the MIDI CC Value for the x/y axis transmitted to their corresponding Knobs 1,2,3,4.

Button 1 to 4 switches the according knobs on and off. Pitch and Wheel does the same with its counterparts.


The lemur folder contains templates for the Liine Lemur app

* `iOS <https://itunes.apple.com/app/lemur/id481290621?mt=8>`_
* `Android <https://play.google.com/store/apps/details?id=net.liine.lemurapp>`_

The folder Reason contains the Remote Codec, which (at the moment) only contains the mappings for the combinator. If you use a generic MIDI Controller Keyboard from the Reason Surface setup you can create your own Lemur templates, but only with unidirectional communication. This means, you can only send messages to Reason, but don't get notified if Reason replays something.

There is also a md12 folder containing templates for `Midi Designer 12 <https://itunes.apple.com/app/midi-designer-12-professional/id685657174?mt=8>`_ from which I started of several weeks 
ago
It is not as feature rich and the instructions here will only guide you through with Lemur.
But it's even easier to start. For the connection Just click the template on your phone
(it will open up in Midi Designer). And go to setup entering the IP of your host.
Follow the Connection guide for MIDI and Reason.

If you want to have a working template in `TouchOSC <https://itunes.apple.com/app/touchosc/id288120394>`_ you have to donate it. I'm willing to create one. 


.. _TIPS:

TIPS
----

* If you want to preserve some tweaks on your phone save the template with a new name
* If you want to save the parameter settings on your phone

