
/mnt/data/D578_satellite_recherche/rapport_final/ELF/D878.elf:	file format elf32-littlearm

Disassembly of section .text:

08004000 <.text>:
 8078620: b50f         	push	{r0, r1, r2, r3, lr}
 8078622: b09d         	sub	sp, #0x74
 8078624: a912         	add	r1, sp, #0x48
 8078626: a81e         	add	r0, sp, #0x78
 8078628: f001 fa20    	bl	0x8079a6c <.text+0x75a6c> @ imm = #0x1440
 807862c: 9815         	ldr	r0, [sp, #0x54]
 807862e: 9011         	str	r0, [sp, #0x44]
 8078630: 9816         	ldr	r0, [sp, #0x58]
 8078632: 1c40         	adds	r0, r0, #0x1
 8078634: 9010         	str	r0, [sp, #0x40]
 8078636: 9817         	ldr	r0, [sp, #0x5c]
 8078638: f200 706c    	addw	r0, r0, #0x76c
 807863c: 900f         	str	r0, [sp, #0x3c]
 807863e: e9dd 1210    	ldrd	r1, r2, [sp, #64]
 8078642: f7ff fb1a    	bl	0x8077c7a <.text+0x73c7a> @ imm = #-0x9cc
 8078646: 49ae         	ldr	r1, [pc, #0x2b8]        @ 0x8078900 <.text+0x74900>
 8078648: 6008         	str	r0, [r1]
 807864a: 9812         	ldr	r0, [sp, #0x48]
 807864c: 9000         	str	r0, [sp]
 807864e: f028 fbfd    	bl	0x80a0e4c <.text+0x9ce4c> @ imm = #0x287fa
 8078652: 9001         	str	r0, [sp, #0x4]
 8078654: f028 fa62    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x284c4
 8078658: 2200         	movs	r2, #0x0
 807865a: 4baa         	ldr	r3, [pc, #0x2a8]        @ 0x8078904 <.text+0x74904>
 807865c: e9cd 0102    	strd	r0, r1, [sp, #8]
 8078660: f027 fcf4    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x279e8
 8078664: e9cd 0106    	strd	r0, r1, [sp, #24]
 8078668: 9813         	ldr	r0, [sp, #0x4c]
 807866a: 9002         	str	r0, [sp, #0x8]
 807866c: f028 fbee    	bl	0x80a0e4c <.text+0x9ce4c> @ imm = #0x287dc
 8078670: 9003         	str	r0, [sp, #0xc]
 8078672: f028 fa53    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x284a6
 8078676: e9cd 0104    	strd	r0, r1, [sp, #16]
 807867a: e9dd 2306    	ldrd	r2, r3, [sp, #24]
 807867e: f027 fc29    	bl	0x809fed4 <.text+0x9bed4> @ imm = #0x27852
 8078682: 2200         	movs	r2, #0x0
 8078684: 4b9f         	ldr	r3, [pc, #0x27c]        @ 0x8078904 <.text+0x74904>
 8078686: e9cd 0108    	strd	r0, r1, [sp, #32]
 807868a: f027 fcdf    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x279be
 807868e: e9cd 010c    	strd	r0, r1, [sp, #48]
 8078692: 9814         	ldr	r0, [sp, #0x50]
 8078694: 9008         	str	r0, [sp, #0x20]
 8078696: f028 fbd9    	bl	0x80a0e4c <.text+0x9ce4c> @ imm = #0x287b2
 807869a: 9009         	str	r0, [sp, #0x24]
 807869c: f028 fa3e    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x2847c
 80786a0: e9cd 010a    	strd	r0, r1, [sp, #40]
 80786a4: e9dd 230c    	ldrd	r2, r3, [sp, #48]
 80786a8: f027 fc14    	bl	0x809fed4 <.text+0x9bed4> @ imm = #0x27828
 80786ac: 2200         	movs	r2, #0x0
 80786ae: 4b96         	ldr	r3, [pc, #0x258]        @ 0x8078908 <.text+0x74908>
 80786b0: e9cd 010e    	strd	r0, r1, [sp, #56]
 80786b4: f027 fcca    	bl	0x80a004c <.text+0x9c04c> @ imm = #0x27994
 80786b8: e9cd 0110    	strd	r0, r1, [sp, #64]
 80786bc: f027 fbd8    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x277b0
 80786c0: 4992         	ldr	r1, [pc, #0x248]        @ 0x807890c <.text+0x7490c>
 80786c2: 6008         	str	r0, [r1]
 80786c4: 981d         	ldr	r0, [sp, #0x74]
 80786c6: 6980         	ldr	r0, [r0, #0x18]
 80786c8: 4601         	mov	r1, r0
 80786ca: 900f         	str	r0, [sp, #0x3c]
 80786cc: 488f         	ldr	r0, [pc, #0x23c]        @ 0x807890c <.text+0x7490c>
 80786ce: 6800         	ldr	r0, [r0]
 80786d0: f028 fd24    	bl	0x80a111c <.text+0x9d11c> @ imm = #0x28a48
 80786d4: 9011         	str	r0, [sp, #0x44]
 80786d6: 488a         	ldr	r0, [pc, #0x228]        @ 0x8078900 <.text+0x74900>
 80786d8: 6800         	ldr	r0, [r0]
 80786da: f028 fbcf    	bl	0x80a0e7c <.text+0x9ce7c> @ imm = #0x2879e
 80786de: 900f         	str	r0, [sp, #0x3c]
 80786e0: 981d         	ldr	r0, [sp, #0x74]
 80786e2: 6940         	ldr	r0, [r0, #0x14]
 80786e4: 4601         	mov	r1, r0
 80786e6: 900e         	str	r0, [sp, #0x38]
 80786e8: 980f         	ldr	r0, [sp, #0x3c]
 80786ea: f028 fd17    	bl	0x80a111c <.text+0x9d11c> @ imm = #0x28a2e
 80786ee: 9010         	str	r0, [sp, #0x40]
 80786f0: 9911         	ldr	r1, [sp, #0x44]
 80786f2: f028 fa3f    	bl	0x80a0b74 <.text+0x9cb74> @ imm = #0x2847e
 80786f6: 4986         	ldr	r1, [pc, #0x218]        @ 0x8078910 <.text+0x74910>
 80786f8: 6008         	str	r0, [r1]
 80786fa: 981d         	ldr	r0, [sp, #0x74]
 80786fc: 6d80         	ldr	r0, [r0, #0x58]
 80786fe: 900c         	str	r0, [sp, #0x30]
