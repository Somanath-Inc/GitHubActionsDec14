 #!/bin/bash
if [ $# -ne 1 ];
then
    echo "Please Input the path to check"
    exit 1
fi
directory=$1

function iterate() {
  local dir="$1"

  for file in "$dir"/*; do
    if [ -f "$file" ]; then
      echo $file >> listoffiles.txt
      echo "\n" >> listoffiles.txt
    fi

    if [ -d "$file" ]; then
      iterate "$file"
    fi
  done
}

iterate "$directory"
pwd
cat listoffiles.txt