Lemur
=====


API
---

.. data:: Internal.Sensors.accelerometer

   Array containing the x,y,z variables as, where each axis is a floating point value
   ranging from -1.00 to 1.00

   accelerometer[0] accelerometer[1] accelerometer[2]


Acellerometer
^^^^^^^^^^^^^

Script Acess
++++++++++++

``Execution: On Expression - accelerometer``


.. code-block:: lua

       y=(accelerometer[0]*-1+1)/2;
       x=(accelerometer[1]+1)/2;

Midi
^^^^

``Exceution: <any>``

.. code-block:: lua

    midiout(0,{msg_type_x, msg_data_x, midi_val_x});
