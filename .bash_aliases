alias hello='echo "Hello world!"'
alias mqtt='python /home/fverstra/countit/countitOF/utils/mqtt-utils.py'
alias countit='/home/fverstra/countit/countitOF/bin/countitOF offline'
alias hi='echo "Hello mother fuckers"'
alias clima='curl wttr.in/buenos_aires'
alias ssh-countit='ssh countit-dev@10.42.0.1'
alias connect-countit='~/countit/countitOF/utils/connect-countit'
alias blue-on='sudo ~/Repository/lchico-utils/Ticks/bluetooth'
alias blue-off='sudo pkill -9 bluetooth;sudo pkill -9 rfcomm'

#Function to extract any file type
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        NAME=${1%.*}
        mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}
