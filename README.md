emacsntu
========

Get up and running with latest emacs+plugins on Ubuntu

## dependencies installed

+ python-software-properties
+ ppa:ubuntu-elisp/ppa # Latest development release
+ git

## installation
```
curl -L https://github.com/battlemidget/emacsntu/raw/master/emacsntu | perl
```
or

```
wget --no-check-certificate https://github.com/battlemidget/emacsntu/raw/master/emacsntu -O - | perl
```

## running
```
emacs --daemon
emacsclient -nc file.whatever
```

