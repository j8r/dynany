# Dynany

Dynamic JSON/YAML/CON mapping manipulation - extends `Any`

## Installation

Add the dependency to your `shard.yml`:

```yaml
dependencies:
  dynany:
    github: j8r/dynany
```

## Usage

This shard monkey patch `JSON::Any`, `YAML::Any` and `CON::Any` to extend them by adding this following methods, which are equivalent for those fround in [Hash](https://crystal-lang.org/api/master/Hash.html) and [Array](https://crystal-lang.org/api/master/array.html).

The main difference is the argument, which accept an `Enumerable` which represents a path in the document.


The available methods are:

`#[](path : Enunerable)`

`#[]?(path : Enumerable`

`#[]=(path : Enumerable)`

`#delete(path : Enumerable)`

## Example

```crystal
require "dynany/json"

json = JSON.parse %({"hash": {"array": ["first", "second"]}})
json[["hash", "array", 1]]       # => "second"
json.delete ["hash", "array", 1] # => {"hash" => {"array" => ["first"]}}
json[["hash", "array", 1]]?      # => nil
```

## License                                                                                                 

Copyright (c) 2018-2019 Julien Reichardt - ISC License
