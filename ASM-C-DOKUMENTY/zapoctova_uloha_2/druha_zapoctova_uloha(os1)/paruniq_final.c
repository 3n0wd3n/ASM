#include <stdio.h> 
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
// this library called pthread is used for creating the threads
#include <pthread.h>
#include <errno.h>

/*

SPOUŠTĚNÍ souboru (v UBUNTU-18.04 WSL)

$ gcc paruniq.c -o paruniq --> budeme používat rozšířenou kompilace $ gcc -g -pthread paruniq.c -o paruniq
$ ./paruniq

KROKY pro splění úlohy 

1. Do paměti počítače je načten celý obsah souboru.
    - ze standartního vstupu načíst řádky (echo -e "foo\nbar\nbaz\nfoo\nbar" | ./paruniq 2)
2. Soubor je v paměti rozdělen na přibližně stejně velké části.
3. V každé části jsou samostatným vláknem identifikovány unikátní řádky.
4. Poté, co skončí všechna vlákna svou činnost, jsou z jednotlivých dílčích částí vybrány unikátní řádky a ty vypsaný na standardní výstup

TESTOVÁNÍ 
$ cat paruniq-test2.txt | ./main 100
$ echo -e "ahoj\nahoj\ncau\n" | ./main 4
*/

struct arguments {
    // arguments for thread 
    int id; // thread id 
    int start_position; // what index should thread start operating on 
    int number_of_lines; // how many indexies should thread filter 
    char (*array)[100]; // array of strings
};

// thread function
static void *thread_main(void *thread_argv)
{
    int id = (((struct arguments*)thread_argv)->id); // id of the thread 
    int start_position = (((struct arguments*)thread_argv)->start_position); // starting index for filtering 
    int number_of_lines = (((struct arguments*)thread_argv)->number_of_lines); // how many indexies should the thread go through
    char (*array)[100]  = (((struct arguments*)thread_argv)->array); // array with strings 

    // if we find duplicate we replace it with empty string
    for (int i = start_position; i < start_position + number_of_lines; i++){
        for (int j = start_position; j < start_position + number_of_lines; j++){
            if(!strcmp(array[i],array[j]) && i != j ){
                strcpy(array[j],"");
            }
        }
    }

    return (void *) NULL;
}


int main(int argc, char *argv[]) {

    // Load file into the string
    int line_counter = 0; // how many lines did we read 
    char buf[4096]; // buffer 
    ssize_t n;
    char *str = NULL; // string to store whole
    size_t len = 0;
    while (n = read(STDIN_FILENO, buf, sizeof buf)) {
        if (n < 0) {
            if (errno == EAGAIN)
                continue;
            perror("read");

            break;
        }

        str = realloc(str, len + n + 1);
        memcpy(str + len, buf, n);
        len += n;
        str[len] = '\0';
    }

    // how many lines are in the file
    for(int i = 0; i < 4096; i++){
        if (buf[i] == '\n'){
            line_counter++;
        }
        if (buf[i] == '\0'){
            line_counter++;
            break;
        }
    }

    // alocation for strings
    char array[line_counter][100];

    // split the whole file into array of lines
    const char s[2] = "\n";
    char *token;
    
    // get the first token 
    token = strtok(str, s);
    int counter = 0;
    
    // walk through other tokens
    while( token != NULL ) {
        strcpy(array[counter], token);
        counter++;
        token = strtok(NULL, s);
    }

    // threads
    short num_of_threads = atoi(argv[1]);
     // individual threads in thread_array stores the information about thread and its data typy is p_thread
    pthread_t thread_array[num_of_threads];
    short lines_per_thread = 1;
    while(lines_per_thread * num_of_threads < line_counter){
        lines_per_thread++;
    }

    // starting threads and creating threads
    for (int i = 0; i < num_of_threads; i++){
        struct arguments *thread_argv = (struct arguments *)malloc(sizeof(struct arguments)); // creating an argument
        thread_argv->array = array;
        thread_argv->id = i;
        thread_argv->start_position = i * lines_per_thread;
        thread_argv->number_of_lines = lines_per_thread;
        // creating the thread
        pthread_create(&thread_array[i], NULL, thread_main, (void *)thread_argv); // thread create
    }

    int tmp = 0; // just for thread return
    for (int i = 0; i < num_of_threads; i++){
        //waitung untill execution is finished
        pthread_join(thread_array[i], (void **) &tmp);
    }

    // filter remaining strings for duplicates
    for (int i = 0; i < line_counter; i++){
        for (int j = 0; j < line_counter; j++){
            if(!strcmp(array[i],array[j]) && i != j ){
                strcpy(array[j],"");
            }
        }   
    }

    // print strings that are not empty
    for (int i = 0; i < line_counter; i++){
        if(!strcmp(array[i],"")){continue;}
        printf("%s\n", array[i]);
    }
    return 0;
}