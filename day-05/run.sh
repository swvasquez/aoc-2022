#!/usr/bin/env bash

perl -ne '
    BEGIN {
        $header = 1;
    }
    chomp;
    if (!$_ && $header){
        $header = 0;
    }
    if ($header){
        while ($_ =~ /[[:alpha:]]/g){
            $col = ($-[0] + 3) / 4;
            @singleton = ($&);
            if (exists $diagram{$col}) {
                push(@singleton, @{$diagram{$col}});
            }
            @{$diagram{$col}} = @singleton;
        } 
    }elsif($_){
        ($amount, $src, $dest) = $_ =~ /[0-9]+/g;
        @batch = splice @{$diagram{$src}}, -$amount;
        push(@{$diagram{$dest}}, reverse(@batch));
    }
    END{
        foreach $col (sort keys %diagram){
            print @{$diagram{$col}}[-1];
        }
        print "\n";
    }
' input.txt

# This solution simply removes the reverse call from the above
perl -ne '
    BEGIN {
        $header = 1;
    }
    chomp;
    if (!$_ && $header){
        $header = 0;
    }
    if ($header){
        while ($_ =~ /[[:alpha:]]/g){
            $col = ($-[0] + 3) / 4;
            @singleton = ($&);
            if (exists $diagram{$col}) {
                push(@singleton, @{$diagram{$col}});
            }
            @{$diagram{$col}} = @singleton;
        } 
    }elsif($_){
        ($amount, $src, $dest) = $_ =~ /[0-9]+/g;
        @batch = splice @{$diagram{$src}}, -$amount;
        push(@{$diagram{$dest}}, @batch);
    }
    END{
        foreach $col (sort keys %diagram){
            print @{$diagram{$col}}[-1];
        }
        print "\n";
    }
' input.txt