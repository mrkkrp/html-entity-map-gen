# HTML entity map gen

The tool fetches the map of HTML5 entities from here:

https://html.spec.whatwg.org/entities.json

And outputs Haskell code that can be used to construct a `Map Text Char`
from that. This is used in this library:

https://github.com/mrkkrp/html-entity-map

## Contribution

Issues, bugs, and questions may be reported in [the GitHub issue tracker for
this project](https://github.com/mrkkrp/html-entity-map/issues).

Pull requests are also welcome and will be reviewed quickly.

## License

Copyright © 2017–2018 Mark Karpov

Distributed under BSD 3 clause license.
