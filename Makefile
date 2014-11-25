build:
	sudo debirf make --root-build --no-warning debian-amd64

clean:
	sudo rm -fr *-amd64/root *-amd64/.fakeroot-state* *-amd64/.bootstrap.log
