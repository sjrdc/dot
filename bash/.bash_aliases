
alias ll='l -ltr'
alias lh='ll -h'
alias lll='l -lF'
alias l='ls --color=auto'

alias maek='make'

alias mvdcm='mkdir dcm; mv *.dcm dcm;'
alias rd='\rm -rf'
alias ..='cd ..'

# handy function to make folder and change to it directly
function ccd ()
{
  mkdir $1
  cd $1
}