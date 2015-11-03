
refigur8tor
===========

About
-----

ReFigur8tor - initially ReFigur8thor (with puns intended of course) - is a control template for a Reason Combinator.
Right now it has two Multiballs controlling the Knobs on the combinator, the 4 buttons as well as Pitch Bend and Modulation Wheel.

I will soon enhance it for the Performance controls like breath and so on. I'm very happy right now with the performance.
Either start from scratch and create an own combinator or use a well crafted one, that's balanced for tweaking.


Usage
-----

refigur8tor unidirectional communication atm. This means only midi messages are sent to Reason. If you change a value in Reason, it won't be displayed on the touch device. For the buttons this means they won't necessarily the current state.

The left MultiBall controls Rotary 1 and 2, the right one 3 and. The range sliders to the left and bottom side control the values sent to Reason. Think of if as a zoom control where the Multiball control is the view. If the Range is set to MIN and MAX you have the full range. If set to specific locations it is zoomed in and will just produce values relative to this region. The Numbers in the brackets in the Multiball controls are monitors which show you the MIDI CC Value for the x/y axis transmitted to their corresponding Knobs 1,2,3,4.

Button 1 to 4 switches the according knobs on and off. Pitch and Wheel does the same with its counterparts.

Documentation
------------

The full documentation is available at https://refigur8tor.readthedocs.org

