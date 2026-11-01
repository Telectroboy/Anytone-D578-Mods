
/mnt/data/D578_satellite_recherche/rapport_final/ELF/D878.elf:	file format elf32-littlearm

Disassembly of section .text:

08004000 <.text>:
 8077cc8: e92d 4fff    	push.w	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
 8077ccc: b091         	sub	sp, #0x44
 8077cce: 460d         	mov	r5, r1
 8077cd0: 4616         	mov	r6, r2
 8077cd2: 461f         	mov	r7, r3
 8077cd4: 9c25         	ldr	r4, [sp, #0x94]
 8077cd6: 981e         	ldr	r0, [sp, #0x78]
 8077cd8: f028 ff20    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28e40
 8077cdc: 4ad1         	ldr	r2, [pc, #0x344]        @ 0x8078024 <.text+0x74024>
 8077cde: 4bd2         	ldr	r3, [pc, #0x348]        @ 0x8078028 <.text+0x74028>
 8077ce0: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077ce4: f028 fc0a    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28814
 8077ce8: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077cec: f028 f8c0    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28180
 8077cf0: 6120         	str	r0, [r4, #0x10]
 8077cf2: 981f         	ldr	r0, [sp, #0x7c]
 8077cf4: 6160         	str	r0, [r4, #0x14]
 8077cf6: 9820         	ldr	r0, [sp, #0x80]
 8077cf8: f028 ff10    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28e20
 8077cfc: 4ac9         	ldr	r2, [pc, #0x324]        @ 0x8078024 <.text+0x74024>
 8077cfe: 4bca         	ldr	r3, [pc, #0x328]        @ 0x8078028 <.text+0x74028>
 8077d00: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077d04: f028 fbfa    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x287f4
 8077d08: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077d0c: f028 f8b0    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28160
 8077d10: 61a0         	str	r0, [r4, #0x18]
 8077d12: 9821         	ldr	r0, [sp, #0x84]
 8077d14: f028 ff02    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28e04
 8077d18: 4ac2         	ldr	r2, [pc, #0x308]        @ 0x8078024 <.text+0x74024>
 8077d1a: 4bc3         	ldr	r3, [pc, #0x30c]        @ 0x8078028 <.text+0x74028>
 8077d1c: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077d20: f028 fbec    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x287d8
 8077d24: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077d28: f028 f8a2    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28144
 8077d2c: 61e0         	str	r0, [r4, #0x1c]
 8077d2e: 9822         	ldr	r0, [sp, #0x88]
 8077d30: f028 fef4    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28de8
 8077d34: 2200         	movs	r2, #0x0
 8077d36: f04f 4380    	mov.w	r3, #0x40000000
 8077d3a: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077d3e: f028 fbdd    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x287ba
 8077d42: 4aba         	ldr	r2, [pc, #0x2e8]        @ 0x807802c <.text+0x7402c>
 8077d44: 4bba         	ldr	r3, [pc, #0x2e8]        @ 0x8078030 <.text+0x74030>
 8077d46: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077d4a: f028 fbd7    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x287ae
 8077d4e: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077d52: f028 f88d    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x2811a
 8077d56: 6220         	str	r0, [r4, #0x20]
 8077d58: 6a20         	ldr	r0, [r4, #0x20]
 8077d5a: f028 fedf    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28dbe
 8077d5e: 2200         	movs	r2, #0x0
 8077d60: 4bb4         	ldr	r3, [pc, #0x2d0]        @ 0x8078034 <.text+0x74034>
 8077d62: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077d66: f028 f971    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x282e2
 8077d6a: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077d6e: f028 f87f    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x280fe
 8077d72: 6260         	str	r0, [r4, #0x24]
 8077d74: 6a60         	ldr	r0, [r4, #0x24]
 8077d76: f028 fed1    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28da2
 8077d7a: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077d7e: 6a60         	ldr	r0, [r4, #0x24]
 8077d80: f028 fecc    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28d98
 8077d84: 4602         	mov	r2, r0
 8077d86: 460b         	mov	r3, r1
 8077d88: e9cd 0106    	strd	r0, r1, [sp, #24]
 8077d8c: 2000         	movs	r0, #0x0
 8077d8e: 49aa         	ldr	r1, [pc, #0x2a8]        @ 0x8078038 <.text+0x74038>
 8077d90: f028 f95c    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x282b8
 8077d94: e9cd 0108    	strd	r0, r1, [sp, #32]
 8077d98: e9dd 230a    	ldrd	r2, r3, [sp, #40]
 8077d9c: f028 f956    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x282ac
 8077da0: f04f 3255    	mov.w	r2, #0x55555555
 8077da4: 4ba5         	ldr	r3, [pc, #0x294]        @ 0x807803c <.text+0x7403c>
 8077da6: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077daa: f027 fad3    	bl	0x809f354 <.text+0x9b354> @ imm = #0x275a6
 8077dae: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077db2: f028 f85d    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x280ba
 8077db6: 62a0         	str	r0, [r4, #0x28]
 8077db8: 4630         	mov	r0, r6
 8077dba: f028 feaf    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28d5e
 8077dbe: 2200         	movs	r2, #0x0
 8077dc0: f04f 4380    	mov.w	r3, #0x40000000
 8077dc4: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077dc8: f028 fb98    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28730
 8077dcc: 4a97         	ldr	r2, [pc, #0x25c]        @ 0x807802c <.text+0x7402c>
 8077dce: 4b98         	ldr	r3, [pc, #0x260]        @ 0x8078030 <.text+0x74030>
 8077dd0: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077dd4: f028 fb92    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28724
 8077dd8: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077ddc: f028 f848    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28090
 8077de0: 6320         	str	r0, [r4, #0x30]
 8077de2: 9823         	ldr	r0, [sp, #0x8c]
 8077de4: f028 fff6    	bl	0x80a0dd4 <.text+0x9cdd4> @ imm = #0x28fec
 8077de8: 6360         	str	r0, [r4, #0x34]
 8077dea: 4628         	mov	r0, r5
 8077dec: f028 fff2    	bl	0x80a0dd4 <.text+0x9cdd4> @ imm = #0x28fe4
 8077df0: 4682         	mov	r10, r0
 8077df2: 4650         	mov	r0, r10
 8077df4: f029 f82a    	bl	0x80a0e4c <.text+0x9ce4c> @ imm = #0x29054
 8077df8: 4683         	mov	r11, r0
 8077dfa: 4629         	mov	r1, r5
 8077dfc: f029 f983    	bl	0x80a1106 <.text+0x9d106> @ imm = #0x29306
 8077e00: 6060         	str	r0, [r4, #0x4]
 8077e02: 9811         	ldr	r0, [sp, #0x44]
 8077e04: f028 ffe6    	bl	0x80a0dd4 <.text+0x9cdd4> @ imm = #0x28fcc
 8077e08: 2200         	movs	r2, #0x0
 8077e0a: 2101         	movs	r1, #0x1
 8077e0c: 900f         	str	r0, [sp, #0x3c]
 8077e0e: f7ff ff34    	bl	0x8077c7a <.text+0x73c7a> @ imm = #-0x198
 8077e12: eb00 0b0a    	add.w	r11, r0, r10
 8077e16: 4658         	mov	r0, r11
 8077e18: f029 f830    	bl	0x80a0e7c <.text+0x9ce7c> @ imm = #0x29060
 8077e1c: 6020         	str	r0, [r4]
 8077e1e: 4638         	mov	r0, r7
 8077e20: f028 fe7c    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28cf8
 8077e24: 4a7f         	ldr	r2, [pc, #0x1fc]        @ 0x8078024 <.text+0x74024>
 8077e26: 4b80         	ldr	r3, [pc, #0x200]        @ 0x8078028 <.text+0x74028>
 8077e28: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077e2c: f028 fb66    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x286cc
 8077e30: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077e34: f028 f81c    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28038
 8077e38: 9010         	str	r0, [sp, #0x40]
 8077e3a: 9810         	ldr	r0, [sp, #0x40]
 8077e3c: f028 fe6e    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28cdc
 8077e40: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077e44: f027 ff72    	bl	0x809fd2c <.text+0x9bd2c> @ imm = #0x27ee4
 8077e48: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077e4c: f028 f810    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28020
 8077e50: 60a0         	str	r0, [r4, #0x8]
 8077e52: 9810         	ldr	r0, [sp, #0x40]
 8077e54: f028 fe62    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28cc4
 8077e58: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077e5c: f027 f9c6    	bl	0x809f1ec <.text+0x9b1ec> @ imm = #0x2738c
 8077e60: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077e64: f028 f804    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x28008
 8077e68: 60e0         	str	r0, [r4, #0xc]
 8077e6a: 6961         	ldr	r1, [r4, #0x14]
 8077e6c: 4608         	mov	r0, r1
 8077e6e: f029 f84d    	bl	0x80a0f0c <.text+0x9cf0c> @ imm = #0x2909a
 8077e72: 4683         	mov	r11, r0
 8077e74: f028 fe52    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28ca4
 8077e78: 2200         	movs	r2, #0x0
 8077e7a: 4b71         	ldr	r3, [pc, #0x1c4]        @ 0x8078040 <.text+0x74040>
 8077e7c: e9cd 0106    	strd	r0, r1, [sp, #24]
 8077e80: f028 fc70    	bl	0x80a0764 <.text+0x9c764> @ imm = #0x288e0
 8077e84: e9cd 0108    	strd	r0, r1, [sp, #32]
 8077e88: f027 ffa0    	bl	0x809fdcc <.text+0x9bdcc> @ imm = #0x27f40
 8077e8c: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077e90: 6aa0         	ldr	r0, [r4, #0x28]
 8077e92: f028 fe43    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28c86
 8077e96: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077e9a: e9dd 230c    	ldrd	r2, r3, [sp, #48]
 8077e9e: f028 fb2d    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x2865a
 8077ea2: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077ea6: f027 ffe3    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27fc6
 8077eaa: 62e0         	str	r0, [r4, #0x2c]
 8077eac: 6ae1         	ldr	r1, [r4, #0x2c]
 8077eae: 4608         	mov	r0, r1
 8077eb0: f029 f82c    	bl	0x80a0f0c <.text+0x9cf0c> @ imm = #0x29058
 8077eb4: 4683         	mov	r11, r0
 8077eb6: 4863         	ldr	r0, [pc, #0x18c]        @ 0x8078044 <.text+0x74044>
 8077eb8: 6aa1         	ldr	r1, [r4, #0x28]
 8077eba: f029 f827    	bl	0x80a0f0c <.text+0x9cf0c> @ imm = #0x2904e
 8077ebe: 4659         	mov	r1, r11
 8077ec0: 900f         	str	r0, [sp, #0x3c]
 8077ec2: f028 fec5    	bl	0x80a0c50 <.text+0x9cc50> @ imm = #0x28d8a
 8077ec6: 4681         	mov	r9, r0
 8077ec8: 6a20         	ldr	r0, [r4, #0x20]
 8077eca: f028 fe27    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28c4e
 8077ece: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077ed2: 4648         	mov	r0, r9
 8077ed4: f028 fe22    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28c44
 8077ed8: e9cd 0108    	strd	r0, r1, [sp, #32]
 8077edc: 4648         	mov	r0, r9
 8077ede: f028 fe1d    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28c3a
 8077ee2: 4a59         	ldr	r2, [pc, #0x164]        @ 0x8078048 <.text+0x74048>
 8077ee4: 4b59         	ldr	r3, [pc, #0x164]        @ 0x807804c <.text+0x7404c>
 8077ee6: e9cd 0104    	strd	r0, r1, [sp, #16]
 8077eea: f028 fb07    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x2860e
 8077eee: e9cd 0106    	strd	r0, r1, [sp, #24]
 8077ef2: e9dd 2308    	ldrd	r2, r3, [sp, #32]
 8077ef6: f028 fb01    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28602
 8077efa: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077efe: e9dd 230c    	ldrd	r2, r3, [sp, #48]
 8077f02: f028 fafb    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x285f6
 8077f06: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077f0a: f027 ffb1    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27f62
 8077f0e: 4681         	mov	r9, r0
 8077f10: f089 4b00    	eor	r11, r9, #0x80000000
 8077f14: 4658         	mov	r0, r11
 8077f16: 68e1         	ldr	r1, [r4, #0xc]
 8077f18: f028 fff8    	bl	0x80a0f0c <.text+0x9cf0c> @ imm = #0x28ff0
 8077f1c: 63e0         	str	r0, [r4, #0x3c]
 8077f1e: 68e0         	ldr	r0, [r4, #0xc]
 8077f20: f028 fdfc    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28bf8
 8077f24: e9cd 0104    	strd	r0, r1, [sp, #16]
 8077f28: 68e0         	ldr	r0, [r4, #0xc]
 8077f2a: f028 fdf7    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28bee
 8077f2e: 2200         	movs	r2, #0x0
 8077f30: 4b47         	ldr	r3, [pc, #0x11c]        @ 0x8078050 <.text+0x74050>
 8077f32: e9cd 0100    	strd	r0, r1, [sp]
 8077f36: f028 fae1    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x285c2
 8077f3a: e9cd 0102    	strd	r0, r1, [sp, #8]
 8077f3e: e9dd 2304    	ldrd	r2, r3, [sp, #16]
 8077f42: f028 fadb    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x285b6
 8077f46: 2200         	movs	r2, #0x0
 8077f48: 4b3d         	ldr	r3, [pc, #0xf4]         @ 0x8078040 <.text+0x74040>
 8077f4a: e9cd 0106    	strd	r0, r1, [sp, #24]
 8077f4e: f028 fcfb    	bl	0x80a0948 <.text+0x9c948> @ imm = #0x289f6
 8077f52: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077f56: 4648         	mov	r0, r9
 8077f58: f028 fde0    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28bc0
 8077f5c: e9cd 0108    	strd	r0, r1, [sp, #32]
 8077f60: e9dd 230a    	ldrd	r2, r3, [sp, #40]
 8077f64: f028 faca    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28594
 8077f68: 2200         	movs	r2, #0x0
 8077f6a: f04f 4380    	mov.w	r3, #0x40000000
 8077f6e: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077f72: f028 f86b    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x280d6
 8077f76: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077f7a: f027 ff79    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27ef2
 8077f7e: 6420         	str	r0, [r4, #0x40]
 8077f80: 6a20         	ldr	r0, [r4, #0x20]
 8077f82: f028 fdcb    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28b96
 8077f86: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077f8a: 6b20         	ldr	r0, [r4, #0x30]
 8077f8c: f028 fdc6    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28b8c
 8077f90: 2200         	movs	r2, #0x0
 8077f92: f04f 4340    	mov.w	r3, #0xc0000000
 8077f96: e9cd 0106    	strd	r0, r1, [sp, #24]
 8077f9a: f028 faaf    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x2855e
 8077f9e: e9cd 0108    	strd	r0, r1, [sp, #32]
 8077fa2: e9dd 230a    	ldrd	r2, r3, [sp, #40]
 8077fa6: f028 f851    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x280a2
 8077faa: 2200         	movs	r2, #0x0
 8077fac: 4b29         	ldr	r3, [pc, #0xa4]         @ 0x8078054 <.text+0x74054>
 8077fae: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077fb2: f028 f84b    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x28096
 8077fb6: e9cd 010e    	strd	r0, r1, [sp, #56]
 8077fba: f027 ff59    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27eb2
 8077fbe: 6460         	str	r0, [r4, #0x44]
 8077fc0: 2200         	movs	r2, #0x0
 8077fc2: 2101         	movs	r1, #0x1
 8077fc4: f240 70da    	movw	r0, #0x7da
 8077fc8: f7ff fe57    	bl	0x8077c7a <.text+0x73c7a> @ imm = #-0x352
 8077fcc: 900e         	str	r0, [sp, #0x38]
 8077fce: f028 ff55    	bl	0x80a0e7c <.text+0x9ce7c> @ imm = #0x28eaa
 8077fd2: 900f         	str	r0, [sp, #0x3c]
 8077fd4: 6821         	ldr	r1, [r4]
 8077fd6: f029 f896    	bl	0x80a1106 <.text+0x9d106> @ imm = #0x2912c
 8077fda: 4683         	mov	r11, r0
 8077fdc: 6861         	ldr	r1, [r4, #0x4]
 8077fde: f028 fdc9    	bl	0x80a0b74 <.text+0x9cb74> @ imm = #0x28b92
 8077fe2: 4680         	mov	r8, r0
 8077fe4: 4640         	mov	r0, r8
 8077fe6: f028 fd99    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28b32
 8077fea: 4a1b         	ldr	r2, [pc, #0x6c]         @ 0x8078058 <.text+0x74058>
 8077fec: 4b1b         	ldr	r3, [pc, #0x6c]         @ 0x807805c <.text+0x7405c>
 8077fee: e9cd 010a    	strd	r0, r1, [sp, #40]
 8077ff2: f028 fa83    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28506
 8077ff6: 4a1a         	ldr	r2, [pc, #0x68]         @ 0x8078060 <.text+0x74060>
 8077ff8: 4b1a         	ldr	r3, [pc, #0x68]         @ 0x8078064 <.text+0x74064>
 8077ffa: e9cd 010c    	strd	r0, r1, [sp, #48]
 8077ffe: f027 ff69    	bl	0x809fed4 <.text+0x9bed4> @ imm = #0x27ed2
 8078002: e9cd 010e    	strd	r0, r1, [sp, #56]
 8078006: f027 ff33    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27e66
 807800a: 64a0         	str	r0, [r4, #0x48]
 807800c: b015         	add	sp, #0x54
 807800e: e02b         	b	0x8078068 <.text+0x74068> @ imm = #0x56
 8078010: d00c         	beq	0x807802c <.text+0x7402c> @ imm = #0x18
 8078012: 2000         	movs	r0, #0x0
 8078014: 0fdc         	lsrs	r4, r3, #0x1f
 8078016: 2000         	movs	r0, #0x0
 8078018: a000         	adr	r0, #0 <.text+0x7401c>
 807801a: 43b6         	bics	r6, r6
 807801c: 999a         	ldr	r1, [sp, #0x268]
 807801e: 9999         	ldr	r1, [sp, #0x264]
 8078020: 9999         	ldr	r1, [sp, #0x264]
 8078022: 403e         	ands	r6, r7
 8078024: 9d39         	ldr	r5, [sp, #0xe4]
 8078026: a252         	adr	r2, #328 <.text+0x7407c>
 8078028: df46         	svc	#0x46
 807802a: 3f91         	subs	r7, #0x91
 807802c: 2d18         	cmp	r5, #0x18
 807802e: 5444         	strb	r4, [r0, r1]
 8078030: 21fb         	movs	r1, #0xfb
 8078032: 4009         	ands	r1, r1
 8078034: 1800         	adds	r0, r0, r0
 8078036: 40f5         	lsrs	r5, r6
 8078038: 5420         	strb	r0, [r4, r0]
 807803a: 4118         	asrs	r0, r3
 807803c: 5555         	strb	r5, [r2, r5]
 807803e: 3fd5         	subs	r7, #0xd5
 8078040: 0000         	movs	r0, r0
 8078042: 3ff0         	subs	r7, #0xf0
 8078044: 5119         	str	r1, [r3, r4]
 8078046: 45c7         	cmp	pc, r8
 8078048: 98b8         	ldr	r0, [sp, #0x2e0]
 807804a: aa97         	add	r2, sp, #0x25c
 807804c: 9b51         	ldr	r3, [sp, #0x144]
 807804e: 3f5a         	subs	r7, #0x5a
 8078050: 0000         	movs	r0, r0
 8078052: 4014         	ands	r4, r2
 8078054: 0000         	movs	r0, r0
 8078056: 4008         	ands	r0, r1
 8078058: 2ae3         	cmp	r2, #0xe3
 807805a: f00d 3398    	and	r3, sp, #0x98989898
 807805e: 4019         	ands	r1, r3
 8078060: b653         	<unknown>
 8078062: 9e21         	ldr	r6, [sp, #0x84]
 8078064: cd41         	ldm	r5!, {r0, r6}
 8078066: 3ffb         	subs	r7, #0xfb
 8078068: e8bd 8ff0    	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
