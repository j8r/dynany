require "./dynany"
require "con"

module CON
  struct Any
    include Dynany(CON)

    # Sets the value of key to the given value.
    def []=(key : String, value : Any) : T::Any
      as_h[key] = value
    end
  end
end
