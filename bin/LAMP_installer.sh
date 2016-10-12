#!/bin/bash
# Copyright © 2016, William N. Braswell, Jr.. All Rights Reserved. This work is Free \& Open Source; you can redistribute it and/or modify it under the same terms as Perl 5.24.0.
# LAMP Installer Script v0.003_000

# enable extended pattern matching in case statements
shopt -s extglob

C () {  # _C_onfirm user action
    echo $1
    while true; do
        read -p 'Did you do it, yes or no?  [yes] ' -n 1 PROMPT_INPUT
        case $PROMPT_INPUT in
            n|N ) echo; echo; echo $1;;
            y|Y ) echo; echo; break;;
#            ' ' ) echo;;  # NEED FIX: space ' ' should not trigger empty ''
            ''  ) echo; break;;
            *   ) echo;;
        esac
    done
}

P () {  # _P_rompt user for input
    if [ $1 != '__EMPTY__' ]; then
        USER_INPUT=$1
        return
    fi
    while true; do
            read -p "Please type the $2... " USER_INPUT
        case $USER_INPUT in
            [abcdefghijklmnopqrstuvwxyz]+([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.]) ) echo; break;;
            * ) echo "Please type the $2! "; echo;;
        esac
    done
}

N () {  # prompt user for _N_umeric input
    if [ $1 != '__EMPTY__' ]; then
        USER_INPUT=$1
        return
    fi
    while true; do
            read -p "Please type the $2... " USER_INPUT
        case $USER_INPUT in
            [0123456789]+([0123456789.]) ) echo; break;;
            * ) echo "Please type the $2! "; echo;;
        esac
    done
}

D () {  # prompt user for input w/ _D_efault value
    if [ $1 != '__EMPTY__' ]; then
        USER_INPUT=$1
        return
    fi
    while true; do
            read -p "Please type the $2, or press <ENTER> for $3... " USER_INPUT
        case $USER_INPUT in
            [abcdefghijklmnopqrstuvwxyz]+([abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_.]) ) echo; break;;
            '' ) echo; USER_INPUT=$3; break;;
            * ) echo "Please type the $2, or press <ENTER> for $3! "; echo;;
        esac
    done
}

S () {  # _S_udo command
    B sudo $@
}

B () {  # _B_ash command
    echo '$' "$@"
    while true; do
        read -p 'Run above command, yes or no?  [yes] ' -n 1 PROMPT_INPUT
        case $PROMPT_INPUT in
            n|N ) echo; echo; return;;
            y|Y ) echo; break;;
            '' ) break;;
            * ) echo;;
        esac
    done
    #    bash -xc " \  # -x replaced w/ echo above
    bash -c " ${01} ${02} ${03} ${04} ${05} ${06} ${07} ${08} ${09} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} \
        ${20} ${21} ${22} ${23} ${24} ${25} ${26} ${27} ${28} ${29} ${30} ${31} ${32} ${33} ${34} ${35} ${36} ${37} ${38} ${39} \
        ${40} ${41} ${42} ${43} ${44} ${45} ${46} ${47} ${48} ${49} ${50} ${51} ${52} ${53} ${54} ${55} ${56} ${57} ${58} ${59} \
        ${60} ${61} ${62} ${63} ${64} ${65} ${66} ${67} ${68} ${69} ${70} ${71} ${72} ${73} ${74} ${75} ${76} ${77} ${78} ${79} \
        ${80} ${81} ${82} ${83} ${84} ${85} ${86} ${87} ${88} ${89} ${90} ${91} ${92} ${93} ${94} ${95} ${96} ${97} ${98} ${99} "
    echo
}
#B echo DUMMY COMMAND $MENU_CHOICE 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49

echo  '    [[[<<< LAMP Installer Script >>>]]]'
echo  '          [[[<<< Main Menu >>>]]]'
echo

