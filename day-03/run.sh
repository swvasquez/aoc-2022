#!/usr/bin/env bash

perl -ane '
    BEGIN {
        sub halve{
            ($x) = @_; 
            $half = length($x)/2;
            return unpack("A".$half."A".$half, "$x");
        };
        sub chars{
            ($x) = @_; 
            return map { $_ => 1 } split (//, $x);
        };
        sub priority{
            ($x) = @_;
            $base = 0;
            if($x ne lc($x)){$base = 26;}
            return ord(lc($x)) - 96 + $base;
        };
        sub intersection{
            %x = %{@_[0]};
            %y = %{@_[1]};
            return grep { exists $x{$_} } keys %y;
        }
        $score = 0;
    }
    if(@F){
       @halves = &halve(@F[0]);
       %half1 = &chars(@halves[0]);
       %half2 = &chars(@halves[1]);
       $score = $score + &priority(&intersection(\%half1, \%half2));
    }
    END {
        print $score, "\n";

    }
' input.txt

# Assumes all batches contain 3 elements
perl -ane '
    BEGIN {
        sub chars{
            ($x) = @_; 
            return map { $_ => 1 } split (//, $x);
        };
        sub priority{
            ($x) = @_;
            $base = 0;
            if($x ne lc($x)){$base = 26;}
            return ord(lc($x)) - 96 + $base;
        };
        sub intersection{
            %x = &chars(@_[0]);
            %y = &chars(@_[1]);
            %z = &chars(@_[2]);
            return grep {exists $z{$_}} grep {exists $x{$_}} keys %y;
        }
        @batch = ();
        $score = 0;
    }
    if(@F){
        $size = push(@batch, @F[0]);
        if($size % 3 == 0){
            @overlap = &intersection(@batch);
            $score = $score + &priority(@overlap[0]);
            @batch = ();
        }
    } 
    END {
        print $score, "\n";

    }
' input.txt