module Dynany
  macro any_methods(type)
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
      if keys = self[first_key]?
        keys[path.to_a[1..-1]]?
      end
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
