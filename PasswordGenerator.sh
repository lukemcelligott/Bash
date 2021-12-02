#!/bin/bash

#*****************************************************
#*            Password Generator Program             *
#*---------------------------------------------------*
#* November 30, 2021                                 *
#* By: Luke McElligott                               *
#* Description:                                      *
#* Password generator program capable of creating    *
#* numerous different types of passwords of different*
#* lengths. Also has a testing feature based around  *
#* the length of the password.                       *
#*****************************************************

echo "Welcome to the password application!"
echo "What would you like to do today?"
echo "(1) Generate a password"
echo "(2) Generate numerous passwords"
echo "(3) Test the strength of a password"
echo "(4) Generate a password and test the strength of it"
echo "(5) Quit the program"
read functionNum

#validation
if ! [[ "$functionNum" =~ ^[1-5]+$ ]]; then
        echo "Please enter an appropriate option number"
        read functionNum
fi

#option 1: generating a password
if [[ $functionNum -eq 1 ]]; then
	#ask user what type of password they want
	echo "What kind of password would you like to generate?"
	echo "(1) Password with characters"
	echo "(2) Password with integers"
	echo "(3) Password with characters and integers"
	echo "(4) Password with characters, integers, and special charaters"
	read choiceNum
	#validation
	if ! [[ "$choiceNum" =~ ^[1-4] ]]; then
		echo "Please enter a valid number:"
		read choiceNum
	fi
	
	#get input for the length of the password
	echo "How many characters long would you like the password to be?"
        read passChar
        #validation
        if ! [[ "$passChar" =~ ^[1-9] ]]; then
        	echo "Please enter an integer:"
                read passChar
        fi

	#generate a password with just chars
	if [[ $choiceNum -eq 1 ]]; then
		#generate the password
		echo "Generating password..."
                echo "Your generated password is:"
                < /dev/urandom tr -dc A-Za-z | head -c$passChar; echo #command used for generating the random password
        fi

	#generate a password with just ints
	if [[ $choiceNum -eq 2 ]]; then
		#generate the password
		echo "Generating password..."
                echo "Your generated password is:"
                < /dev/urandom tr -dc 0-9 | head -c$passChar; echo #command used for generating the random password
        fi

	#generate a password with chars and ints
	if [[ $choiceNum -eq 3 ]]; then	
		#generate the password
		echo "Generating password..."
		echo "Your generated password is:"
		< /dev/urandom tr -dc A-Za-z0-9 | head -c$passChar; echo #command used for generating the random password
	fi

	#generate a password with chars, ints, and special chars
	if [[ $choiceNum -eq 4 ]]; then
		#generate the password
		echo "Generating your password..."
		echo "Your generated password is:"
		< /dev/urandom tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}`' | head -c$passChar; echo #gets chars, ints, and special 			chars
	fi
fi

#option 2: geneating numerous passwords
if [[ $functionNum -eq 2 ]];then
	#ask what kind of passwords the user wants
	echo "What kind of passwords would you like to generate?"
        echo "(1) Password with characters"
        echo "(2) Password with integers"
        echo "(3) Password with characters and integers"
        echo "(4) Password with characters, integers, and special charaters"
        read choiceNum
	#validation
	if ! [[ "$choiceNum" =~ ^[1-4] ]]; then
		echo "Please enter a valid number:"
		read choiceNum
	fi

        #get number for the amount of passwords
        echo "How many passwords would you like to generate?"
        read passNum
        #validation
        if ! [[ "$passNum" =~ ^[1-9] ]]; then
                echo "Please enter an integer:"
                read passNum
        fi

        #get the number for the length of passwords
        echo "How many characters long would you like the password to be?"
        read passChar
        #validation
        if ! [[ "$passChar" =~ ^[1-9] ]]; then
                echo "Please enter an integer:"
                read passChar
        fi

	#generate a password with just chars
        if [[ $choiceNum -eq 1 ]]; then
                #generate the passwords
                echo "Generating passwords..."
                echo "Your generated passwords are:"
		for ((i=0; i<=($passNum-1); i++))
		do
                	< /dev/urandom tr -dc A-Za-z | head -c$passChar; echo #command used for generating the random password
        	done
	fi

	#generate a password with just ints
	if [[ $choiceNum -eq 2 ]]; then
                #generate the passwords
                echo "Generating passwords..."
                echo "Your generated passwords are:"
                for ((i=0; i<=($passNum-1); i++))
                do
                        < /dev/urandom tr -dc 0-9 | head -c$passChar; echo #command used for generating the random password
                done
        fi
	
	#generate passwords with chars and ints
	if [[ $choiceNum -eq 3 ]]; then
		#generate the passwords
                echo "Generating passwords..."
                echo "Your generated passwords are:"
                for ((i=0; i<=($passNum-1); i++))
                do
                        < /dev/urandom tr -dc A-Za-z0-9 | head -c$passChar; echo #command used for generating the random password
                done
        fi

	#generate passwords with chars, ints, and special chars
	if [[ $choiceNum -eq 4 ]]; then
		#generate the passwords
                echo "Generating passwords..."
                echo "Your generated passwords are:"
                for ((i=0; i<=($passNum-1); i++))
                do
                        < /dev/urandom tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}`' | head -c$passChar; echo #gets chars, ints, and special chars
                done
        fi
