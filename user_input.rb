def input(num, app)
  actions = {
    1 => -> { app.list_books },
    2 => -> { app.list_people },
    3 => -> { app.create_person },
    4 => -> { app.create_book },
    5 => -> { app.create_rental },
    6 => -> { app.list_rentals },
    7 => -> { puts 'Thank you for using this app. See you soon again!' }
  }

  action = actions[num]

  if action
    action.call
  else
    puts "No action matches your selection (#{num}). Kindly provide a valid input."
  end
end
