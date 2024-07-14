require './alphapolis'

App = Alphapolis::App.new

if ARGV.length == 0
  while true
    print("exit or writer_id:book_id $")
    command = gets.chomp

    if command == "exit"
      exit
    end

    argv = command.split(':')
    writer_id = argv[0]
    book_id = argv[1]

    puts "Writer_id: #{writer_id}"
    puts "Book_id: #{book_id}"

    print("Are you ok ( y / n ) ?")
    selection = gets.chomp
    puts selection

    if selection == "y" || selection == "yes"
      App.download writer_id=writer_id, book_id=book_id
    end
  end

elsif ARGV.length == 1
  if ARGV[0] == "-help"
    puts 'Usage: Alphapolis [Writer_id] [Book_id]'
  else
    puts "Invalid argument. Use -help for usage."
  end

elsif ARGV.length == 2
  writer_id = ARGV[0]
  book_id = ARGV[1]

  puts "Writer_id: #{writer_id}"
  puts "Book_id: #{book_id}"

  App.download writer_id=writer_id, book_id=book_id
end