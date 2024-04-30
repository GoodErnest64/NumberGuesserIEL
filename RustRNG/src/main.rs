use std::io;
use rand::Rng;
use std::io::Write;
use std::cmp::Ordering;
use std::process::Command;

fn main() {
    let MAX = 100;
    let MIN = 0;

    let num = rand::thread_rng().gen_range(MIN..=MAX);
    let mut guesses = 0;
    
    loop {
        print!("\nEnter Your Guess : ");
        std::io::stdout().flush().unwrap();

        let mut guess = String::new();

        io::stdin()
            .read_line(&mut guess)
            .expect("Failed to read line");

        let guess: u32 = match guess.trim().parse() {
            Ok(num) => num,
            Err(_) => {
                print!("Invalid Input !!!");
                return;
            },
        };

        if guess > MAX || guess < MIN {
            print!("Input Out Of Range !!!");
            return;
        }


        match guess.cmp(&num) {
            Ordering::Less => print!("Your Guess Is Too Low !"),
            Ordering::Greater => print!("Your Guess Is Too High !"),
            Ordering::Equal => {
                println!("You Won ! The Number Was {num} And You Guessed It In {guesses} Guesses !");
                std::io::stdout().flush().unwrap();
                break;
            }
        }
        guesses += 1;
    }

    let _ = Command::new("cmd.exe").arg("/c").arg("pause").status();
}