#include <stdlib.h>
#include <stdio.h>
#include <dlfcn.h>
#include "keygen_lib.h"

int main(int argc, char **argv)
{
    void* handle = dlopen ("./libkeygen.so.1", RTLD_LAZY);
    if (!handle) {
        fputs (dlerror(), stderr);
        printf("\n");
        return 0;
    }

    ConvertToStringC_t ConvertToStringC = (ConvertToStringC_t) dlsym(handle, "ConvertToStringC");
    if (!ConvertToStringC)
    {
        printf("Cannot load symbol 'ConvertToStringC\n");
        fputs (dlerror(), stderr);
        printf("\n");
        dlclose(handle);
        return 0;
    }

    GenerateShortKeyC_t GenerateShortKeyC = (GenerateShortKeyC_t) dlsym(handle, "GenerateShortKeyC");
    if (!GenerateShortKeyC)
    {
        printf("Cannot load symbol 'GenerateShortKeyC\n");
        fputs (dlerror(), stderr);
        printf("\n");
        dlclose(handle);
        return 0;
    }

    GenerateKeyfileC_t GenerateKeyfileC = (GenerateKeyfileC_t) dlsym(handle, "GenerateKeyfileC");
    if (!GenerateKeyfileC)
    {
        printf("Cannot load symbol 'GenerateKeyfileC\n");
        fputs (dlerror(), stderr);
        printf("\n");
        dlclose(handle);
        return 0;
    }

    SHORTKEY_INFO ki;
    char buffer[256];
    ki.dwSize = sizeof(SHORTKEY_INFO);
    ki.lpInfo = "John Doe";
    ki.lpProjectFile = "sample_project.opf";
    ki.lpSystemID = NULL;
    ki.lpExpDate = NULL;
    ki.lpBuffer = buffer;
    ki.dwFlags = 0;
    ki.dwCustom = 0;
    int ret = GenerateShortKeyC(&ki);
    if (ret > 0)
        printf("%s\n", buffer);
    else
        printf("error generating short key, error code %i\n", ret);

/*
    unsigned char buffer[4096];
    char Info1[] = "John Doe";
    KEYFILE_INFO ki;
    ki.dwSize = sizeof(KEYFILE_INFO);
    ki.lpInfo1 = Info1;
    ki.lpInfo2 = NULL;
    ki.lpInfo3 = NULL;
    ki.lpExtInfo = NULL;
    ki.lpSystemID = NULL;
    ki.lpExpDate = NULL;
    ki.lpBuffer = buffer;
    ki.lpProjectFile = "sample_project.opf";
    int ret = GenerateKeyfileC(&ki);
    printf("GenerateKeyfileC returned %d\n", ret);
    if (ret > 0)
    {
        char output[4096];
        ConvertToStringC(buffer, ret, output);
        printf("ConvertToStringC returned:\n%s\n", output);
    }
    else
        printf("error generating keyfile, error code %i\n", ret);
*/
    dlclose(handle);
    return ret;
}
