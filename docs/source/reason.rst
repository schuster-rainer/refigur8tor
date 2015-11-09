Reason
======

WAT?! ... this nice `software from Propellerheads <https://www.propellerheads.se/reason>`_


Disclaimer
----------

I neither have an affiliation with Propellerheads nor a Remote SDK. This information is given as is and just documents my ramblings and findings searching the internet and looking into the given codecs and maps.

Support
-------


* `Reason Help <https://www.propellerheads.se/support/downloads/reason-documentation-and-help-files/>`_
* `Reason 8.3 MIDI Implementation Chart <http://cdn.propellerheads.se/Reason8/Manuals/Reason_83_MIDI_Implementation_Chart.pdf>`_


.. _REMOTE:

Remote
------

Reasons interface to communicate with external control surfaces and keyboards. It consists of a Codec, which is vendor specific. In addition it has a Map of how to apply or route the MIDI signals from the controls of the surface to the different devices/sections or **Scopes** as they are called.

.. _REMOTE_CODEC:

Codec
^^^^^

A codec defines how a controller is designed and how it operates with Reason, receiving and sending MIDI. The minimal codec consists of the function :func:`remote_init`. This function defines the items from your controller and how it interacts (sending and receiving MIDI to/from Reason)



Have a look at the :ref:`LUA_CODEC_EXAMPLE`

.. _LUA_CODEC_EXAMPLE:

Lua Codec Example
+++++++++++++++++


This is a simple Lua Codec example of a minimal remote codec

.. code-block:: lua

    function remote_init(manufacturer, model)
        items={
            {name="Rotary1", input="value",output="value", min=0, max=127},
            {name="Rotary2", input="value",output="value", min=0, max=127},
        }
        remote.define_items(items)

        local inputs={
            {pattern="b?  01  xx", name="ModWheel"},
            {pattern="b?  47  xx", name="Rotary1"},
        }
        remote.define_auto_inputs(inputs)

        local outputs={
            {pattern="b?  01  xx", name="ModWheel"},
            {pattern="b?  47  xx", name="Rotary1"},
        }
        remote.define_auto_outputs(outputs)
    end


.. _INPUT_TYPES:

Input Types
+++++++++++


.. code-block:: lua

    items = {
        {name="Keyboard",input="keyboard"},
        {name="Button 1",input="button"},
        {name="Knob 1", input="value", min=0, max=127, output="value"},
        {name="Button 2", input="button", min=0, max=10, output="value"},
    }

The items variable is an associative array. In lua they are called
`tables <http://lua-users.org/wiki/TablesTutorial>`_. Other programming languages refer
to them as maps. They are like lockers. A table is a row of lockers. 
In the locker box with number 42 you can put your bag in, or whatever else comes to mind.
The remote codec uses it for defining how your surface of the controller looks like and
what kind of things he supports. Rotary1 for example is a knob (we could even have named
it Knob1, but I wanted to stick to the Reason lingo).It transmits a value when you twist 
it and it also receives one (this is the output). The Range supported is the typical midi
range from 0 to 127. Have a quick read at
`An Introduction to MIDI <http://midi.org/aboutmidi/intromidi.pdf>`_
In theory you can put in whatever comes to your mind you just have to stick to it and 
use it later on in the remotemap. Of course it makes sense to name the items according to
your designed surface. With a Lemur app, we can get very creative, as we don't really have
any constraints here and just can morph our surface. There are different implementation 
approaches. One could just put in as many items and MIDI messages into the definition to
have a generic codec for all of the Lemur templates. Another approach is to just put in 
the definitions per template and create specific controller.lua files. 

The inputs and outputs define what to expect to receive from the controller
or how to send MIDI messages out. pattern is a MIDI string with joker signs/wildcards. 
Read on soundonsound.com `Hacking Remote Files in Reason <http://www.soundonsound.com/sos/mar07/articles/reasontech_0307.htm>`_
It describes the older MIDI codec, but the logic of it applies to the luacodec as well.

Read on in the :ref:`MIDI_PATTERNS` to get some more detailed examples

.. _MIDI_PATTERNS:

MIDI Patterns
+++++++++++++

Understanding MIDI is quite easy, if you know the basics of how computers work. A short detour.

#. The tiniest unit in a computer is a bit
#. A bit can have the value 0 or 1
#. This value is called a binary digit
#. 4 bits are called a half byte or nyble
#. 8 bits are called a byte
#. A byte could look like 00101111 and would mean 47 as decimal number
#. As most of us don't speak binary we love to use decimal, as we are used to
#. In this case you always group this 8 bits (or one byte) as a single unit
#. In computer theory sometimes to save space, be very clever and fancy,
   you really do bit operations where you have to speak binary and apply binary math
   with every single bit. Just remember that it's possible. And if you want to get the 
   best use of MIDI you sometimes will use 4 bits (or a nyble as you just learned)
   to get a finer grained control over the incomming or outgoing data.

