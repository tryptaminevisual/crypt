#! /bin/bash
    #def exp_asc():
    #print(50 * "-")
    #print("Here we export the keys")
    #print(50 * "-")
    #print("Here are the available keys:")
    #os.system("gpg --list-keys")
    #print(50 * "-")
    # We can address the key in multiple ways
    # We can address by fingerprint, e-mail or using part of the name
    #var_n = input("Please enter a name for the key:" + " ")
    #var_m = input("Please enter the email of your PGP key:" + " ")
    #cmnd = "gpg --export -a --output " + var_n + ".asc" + " " + var_m
    #print(50 * "-")
    #print(cmnd) This print verifies the command (Seems to be working fine)
    #os.system(cmnd)
    #print("Key has been exported, check file with the name " + var_n + ".asc")

exp_asc () {
    echo '-----------------------------------------'
    echo 'Here we export the keys'
    echo '-----------------------------------------'
    echo 'Here are the available keys:'
    gpg --list-keys
    echo '-----------------------------------------'
    # We can address the key in multiple ways
    # We can address by fingerprint, e-mail or using part of the name
    echo 'Please enter a name for the key:'
    read -p 'Name:' varname
    echo '------------------------------------------'
    echo 'Please enter the e-mail of your pgp key:'
    read -p 'E-mail:' varmail
    echo '-------------------------------------------'
    # The command to replicate should be the following
    # gpg --export -a --output " + var_n + ".asc" + " " + var_m
    my_cmd="gpg --export -a --output $varname.asc $varmail" # COmmand works fine
    eval "$my_cmd"
    echo 'Done exporting public key!'
    echo '-------------------------------------------'
    #break
    clear
}
#def encrypt():
    #print(50 * "-")
    #print("Lets encrypt the file")
    #print(50 * "-")
    #os.system("ls")
    #print(50 * "-")
    #ch3 = input("Please select the file to encrypt:" + " ")
    #ch4 = input("Please select recipient:" + " ")
    #print(50 * "-")
    #cmnd1 = "gpg -a -e -r" + " " + ch4 + " " + ch3
    #os.system(cmnd1)
    #print(50 * "-")
    #print("File encrypted!")
    #print(50 * "-")
    #cmnd3 = "rm -rf" + " " + ch3
    #os.system(cmnd3)
    #input("Press any key to exit:")
    #os.system("clear")
    #exit()
encrypt () {
    echo '---------------------------------------------'
    echo 'Lets encrypt the file'
    echo '---------------------------------------------'
    ls
    echo '---------------------------------------------'
    echo 'Please select the file to encrypt:'
    read -p 'Name:' fcrypt
    echo '------------------------------------------'
    my_cmd1="gpg -e $fcrypt" # Command works fine
    eval "$my_cmd1"
    echo '-------------------------------------------'
    echo 'File encrypted succesfully!'
    echo '-------------------------------------------'
    rm -rf $fcrypt
    clear
}
#def decrypt():
    #print(50 * "-")
    #print("Decrypt file")
    #print("Remember that the file to decrypt should be ending in .asc")
    #print(50 * "-")
    #os.system("ls")
    #print(50 * "-")
    #ch5 = input("Enter the file to decrypt:" + " ")
    #cmnd4 = "gpg" + " " + ch5
    #print(50 * "-")
    #os.system(cmnd4)
    #print(50 * "-")
    #print("File decrypted!")
    #input("Press any key to exit:")
    #os.system("clear")
    #exit()
decrypt () {
    echo '----------------------------------------------------------'
    echo 'Decrypt file'
    echo 'remember that the file to decrypt should be ending in .asc'
    echo '----------------------------------------------------------'
    ls
    echo '----------------------------------------------------------'
    read -p 'Please select the file to decrypt:' dcrp
    my_cmd2="gpg --decrypt $dcrp"
    eval "$my_cmd2"
    echo '-----------------------------------------------------------'
    echo 'Files decrypted!'
    echo '------------------------------------------------------------'
    read -p "Press enter to continue:"
    clear
}
#def main_m():
    #print(50 * "-")
    #print("Welcome to the PGP Tool")
    #print(50 * "-")
    #print("Export Public Key (1)")
    #print("Create File (2)")
    #print("Encrypt File (3)")
    #print("Decrypt File (4)")
    #print(50 * "-")
    #ch2 = input("Please select your option: " + " ")
    #if ch2 == "1":
        #exp_asc()
    #if ch2 == "2":
        #crt_f()
    #if ch2 == "3":
        #encrypt()
    #if ch2 == "4":
        #decrypt()
    #if ch2 == "5":
        #print(50 * "-")
        #print("Exiting... Press any key to continue:" + " ")
        #print(50 * "-")
        #os.system(clear)
        #exit()
#def crt_f():
    #os.system("clear")
    #print(50 * "-")
    #print("Creating the message")
    #print(50 * "-")
    #msg_v = input("Please enter your message:" + " ")
    #with open("msg.txt", "x") as f:
        #f.write(msg_v)
    #print(50 * "-")
    #ch1 = input("Do you wish to encrypt the file now? (1/2):" + " ")
    #if ch1 == "1":
        #encrypt()
    #elif ch1 == "2":
        #print(50 * "-")
        #print("Not encrypting file...")
        #print(50 * "-")
        #input("Press any key to exit:")
        #os.system("clear")
        #exit()

create_msg () {
    echo '-------------------------------------'
    echo 'Lets create the message to encrypt'
    echo '--------------------------------------'
    echo 'Please enter the text you want to cipher:'
    read -p 'Cipher Text:' cipher_text
    my_cmd1="echo -e '$cipher_text' >> msg.txt" # Command should work fine
    eval "$my_cmd1"
    echo '---------------------------------------'    
    clear     
}
main_m () {
PS3='Please enter your choice: '
options=("Export Public Key" "Create Message" "Encrypt File" "Decrypt File" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Export Public Key")
            exp_asc
            ;;
        "Create Message")
            create_msg
            ;;
        "Encrypt File")
            encrypt
            ;;
        "Decrypt File")
            decrypt
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done   
}
main_m