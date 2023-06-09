main: src/main.c src/util.c
	gcc -o bin/pendu src/main.c src/util.c src/hint.c -Wall -Wextra -Werror -lcurses -ljson-c

test: test.c
	gcc -o bin/test test.c -Wall -Wextra -Werror -lcurses -ljson-c

clean: rm -f bin/game

container: docker build -t mini-project .
	docker run -t -i -e "PULSE_SERVER=/mnt/wslg/PulseServer" -v \\wsl$\Ubuntu\mnt\wslg:/mnt/wslg/ mini-project

run: bin/pendu
	./bin/pendu
