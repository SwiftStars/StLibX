//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

#include "include/StdLibXFromC.h"
#include <iostream>
using namespace std;

void shellCMD_V(const char *cmd) {
    system(cmd);
}

int shellCMD_I(const char *cmd) {
    int out = system(cmd);
    return WEXITSTATUS(out);
}
