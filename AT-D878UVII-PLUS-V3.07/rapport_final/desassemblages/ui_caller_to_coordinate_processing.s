
/mnt/data/D578_satellite_recherche/rapport_final/ELF/D878.elf:	file format elf32-littlearm

Disassembly of section .text:

08004000 <.text>:
 8049448: 48a3         	ldr	r0, [pc, #0x28c]        @ 0x80496d8 <.text+0x456d8>
 804944a: 7800         	ldrb	r0, [r0]
 804944c: 2801         	cmp	r0, #0x1
 804944e: d116         	bne	0x804947e <.text+0x4547e> @ imm = #0x2c
 8049450: f7fd fdc5    	bl	0x8046fde <.text+0x42fde> @ imm = #-0x2476
 8049454: 48af         	ldr	r0, [pc, #0x2bc]        @ 0x8049714 <.text+0x45714>
 8049456: f890 006f    	ldrb.w	r0, [r0, #0x6f]
 804945a: b910         	cbnz	r0, 0x8049462 <.text+0x45462> @ imm = #0x4
 804945c: f7dd fffd    	bl	0x802745a <.text+0x2345a> @ imm = #-0x22006
 8049460: e009         	b	0x8049476 <.text+0x45476> @ imm = #0x12
 8049462: 48ac         	ldr	r0, [pc, #0x2b0]        @ 0x8049714 <.text+0x45714>
 8049464: f890 006f    	ldrb.w	r0, [r0, #0x6f]
 8049468: 4bae         	ldr	r3, [pc, #0x2b8]        @ 0x8049724 <.text+0x45724>
 804946a: 4aaf         	ldr	r2, [pc, #0x2bc]        @ 0x8049728 <.text+0x45728>
 804946c: 49af         	ldr	r1, [pc, #0x2bc]        @ 0x804972c <.text+0x4572c>
 804946e: 9000         	str	r0, [sp]
 8049470: 48af         	ldr	r0, [pc, #0x2bc]        @ 0x8049730 <.text+0x45730>
 8049472: f02c f936    	bl	0x80756e2 <.text+0x716e2> @ imm = #0x2c26c
 8049476: f02f f8a2    	bl	0x80785be <.text+0x745be> @ imm = #0x2f144
 804947a: f031 f995    	bl	0x807a7a8 <.text+0x767a8> @ imm = #0x3132a
 804947e: 2003         	movs	r0, #0x3
 8049480: 4994         	ldr	r1, [pc, #0x250]        @ 0x80496d4 <.text+0x456d4>
 8049482: 7008         	strb	r0, [r1]
 8049484: 48ab         	ldr	r0, [pc, #0x2ac]        @ 0x8049734 <.text+0x45734>
 8049486: 7800         	ldrb	r0, [r0]
 8049488: 499d         	ldr	r1, [pc, #0x274]        @ 0x8049700 <.text+0x45700>
 804948a: 6008         	str	r0, [r1]
 804948c: f7fd fab8    	bl	0x8046a00 <.text+0x42a00> @ imm = #-0x2a90