fi

#option 3: testing a password
if [[ $functionNum -eq 3 ]]; then
	echo "Please enter enter the password you would like to test:"
	read testPasswd
	echo "Testing..."

	#takes the password input and turns the length into an integer
	passwdLength=${#testPasswd}
	#tests for a very weak password
	if (( $passwdLength<=6 )); then
		echo "This is an extremely weak password!"
		echo "Tip: Consider making your password longer."
	fi
	#tests for a weak password
	if (( $passwdLength>6 )) && (( $passwdLength<=10 )); then
		echo "This is a weak password!"
		echo "Tip: Adding more characters to a password strengthens it."
	fi
	#tests for a mediocre password
	if (( $passwdLength>10 )) && (( $passwdLength<=15 )); then
		echo "This is a moderately secure password!"
		echo "Tip: A secure password is typically a long one."
	fi
	#tests for a strong password
	if (( $passwdLength>15 )) && (( $passwdLength<=18 )); then
		echo "This is a strong password!"
		echo "Tip: A longer password is typically more secure."
	fi
	#tests for a very strong password
	if (( $passwdLength>18 )); then
		echo "This is a very strong password!"
		echo "Tip: Passwords with letters, numbers and special characters are typically very strong."
	fi

fi

#option 4: generating and testing a password
if [[ $functionNum -eq 4 ]]; then
	#GENERATING A PASSWORD
	#ask user what type of password they want
        echo "What kind of password would you like to generate?"
        echo "(1) Password with characters"
        echo "(2) Password with integers"
        echo "(3) Password with characters and integers"
        echo "(4) Password with characters, integers, and special charaters"
        read choiceNum
        #validation
        if ! [[ "$choiceNum" =~ ^[1-4] ]]; then
                echo "Please enter a valid number:"
                read choiceNum
        fi

        #get input for the length of the password
        echo "How many characters long would you like the password to be?"
        read passChar
        #validation
        if ! [[ "$passChar" =~ ^[1-9] ]]; then
                echo "Please enter an integer:"
                read passChar
        fi
	echo "Generating password..."
	echo "Your generated password is:"

	#generate a password with just chars
        if [[ $choiceNum -eq 1 ]]; then
                #generate the password
                < /dev/urandom tr -dc A-Za-z | head -c$passChar; echo #command used for generating the random password
        fi

        #generate a password with just ints
        if [[ $choiceNum -eq 2 ]]; then
                #generate the password
                < /dev/urandom tr -dc 0-9 | head -c$passChar; echo #command used for generating the random password
        fi

        #generate a password with chars and ints
        if [[ $choiceNum -eq 3 ]]; then
                #generate the password
                < /dev/urandom tr -dc A-Za-z0-9 | head -c$passChar; echo #command used for generating the random password
        fi

	#generate a password with chars, ints, and special chars
        if [[ $choiceNum -eq 4 ]]; then
                #generate the password
                < /dev/urandom tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}`' | head -c$passChar; echo #gets chars,ints, and special chars
        fi

	#TESTING THE PASSWORD
	echo "Testing..."
	#tests for a very weak password
        if (( $passChar<=6 )); then
                echo "This is an extremely weak password!"
		echo "Tip: Consider making your password longer."
        fi
        #tests for a weak password
        if (( $passChar>6 )) && (( $passChar<=10 )); then
                echo "This is a weak password!"
		echo "Tip: A longer password is usually more secure."
        fi
        #tests for a mediocre password
        if (( $passChar>10 )) && (( $passChar<=15 )); then
                echo "This is a moderately secure password!"
		echo "Tip: Adding special characters makes a more secure password"
        fi
        #tests for a strong password
        if (( $passChar>15 )) && (( $passChar<=18 )); then
                echo "This is a strong password!"
		echo "Tip: Short passwords are not usually very strong."
        fi
        #tests for a very strong password
        if (( $passChar>18 )); then
                echo "This is a very strong password!"
		echo "Tip: The best passwords have numerous characters and are long"
        fi
fi

#option 5: quit the program
if [[ $functionNum -eq 5 ]]; then
	echo "Ending program..."
	echo "Goodbye!"
	exit 1
fi
