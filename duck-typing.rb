# class E
# end

# E.ping
# name = gets
# p name
# p name.chomp

class E
  if gets("Type ping to add method > ").match("ping")
    def self.ping
      "pong"
    end
  end
end

# E.ping