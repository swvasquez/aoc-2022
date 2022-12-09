#!/usr/bin/env bash

perl -ane '
    BEGIN {
        %val = ('A' => 1,
                'B' => 2,
                'C' => 3);
        %win = ('A' => 'B',
                'B' => 'C',
                'C' => 'A');
        %map = ('X' => 'A',
                'Y' => 'B',
                'Z' => 'C');
        $score = 0;
    }
    if(@F){
        ($play, $response) = @F;
        $response = $map{$response};
        $score = $score + $val{$response};
        if($response eq $win{$play}){
            $score = $score + 6;
        }elsif($response eq $play){
            $score = $score + 3;
        }
    }
    END {
        print $score, "\n"
    }
' input.txt

perl -ane '
    BEGIN {
        %win = ('A' => 'B',
                'B' => 'C',
                'C' => 'A');
        %lose = reverse %win;
        %val = ('A' => 1,
                'B' => 2,
                'C' => 3);
        %map = ('X' => sub{($x) = @_; return $val{$lose{$x}};},
                'Y' => sub{($x) = @_; return $val{$x} + 3;},
                'Z' => sub{($x) = @_; return $val{$win{$x}} + 6;});
        $score = 0;
    }
    if(@F){
        ($play, $response) = @F;
        $score = $score + &{$map{$response}}($play);
    }
    END {
        print $score."\n"
    }
' input.txt
