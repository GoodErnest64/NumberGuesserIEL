import random
import sys
import os

MIN = 0
MAX = 100

guesses = 0
num = random.randint(MIN, MAX)

while True:
    try:
        guess = int(input("Enter Your Guess : "))
    except ValueError:
        print("Invalid Input !!!")
        sys.exit(1)
    if guess > num:
        print("Your Guess Is Too High !")
    elif guess < num:
        print("Your Guess Is Too Low !")
    elif guess == num:
        print(f"You Won ! The Number Was {num} And You Guessed It In {guesses} Guesses !")
        break
    guesses += 1

os.system("pause")
