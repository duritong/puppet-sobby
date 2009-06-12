# manifests/init.pp - manage onak stuff
# Copyright (C) 2009 admin@immerda.ch
# GPLv3

class sobby {
    case $operatingsystem {
        default: { include onak::base }
    }
}
