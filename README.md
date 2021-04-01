# /home/gasolwu/.vim/

The Vim configuration is used in my daily work. I mainly use Neovim (nightly
build for the treesitter support) but still keep compatibility for Vim in terms of
portability. Because I'm not only a serious developer who code on Apple
machines, but also a system administrator who operates on various unix-like
machines. There are many languages I work with, including, but not limited to,
PHP, Java, C, Python, JavaScript. Hope it might be useful if you speak the same
language too. This Vim configuration isn't meant to make Vim looks like an IDE.
It's optimized for security, efficiency and vim-ish with ♥️.

## Installation

> Don't blindly use someones's configuration

I don't recommend it. Vim is not supposed to be used by that way. Instead, Just
borrow some lines you might be interested in. or if you would like to see how
good is my taste.

    (cd $HOME; git clone https://github.com/Gasol/vimrc .vim)

Only needed when it failed to install some plugins automatically.

    nvim +'call dein#install()' 

## Features

TODO

* Fast startup

  Compares startup time to the minimum config (-u NONE) of Neovim

  ```diff
  -019.621  000.002: --- NVIM STARTED ---
  +394.388  000.002: --- NVIM STARTED ---
  ```

## Leader Key

The `<Space>` bar have chosen to be leader key instead of `,` by default.
Because we don't need additional keystroke for actions like `l` key which only
move the cursor to the next character.

## License

https://gasolwu.mit-license.org/

> The MIT License (MIT)
> 
> Copyright © 2021 Gasol Wu <gasol.wu@gmail.com>
> 
> Permission is hereby granted, free of charge, to any person obtaining a copy
> of this software and associated documentation files (the “Software”), to deal
> in the Software without restriction, including without limitation the rights
> to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> copies of the Software, and to permit persons to whom the Software is
> furnished to do so, subject to the following conditions:
> 
> The above copyright notice and this permission notice shall be included in
> all copies or substantial portions of the Software.
> 
> THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> THE SOFTWARE.
