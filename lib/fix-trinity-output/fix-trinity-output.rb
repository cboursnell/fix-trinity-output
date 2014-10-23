#!/usr/bin/env ruby

class Fixer

  def initialize

  end

  def run left, right, prefix
    leftout = ""
    rightout = ""
    buffersize = 200000
    buffer = 0
    data = {}
    cont = true
    lh = File.open(left)
    rh = File.open(right)
    lout = File.open("#{prefix}-fixed.1.fastq", "w")
    rout = File.open("#{prefix}-fixed.2.fastq", "w")
    count=0
    name1 = lh.readline.chomp rescue nil
    name2 = rh.readline.chomp rescue nil
    while cont
      seq1 = lh.readline rescue nil
      plus1 = lh.readline rescue nil
      quals1 = lh.readline rescue nil
      seq2 = rh.readline rescue nil
      plus2 = rh.readline rescue nil
      quals2 = rh.readline rescue nil

      if name1
        shortname1 = name1[0..-3]
        if data[shortname1]
          leftout << "#{name1}\n#{seq1}+\n#{quals1}"
          rightout << data[shortname1][1]
          buffer+=1
          data.delete(shortname1)
          if buffer>=buffersize
            lout.write leftout
            leftout=""
            rout.write rightout
            rightout=""
            buffer=0
          end
        else
          data[shortname1]=[]
          data[shortname1][0]="#{name1}\n#{seq1}+\n#{quals1}"
        end
      end
      if name2
        shortname2 = name2[0..-3]
        if data[shortname2]
          leftout << data[shortname2][0]
          rightout << "#{name2}\n#{seq2}+\n#{quals2}"
          buffer+=1
          data.delete(shortname2)
          if buffer>=buffersize
            lout.write leftout
            leftout=""
            rout.write rightout
            rightout=""
            buffer=0
          end
        else
          data[shortname2]=[]
          data[shortname2][1]="#{name2}\n#{seq2}+\n#{quals2}"
        end
      end

      name1 = lh.readline.chomp rescue nil
      name2 = rh.readline.chomp rescue nil
      if name1==nil and name2==nil
        cont=false
      end
    end

    lout.write leftout
    rout.write rightout
    lout.close
    rout.close

    File.open("#{prefix}-fixed.single.fastq", "w") do |out|
      data.each do |name, list|
        if list
          if list[0]
            out.write list[0]
          end
          if list[1]
            out.write list[1]
          end
        end
      end
    end

  end
end