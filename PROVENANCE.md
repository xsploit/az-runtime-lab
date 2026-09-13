# User-supplied firmware research inputs

User supplied Downloads files and a chat transcript attributing decrypted XDJ-AZ 1.30 and CDJ-3000X 1.40 ISOs and initramfs archives to letacy. These are supplied decrypted inputs, not a key recovered by this agent. Letacy reports an existing patched AZ runtime with slow/non-realtime operation and input problems, and says the AZ relies on a hardware mixer. Those statements are useful leads but have not been independently validated here.

Original inputs preserved under originals/. Extracted files remain local; no firmware upload or message to the contributor has been performed. ARM64 ELF headers verified for EP147 (AZ) and EP145 (3000X). Initial AZ dynamic-loader dependency check passed in an isolated read-only root with QEMU user-mode. No Pi connected or flashed. Vendor startup scripts are inspected as data; they are not executed against the host.