echo  '        <<< LOCAL CLI SECTIONS >>>'
echo \ '0. [[[        LINUX, CONFIGURE OPERATING SYSTEM USERS ]]]'
echo \ '1. [[[        LINUX, CONFIGURE CLOUD NETWORKING ]]]'
echo \ '2. [[[ UBUNTU LINUX, FIX BROKEN SWAP DEVICE ]]]'
echo \ '3. [[[ UBUNTU LINUX, FIX BROKEN LOCALE ]]]'
echo \ '4. [[[ UBUNTU LINUX, INSTALL EXPERIMENTAL UBUNTU SDK BEFORE OTHER PACKAGES ]]]'
echo \ '5. [[[ UBUNTU LINUX, UPGRADE ALL OPERATING SYSTEM PACKAGES ]]]'
echo \ '6. [[[ UBUNTU LINUX, INSTALL BASE CLI OPERATING SYSTEM PACKAGES ]]]'
echo \ '7. [[[ UBUNTU LINUX, INSTALL & TEST CLAMAV ANTI-VIRUS ]]]'
echo \ '8. [[[        LINUX, INSTALL LAMP UNIVERSITY TOOLS ]]]'
echo \ '9. [[[ UBUNTU LINUX, INSTALL HEIRLOOM TOOLS (including bdiff) ]]]'
echo  '10. [[[ UBUNTU LINUX, INSTALL BROADCOM B43 WIFI ]]]'
echo  '11. [[[ UBUNTU LINUX, PERFORMANCE BENCHMARKING ]]]'
echo

echo  '        <<< LOCAL GUI SECTIONS >>>'
echo  '12. [[[ UBUNTU LINUX, INSTALL BASE GUI OPERATING SYSTEM PACKAGES ]]]'
echo  '13. [[[ UBUNTU LINUX, INSTALL EXTRA GUI OPERATING SYSTEM PACKAGES ]]]'
echo  '14. [[[ UBUNTU LINUX, INSTALL XPRA ]]]'
echo  '15. [[[ UBUNTU LINUX, INSTALL VIRTUALBOX GUEST ADDITIONS ]]]'
echo  '16. [[[ UBUNTU LINUX, FIX BROKEN SCREENSAVER ]]]'
echo  '17. [[[ UBUNTU LINUX, CONFIGURE XFCE WINDOW MANAGER ]]]'
echo

echo  '         <<< SERVICE SECTIONS >>>'
echo  '18. [[[ UBUNTU LINUX,   INSTALL NFS ]]]'
echo  '19. [[[ UBUNTU LINUX,   INSTALL APACHE & MOD_PERL ]]]'
echo  '20. [[[ APACHE,         CONFIGURE DOMAIN(S) ]]]'
echo  '21. [[[ UBUNTU LINUX,   INSTALL MYSQL & PHPMYADMIN ]]]'
echo  '22. [[[ APACHE & MYSQL, CONFIGURE PHPMYADMIN ]]]'
echo  '23. [[[ UBUNTU LINUX,   INSTALL WEBMIN ]]]'
echo  '24. [[[ UBUNTU LINUX,   INSTALL POSTFIX ]]]'
echo  '25. [[[ UBUNTU LINUX,   INSTALL NON-LATEST PERL CATALYST ]]]'
echo  '26. [[[ UBUNTU LINUX,   INSTALL PERL CPANM & LOCAL::LIB ]]]'
echo  '27. [[[ UBUNTU LINUX,   INSTALL HAND-COMPILED PERL, OR PERLBREW & CPANMINUS ]]]'
echo  '28. [[[ PERL CATALYST,  INSTALL TUTORIAL FROM CPAN ]]]'
echo  '29. [[[ UBUNTU LINUX,   INSTALL PERL CATALYST SHINYCMS PREREQUISITES ]]]'
echo  '30. [[[ PERL CATALYST,  INSTALL SHINYCMS FROM GITHUB & LATEST CATALYST FROM CPAN ]]]'
echo  '31. [[[ PERL CATALYST,  INSTALL RAPIDAPP FROM GITHUB & LATEST CATALYST FROM CPAN ]]]'
echo  '32. [[[ PERL CATALYST,  CHECK VERSIONS ]]]'
echo

