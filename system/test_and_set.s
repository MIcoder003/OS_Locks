/* test_and_set.S - test and set (for x86) */

    .text
    .globl test_and_set

/* --- testandset ---- */
testandset:
            pushl   %ebp        /* save caller's frame pointer */
            movl    %esp, %ebp  /* anchor ebp to this frame */

            movl    12(%ebp),%eax    /* eax = new_value, the value that will be written */
            movl	8(%ebp),%edx    /* edx = ptr, the address of the word to be swapped */
            xchgl %eax, (%edx)      /* Atomically swap the memory and eax value */

            popl  %ebp              /* Restore caller's ebp */
            ret                     /* Ol value already in eax */
