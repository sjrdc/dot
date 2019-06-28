
alias ll='l -ltr'
alias lh='ll -h'
alias lll='l -lF'
alias l='ls --color=auto'

alias npp='/c/Program\ Files\ \(x86\)/Notepad++/notepad++.exe'
alias maek='make'

alias rd='\rm -rf'
alias ..='cd ..'

# handy function to make folder and change to it directly
function ccd ()
{
  mkdir $1
  cd $1
}
