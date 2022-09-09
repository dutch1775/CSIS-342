.global main
.func main

#Michael Dutchin
#01-Apr-22

main:
  mov r7, #0
  
outerloop:
  cmp r7, #5
  beq endloop
  
  mov r1, r7
  
  push {lr}
  push {r1}
  ldr r0, =format_specifier2
  bl printf
  pop {r1}
  pop {lr}
  
  mov r6, #15
  
innerloop:

  mov r1, r6
  
  push {lr}
  push {r1}
  ldr r0, =format_specifier
  bl printf
  pop {r1}
  pop {lr}
  
  sub r6, r6, #1
  
  cmp r6, #1
  bge innerloop

innerEnd:
  
  add r7, r7, #1
  b outerloop
  
endloop:

  mov pc, lr
  
.data
format_specifier:
  .asciz "%x "

format_specifier2
  .asciz "\n"
  
  
  
  
