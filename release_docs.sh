virtualenv docs/build/.env/
source docs/build/.env/bin/activate
pip install sphinx
cd docs
make html

