# Dynany

Dynamic JSON/YAML mapping manipulation - extends `Any`

## Installation

Add this block to your application's `shard.yml`:

```yaml
dependencies:
  clicr:
    github: j8r/dynany
```

## Usage

This shard monkey patch `JSON::Any` and `YAML::Any` to extend them by adding this following methods, which are equivalent for those fround in [Hash](https://crystal-lang.org/api/master/Hash.html) and [Array](https://crystal-lang.org/api/master/array.html).

The main difference is the argument, which accept an `Enumerable` which represents a path in the document.


The methods are: `#[](path : Enunerable)`, `#[]?(path : Enumerable`, `#[]=(path : Enumerable)` and `#.delete(path : Enumerable)`

## Example

```crystal
require "dynany/json"

json = JSON.parse my_json
json[["hash", "array", 1]]  # => "value"
json.delete ["hash", "array", 1]
json[["hash", "array", 1]]? # => nil  
```

## License                                                                                                 

Copyright (c) 2018 Julien Reichardt - ISC License
