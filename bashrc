alias ppv='puppet parser validate'
alias pl='puppet-lint'
# a lot of people say "who's that, it's "
alias pat='puppet agent -t'
# go puppet
alias gop='pushd /etc/puppetlabs/puppet'

# search directories (cd ssl => /etc/puppetlabs/puppet/ssl)
export CDPATH=/etc/puppetlabs:/etc/puppetlabs/puppet:/opt/puppetlabs:/opt/puppetlabs/puppet:/opt/puppetlabs/server:$CDPATH
export PATH=/opt/puppetlabs/bin:/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:$PATH

# validation
function is_ok() {
  if [ $1 == 0 ]; then
    if [[ "$TERM" == *"xterm"* ]] || [[ "$TERM" == *"vt100"* ]]; then
      printf "\033[1mSyntax \033[32;1mOk!\033[0m\n"
    else
      printf "Syntax Ok!\n"
    fi
  else
    if [[ "$TERM" == *"xterm"* ]] || [[ "$TERM" == *"vt100"* ]]; then
      printf "\033[1mSyntax Error!\033[0m\n"
    else
      printf "Syntax Error!\n"
    fi
    return $1
  fi
}

function verb() {
  # validate erb template
  for i in $@
  do
    [ $# -gt 1 ] && printf "$i: "
    erb -P -x -T '-' $i | ruby -c
    is_ok $?
  done
}

function vepp() {
  # validate epp template
  for i in $@
  do
    [ $# -gt 1 ] && printf "$i: "
    puppet epp validate $i
    is_ok $?
  done
}

function vyaml() {
  # validate yaml, use the Ruby yaml library
  for i in $@
  do
    [ $# -gt 1 ] && printf "$i: "
    ruby -ryaml -e "YAML.load_file '$i'"
    is_ok $?
  done
}

function vjson() {
  for i in $@ 
  do
    [ $# -gt 1 ] && printf "$i: "
    ruby -rjson -e "j=File.read('$i'); begin JSON.parse(j); rescue JSON::ParserError => e; print \"#{e}\"; exit 1; end"
    is_ok $?
  done
}

function reyaml() {
  # (re)read yaml file
  # useful to get the yaml library to output the file in a known good format.
  # RBTL - removes your coworkers silly indenting (no printf here, don't want filenames)
  for i in $@
  do
    ruby -ryaml -e "print YAML.load_file('$i').to_yaml"
  done
}

