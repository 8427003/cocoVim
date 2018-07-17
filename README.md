# 一、cocoVim Simple版更吸引人(本人正在使用)

只支持命令行下vim，插件更少，更轻量级，但是包含了最基本的配置。

#install

1. clone the project to your local `~/cocoVim`

2. add `source ~/cocoVim/simple/.vimrc` in `~/.vimrc` if not exist create it first

3. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

4. open vim, and `:PluginInstall` install plugins

5. view .vimrc install Special plugs youcompleteme, tern

screenshot in commond line:

![A screenshot of your package](https://raw.githubusercontent.com/8427003/cocoVim/master/screenshots/cocoVim.png)

# 二、from vim to neovim

 1. 按照neovvim官方文档 brew 安装neovim
 
 2. do as :help nvim-from-vim

## 遇到的问题：
1. E576: Failed to parse ShaDa file: extra bytes in msgpack string at position 3
 
 解：删除~/.viminfo（与以前的vim共用估计格式不兼容，故删除重新生成文件）
    （https://github.com/neovim/neovim/issues/3469#issuecomment-148897966）
    
2. youcomelateme，提示python....


 解：需要安装provider-python 
 `pip2 install --user --upgrade neovim`
 （https://neovim.io/doc/user/provider.html#provider-python）
