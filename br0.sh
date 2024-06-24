#!/bin/bash

# تثبيت NoMachine على Ubuntu
sudo apt update
sudo apt install -y wget
wget https://download.nomachine.com/download/8.11/Linux/nomachine_8.11.3_4_amd64.deb
sudo dpkg -i nomachine_8.11.3_4_amd64.deb
sudo apt install -y -f

# تعريف الألوان للرسائل
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# تعريف الألوان البارزة
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# وظيفة للحصول على معلومات الهوست والبورت
get_host_port_info() {
    CONTAINER_NAME=$1
    HOST=$(docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $CONTAINER_NAME)
    PORTS=$(docker port $CONTAINER_NAME | awk '{print $3}')
    echo "Host: $HOST"
    echo "Port: $PORTS"
}

# عرض شاشة الترحيب
echo -e "${Cyan}    +${Yellow}--------------------------------------------------------------------------------------------------------------------------${Cyan}+"
echo -e "${Yellow}     |                                                                                                                        |"
echo -e "     |${Green}     ██████╗ ███╗   ██╗██╗     ██╗███╗   ██╗███████╗    ${Red}██████${Black}╗${Red} ██████${Black}╗${Red}  ██████${Black}╗${Red} ██${Black}╗${Red}    ██${Black}╗${Red}███████${Black}╗${Red}███████${Black}╗${Red}██████${Black}╗  ${Yellow}    |"
echo -e "     |${Green}    ██╔═══██╗████╗  ██║██║     ██║████╗  ██║██╔════╝    ${Red}██${Black}╔══${Red}██${Black}╗${Red}██${Black}╔══${Red}██${Black}╗${Red}██${Black}╔═══${Red}██${Black}╗${Red}██${Black}║${Red}    ██${Black}║${Red}██${Black}╔════╝${Red}██${Black}╔════╝${Red}██${Black}╔══${Red}██${Black}╗${Red}    ${Yellow} |"
echo -e "     |${Green}    ██║   ██║██╔██╗ ██║██║     ██║██╔██╗ ██║█████╗      ${Red}██████${Black}╔╝${Red}██████${Black}╔╝${Red}██${Black}║   ${Red}██${Black}║${Red}██${Black}║ ${Red}█${Black}╗ ${Red}██${Black}║${Red}███████${Black}╗${Red}█████${Black}╗  ${Red}██████${Black}╔╝    ${Yellow} |"
echo -e "     |${BGreen}    ██║   ██║██║╚██╗██║██║     ██║██║╚██╗██║██╔══╝      ${BRed}██${Black}╔══${BRed}██${Black}╗${BRed}██${Black}╔══${BRed}██${Black}╗${BRed}██${Black}║   ${Red}██${Black}║${BRed}██${Black}║${BRed}███${Black}╗${BRed}██${Black}║╚════${BRed}██${Black}║${BRed}██${Black}╔══╝  ${BRed}██${Black}╔══${BRed}██${Black}╗    ${Yellow} |"
echo -e "     |${BGreen}    ╚██████╔╝██║ ╚████║███████╗██║██║ ╚████║███████╗    ${BRed}██████${Black}╔╝${BRed}██${Black}║${BRed}  ██${Black}║╚${BRed}██████${Black}╔╝╚${BRed}███${Black}╔${BRed}███${Black}╔╝${BRed}███████${Black}║${BRed}███████${Black}╗${BRed}██${Black}║  ${BRed}██${Black}║    ${Yellow} |"
echo -e "     |${Green}     ╚═════╝ ╚═╝  ╚═══╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝    ${Black}╚═════╝ ╚═╝  ╚═╝ ╚═════╝  ╚══╝╚══╝ ╚══════╝╚══════╝╚═╝  ╚═╝ ${Yellow}    |"
echo -e "     |                                                                                                               ${BCyan} BETA${Yellow}    |"
echo -e "     |                                                                                                                        |"
echo -e "${Cyan}    +${Yellow}--------------------------------------------------------------------------------------------------------------------------${Cyan}+${Yellow}"
echo -e "                                     |${BRed} Online Browser ${BYellow}by${BGreen} Hamza Hammouch${Cyan} powered by${BPurple} linuxserver${Yellow} |"
echo -e "                                     ${Cyan}+${Yellow}--------------------------------------------------------${Cyan}+"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Yellow} ID ${White} |                   ${BPurple}   Browser Name                       ${White}   |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo -e "${White}     | ${Red}[${Yellow}01${Red}]${White} |$Green Install Chromium${White}                                           |"
echo -e "${White}     | ${Red}[${Yellow}02${Red}]${White} |$Green Install Firefox${White}                                            |"
echo -e "${White}     | ${Red}[${Yellow}03${Red}]${White} |$Green Install Opera${White}                                              |"
echo -e "${White}     | ${Red}[${Yellow}04${Red}]${White} |$Green Install Mullvad Browser${White}                                    |"
echo -e "${White}     | ${Red}[${Yellow}05${Red}]${White} |$Green Install Microsoft Edge${White}                                      |"
echo -e "${Yellow}     +${White}-------------------------------------------------------------------${Yellow}+"
echo ""
echo -e -n "$White    ${Red} [${Cyan}!Note:${Red}]$White If your choice is Chromium type $Green 1${White} not ${Red}01$White and the same principle applies to other browsers "
echo ""

