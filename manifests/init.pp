# manifests/init.pp - manage sobby stuff
# Copyright (C) 2009 admin@immerda.ch
# GPLv3

class sobby {
    case $operatingsystem {
        default: { include sobby::base }
    }
}
