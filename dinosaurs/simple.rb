class Dinosaur
  def self.add_method(method_name)
    # pass in method_name, and a block to define the new methods behaviour
    define_method(method_name) do
      "this method was dynamically defined"
    end
  end
end