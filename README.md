# vimrm
---

Archivos de configuración para [VIM](http://www.vim.org/)

Es una personalización del repositorio de vim [yadr](http://skwp.github.io/dotfiles/)

##### Notas generales:
Para modificar los directorios de instalación, si hemos instalado vimrm en otro directorio o queremos que los bundles obtenidos se guarden en otro lugar, modificar los directorios en el archivo vim/.vimrc.before

## Instalación en Debian

##### Requisitos:
Instalar [git](https://git-scm.com/book/es/v1/Empezando-Instalando-Git#Instalando-en-Linux), [ctags](http://ctags.sourceforge.net/), [curl](https://curl.haxx.se/), [nodejs](https://nodejs.org/es/) y [SilverSearcher](https://blog.kowalczyk.info/software/the-silver-searcher-for-windows.html):
```
sudo apt-get install git exuberant-ctags curl nodejs silversearcher-ag
```

##### Instalación:
Clonar el repositorio:
```
git clone --recursive https://github.com/ruben2m/vimrm.git ~/.vimrm
```

Enlazamos el archivo .vimrc y la carpeta .vim
```
ln -s ~/.vimrm/vim ~/.vim
ln -s ~/.vimrm/vim/vimrc ~/.vimrc
```

Para la gestión de los plugins se utiliza [Vundle](https://github.com/VundleVim/Vundle.vim), por lo que abrimos vim (nos van a aparecer una serie de errores, los obviamos) y ejecutamos:
```
:PluginInstall
```

##### Compilar [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):
En mi caso necesito soporte semántico para C, typescript, javascript, por ahora. Para ello tenemos que instalar previamente nodeJS y npm como se ha especificado en requisitos. A continuación instalamos typescript para nodejs y compilamos YouCompleteMe: 
```
sudo npm install -g typescript
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --tern-completer
```

## Instalación en Windows

##### Requisitos:
La mejor opción para instalar los requisitos (la más sencilla) es instalar [Chocolatey para Windows](https://chocolatey.org/) ya que se encarga de gestionar además, el PATH de Windows.
```
C:\> choco install -y git
C:\> choco install -y ctags
C:\> choco install -y curl
C:\> choco install -y nodejs.install
C:\> choco install -y python2
C:\> choco install -y cmake.install
C:\> choco install -y ag
```
Después de cerrar y abrir el terminal para que se actualice el PATH, se puede comprobar si se ha instalado bien:
```
C:\> git --version
C:\> ctags --version
...
```

##### Instalación:
Clonar el repositorio:
```
git clone https://github.com/ruben2m/vimrm.git %HOMEPATH%/vimrm
```

En Windows es necesario copiar el contenido del directorio `%HOMEPATH%/vimrm/vim` en `%HOMEPATH%/vimfiles`, y el archivo `%HOMEPATH%/vimrm/vim/_vimrc` sobreescribiendo `%HOMEPATH%/_vimrc`.

¡¡¡Importante!!! Por ahora es necesario modificar este archivo _vimrc cambiando los directorios donde se encuentra la instalación. TODO cambiarlo por %HOMEPATH%

Para la gestión de los plugins se utiliza [Vundle](https://github.com/VundleVim/Vundle.vim), por lo que abrimos vim y ejecutamos:
```
:PluginInstall
```

##### Compilar [YouCompleteMe](https://github.com/Valloric/YouCompleteMe):
En mi caso necesito soporte semántico para C, typescript, javascript, por ahora. Para ello tenemos que instalar previamente nodeJS y npm como se ha especificado en requisitos. 

Como explica en la página oficial la [instalación para windows](https://github.com/Valloric/YouCompleteMe#windows) requiere instalar Python2 o Python3, cmake y [Visual Studio](https://www.visualstudio.com/downloads/). Tanto Python2 como cmake se han instalado en requisitos. Para Visual Studio elegiremos la opción Desarrollo de Aplicaciones de escritorio en c++ en la pestaña de Carga de Trabajo.

A continuación instalamos typescript para nodejs y compilamos YouCompleteMe: 
```
npm install -g typescript
cd %HOMEPATH%/vimfiles/bundle/YouCompleteMe
install.py --clang-completer --tern-completer
```
