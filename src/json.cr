require "./dynany"
require "json"

module JSON
  struct Any
    Dynany.any_methods "JSON"

    # Deletes the key-value pair.
    def delete(key : String)
      as_h.delete key
    end

    # Sets the value of key to the given value.
    def []=(key : String, value : Any)
      as_h[key] = value
    end
  end
end
