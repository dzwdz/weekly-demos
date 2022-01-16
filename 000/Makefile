%.com: %.o
	ld -o $@ --oformat binary -Ttext 0x100 $<

%.o: %.s
	as -o $@ $<

