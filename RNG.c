#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <ctype.h>

int num;
int guess;
int guesses = 0;
const int MIN = 0;
const int MAX = 100;

int main()
{
    srand(time(0));
    num = (rand() % (MAX - MIN + 1)) + MIN; ;
    while (1){
        printf("Enter Your Guess : ");
        if(scanf("%d", &guess) != 1){
            printf("Invalid Input !!!");
            exit(1);
        }

        if(guess > MAX || guess < MIN){
            printf("Input Out Of Range !!!");
            exit(1);
        }

        if(guess > num){
            printf("Your Guess Is Too High !\n");
        }
        else if (guess < num){
            printf("Your Guess Is Too Low !\n");
        }
        else if(guess == num){
            printf("You Won ! The Number Was %d And You Guessed It In %d Guesses !\n", num, guesses);
            break;
        }
        guesses++;
    }
    //printf("\nPress Any Key To Continue . . .");
    //_getch();
    system("pause");
    return 0;
}
