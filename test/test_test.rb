#!/usr/bin/env	ruby

require 'helper'
require 'tmpdir'

class TestFixer < Test::Unit::TestCase

  context 'fixer' do

    setup do
      @fixer = Fixer.new
    end

    teardown do
    end

    should 'fix pair of fastq files' do
      left = File.join(File.dirname(__FILE__), 'left.fq')
      right = File.join(File.dirname(__FILE__), 'right.fq')
      tmpdir = Dir.mktmpdir
      prefix = "#{tmpdir}/test"
      @fixer.run left, right, prefix
      assert File.exist?("#{tmpdir}/test-fixed.1.fastq")
      assert File.exist?("#{tmpdir}/test-fixed.2.fastq")
      assert File.exist?("#{tmpdir}/test-fixed.single.fastq")
      assert_equal 48789, File.size("#{tmpdir}/test-fixed.1.fastq")
      assert_equal 50035, File.size("#{tmpdir}/test-fixed.2.fastq")
      assert_equal 762, File.size("#{tmpdir}/test-fixed.single.fastq")
    end

  end
end