while true; do
    read -p 'Please type your chosen main menu section number, or press <ENTER> for 0... ' MENU_CHOICE
    case $MENU_CHOICE in
        [0123456789]|[12][0123456789]|3[012] ) echo; break;;
        '' ) echo; MENU_CHOICE=0; break;;
        * ) echo 'Please choose a section number from the menu!'; echo;;
    esac
done

CURRENT_SECTION=0


echo  '          [[[<<< Machine Menu >>>]]]'
echo
echo \ '0. [[[      NEW MACHINE; SERVER; REMOTE CLOUD HOST ]]]'
echo \ '1. [[[ EXISTING MACHINE; CLIENT; LOCAL USER SYSTEM ]]]'
echo

while true; do
    read -p 'Please type your machine menu choice number, or press <ENTER> for 0... ' MACHINE_CHOICE
    case $MACHINE_CHOICE in
        [01] ) echo; break;;
        '' ) echo; MACHINE_CHOICE=0; break;;
        * ) echo 'Please choose a number from the menu!'; echo;;
    esac
done

# ALL VARIABLES
EDITOR='__EMPTY__'
USERNAME='__EMPTY__'
IP_ADDRESS='__EMPTY__'
DOMAIN_NAME='__EMPTY__'

if [ $MENU_CHOICE -le 0 ]; then
    echo '0. [[[ LINUX, CONFIGURE OPERATING SYSTEM USERS ]]]'
    echo
    if [ $MACHINE_CHOICE -eq 0 ]; then
        echo '0. [[[ NEW MACHINE; SERVER; REMOTE CLOUD HOST ]]]'
        echo '[ Reset root Password ]'
        S passwd  # NEED FIX: disable root account???
        echo '[ Remove Default User ]'
        S userdel user
        S rm -Rf /home/user
        echo '[ Create New User ]'
        P $USERNAME 'new username to be created'
        USERNAME=$USER_INPUT
        S useradd $USERNAME
        S passwd $USERNAME
        S cp -a /etc/skel /home/$USERNAME
        S chown -R $USERNAME.$USERNAME /home/$USERNAME
        S chmod -R go-rwx /home/$USERNAME
        S chsh -s /bin/bash $USERNAME
        echo "[ Manually Add $USERNAME To User Group sudo, Allows Running root Commands (Like update-manager) Via sudo In xpra ]"
        D $EDITOR 'preferred text editor' 'vi'
        EDITOR=$USER_INPUT
        S $EDITOR /etc/group
        echo "[ Take Note Of IP Address For Use On Existing Machine ]"
        B ifconfig
        C "Please Run LAMP Installer Section $CURRENT_SECTION On Existing Machine Now..."
    elif [ $MACHINE_CHOICE -eq 1 ]; then
        echo '1. [[[ EXISTING MACHINE; CLIENT; LOCAL USER SYSTEM ]]]'
        C "Please Run LAMP Installer Section $CURRENT_SECTION On New Machine First..."
        P $USERNAME "new machine's user name"
        USERNAME=$USER_INPUT
        N $IP_ADDRESS "new machine's IP address (ex: 123.145.167.189)"
        IP_ADDRESS=$USER_INPUT
        P $DOMAIN_NAME "new machine's fully-qualified domain name (ex: domain.com OR subdomain.domain.com)"
        DOMAIN_NAME=$USER_INPUT
        echo "[ Manually Add New Machine IP Address & Domain Name ]"
        echo "[ Copy Data From The Next Line ]"
        echo $IP_ADDRESS $DOMAIN_NAME
        echo
        D $EDITOR 'preferred text editor' 'vi'
        EDITOR=$USER_INPUT
        S $EDITOR /etc/hosts
        echo "[ Enable Passwordless SSH ]"
        echo "[ Do Not Re-Run ssh-keygen If Already Done In The Past ]"
        B ssh-keygen
        B ssh-copy-id $USERNAME@$DOMAIN_NAME
        echo "[ You May Be Prompted Once To Unlock Keyring, Passwordless Thereafter ]"
        B ssh $USERNAME@$DOMAIN_NAME
        B ssh $USERNAME@$DOMAIN_NAME
        echo "[ Copy Run Commands & Config Files To New Machine: bash, vi, git ]"
        B scp ~/.bashrc ~/.vimrc ~/.gitconfig $DOMAIN_NAME:~/
    fi
