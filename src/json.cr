require "./dynany"
require "json"

module JSON
  struct Any
    include Dynany(JSON)

    # Sets the value of key to the given value.
    def []=(key : String, value : Any) : T::Any
      as_h[key] = value
    end
  end
end
