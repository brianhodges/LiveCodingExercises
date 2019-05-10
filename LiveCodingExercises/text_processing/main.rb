filename = "essay.txt"
charLimit = 80

# Read in text file
content = File.open(filename).read

unformattedText = ""

content.each_line do |line|
  unformattedText += line
end

# Split into paragraphs
paragraphs = unformattedText.split("\n\n")
essay = ""

paragraphs.each do |paragraph|
  # Split into words
  words = paragraph.split(' ')
  
  line = "";
  words.each do |word|
      # Add line to completed formatted text and reset if exceeds character limit
      if ((line + word).length > charLimit)
          essay += line
          line = "";
      end
  
      line += word + " "
  end
  
  if (line.length > 0)
      essay += line
  end
  
  # Keep paragraph format
  essay += "\n\n"
end
  

# Output formatted text to log file
File.open('log.txt', 'w') do |file|
  file.puts essay
end
