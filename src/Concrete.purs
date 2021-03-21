module Attributes.Concrete where

import Attributes.Variant
import Prelude

strokeColor :: StringAttr -> Attribute
strokeColor = stringAttribute "stroke"

strokeOpacity :: NumberAttr -> Attribute
strokeOpacity = numberAttribute "stroke-opacity"

strokeWidth :: NumberAttr -> Attribute
strokeWidth = numberAttribute "stroke-width"

fill :: StringAttr -> Attribute
fill = stringAttribute "fill"

viewBox :: Number -> Number -> Number -> Number -> Attribute
viewBox xo yo width height = arrayAttribute "viewbox" $ staticArray [ xo, yo, width, height ]

fontFamily :: StringAttr -> Attribute
fontFamily = stringAttribute "font-family"
  
textAnchor :: StringAttr -> Attribute
textAnchor = stringAttribute "text-anchor"

radius :: NumberAttr -> Attribute
radius = numberAttribute "r"

fontSize :: NumberAttr -> Attribute
fontSize = numberAttribute "font-size"

width :: NumberAttr -> Attribute
width = numberAttribute "width"

height :: NumberAttr -> Attribute
height = numberAttribute "height"

x :: NumberAttr -> Attribute
x = numberAttribute "x"

y :: NumberAttr -> Attribute
y = numberAttribute "y"

dx :: NumberAttr -> Attribute
dx = numberAttribute "dx"

dy :: NumberAttr -> Attribute
dy = numberAttribute "dy"

text :: StringAttr -> Attribute
text = stringAttribute "text"
