_TEXT SEGMENT

;generated by https://godbolt.org/
;https://wiki.osdev.org/VMware_tools
;rdi->rcx

;void vmware_send(vmware_cmd * cmd) {
;	cmd->magic = VMWARE_MAGIC;
;	cmd->port = VMWARE_PORT;
;	asm volatile("in %%dx, %0" : "+a"(cmd->ax), "+b"(cmd->bx), "+c"(cmd->cx), "+d"(cmd->dx), "+S"(cmd->si), "+D"(cmd->di));
;}
vmware_send PROC
        push    rbp
        mov     rbp, rsp
        push    rbx
        mov     QWORD PTR [rbp-16], rcx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax], 1447909480
        mov     rax, QWORD PTR [rbp-16]
        mov     WORD PTR [rax+12], 22104
        mov     rax, QWORD PTR [rbp-16]
        mov     r9d, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     r8d, DWORD PTR [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     ecx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rax+12]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, DWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     edi, DWORD PTR [rax+20]
        mov     eax, r9d
        mov     ebx, r8d
        in      eax, dx
        mov     r8d, ebx
        mov     r9, QWORD PTR [rbp-16]
        mov     DWORD PTR [r9], eax
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+4], r8d
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+8], ecx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+12], edx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+16], esi
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+20], edi
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
vmware_send ENDP

;static void vmware_send_hb(vmware_cmd * cmd) {
;	cmd->magic = VMWARE_MAGIC;
;	cmd->port = VMWARE_PORTHB;
;	asm volatile("cld; rep; outsb" : "+a"(cmd->ax), "+b"(cmd->bx), "+c"(cmd->cx), "+d"(cmd->dx), "+S"(cmd->si), "+D"(cmd->di));
;}
vmware_send_hb PROC
        push    rbp
        mov     rbp, rsp
        push    rbx
        mov     QWORD PTR [rbp-16], rcx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax], 1447909480
        mov     rax, QWORD PTR [rbp-16]
        mov     WORD PTR [rax+12], 22105
        mov     rax, QWORD PTR [rbp-16]
        mov     r9d, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     r8d, DWORD PTR [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     ecx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rax+12]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, DWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     edi, DWORD PTR [rax+20]
        mov     eax, r9d
        mov     ebx, r8d
        cld
        rep     outsb
        mov     r8d, ebx
        mov     r9, QWORD PTR [rbp-16]
        mov     DWORD PTR [r9], eax
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+4], r8d
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+8], ecx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+12], edx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+16], esi
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+20], edi
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
vmware_send_hb ENDP

;static void vmware_get_hb(vmware_cmd * cmd) {
;	cmd->magic = VMWARE_MAGIC;
;	cmd->port = VMWARE_PORTHB;
;	asm volatile("cld; rep; insb" : "+a"(cmd->ax), "+b"(cmd->bx), "+c"(cmd->cx), "+d"(cmd->dx), "+S"(cmd->si), "+D"(cmd->di));
;}
vmware_get_hb PROC
        push    rbp
        mov     rbp, rsp
        push    rbx
        mov     QWORD PTR [rbp-16], rcx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax], 1447909480
        mov     rax, QWORD PTR [rbp-16]
        mov     WORD PTR [rax+12], 22105
        mov     rax, QWORD PTR [rbp-16]
        mov     r9d, DWORD PTR [rax]
        mov     rax, QWORD PTR [rbp-16]
        mov     r8d, DWORD PTR [rax+4]
        mov     rax, QWORD PTR [rbp-16]
        mov     ecx, DWORD PTR [rax+8]
        mov     rax, QWORD PTR [rbp-16]
        mov     edx, DWORD PTR [rax+12]
        mov     rax, QWORD PTR [rbp-16]
        mov     esi, DWORD PTR [rax+16]
        mov     rax, QWORD PTR [rbp-16]
        mov     edi, DWORD PTR [rax+20]
        mov     eax, r9d
        mov     ebx, r8d
        cld
        rep     insb
        mov     r8d, ebx
        mov     r9, QWORD PTR [rbp-16]
        mov     DWORD PTR [r9], eax
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+4], r8d
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+8], ecx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+12], edx
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+16], esi
        mov     rax, QWORD PTR [rbp-16]
        mov     DWORD PTR [rax+20], edi
        nop
        mov     rbx, QWORD PTR [rbp-8]
        leave
        ret
vmware_get_hb ENDP

_TEXT ENDS

END