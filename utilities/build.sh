echo Build a demo zip archive

_FULL_PATH=$(cd -P -- "$(dirname -- "$0")" && pwd -P) && SELF_PATH=$SELF_PATH/$(basename -- "$0" | awk '{ print $NF }')
_DOJO_HOME=$(echo $_FULL_PATH | awk '{ print $1 }') # weirdness with paths, should be able to combine with above

#echo "$_FULL_PATH"
#echo "$_DOJO_HOME"

cd "$_DOJO_HOME"/.. 

dojo_cleanup () 
{
  if [ -f ./builds/dojo.tar.gz ]
  then
    echo "Removing old dojo build"
    rm ./builds/dojo.tar.gz 
  fi
}

dojo_build ()
{
  dojo_cleanup
  tar -chzvf ./builds/dojo.tar.gz ./resources
}

dojo_build

