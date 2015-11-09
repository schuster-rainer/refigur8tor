Developing
----------

Documentation
+++++++++++++

.. _BUILDINGDOC:

Building
^^^^^^^^

#. Go to the root folder and run
   
   .. code-block:: bash

       ./release_doc.sh

#. this creates a python virtual environment and installs all dependent packages.
#. The virtualenv can be found in ``docs/build/.env``

Writing
^^^^^^^

#. For setup have a look at :ref:`_BUILDINGDOC` the documentation
#. Once setup you, activate this environment for convenience ``source docs/build/.env/bin/activate``
#. Change the files in ``docs/source``
#. run ``make html`` from the docs directory

Review your documentation
^^^^^^^^^^^^^^^^^^^^^^^^^

#. Run a local webserver in the background

   .. code-block:: bash
       
       cd docs/build/html/
       python -m SimpleHTTPServer 8000 &
       cd -
#. Open your browser and navigate to http://localhost:8000
#. After each build refresh your browser to see the latest content
#. When finished, shut down the webserver

   .. code-block:: bash

       # list the processes running in the background
       jobs
       # remember the number infront of the python -m SimpleHttpServer command
       fg <remembered number>
       # now hit ctrl+c to stop the server


Automatic Building on change
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

#. Once setup you, activate this environment for convenience ``source docs/build/.env/bin/activate``
#. Start automatic build when editing a documentation if you want to see the latest changes in the browser

   .. code-block:: bash

      watchmedo shell-command ./source/ --pattern '*.rst' --recursive --command 'make html' --ignore-patterns="*/.*" --wait
#. when finished hit *ctrl+c* to stop the file watcher


MIDI
++++

Midi Monitor Apps

* Mac - `Snoize MIDI Monitor <http://www.snoize.com/MIDIMonitor/`_
* Windows - `MIDI-OX <http://www.midiox.com/>`_


Lemur Tutorials
+++++++++++++++

* iOS Basic Introduction

  .. youtube:: https://www.youtube.com/watch?v=HUKoW4VTpj8


Writing the Documentation
+++++++++++++++++++++++++


* `Sphinx <http://sphinx-doc.org/index.html>`_


