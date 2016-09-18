# cocoVim
个人的vim配置项目

主要在exvim的结构上进行了修改，所有的配置在文件.vimrc.plugins里,只需要克隆下项目到本地，2行简单配置即可使用

#install
##Source cocoVim to your current Vim

1.Suppose you download/update cocoVim in the path ~/cocoVim. 

2.Edit your vimrc file, default is ~/.vimrc in Mac/Linux and C:\Users\your_name\_vimrc in Windows.

3.In your vimrc file, just write:

<pre><code>let g:exvim_custom_path='~/cocoVim/'
source ~/cocoVim/.vimrc
</code></pre>

##其他一些增强功能可参照
http://exvim.github.io/downloads/



# cocoVim Simple版更吸引人

只支持命令行下vim，插件更少，更轻量级,但是包含了最基本的配置。

#install

clone the project to your local `~/cocoVim`

add `source ~/cocoVim/simple/.vimrc` in `~/.vimrc`

open vim, and `:PluginInstall` install plugins

