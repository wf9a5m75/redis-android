#ifdef __ANDROID__
    // prevent wait3() returned an error: No child processes. rdb_child_pid = 25182, aof_child_pid = -1 error
    // https://stackoverflow.com/questions/33994543/wait3-waitpid-alias-returns-1-with-errno-set-to-echild-when-it-should-not
    #ifndef __WAIT3_H
        #define __WAIT3_H
        #include <sys/syscall.h>
        #include <sys/resource.h>
        #include <sys/wait.h>
        pid_t wait3(int* status, int options, struct rusage* usage);
    #endif
#else
    #define _GNU_SOURCE
    #include <sys/syscall.h>
    #include <sys/resource.h>
    #include <sys/wait.h>
#endif