install:
	swift build --configuration release
	install .build/release/ModulusOperandiCLI /usr/local/bin/modulo
