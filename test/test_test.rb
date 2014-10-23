#!/usr/bin/env	ruby

require 'helper'
require 'tmpdir'

class TestFixer < Test::Unit::TestCase

  context 'fixer' do

    setup do
      @fixer = Fixer.new
      @tmpdir = Dir.mktmpdir
    end

    teardown do
      cmd = "rm -rf #{@tmpdir}"
      `#{cmd}`
    end

    should 'fix pair of fastq files' do
      left = File.join(File.dirname(__FILE__), 'left.fq')
      right = File.join(File.dirname(__FILE__), 'right.fq')
      prefix = "#{@tmpdir}/test"
      @fixer.run left, right, prefix
      assert File.exist?("#{@tmpdir}/test-fixed.1.fastq")
      assert File.exist?("#{@tmpdir}/test-fixed.2.fastq")
      assert File.exist?("#{@tmpdir}/test-fixed.single.fastq")
      lines = `wc -l #{@tmpdir}/test-fixed.1.fastq`
      assert_equal 876, lines.split(/\s+/).first.to_i
      lines = `wc -l #{@tmpdir}/test-fixed.2.fastq`
      assert_equal 876, lines.split(/\s+/).first.to_i
      assert_equal 762, File.size("#{@tmpdir}/test-fixed.single.fastq")

    end

  end
end
