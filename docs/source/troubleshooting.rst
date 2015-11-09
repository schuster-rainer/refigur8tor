Troubleshooting
---------------

Seems a lot to do, but once setup, you just have to do the connection thing (start midiLE and connect to USB or open Audio MIDI setup and connect your iPhone) and launch lemur on your touch device. 


If there are any problems in the setup there check your connectivity first. USB Midi is the easiest one. It won't timeout and has superior latency. In case there is no controller moving in Reason:

Open Midi Monitor and move some controls on your touch device. If no message shows up here there is a connection issue. From time to time (happens for me when using Bluetooth and the connection times out) You have to close the Midi Monitor Window (cmd+q) and create a new one (cmd+n) because it won't register any messages. So make sure that this is not  the case and you are trapped into believing it is a connection issue.

For Midi Monitor or a Windows alternative have a look at 
https://www.native-instruments.com/de/support/knowledge-base/show/998/how-to-monitor-the-input-of-a-midi-controller/


If you are running windows and want to use it there have a look at `rtpMidi <http://www.tobias-erichsen.de/software/rtpmidi.html>`_.
