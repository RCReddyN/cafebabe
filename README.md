<h1>cafebabe</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://github.com/RCReddyN/cafebabe/blob/master/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
  </a>
</p>

- The tiniest OS, or you can call it a make-believe OS.
- It writes a number (for namesake, consider 0xCAFEBABE) to eax register.

loader.s:
- Written is assembly code.
- There is no reason for the number 0xCAFEBABE to be in eax if OS didn't put it there.
- If it is, it means OS put it there.

```
nasm -f elf32 loader.s
```

link.ld:
- The code must be linked to produce an exec file.
- The address less than 1MB is used by GRUB, BIOS, and I/O.
- GRUB needs to load the kernel at an address higher than or equal to 1MB(0x00100000).
- This is also written in assembly.

```
ld -T link.ld -melf_i386 loader.o -o kernel.elf
```

run kernel:

I write code on WSL-Ubuntu, qemu doesn't work as gui is not available. You can either add options --nographic or --curses to startup qemu.

```
qemu-system-i386 -monitor stdio -kernel kernel.elf --curses
```

To check if it served its purpose, press alt + 2 to enter qemu monitor.
```
(qemu) info registers
```

You should see that EAX is loaded with the number 0xCAFEBABE.

## Author

👤 **Ravi Chandra N Reddy**
* Website: rcreddyn.github.io
* LinkedIn: [@rcreddyn](https://linkedin.com/in/rcreddyn)
