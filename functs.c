/*
	This is a file with functions used in the kernel
	with description of their purpose
*/

//allocate memory in the kernel for objects smaller than a page size
static __always_inline void *kmalloc(size_t size, gfp_t flags)
// allocate vitually continuous memory
void *vmalloc(unsigned long size)