But now lets have a step by step view of how a midi pattern is built up.
A midi pattern is a sequence of space separated values in hexadecimal or binary notation.
Its use is to pattern match a MIDI message, which consists of 3 bytes. We will work
with this 3 status bytes in the examples below.

A detailed explanation and overview can be found in the 
`technical specification <http://www.midi.org/techspecs/midimessages.php>`_ on midi.org.
If you want to get a technical tour I also recommend having a look at `wikipedia <https://en.wikipedia.org/wiki/MIDI>`. `Table 2 <http://www.midi.org/techspecs/midimessages.php#2>`_ is a listing of the status bytes as also used in the patterns.

Example 1
#########

Match control change for controller 32 (`hexadecimal 0x20 <https://www.google.de/search?q=hexadecimal+to+decimal&oq=hexadecimal+to+d&aqs=chrome.1.69i57j0l5.4463j0j4&sourceid=chrome&es_sm=91&ie=UTF-8#q=0x20+in+decimal>`_ or in the string just 20) on every channel (that's the b?) and assign value that is matched by xx to the controls value

Status Bytes:

#. matching **Control Changes** for any Channel
#. matching **Control Number** 32
#. matching any **Value** and assigning it to xx

.. code-block:: lua

    pattern="b? 20 xx"


Example 2
#########

Check for a midi message in all channels

Status Bytes:

#. matching **Control Changes** for any Channel
#. matching any **control numbers** and assigning it to yy
#. matching any **value** and assigning it to xx

.. code-block:: lua

    remote.match_midi("b? yy xx", event)

Example 3
#########

When a note is played (90) with note number 60 (3C) map its velocity to the value. The value can be used in the inputs and outputs for x. You can even call custom functions.

Status Bytes:

#. matching on **Note On**
#. matching note number 60
#. matching any note velocity and assign it to value (xx)

.. code-block:: lua
    pattern = "90 3C xx"


Example 4
#########

Binary pattern matching.

Match any Note On or Off and assign the fourth bit to value x (**<100x>?**) where the number is 61 and map the first bit of the velocity to z.

The first status byte is **<100x>?** where the first 4 bits of the status byte are matched to only catch note on/off. For reference have a look at the `Status Bytes Specification <http://www.midi.org/techspecs/midimessages.php#2`_. The second byte is ignore as it can have any value denoted by the wildcard **?**


#. matching any **Note On/Of** (first 3 bits) and assign the fourth to x. The **?** matches any other four bits of this first status byte
#. matching **Control Number** 32
#. matching any **Value** and assigning it to xx

.. code-block:: lua

   pattern = "<100x>? 3D <z000>0"


.. todo:: Add more expamples and explanations


Map
^^^

.. todo:: Add description of maps here

.. _REMOTE_API:

API
^^^

.. function:: remote_init(manufacturer, model)

   Initializes your controler. This function defines how your
   controler looks like and what type of controls are on its surface
   and supported.

   :param manufacturer: The manufacturer string from your codec
                        which the users selects in the Surface Setup
   :param model:        The specific model which is select in the setup
               zR         from a manufacturer. You can use it to define different
                        models in one controller.lua and to distinguish
                        which one the user has selected.

.. function:: remote_set_state(changed_items)

   Handle incoming changes from Reason


.. function:: remote_process_midi(event)

   Manually handle incoming messages from the controller. use :func:`remote.match_midi`


.. function:: remote_probe()

   ???


.. function:: remote_prepare_for_use()

   ???


.. function:: remote_release_from_use()

   ???


.. todo:: Add missing codec API functions here


.. _SDK:

SDK
^^^


.. function:: remote.define_items(items)

   Defines the controler surface items. This function tells Reason how the
   controler looks like, what type of controls are on its surface and how they
   operate.

   :param items:    A :ref:`lua table <http://lua-users.org/wiki/TablesTutorial>` defining the controls of the surface


.. function:: remote.define_auto_inputs(inputs)

   Defines the which surface control sends which message to reason

   :param inputs: A lua table defining inputs from a Control Surface items midi message pattern mapped send to Reason.


.. function:: remote.define_auto_output(outputs)

   Defines the pattern when reason should send message a message to the controller

   :param outputs: A lua table defining outputs from a Reason midi message pattern mapped to the control surface item


.. function:: remote.trace(text)

   Trace output the text

.. function:: remote.make_midi(text)

   Send the given text as midi message to the controller

   :param text: MIDI message string

.. function:: remote.match_midi(pattern, event)

   Returns something not nil when the given midi pattern 
   matches the event

   :param pattern: A midi pattern with wildcards
   :param event: An event, received by remote (for example in :func:`remote_process_midi`

.. todo:: Add missing Remote SDK functions here
