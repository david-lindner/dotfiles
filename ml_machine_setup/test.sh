#!/bin/sh
# for travis to make sure everything works

assert ()
{
  E_PARAM_ERR=98
  E_ASSERT_FAILED=99

  if [ -z "$1" ]  # no argument given
  then
    return $E_PARAM_ERR
  fi

  if [ ! $1 ] 
  then
    echo "Assertion failed:  \"$1\""
    exit $E_ASSERT_FAILED
  fi  
}

PATH="~/bin:PATH"

cd ~
mkdir test
cd test

export TEST='wrong'
echo "export TEST='test'" > .envrc
eval "$(direnv export bash)"
direnv allow .
assert "'$TEST' == 'test'"

nvidia-htop -c

cd ..
rm -r test


