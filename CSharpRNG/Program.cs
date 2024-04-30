Random rnd = new Random();
int MAX = 100;
int MIN = 0;
int num = rnd.Next(MIN, MAX);
int guess;
int guesses = 0;

while (true)
{
    Console.Write("Enter Your Guess : ");
    guess = Convert.ToInt32(Console.ReadLine());

    if(guess > MAX || guess < MIN){
        Console.WriteLine("Input Out Of Range !!!");
        System.Environment.Exit(1);
    }   
    if(guess > num){
        Console.WriteLine("Your Guess Is Too High !");
    }
    else if (guess < num){
        Console.WriteLine("Your Guess Is Too Low !");
    }
    else if(guess == num){
        Console.WriteLine($"You Won ! The Number Was {num} And You Guessed It In {guesses} Guesses !");
        break;
    }
    guesses++;
}

Console.Write("Press any key to continue . . . ");
Console.ReadKey();