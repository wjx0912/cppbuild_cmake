#include <stdio.h>
#include "zlib.h"

int main()
{
	//const char *ver = zlib_version;
	const char *ver = zlibVersion();
	printf("zlib version: %s\n", ver);
	return 0;
}

