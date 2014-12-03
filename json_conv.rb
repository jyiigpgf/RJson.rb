# coding: utf-8
#
#
#

require "json"

unless ARGV.size.eql?(2)
  puts 'please input sourcePath and destPath'
  exit
end

inPath = ARGV[0]
outPath = ARGV[1]

outf = File.open(outPath, 'w')
jsonData = ''
blockData = {}

File.open(inPath, 'r') do |infile|

  blockStart = false
  blockName = ''

  while (line = infile.gets)
    ripLine = line.strip
    if ripLine.start_with?('#') && !ripLine.start_with?('#{')
    #替换def数据
    elsif !ripLine.empty? && blockData.has_key?(ripLine) && !blockStart
      #jsonData << blockData[ripLine]
    elsif ripLine.start_with? 'def'
      blockName = ripLine['def'.size..-1].strip
      blockData[blockName] = ''
      blockStart = true
    elsif ripLine.start_with? 'end'
      blockStart = false
    else
      if blockStart
        blockData[blockName] << line
      else
        jsonData << line
      end
    end
  end

end

#替换#{*}数据
while true
  hasReplaceBlock = false
  blockData.each do |key, value|
    blockName = '#{' + key + '}'
    if jsonData.include? blockName
      hasReplaceBlock = true
      jsonData.gsub!(blockName, value.strip)
    end
  end

  unless hasReplaceBlock
    break
  end
end

outf.write JSON.pretty_generate(JSON.parse(jsonData))

outf.close
puts 'convert succeed!'
