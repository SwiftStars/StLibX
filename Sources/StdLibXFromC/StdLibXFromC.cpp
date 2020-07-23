//
// StdLibX Code
// Copyright © Ben Sova 2020 (MIT)
//

#include "include/StdLibXFromC.h"
#include <iostream>
using namespace std;

__API_AVAILABLE(macos(10.0)) __IOS_PROHIBITED
__WATCHOS_PROHIBITED __TVOS_PROHIBITED
void shellCMD_V(const char *cmd) {
    system(cmd);
}

__API_AVAILABLE(macos(10.0)) __IOS_PROHIBITED
__WATCHOS_PROHIBITED __TVOS_PROHIBITED
int shellCMD_I(const char *cmd) {
    int out = system(cmd);
    return WEXITSTATUS(out);
}
