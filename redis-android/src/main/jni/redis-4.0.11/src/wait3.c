#include "wait3.h"

pid_t wait3(int* status, int options, struct rusage* usage) {
    return waitpid(-1, status, options);
}