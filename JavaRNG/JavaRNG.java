import java.io.IOException;
import java.util.Scanner;

class JavaRNG
{   public static void main(String []args) throws IOException
    {
       int num;
       int guess = 0;
       int guesses = 0;
       int MIN = 0;
       int MAX = 100;

        Scanner scanner = new Scanner(System.in);

        num = (int)Math.floor(Math.random() *(MAX - MIN + 1) + MIN);

        while (true){
            System.out.print("Enter Your Guess : ");

            try
            {
                guess = scanner.nextInt();
            }
            catch(Exception e){
                System.out.println("Invalid Input !!!");
                System.exit(1);
            }
    
            if(guess > MAX || guess < MIN){
                System.out.println("Input Out Of Range !!!");
                System.exit(1);
            }
    
            if(guess > num){
                System.out.println("Your Guess Is Too High !");
            }

            else if (guess < num){
                System.out.println("Your Guess Is Too Low !");
            }

            else if(guess == num){
                System.out.println("You Won ! The Number Was " + num + " And You Guessed It In " + guesses + " Guesses !");
                break;
            }
            guesses++;
        }
        System.out.print("Press Any Key To Continue . . . ");
        scanner.nextLine();
        scanner.close();
    }
};
