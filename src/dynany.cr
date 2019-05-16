module Dynany(T)
  # Allows to take precedence over the stdlib methods, which also accept enumerables (but not only).
  macro included
  # Returns the value corresponding to the path. If not found, raise.
  def [](path : Enumerable) : T::Any
    first_key = path.first
    if path.size == 1
      self[first_key]
    else
      self[first_key][path.to_a[1..-1]]
    end
  end

  # Returns the value corresponding to the path. If not found, returns nil.
  def []?(path : Enumerable) : T::Any?
    first_key = path.first
    if path.size == 1
      self[first_key]?
    else
      if keys = self[first_key]?
        keys[path.to_a[1..-1]]?
      end
    end
  end
  end

  # Sets the value of key to the given value.
  def []=(key : Int, value : T::Any)
    as_a[key] = value
  end

  # Sets the value of key to the given value.
  def []=(path : Enumerable, value : T::Any) : T::Any
    first_key = path.first
    if path.size == 1
      self[first_key] = value
    else
      self[first_key][path.to_a[1..-1]] = value
    end
  end

  # Deletes the element at the given index.
  def delete(index : Int) : T::Any?
    as_a.delete_at index
  end

  # Deletes the key-value pair.
  def delete(key : String) : T::Any?
    as_h.delete key
  end

  # Removes the element corresponding to the path.
  def delete(path : Enumerable) : T::Any
    first_key = path.first
    if path.size == 1
      delete first_key
    else
      self[first_key].delete path.to_a[1..-1]
    end
    self
  end
end
