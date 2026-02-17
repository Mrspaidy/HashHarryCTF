#!/usr/bin/env python3
import hashlib
import time

# ===== SECRET VALUES (player ko nahi pata) =====
CORRECT_CHEESE = "gouda"
SECRET_SALT = "b7"

FLAG = "dark_flag{cheese_master}"

# hash generate (server side)
TARGET_HASH = hashlib.sha256(
    (CORRECT_CHEESE + SECRET_SALT).encode()
).hexdigest()

print("*******************************************")
print("***             Part 1                  ***")
print("***    The Mystery of the CLONED RAT    ***")
print("*******************************************")
print()

print("I heard that SHA-256 is the best hash function!")
print("We enjoy our cheese with exactly")
print("2 nibbles of hexadecimal-character salt!")
print()

print("Hash:", TARGET_HASH)
print()

while True:
    print("Commands: (g)uess my cheese")
    choice = input("What would you like to do? ").strip().lower()

    if choice == "g":
        guess = input("Enter cheese: ").strip().lower()

        test_hash = hashlib.sha256(
            (guess + SECRET_SALT).encode()
        ).hexdigest()

        if test_hash == TARGET_HASH:
            print("\nCorrect! Squeexy approves 🧀")
            print(FLAG)
            time.sleep(15) 
            break
        else:
            print("Wrong cheese!\n")
