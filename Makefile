build:
	sudo debirf make --root-build --no-warning debian-amd64

# Workaround for #917391 and #917393
install_deps:
	sudo apt install -y -q grub-pc-bin mtools

run:
	kvm -m 1024 -serial stdio -net nic -net user \
		-kernel $(shell ls -rt1 debian-amd64/vmlinuz-*-amd64 | tail -1) \
		-initrd $(shell ls -rt1 debian-amd64/rescue_*.cgz | tail -1) \
		-append console=ttyS0

clean:
	sudo rm -fr *-amd64/root *-amd64/.fakeroot-state* *-amd64/.bootstrap.log
