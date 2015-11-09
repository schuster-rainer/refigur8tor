virtualenv docs/build/.env/
source docs/build/.env/bin/activate
pip install --upgrade pip
pip install sphinx sphinxcontrib.youtube
cd docs
make html

