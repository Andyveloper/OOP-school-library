def header
  system('cls')
  puts '╔═══════════════════════════════════════════════════════════╗'
  puts '║                  School Library System                    ║'
  puts '╠═══════════════════════════════════════════════════════════╣'
end

def footer
  puts '║                                                           ║'
  puts '╠═══════════════════════════════════════════════════════════╣'
  puts '║           Press any key to return to main menu            ║'
  puts '╚═══════════════════════════════════════════════════════════╝'
end

def blankline
  puts '║                                                           ║'
end

def whitespace(line)
  whiteline = ''
  (0..(@width - line - 3)).each do |_i|
    whiteline += ' '
  end
  whiteline
end
