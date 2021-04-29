#include <stdio.h>
#include "curl/curl.h"

int main()
{
	curl_easy_init();
	printf("hello,libcurl.\n");
	return 0;
}

