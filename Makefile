build:
	bash ./scripts/build.sh

install:
	poetry install

uninstall:
	pip uninstall -y citest

clean:
	rm -rf build output dist citest.egg-info docs

doc: install
	poetry run bash -c "sphinx-apidoc -f -F -o build/docs -t citest/docs citest && cd build/docs && make html"

lint: install
	poetry run black ./citest --check 
	poetry run ruff check ./citest
	poetry run mypy ./citest

test: clean install 
	poetry run coverage run -m pytest -v -r A --continue-on-collection-errors --full-trace citest


.PHONY: build install uninstall clean 