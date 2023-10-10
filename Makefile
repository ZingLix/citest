build:
	bash ./scripts/build.sh

install:
	poetry install

uninstall:
	pip uninstall -y qianfan

clean:
	rm -rf build output dist qianfan.egg-info docs

doc: install
	poetry run bash -c "sphinx-apidoc -f -F -o build/docs -t qianfan/docs qianfan && cd build/docs && make html"

lint: install
	poetry run black ./qianfan --check 
	poetry run ruff check ./qianfan
	poetry run mypy ./qianfan

test: clean install 
	poetry run coverage run -m pytest -v -r A --continue-on-collection-errors --full-trace qianfan


.PHONY: build install uninstall clean 