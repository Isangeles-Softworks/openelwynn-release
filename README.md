## Introduction
This repository contains the release scripts for [OpenElwynn](https://github.com/isangeles-softworks/openelwynn).

The scritps are used to prepare and release the game builds for different platforms.

Release script builds the game from latest sources, creates release package, and uploads the package to the [official release server](https://my.opendesktop.org/s/H4w5fXbfW7ZETsk).

## Usage
To perform the release you need to obtain all dependecies required to build [OpenElwynn](https://github.com/isangeles-softworks/openelwynn).

To create a release, pull the content of the repository and run the script for your platform.

You need to specify the credentials with the write access to the release server as first two arguments of the script.

For Linux/macOS:
```
./release user password
```

For Windows(using PowerShell):
```
./release.ps1 -login user -pass password
```
Note that you may need to change execution policy first:
```
Set-ExecutionPolicy RemoteSigned
```

After that, the released game package will be available [here](https://my.opendesktop.org/s/H4w5fXbfW7ZETsk).

## Contact
* Isangeles <<ds@isangeles.dev>>

## License
Copyright 2023 Isangeles Softworks <<softworks@isangeles.dev>>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
MA 02110-1301, USA.

