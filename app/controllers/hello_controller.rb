class HelloController < ApplicationController


  def myFunc
    unless myVar
      puts 'Sorry, myVar ist not set'
      return
    end

    puts 'Jetzt gehts weiter'
  end

end