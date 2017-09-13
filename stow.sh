#!/bin/bash

stowConfig()
{
    # oldPath=`pwd`
    dotFilesPath=~/dotfiles
    confList="Conf.list"

    # 注意：即将删除默认的配置文件！
    echo "Note: the default configuration file is about to be deleted!"
    cat ${1}${confList} | xargs -p -n 1 -I {} rm -rf "$HOME{}"

    # 建立配置文件到dotfiles的链接
    stow -d $dotFilesPath -t ~ --ignore=\.DS_Store $1 

    echo "stow completed!"

}

isPgExist()
{
    pg=`which $1`
    if [ ! -x "$pg" ]; then
        return 1
    fi
    return 0
}

# stowConfig $1
arrPgNames=()
if [ $# -gt 0 ]; then
    arrPgNames=$*
else
    arrPgNames=`ls -p | grep "/$" | sed "s:/::"`
fi
# echo "arrPgNames=$arrPgNames"

for name in $arrPgNames
do
    echo "name=$name"
    if isPgExist $name; then
        stowConfig $name
        echo "Stow $name OK" 
    else
        echo "Program $name not installed."
    fi
done

# a=10
# b=20
# val=`expr $a \* $b`
# echo "a * b : $val"