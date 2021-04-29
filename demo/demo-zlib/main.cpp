#include <stdio.h>
#include "zlib.h"

int main()
{
	const char *ver = zlib_version;
	printf("zlib version: %s\n", ver);
	return 0;
}

