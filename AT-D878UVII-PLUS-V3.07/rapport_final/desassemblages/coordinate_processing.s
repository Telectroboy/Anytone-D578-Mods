
/mnt/data/D578_satellite_recherche/rapport_final/ELF/D878.elf:	file format elf32-littlearm

Disassembly of section .text:

08004000 <.text>:
 80785be: e92d 41f0    	push.w	{r4, r5, r6, r7, r8, lr}
 80785c2: 48cb         	ldr	r0, [pc, #0x32c]        @ 0x80788f0 <.text+0x748f0>
 80785c4: 7800         	ldrb	r0, [r0]
 80785c6: 284e         	cmp	r0, #0x4e
 80785c8: d105         	bne	0x80785d6 <.text+0x745d6> @ imm = #0xa
 80785ca: 49ca         	ldr	r1, [pc, #0x328]        @ 0x80788f4 <.text+0x748f4>
 80785cc: c903         	ldm	r1, {r0, r1}
 80785ce: f027 fc4f    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x2789e
 80785d2: 4605         	mov	r5, r0
 80785d4: e009         	b	0x80785ea <.text+0x745ea> @ imm = #0x12
 80785d6: 48c7         	ldr	r0, [pc, #0x31c]        @ 0x80788f4 <.text+0x748f4>
 80785d8: c80c         	ldm	r0!, {r2, r3}
 80785da: 2000         	movs	r0, #0x0
 80785dc: 4601         	mov	r1, r0
 80785de: f028 f9b3    	bl	0x80a0948 <.text+0x9c948> @ imm = #0x28366
 80785e2: 4606         	mov	r6, r0
 80785e4: f027 fc44    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27888
 80785e8: 4605         	mov	r5, r0
 80785ea: 48c3         	ldr	r0, [pc, #0x30c]        @ 0x80788f8 <.text+0x748f8>
 80785ec: 7800         	ldrb	r0, [r0]
 80785ee: 2845         	cmp	r0, #0x45
 80785f0: d105         	bne	0x80785fe <.text+0x745fe> @ imm = #0xa
 80785f2: 49c2         	ldr	r1, [pc, #0x308]        @ 0x80788fc <.text+0x748fc>
 80785f4: c903         	ldm	r1, {r0, r1}
 80785f6: f027 fc3b    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27876
 80785fa: 4604         	mov	r4, r0
 80785fc: e009         	b	0x8078612 <.text+0x74612> @ imm = #0x12
 80785fe: 48bf         	ldr	r0, [pc, #0x2fc]        @ 0x80788fc <.text+0x748fc>
 8078600: c80c         	ldm	r0!, {r2, r3}
 8078602: 2000         	movs	r0, #0x0
 8078604: 4601         	mov	r1, r0
 8078606: f028 f99f    	bl	0x80a0948 <.text+0x9c948> @ imm = #0x2833e
 807860a: 4606         	mov	r6, r0
 807860c: f027 fc30    	bl	0x809fe70 <.text+0x9be70> @ imm = #0x27860
 8078610: 4604         	mov	r4, r0
 8078612: 2200         	movs	r2, #0x0
 8078614: 4621         	mov	r1, r4
 8078616: 4628         	mov	r0, r5
 8078618: f7ff fe85    	bl	0x8078326 <.text+0x74326> @ imm = #-0x2f6
 807861c: e8bd 81f0    	pop.w	{r4, r5, r6, r7, r8, pc}
