module Attributes.Concrete where

import Attributes.Variant

strokeFill :: StringAttr -> Attribute
strokeFill = stringAttribute "stroke-fill"

strokeOpacity :: NumberAttr -> Attribute
strokeOpacity = numberAttribute "stroke-opacity"

viewBox :: ArrayAttr -> Attribute
viewBox = arrayAttribute "viewbox"