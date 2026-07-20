<%page args="binary, host=None, port=None, user=None, password=None, libc=None, remote_path=None, quiet=False"/>\
<%
import os
import sys

from pwnlib.context import context as ctx
from pwnlib.elf.elf import ELF
from pwnlib.util.sh_string import sh_string
from elftools.common.exceptions import ELFError

argv = list(sys.argv)
argv[0] = os.path.basename(argv[0])

try:
    if binary:
       ctx.binary = ELF(binary, checksec=False)
except ELFError:
    pass

if not binary:
    binary = './path/to/binary'

exe = os.path.basename(binary)

remote_path = remote_path or exe
password = password or 'secret1234'
binary_repr = repr(binary)
libc_repr = repr(libc)
%>\
#!/usr/bin/env python3
from pwn import *

%if libc:
library_path = libcdb.download_libraries(${libc_repr})
exe = context.binary = ELF.patch_custom_libraries(${binary_repr}, library_path)
%else:
exe = context.binary = ELF(${binary_repr}) <% binary_repr = 'exe.path' %>
%endif
libc = exe.libc

def start():
    if args.REMOTE:
        return remote(${repr(host)}, ${port})
    elif args.GDB:
        return gdb.debug([exe.path], gdbscript=gdbscript)
    return process([exe.path])

gdbscript = f'''
%if ctx.binary:
  %if 'main' in ctx.binary.symbols:
tbreak main
  %elif 'DYN' != ctx.binary.elftype:
tbreak *0x{exe.entry:x}
  %endif
%endif
continue
'''

%if ctx.binary and not quiet:
# ${'%-10s%s-%s-%s' % ('Arch:',
                       ctx.binary.arch,
                       ctx.binary.bits,
                       ctx.binary.endian)}
%for line in ctx.binary.checksec(color=False).splitlines():
# ${line}
%endfor
%endif

io = start()

# -- Exploit goes here --

io.interactive()
