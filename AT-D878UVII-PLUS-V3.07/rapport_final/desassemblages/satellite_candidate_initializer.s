
/mnt/data/D578_satellite_recherche/rapport_final/ELF/D878.elf:	file format elf32-littlearm

Disassembly of section .text:

08004000 <.text>:
 807a7a8: b510         	push	{r4, lr}
 807a7aa: 2001         	movs	r0, #0x1
 807a7ac: 4942         	ldr	r1, [pc, #0x108]        @ 0x807a8b8 <.text+0x768b8>
 807a7ae: 7008         	strb	r0, [r1]
 807a7b0: 2000         	movs	r0, #0x0
 807a7b2: 4942         	ldr	r1, [pc, #0x108]        @ 0x807a8bc <.text+0x768bc>
 807a7b4: 6008         	str	r0, [r1]
 807a7b6: 4942         	ldr	r1, [pc, #0x108]        @ 0x807a8c0 <.text+0x768c0>
 807a7b8: 7708         	strb	r0, [r1, #0x1c]
 807a7ba: 4842         	ldr	r0, [pc, #0x108]        @ 0x807a8c4 <.text+0x768c4>
 807a7bc: 4942         	ldr	r1, [pc, #0x108]        @ 0x807a8c8 <.text+0x768c8>
 807a7be: 6008         	str	r0, [r1]
 807a7c0: 2000         	movs	r0, #0x0
 807a7c2: f7ff fa36    	bl	0x8079c32 <.text+0x75c32> @ imm = #-0xb94
 807a7c6: 2000         	movs	r0, #0x0
 807a7c8: 4940         	ldr	r1, [pc, #0x100]        @ 0x807a8cc <.text+0x768cc>
 807a7ca: 7008         	strb	r0, [r1]
 807a7cc: 4840         	ldr	r0, [pc, #0x100]        @ 0x807a8d0 <.text+0x768d0>
 807a7ce: 7940         	ldrb	r0, [r0, #0x5]
 807a7d0: 4940         	ldr	r1, [pc, #0x100]        @ 0x807a8d4 <.text+0x768d4>
 807a7d2: f851 0030    	ldr.w	r0, [r1, r0, lsl #3]
 807a7d6: 4940         	ldr	r1, [pc, #0x100]        @ 0x807a8d8 <.text+0x768d8>
 807a7d8: 6008         	str	r0, [r1]
 807a7da: 201b         	movs	r0, #0x1b
 807a7dc: f795 fc84    	bl	0x80100e8 <.text+0xc0e8> @ imm = #-0x6a6f8
 807a7e0: f7ff f93e    	bl	0x8079a60 <.text+0x75a60> @ imm = #-0xd84
 807a7e4: 493d         	ldr	r1, [pc, #0xf4]         @ 0x807a8dc <.text+0x768dc>
 807a7e6: 6008         	str	r0, [r1]
 807a7e8: 2000         	movs	r0, #0x0
 807a7ea: 493d         	ldr	r1, [pc, #0xf4]         @ 0x807a8e0 <.text+0x768e0>
 807a7ec: 6008         	str	r0, [r1]
 807a7ee: e03b         	b	0x807a868 <.text+0x76868> @ imm = #0x76
 807a7f0: bf00         	nop
 807a7f2: 4832         	ldr	r0, [pc, #0xc8]         @ 0x807a8bc <.text+0x768bc>
 807a7f4: 6800         	ldr	r0, [r0]
 807a7f6: f7ff fc3d    	bl	0x807a074 <.text+0x76074> @ imm = #-0x786
 807a7fa: 2800         	cmp	r0, #0x0
 807a7fc: d0f9         	beq	0x807a7f2 <.text+0x767f2> @ imm = #-0xe
 807a7fe: 482f         	ldr	r0, [pc, #0xbc]         @ 0x807a8bc <.text+0x768bc>
 807a800: 6800         	ldr	r0, [r0]
 807a802: eb00 0140    	add.w	r1, r0, r0, lsl #1
 807a806: ebc1 1040    	rsb	r0, r1, r0, lsl #5
 807a80a: 492e         	ldr	r1, [pc, #0xb8]         @ 0x807a8c4 <.text+0x768c4>
 807a80c: eb01 1000    	add.w	r0, r1, r0, lsl #4
 807a810: 4934         	ldr	r1, [pc, #0xd0]         @ 0x807a8e4 <.text+0x768e4>
 807a812: 6008         	str	r0, [r1]
 807a814: 4608         	mov	r0, r1
 807a816: 6800         	ldr	r0, [r0]
 807a818: f8d0 0094    	ldr.w	r0, [r0, #0x94]
 807a81c: eb00 0180    	add.w	r1, r0, r0, lsl #2
 807a820: 4830         	ldr	r0, [pc, #0xc0]         @ 0x807a8e4 <.text+0x768e4>
 807a822: 6800         	ldr	r0, [r0]
 807a824: 309c         	adds	r0, #0x9c
 807a826: eb00 0081    	add.w	r0, r0, r1, lsl #2
 807a82a: 7c00         	ldrb	r0, [r0, #0x10]
 807a82c: 2802         	cmp	r0, #0x2
 807a82e: d005         	beq	0x807a83c <.text+0x7683c> @ imm = #0xa
 807a830: 482c         	ldr	r0, [pc, #0xb0]         @ 0x807a8e4 <.text+0x768e4>
 807a832: 6800         	ldr	r0, [r0]
 807a834: f8d0 0094    	ldr.w	r0, [r0, #0x94]
 807a838: 280d         	cmp	r0, #0xd
 807a83a: d315         	blo	0x807a868 <.text+0x76868> @ imm = #0x2a
 807a83c: 481f         	ldr	r0, [pc, #0x7c]         @ 0x807a8bc <.text+0x768bc>
 807a83e: 6800         	ldr	r0, [r0]
 807a840: 1c40         	adds	r0, r0, #0x1
 807a842: 491e         	ldr	r1, [pc, #0x78]         @ 0x807a8bc <.text+0x768bc>
 807a844: 6008         	str	r0, [r1]
 807a846: 4826         	ldr	r0, [pc, #0x98]         @ 0x807a8e0 <.text+0x768e0>
 807a848: 6800         	ldr	r0, [r0]
 807a84a: 1c40         	adds	r0, r0, #0x1
 807a84c: 4924         	ldr	r1, [pc, #0x90]         @ 0x807a8e0 <.text+0x768e0>
 807a84e: 6008         	str	r0, [r1]
 807a850: 481e         	ldr	r0, [pc, #0x78]         @ 0x807a8cc <.text+0x768cc>
 807a852: 7800         	ldrb	r0, [r0]
 807a854: 1c40         	adds	r0, r0, #0x1
 807a856: 491d         	ldr	r1, [pc, #0x74]         @ 0x807a8cc <.text+0x768cc>
 807a858: 7008         	strb	r0, [r1]
 807a85a: f04f 5000    	mov.w	r0, #0x20000000
 807a85e: f7c9 ff0d    	bl	0x804467c <.text+0x4067c> @ imm = #-0x361e6
 807a862: 2014         	movs	r0, #0x14
 807a864: f78d fae0    	bl	0x8007e28 <.text+0x3e28> @ imm = #-0x72a40
 807a868: 481d         	ldr	r0, [pc, #0x74]         @ 0x807a8e0 <.text+0x768e0>
 807a86a: 6800         	ldr	r0, [r0]
 807a86c: 491e         	ldr	r1, [pc, #0x78]         @ 0x807a8e8 <.text+0x768e8>
 807a86e: 6809         	ldr	r1, [r1]
 807a870: 4288         	cmp	r0, r1
 807a872: d3bd         	blo	0x807a7f0 <.text+0x767f0> @ imm = #-0x86
 807a874: 4816         	ldr	r0, [pc, #0x58]         @ 0x807a8d0 <.text+0x768d0>
 807a876: f890 0037    	ldrb.w	r0, [r0, #0x37]
 807a87a: 491c         	ldr	r1, [pc, #0x70]         @ 0x807a8ec <.text+0x768ec>
 807a87c: f831 0010    	ldrh.w	r0, [r1, r0, lsl #1]
 807a880: 491b         	ldr	r1, [pc, #0x6c]         @ 0x807a8f0 <.text+0x768f0>
 807a882: 8008         	strh	r0, [r1]
 807a884: 4816         	ldr	r0, [pc, #0x58]         @ 0x807a8e0 <.text+0x768e0>
 807a886: 6800         	ldr	r0, [r0]
 807a888: 4917         	ldr	r1, [pc, #0x5c]         @ 0x807a8e8 <.text+0x768e8>
 807a88a: 6809         	ldr	r1, [r1]
 807a88c: 4288         	cmp	r0, r1
 807a88e: d30a         	blo	0x807a8a6 <.text+0x768a6> @ imm = #0x14
 807a890: 2019         	movs	r0, #0x19
 807a892: 490e         	ldr	r1, [pc, #0x38]         @ 0x807a8cc <.text+0x768cc>
 807a894: 7008         	strb	r0, [r1]
 807a896: 0740         	lsls	r0, r0, #0x1d
 807a898: f7c9 fef0    	bl	0x804467c <.text+0x4067c> @ imm = #-0x36220
 807a89c: 2014         	movs	r0, #0x14
 807a89e: f78d fac3    	bl	0x8007e28 <.text+0x3e28> @ imm = #-0x72a7a
 807a8a2: f7ff ff00    	bl	0x807a6a6 <.text+0x766a6> @ imm = #-0x200
 807a8a6: f795 fc98    	bl	0x80101da <.text+0xc1da> @ imm = #-0x6a6d0
 807a8aa: 2000         	movs	r0, #0x0
 807a8ac: 4902         	ldr	r1, [pc, #0x8]          @ 0x807a8b8 <.text+0x768b8>
 807a8ae: 7008         	strb	r0, [r1]
 807a8b0: bd10         	pop	{r4, pc}
 807a8b2: 0000         	movs	r0, r0
 807a8b4: 10bc         	asrs	r4, r7, #0x2
 807a8b6: 2000         	movs	r0, #0x0
