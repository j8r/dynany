module Dynany
  macro any_methods(type)
  # Checks that the underlying value is `Nil`, and returns `nil`.
  # Raises otherwise.
  def as_nil : Nil
    @raw.as(Nil)
  end

  # Checks that the underlying value is `String`, and returns its value.
  # Raises otherwise.
  def as_s : String
    @raw.as(String)
  end

  # Checks that the underlying value is `String`, and returns its value.
  # Returns `nil` otherwise.
  def as_s? : String?
    @raw.as?(String)
  end

  # Checks that the underlying value is `Int64`, and returns its value.
  # Raises otherwise.
  def as_i64 : Int64
    @raw.as(Int64)
  end

  # Checks that the underlying value is `Int64`, and returns its value.
  # Returns `nil` otherwise.
  def as_i64? : Int64?
    @raw.as?(Int64)
  end

  # Checks that the underlying value is `Int64`, and returns its value as `Int32`.
  # Raises otherwise.
  def as_i : Int32
    @raw.as(Int64).to_i
  end

  # Checks that the underlying value is `Int64`, and returns its value as `Int32`.
  # Returns `nil` otherwise.
  def as_i? : Int32?
    @raw.as?(Int64).try &.to_i
  end

  # Checks that the underlying value is `Float64`, and returns its value.
  # Raises otherwise.
  def as_f : Float64
    @raw.as(Float64)
  end

  # Checks that the underlying value is `Float64`, and returns its value.
  # Returns `nil` otherwise.
  def as_f? : Float64?
    @raw.as?(Float64)
  end

  # Checks that the underlying value is `Float`, and returns its value as an `Float32`.
  # Raises otherwise.
  def as_f32 : Float32
    @raw.as(Float32)
  end

  # Checks that the underlying value is `Float`, and returns its value as an `Float32`.
  # Returns `nil` otherwise.
  def as_f32? : Float32?
    @raw.as?(Float64).try &.to_f
  end


  # Checks that the underlying value is `Array`, and returns its value.
  # Raises otherwise.
  def as_a : Array(Any)
    @raw.as(Array)
  end

  # Checks that the underlying value is `Array`, and returns its value.
  # Returns `nil` otherwise.
  def as_a? : Array(Any)?
    @raw.as?(Array)
  end

  # Checks that the underlying value is `Hash`, and returns its value.
  # Returns `nil` otherwise.
  def as_h? : Hash(Any, Any)?
    @raw.as?(Hash)
  end

  # Checks that the underlying value is `Bytes`, and returns its value.
  # Raises otherwise.
  def as_bytes : Bytes
    @raw.as(Bytes)
  end

  # Checks that the underlying value is `Bytes`, and returns its value.
  # Returns `nil` otherwise.
  def as_bytes? : Bytes?
    @raw.as?(Bytes)
  end

  # :nodoc:
  def inspect(io)
    @raw.inspect(io)
  end

  # :nodoc:
  def to_s(io)
    @raw.to_s(io)
  end

  # :nodoc:
  def pretty_print(pp)
    @raw.pretty_print(pp)
  end

  # Returns `true` if both `self` and *other*'s raw object are equal.
  def ==(other : {{type.id}}::Any)
    raw == other.raw
  end

  # Returns `true` if the raw object is equal to *other*.
  def ==(other)
    raw == other
  end

  # See `Object#hash(hasher)`
  def_hash raw

  # Returns a new {{type.id}}::Any instance with the `raw` value `dup`ed.
  def dup
    Any.new(raw.dup)
  end

  # Returns a new {{type.id}}::Any instance with the `raw` value `clone`ed.
  def clone
    Any.new(raw.clone)
  end

  # Returns the value corresponding to the path. If not found, raise.
  def [](path : Enumerable) : {{type.id}}::Any
    first_key = path.first
    if path.size == 1
      self[first_key]
    else
      self[first_key][path.to_a[1..-1]]
    end
  end

  # Returns the value corresponding to the path. If not found, returns nil.
  def []?(path : Enumerable) : {{type.id}}::Any?
    first_key = path.first
    if path.size == 1
      self[first_key]?
    else
      self[first_key][path.to_a[1..-1]]?
    end
  end

  # Sets the value of key to the given value.
  def []=(key : Int, value : {{type.id}}::Any)
    as_a[key] = value
  end

  # Sets the value of key to the given value.
  def []=(path : Enumerable, value : {{type.id}}::Any) : {{type.id}}::Any
    first_key = path.first
    if path.size == 1
      self[first_key] = value
    else
      self[first_key][path.to_a[1..-1]] = value
    end
  end

  # Deletes the element at the given index.
  def delete(index : Int)
    as_a.delete_at index
  end

  # Removes the element corresponding to the path.
  def delete(path : Enumerable) : {{type.id}}::Any
    first_key = path.first
    if path.size == 1
      delete first_key
    else
      self[first_key].delete path.to_a[1..-1]
    end
    self
  end
end
end
