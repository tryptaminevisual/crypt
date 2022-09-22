#! /bin/python3
import os
# The command to create a gpg key is "gpg --key-gen" & list them "gpg --list-keys"
def exp_asc():
    print(50 * "-")
    print("Here we export the keys")
    print(50 * "-")
    print("Here are the available keys:")
    os.system("gpg --list-keys")
    print(50 * "-")
    # We can address the key in multiple ways
    # We can address by fingerprint, e-mail or using part of the name
    var_n = input("Please enter a name for the key:" + " ")
    var_m = input("Please enter the email of your PGP key:" + " ")
    cmnd = "gpg --export -a --output " + var_n + ".asc" + " " + var_m
    print(50 * "-")
    #print(cmnd) This print verifies the command (Seems to be working fine)
    os.system(cmnd)
    print("Key has been exported, check file with the name " + var_n + ".asc")
def encrypt():
    print(50 * "-")
    print("Lets encrypt the file")
    print(50 * "-")
    os.system("ls")
    print(50 * "-")
    ch3 = input("Please select the file to encrypt:" + " ")
    ch4 = input("Please select recipient:" + " ")
    print(50 * "-")
    cmnd1 = "gpg -a -e -r" + " " + ch4 + " " + ch3
    os.system(cmnd1)
    print(50 * "-")
    print("File encrypted!")
    print(50 * "-")
    cmnd3 = "rm -rf" + " " + ch3
    os.system(cmnd3)
    input("Press any key to exit:")
    os.system("clear")
    exit()
def decrypt():
    print(50 * "-")
    print("Decrypt file")
    print("Remember that the file to decrypt should be ending in .asc")
    print(50 * "-")
    os.system("ls")
    print(50 * "-")
    ch5 = input("Enter the file to decrypt:" + " ")
    cmnd4 = "gpg" + " " + ch5
    print(50 * "-")
    os.system(cmnd4)
    print(50 * "-")
    print("File decrypted!")
    input("Press any key to exit:")
    os.system("clear")
    exit()
def crt_f():
    os.system("clear")
    print(50 * "-")
    print("Creating the message")
    print(50 * "-")
    msg_v = input("Please enter your message:" + " ")
    with open("msg.txt", "x") as f:
        f.write(msg_v)
    print(50 * "-")
    ch1 = input("Do you wish to encrypt the file now? (1/2):" + " ")
    if ch1 == "1":
        encrypt()
    elif ch1 == "2":
        print(50 * "-")
        print("Not encrypting file...")
        print(50 * "-")
        input("Press any key to exit:")
        os.system("clear")
        exit()
def main_m():
    print(50 * "-")
    print("Welcome to the PGP Tool")
    print(50 * "-")
    print("Export Public Key (1)")
    print("Create File (2)")
    print("Encrypt File (3)")
    print("Decrypt File (4)")
    print(50 * "-")
    ch2 = input("Please select your option: " + " ")
    if ch2 == "1":
        exp_asc()
    if ch2 == "2":
        crt_f()
    if ch2 == "3":
        encrypt()
    if ch2 == "4":
        decrypt()
    if ch2 == "5":
        print(50 * "-")
        print("Exiting... Press any key to continue:" + " ")
        print(50 * "-")
        os.system(clear)
        exit()
main_m()
