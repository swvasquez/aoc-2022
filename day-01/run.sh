#!/usr/bin/env bash

perl -MList::Util=max,sum -00ane '
    s/\n/ /g;
    $total = sum(@F);
    $max = $total if $max < $total; 
    END {
        print $max."\n" 
    }
' input.txt

perl -MList::Util=sum -00ane '
    BEGIN {
        @top = (-1, -1, -1)
    } 
    s/\n/ /g;
    $total = sum(@F);
    if ($total > $top[0]) {
        @top = ($total, $top[0], $top[1])
    } 
    END {
        print sum(@top),"\n"
    }
' input.txt
