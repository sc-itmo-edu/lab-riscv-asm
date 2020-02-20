.PHONY: clean

dump_name=example.dump
executable_name=example.elf

default: $(dump_name) $(executable_name)

%.elf : %.c
	@riscv64-unknown-elf-gcc -march=rv32i -mabi=ilp32 $< -o $@

%.dump: %.elf
	@riscv64-unknown-elf-objdump -D $< > $@

clean:
	@rm -f $(dump_name)
	@rm -f $(executable_name)
