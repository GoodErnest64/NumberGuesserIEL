#include <cstdlib> 
#include <iostream> 
#include <time.h> 

using namespace std;

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
        cout << "Please Enter Your Guess : ";
        //cin >> guess;
        if(!(cin >> guess)){
            cout<<"Invalid Input !!!";
            exit(1);
        }

        if(guess > MAX || guess < MIN){
            cout<<"Input Out Of Range !!!";
            exit(1);
        }

        if(guess > num){
            cout<<("Your Guess Is Too High !\n");
        }
        else if (guess < num){
            cout<<("Your Guess Is Too Low !\n");
        }
        else if(guess == num){
            cout<<"You Won ! The Number Was "<<num<<" And You Guessed It In "<<guesses<<" Guesses !\n";
            break;
        }
        guesses++;
    }
    system("pause");
    return 0;
}
