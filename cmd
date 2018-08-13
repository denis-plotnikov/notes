virt-viewer -c p15 atomics_win2012_x64_r2sp1
ipmitool -I lanplus -H p15-ipmi.perf.sw.ru -U ADMIN -P ADMIN sol activate
http://perf.sw.ru/Images/QEMU%20KVM/atomics_win2008_x64_r2sp1.kvm.tar.bz2

compgen -ac | grep numa - list numa nodes settings

dump a kernel module to file
-------------------------------------------------------------------------------
objdump -dr --prefix-addr $(modinfo -n kvm) > /tmp/kvm.s


disassemble flat memory file
-------------------------------------------------------------------------------
objdump -b binary --start-address=0xa8000 --stop-address=0xa9000 -m i8086 -D pc.ram


get module mapping data
-------------------------------------------------------------------------------
cat /sys/module/vzvirtio_balloon/sections/.text

ps -p 10689 -L

/proc/<pid>/task/<tid>/


redirections
-------------------------------------------------------------------------------
stderr 2 file
         grep da * 2> grep-errors.txt
        
stdout 2 stderr
         grep da * 1>&2 
        

stderr 2 stdout
         grep * 2>&1
        
stderr and stdout 2 file
         rm -f $(find / -name core) &> /dev/null 


