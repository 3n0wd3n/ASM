#include <sys/types.h>
// we use unistd (in windows is process.h) library that allows us to execute program (such as gzip, ping etc) inside our program
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
// we use library errno for catching errors
#include <errno.h>

// gzip text1 = 1st process, gzip text2 = 2nd process, gzip text3 = 3rd ...
/*
SPOUŠTĚNÍ souboru (v UBUNTU-18.04 WSL) 

$ gcc parzip.c -o parzip
$ ./parzip gzip text1.txt text2.txt
*/

int main(int argc, char* argv[])
{
    
    if (argc > 2){
        printf("Enough arguments\n");
        // printing second argument
        printf("Program we use to compress: %s\n\n", argv[1]);

        // printing all arguments
        printf("Arguments we use:\n");
        for (int i = 0; i < argc; i++){
            printf("%d.argument: %s\n", i, argv[i]);
        }

        // we start our loop from third argument
        for (int i = 2; i < argc + 1; i++){
            
            // splitting our program to n processes
            int id = fork();
            
            if (id == 0){
                // execl (we use execlp to avoid defining path to pragram, or execvp where v stants for vector to pass more parametrs as argument) has firt two argument defined as program we want to execute to executables that we've sort as arguments to the reminal
                execlp(
                argv[1], // program we use
                argv[1], // program we use
                argv[i], // the document to which the program is applied
                NULL
                );
                // if the program lands here we've got a problem because something went wrong so we use library errno to define an error that occurs
                int err = errno;
                if (err == 2){
                    printf("File with that name not found or path to that file was wrong!\n");
                    break;
                }
            }
        }
    }
    else{
        printf("Insufficient number of arguments\n");
    } 
    return 0;
}