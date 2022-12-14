#learing the screen
clear 

# Getting the current working directory
 setenv WORKING_PATH `pwd`

 # Creating the experiment folder for ls command
 mkdir -p $WORKING_PATH/gpl_directory

 cd $WORKING_PATH/gpl_directory
 ## # Creating certain files and folders
 #mkdir -p dir1/ dir2
 #touch file1.txt
 #touch file2.txt

 # ls command display the full list or content of your directory.
 echo ""
 echo "${RED}Command: ls ${NC}"

 echo ""
 echo "${RED}Description: Full list of current directory ${NC}"
 echo ""


 echo "${RED}Expected Output: ${NC}"
 echo ""
 ls
 echo ""
 echo "${RED}----------------------------------------------------------------------------------------------------- ${NC}"
 echo ""


 echo "\
 ${GREEN}Please try the below command  \
 ls <enter> \
 Compare your output  with the  expected output ${NC}"

 echo ""
 echo -n "${PURPLE}Enter Command ${NC}:"
 echo ""
 set mainmenuinput = `head -1`
 #echo "print $mainmenuinput"
 if ("$mainmenuinput" == "ls") then
   echo ""
     echo "${GREEN}Actual Output:${NC}"
      echo ""
       ls
         else
             echo "${GREEN}Command wrong${NC}"
                 endif

                 echo ""#                 echo ""
                 echo ""
                 echo "${RED}----------------------------------------------------------------------------------------------------- ${NC}"

                 echo ""

                 echo "${PURPLE}Good job!\
                 Now try to learn next command (ls -a) ${NC}"
                 echo ""
                 echo "${PURPLE}Go back usind command (cd - <Enter>)\
                 Then source ls-a.csh${NC} "


                 echo ""
