#!/usr/bin/env ruby
puts ARGV[0].scan(/\[from:(\S+)\] \[to:(\S+)\] \[flags:(\S+)\]/).map { |match| match.join(',') }
