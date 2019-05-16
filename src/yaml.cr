require "./dynany"
require "yaml"

module YAML
  struct Any
    include Dynany(YAML)

    private def transform(path : Array) : Array(Any | Int32 | Int64)
      array = Array(Any | Int32 | Int64).new
      path.each do |key|
        if key.is_a? Int
          array << key
        else
          array << Any.new key
        end
      end
      array
    end

    # Sets the value of the element corresponding to the path.
    def []=(path : Enumerable(String | Int32 | Int64), value) : YAML::Any
      self[transform path] = value
    end

    # Deletes the element corresponding to the path.
    def delete(path : Enumerable(String | Int32 | Int64)) : YAML::Any
      delete transform path
    end

    # Deletes the key-value pair.
    def delete(key : Any) : YAML::Any?
      delete key.as_s
    end

    # Sets the value of key to the given value.
    def []=(key : Any, value : Any) : YAML::Any
      as_h[key] = value
    end
  end
end
