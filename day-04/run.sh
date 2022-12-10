#!/usr/bin/env bash

perl -ane '
    BEGIN {
        $score = 0;
    }
    s/[[:punct:]]/ /g;
    chomp;
    @x = split(" ", $_);
    if(@x[0] == @x[2] || @x[1] == @x[3]){
        $score++;
    }else{
        @ranges = ([@x[0,1]], [@x[2,3]]);
        @ranges = sort {$a->[0] <=> $b->[0]}  @ranges;
        if($ranges[0][1] >= $ranges[1][1]){$score++;}
    }
    END {
        print $score, "\n";
    }
' input.txt

perl -ane '
    BEGIN {
        $score = 0;
    }
    s/[[:punct:]]/ /g;
    chomp;
    @x = split(" ", $_);
    if(@x[0] == @x[2] || @x[1] == @x[3]){
        $score++;
    }else{
        @ranges = ([@x[0,1]], [@x[2,3]]);
        @ranges = sort {$a->[0] <=> $b->[0]}  @ranges;
        if($ranges[0][1] >= $ranges[1][0]){$score++;}
    }
    END {
        print $score, "\n";
    }
' input.txt