
/mnt/data/D578_satellite_recherche/rapport_final/ELF/D878.elf:	file format elf32-littlearm

Disassembly of section .text:

08004000 <.text>:
 807806c: e92d 4fff    	push.w	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, r10, r11, lr}
 8078070: b091         	sub	sp, #0x44
 8078072: 4681         	mov	r9, r0
 8078074: 4692         	mov	r10, r2
 8078076: 461c         	mov	r4, r3
 8078078: f8d9 0000    	ldr.w	r0, [r9]
 807807c: 6020         	str	r0, [r4]
 807807e: f8d9 0004    	ldr.w	r0, [r9, #0x4]
 8078082: 6060         	str	r0, [r4, #0x4]
 8078084: 2000         	movs	r0, #0x0
 8078086: 7220         	strb	r0, [r4, #0x8]
 8078088: 2219         	movs	r2, #0x19
 807808a: 48fe         	ldr	r0, [pc, #0x3f8]        @ 0x8078484 <.text+0x74484>
 807808c: 9912         	ldr	r1, [sp, #0x48]
 807808e: f024 fec5    	bl	0x809ce1c <.text+0x98e1c> @ imm = #0x24d8a
 8078092: 223c         	movs	r2, #0x3c
 8078094: 4651         	mov	r1, r10
 8078096: 48fc         	ldr	r0, [pc, #0x3f0]        @ 0x8078488 <.text+0x74488>
 8078098: f024 fec0    	bl	0x809ce1c <.text+0x98e1c> @ imm = #0x24d80
 807809c: 2205         	movs	r2, #0x5
 807809e: 2137         	movs	r1, #0x37
 80780a0: 48f9         	ldr	r0, [pc, #0x3e4]        @ 0x8078488 <.text+0x74488>
 80780a2: f7ff fdaf    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x4a2
 80780a6: 9007         	str	r0, [sp, #0x1c]
 80780a8: f028 fd38    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28a70
 80780ac: 4607         	mov	r7, r0
 80780ae: 4af7         	ldr	r2, [pc, #0x3dc]        @ 0x807848c <.text+0x7448c>
 80780b0: 4bf7         	ldr	r3, [pc, #0x3dc]        @ 0x8078490 <.text+0x74490>
 80780b2: f027 ff0f    	bl	0x809fed4 <.text+0x9bed4> @ imm = #0x27e1e
 80780b6: 4605         	mov	r5, r0
 80780b8: f027 feda    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27db4
 80780bc: 4683         	mov	r11, r0
 80780be: 220b         	movs	r2, #0xb
 80780c0: 212c         	movs	r1, #0x2c
 80780c2: 48f1         	ldr	r0, [pc, #0x3c4]        @ 0x8078488 <.text+0x74488>
 80780c4: f7ff fd9e    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x4c4
 80780c8: 2208         	movs	r2, #0x8
 80780ca: 2123         	movs	r1, #0x23
 80780cc: 9010         	str	r0, [sp, #0x40]
 80780ce: 48ee         	ldr	r0, [pc, #0x3b8]        @ 0x8078488 <.text+0x74488>
 80780d0: f7ff fd98    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x4d0
 80780d4: 2208         	movs	r2, #0x8
 80780d6: 211a         	movs	r1, #0x1a
 80780d8: 900f         	str	r0, [sp, #0x3c]
 80780da: 48eb         	ldr	r0, [pc, #0x3ac]        @ 0x8078488 <.text+0x74488>
 80780dc: f7ff fd92    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x4dc
 80780e0: 2207         	movs	r2, #0x7
 80780e2: 2112         	movs	r1, #0x12
 80780e4: 900e         	str	r0, [sp, #0x38]
 80780e6: 48e8         	ldr	r0, [pc, #0x3a0]        @ 0x8078488 <.text+0x74488>
 80780e8: f7ff fd8c    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x4e8
 80780ec: 9007         	str	r0, [sp, #0x1c]
 80780ee: f028 fd15    	bl	0x80a0b1c <.text+0x9cb1c> @ imm = #0x28a2a
 80780f2: 4605         	mov	r5, r0
 80780f4: 4ae7         	ldr	r2, [pc, #0x39c]        @ 0x8078494 <.text+0x74494>
 80780f6: 4be8         	ldr	r3, [pc, #0x3a0]        @ 0x8078498 <.text+0x74498>
 80780f8: f028 fa00    	bl	0x80a04fc <.text+0x9c4fc> @ imm = #0x28400
 80780fc: 4607         	mov	r7, r0
 80780fe: f027 feb7    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27d6e
 8078102: 2208         	movs	r2, #0x8
 8078104: 2109         	movs	r1, #0x9
 8078106: 900d         	str	r0, [sp, #0x34]
 8078108: 48df         	ldr	r0, [pc, #0x37c]        @ 0x8078488 <.text+0x74488>
 807810a: f7ff fd7b    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x50a
 807810e: 2208         	movs	r2, #0x8
 8078110: 2100         	movs	r1, #0x0
 8078112: 900c         	str	r0, [sp, #0x30]
 8078114: 48dc         	ldr	r0, [pc, #0x370]        @ 0x8078488 <.text+0x74488>
 8078116: f7ff fd75    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x516
 807811a: 220a         	movs	r2, #0xa
 807811c: 210f         	movs	r1, #0xf
 807811e: 900b         	str	r0, [sp, #0x2c]
 8078120: 48d8         	ldr	r0, [pc, #0x360]        @ 0x8078484 <.text+0x74484>
 8078122: f7ff fd6f    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x522
 8078126: 220c         	movs	r2, #0xc
 8078128: 2102         	movs	r1, #0x2
 807812a: 900a         	str	r0, [sp, #0x28]
 807812c: 48d5         	ldr	r0, [pc, #0x354]        @ 0x8078484 <.text+0x74484>
 807812e: f7ff fd69    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x52e
 8078132: 2202         	movs	r2, #0x2
 8078134: 2100         	movs	r1, #0x0
 8078136: 9009         	str	r0, [sp, #0x24]
 8078138: 48d2         	ldr	r0, [pc, #0x348]        @ 0x8078484 <.text+0x74484>
 807813a: f7ff fd63    	bl	0x8077c04 <.text+0x73c04> @ imm = #-0x53a
 807813e: 4605         	mov	r5, r0
 8078140: 49d6         	ldr	r1, [pc, #0x358]        @ 0x807849c <.text+0x7449c>
 8078142: f028 fd17    	bl	0x80a0b74 <.text+0x9cb74> @ imm = #0x28a2e
 8078146: f104 0114    	add.w	r1, r4, #0x14
 807814a: 2200         	movs	r2, #0x0
 807814c: 9008         	str	r0, [sp, #0x20]
 807814e: 9810         	ldr	r0, [sp, #0x40]
 8078150: e9cd b205    	strd	r11, r2, [sp, #20]
 8078154: 9107         	str	r1, [sp, #0x1c]
 8078156: 9004         	str	r0, [sp, #0x10]
 8078158: e9dd 130c    	ldrd	r1, r3, [sp, #48]
 807815c: e9dd 020e    	ldrd	r0, r2, [sp, #56]
 8078160: e9cd 1300    	strd	r1, r3, [sp]
 8078164: e9cd 0202    	strd	r0, r2, [sp, #8]
 8078168: a808         	add	r0, sp, #0x20
 807816a: c80f         	ldm	r0, {r0, r1, r2, r3}
 807816c: f7ff fdac    	bl	0x8077cc8 <.text+0x73cc8> @ imm = #-0x4a8
 8078170: b015         	add	sp, #0x54
 8078172: e8bd 8ff0    	pop.w	{r4, r5, r6, r7, r8, r9, r10, r11, pc}
