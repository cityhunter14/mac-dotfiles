# Mac-dotfiles

我的Mac上的配置文件，还包含了我自己写的自动配置工具（shell）。

有一些在Unix／Linux上也可以用。

如果要实现自动化配置，请使用stow.sh。使用方法如下：

    ./stow.sh [配置文件目录名...]

可以指定配置一个或多个软件的配置文件，如果不加参数，
自动配置dotfiles目录下所有软件配置文件。

配置文件list需要手动写到list文件中。
文件名规则为：软件名+Conf.list 例：vimConf.list

注意：.zshrc中的ZSH环境变量的值可能是绝对路径，修改成相对路径以免在新系统中找不到oh-my-zsh的路径。