# اختيار المتصفح والتثبيت
echo -e -n "$White    ${Red} [${Cyan}!${Red}]$White Type the$BRed ID$White "
read -p "of your choice : " choice
case $choice in
    1)
        echo "Installing Chromium..."
        docker run -d \
            --name=chromium \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /chromium:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/chromium:latest

        # احصل على معلومات الهوست والبورت
        echo "Waiting for Chromium to start..."
        sleep 10
        get_host_port_info chromium
        ;;
    2)
        echo "Installing Firefox..."
        docker run -d \
            --name=firefox \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /firefox:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/firefox:latest

        # احصل على معلومات الهوست والبورت
        echo "Waiting for Firefox to start..."
        sleep 10
        get_host_port_info firefox
        ;;
    3)
        echo "Installing Opera..."
        docker run -d \
            --name=opera \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /opera:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/opera:latest

        # احصل على معلومات الهوست والبورت
        echo "Waiting for Opera to start..."
        sleep 10
        get_host_port_info opera
        ;;
    4)
        echo "Installing Mullvad Browser..."
        docker run -d \
            --name=mullvad-browser \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /mullvad-browser:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/mullvad-browser:latest

        # احصل على معلومات الهوست والبورت
        echo "Waiting for Mullvad Browser to start..."
        sleep 10
        get_host_port_info mullvad-browser
        ;;
    5)
        echo "Installing Microsoft Edge..."
        docker run -d \
            --name=edge \
            --security-opt seccomp=unconfined \
            -e PUID=1000 \
            -e PGID=1000 \
            -e TZ=Etc/UTC \
            -p 3000:3000 \
            -p 3001:3001 \
            -v /edge:/config \
            --shm-size="7gb" \
            --restart unless-stopped \
            ghcr.io/linuxserver/edge:latest

        # احصل على معلومات الهوست والبورت
        echo "Waiting for Microsoft Edge to start..."
        sleep 10
        get_host_port_info edge
        ;;
    *)
        echo "Invalid choice. Please enter a number from 1 to 5."
        exit 1
        ;;
esac

# معلومات إضافية وتنظيف الشاشة
clear
echo ""
echo -e -n "$White    ${Red} [${Green} ✔ ${Red}]$White Browser installation completed successfully ( •̀ ω •́ )✧"
echo ""
echo ""
echo -e "    ${Red} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${Blue}⢀⣠⣴⣾⣿⣿⣿⣶⣄⡀⠀"
echo -e "    ${Red} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${Blue}⣀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⡄"
echo -e "    ${Red} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${Blue}⢀⣠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷"
echo -e "    ${Red} ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡤${Blue}⠾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠉⠙⣿⣿⡿"
echo -e "    ${Red} ⠀⠀⠀⠀⠀⢀⣠⠶⠛⠁⠀⠀${Blue}⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⣄⣠⣿⡿⠁"
echo -e "    ${Red} ⢀⡾⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀${Blue}⠸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⠀⠀"
echo -e "    ${Red} ⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⡀${Blue}⠙⢿⣿⡿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "    ${Red} ⣿⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⡿⠟⢋⣤⠶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "    ${Red} ⠘⣧⡀⠀⢰⣿⣶⣿⠿⠛⣩⡴⠞⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "    ${Red} ⠀⠈⠛⠦⣤⣤⣤⡤⠖⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
echo -e "${White}"
echo ""
echo -e "Host and Port Information:"
case $choice in
    1)
        echo -e "${Green}Chromium:"
        ;;
    2)
        echo -e "${Green}Firefox:"
        ;;
    3)
        echo -e "${Green}Opera:"
        ;;
    4)
        echo -e "${Green}Mullvad Browser:"
        ;;
    5)
        echo -e "${Green}Microsoft Edge:"
        ;;
esac
echo ""
get_host_port_info "$CONTAINER_NAME"
echo ""
