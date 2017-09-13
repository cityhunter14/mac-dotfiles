#!/bin/bash

# 自动安装VSCODE的插件
# Usage:
# installVscodeExtensions.sh extensionListFilePath

showUsage()
{
    echo "Usage:"
    echo "installVscodeExtensions.sh extensionListFilePath"
}

if [ $# -ne 1 ]; then
    showUsage
    exit 1
elif [ ! -f $1 ]; then
    echo "Please check VS Code Extension List file \"$1\""
    exit 1
else
    cat $1 | xargs -n 1 code --install-extension
fi

exit 0