fi

CURRENT_SECTION=$((CURRENT_SECTION+1))

if [ $MENU_CHOICE -le 1 ]; then
    echo '1. [[[ LINUX, CONFIGURE CLOUD NETWORKING ]]]'
    echo
    if [ $MACHINE_CHOICE -eq 0 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On Existing Machine First..."
        echo
        D $EDITOR 'preferred text editor' 'vi'
        EDITOR=$USER_INPUT
    elif [ $MACHINE_CHOICE -eq 1 ]; then
        P $DOMAIN_NAME "new machine's fully-qualified domain name (ex: domain.com OR subdomain.domain.com)"
        DOMAIN_NAME=$USER_INPUT
        B scp /etc/hosts $DOMAIN_NAME:/tmp/hosts
        C "Please Run LAMP Installer Section $CURRENT_SECTION On New Machine Now..."
    fi




# CLOUD MACHINE
$ mv /tmp/hosts /etc/hosts
$ vi /etc/hosts  # modify localhost entry, public entry if present
    127.0.1.1       SUBDOMAIN_OR_SOMEDOMAIN  # === EDIT THIS LINE TO BE YOUR LOCAL HOSTNAME ===
    # === REMOVE LOCAL HOSTNAME IF APPEARING BELOW ===
    XXX.YYY.ZZZ.YYY                  SUBDOMAIN.SOMEDOMAIN.COM  # godaddy DNS A record
$ vi /etc/hostname  # enter real dot-separated FQDN registered w/ godaddy etc, or single word if no real FQDN
$ vi /etc/network/interfaces  # append following
    dns-nameservers 8.8.8.8 8.8.4.4
$ reboot
$ cat /etc/resolv.conf  # confirm following
    nameserver 8.8.8.8
    nameserver 8.8.4.4
# CHEAT!!!
    mv /tmp/hosts /etc/hosts; vi /etc/hosts; vi /etc/hostname; vi /etc/network/interfaces; reboot
$ cat /etc/resolv.conf  # confirm following
    nameserver 8.8.8.8
    nameserver 8.8.4.4



fi

CURRENT_SECTION=$((CURRENT_SECTION+1))

if [ $MENU_CHOICE -le 2 ]; then
    echo '2. [[[ UBUNTU LINUX, FIX BROKEN SWAP DEVICE ]]]'
    echo
    if [ $MACHINE_CHOICE -eq 0 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On Existing Machine Now..."
    elif [ $MACHINE_CHOICE -eq 1 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On New Machine First..."
    fi
fi

CURRENT_SECTION=$((CURRENT_SECTION+1))

if [ $MENU_CHOICE -le 3 ]; then
    echo '3. [[[ UBUNTU LINUX, FIX BROKEN LOCALE ]]]'
    echo
    if [ $MACHINE_CHOICE -eq 0 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On Existing Machine Now..."
    elif [ $MACHINE_CHOICE -eq 1 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On New Machine First..."
    fi
fi

CURRENT_SECTION=$((CURRENT_SECTION+1))

if [ $MENU_CHOICE -le 4 ]; then
    echo '4. [[[ UBUNTU LINUX, INSTALL EXPERIMENTAL UBUNTU SDK BEFORE OTHER PACKAGES ]]]'
    echo
    if [ $MACHINE_CHOICE -eq 0 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On Existing Machine Now..."
    elif [ $MACHINE_CHOICE -eq 1 ]; then
        C "Please Run LAMP Installer Section $CURRENT_SECTION On New Machine First..."
    fi
fi

CURRENT_SECTION=$((CURRENT_SECTION+1))