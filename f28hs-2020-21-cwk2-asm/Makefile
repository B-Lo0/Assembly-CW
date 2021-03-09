# the name on Ubuntu/Debian machines
# cross-compiler = arm-linux-gnueabi

# the name on Fedora/CentOS machines
cross-compiler = arm-linux-gnu

.PHONY: all
all: freq freq-hard-coded

clean:
	rm freq freq-hard-coded

freq: freq.s
	$(cross-compiler)-as -o freq.o freq.s
	$(cross-compiler)-ld -o freq freq.o

freq-hard-coded: freq-hard-coded.s
	$(cross-compiler)-as -o freq-hard-coded.o freq-hard-coded.s
	$(cross-compiler)-ld -o freq-hard-coded freq-hard-coded.o
