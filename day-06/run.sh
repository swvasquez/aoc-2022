#!/usr/bin/env bash

# Assumes characters are 1 byte
perl -ne '
    BEGIN{
        $/=\1;
        @window = ()
    }
    if (push(@window, $_) == 4){
        %chars = map { $_ => 1 } @window;
        if (scalar keys %chars == 4){
            print $., "\n";
            exit 0
        }else{
            @window = splice @window, -3;
        }
    }
' input.txt

# Assumes characters are 1 byte
perl -ne '
    BEGIN{
        $/=\1;
        @window = ()
    }
    if (push(@window, $_) == 14){
        %chars = map { $_ => 1 } @window;
        if (scalar keys %chars == 14){
            print $., "\n";
            exit 0
        }else{
            @window = splice @window, -13;
        }
    }
' input.txt