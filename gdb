target remote 0.0.0.0:1234
set architecture i386:x86-64
symbol-file <path_to_file>


how to change a varible:
----------------------------------------------------------------------
set var debug_looper = 1
if you need a "looper" breakpoint -- make a variable it non static and volatile
volatile int x;


how to make a symbolic file
----------------------------------------------------------------------
objcopy --only-keep-debug x86/eventinj.flat eventinj.sym


a bunch of nice links about linux kernel debugging
----------------------------------------------------------------------
http://wiki.osdev.org/Kernel_Debugging


defining your own function for reading lists
----------------------------------------------------------------------
(gdb) define plist
>set var $head=&$arg0
>set var $next=$arg0.lh_first
>while $next
 >p $next.cb
 >set var $next=$next.entries.le_next
 >end
>end

(gdb) plist vm_change_state_head
$3 = (VMChangeStateHandler *) 0x55f3ec85f8b0 <virtio_vmstate_change>
$4 = (VMChangeStateHandler *) 0x55f3ec85f8b0 <virtio_vmstate_change>
$5 = (VMChangeStateHandler *) 0x55f3ec9b1190 <scsi_dma_restart_cb>
$6 = (VMChangeStateHandler *) 0x55f3ec85f8b0 <virtio_vmstate_change>
$7 = (VMChangeStateHandler *) 0x55f3ec85f8b0 <virtio_vmstate_change>
$8 = (VMChangeStateHandler *) 0x55f3ec973360 <ide_restart_cb>
$9 = (VMChangeStateHandler *) 0x55f3ec973360 <ide_restart_cb>
$10 = (VMChangeStateHandler *) 0x55f3ec8807e0 <kvm_pit_vm_state_change>
$11 = (VMChangeStateHandler *) 0x55f3ec87eb20 <kvmclock_vm_state_change>
$12 = (VMChangeStateHandler *) 0x55f3ec8d7210 <cpu_update_state>
$13 = (VMChangeStateHandler *) 0x55f3ec8d7210 <cpu_update_state>
$14 = (VMChangeStateHandler *) 0x55f3ec9fb830 <net_vm_change_state_handler>

or 

To print a list of SaveStateEntry-es:

define print_list
set $entry = $arg0.tqh_first
while $entry != 0
 p $entry
 p $entry->idstr
 set $entry = $entry->entry->tqe_next
 end
end

Usage:

print_list savevm_state.handlers

stepping
----------------------------------------------------------------------
s (step)   - go to next diving into function
n (next)   - go to next NOT diving into function
f (finish) - run until the current function returns

