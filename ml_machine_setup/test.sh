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

cd ~
mkdir test
cd test

export TEST='wrong'
echo "export TEST='test'" > .envrc
eval "$(~/bin/direnv export bash)"
~/bin/direnv allow .
assert "'$TEST' == 'test'"

python ~/nvidia-htop/nvidia-htop -c

cd ..
rm -r test


