class String
  def antal_ens(anden_streng)
      anden_streng.upcase!

      antal_ens = 0
      
      self.length.times do
        |i|
        antal_ens += 1 if self[i] == anden_streng[i]
      end

      return antal_ens
  end
end

class Array
  def udskiv_med_iterator
    i=0
    self.each do
      |dims|
        i = i + 1
        puts "#{i}\t #{dims}"
    end
  end
end


class Hacking
  
   attr_accessor(:mulige_ord, :gaet, :antal_rigtige )
  
  def initialize(muligeord)
    @mulige_ord = muligeord.each{|gaet|gaet.upcase!}
 #   puts @mulige_ord
  end

  def udtoem_listen!
      nyt_array = []
       @mulige_ord.each_index do
        |i|
          if @mulige_ord[i].antal_ens(@gaet) == @antal_rigtige
           nyt_array << @mulige_ord[i] 
          end
      end
      @mulige_ord = nyt_array unless nyt_array.length == 0
     
  end

  def to_s
    "Gaet: #{@gaet}\t antal rigtige: #{@antal_rigtige}"
    
  end
  
  def koer
    while @mulige_ord.length != 1 
      puts "Hvilket ord? "
      
      nummer = gets.chomp.to_i  - 1
      @gaet = @mulige_ord[nummer]
      puts @gaet
      puts "Hvormange rigtige? "
      @antal_rigtige = gets.to_i
    
      udtoem_listen!
    
     @mulige_ord.udskiv_med_iterator
     
    end
    puts "Færdig?"
  end

end

def opstart_listen
  puts "Skriv et par ord: "
  arrayet = []
  i = 1
  while true
    print "#{i}:\t "
    ord = gets.chomp!
    break if ord == "exit" or ord == ""
    arrayet << ord
    i += 1
end
  arrayet.udskiv_med_iterator
  return arrayet
end



listen = opstart_listen

hakking = Hacking.new listen
hakking.koer

#puts "RESIDES".antal_ens("fertile")