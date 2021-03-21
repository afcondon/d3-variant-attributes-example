module Attributes.Concrete where

import Attributes.Variant

strokeColor :: StringAttr -> Attribute
strokeColor = stringAttribute "stroke"

strokeOpacity :: NumberAttr -> Attribute
strokeOpacity = numberAttribute "stroke-opacity"

fill :: StringAttr -> Attribute
fill = stringAttribute "fill"

viewBox :: Number -> Number -> Number -> Number -> Attribute
viewBox = arrayAttribute "viewbox" <<< staticArray <<< exactlyFour
  where
    exactlyFour xo yo width height = [ x0, yo, width, height ]

fontFamily :: StringAttr -> Attribute
fontFamily = stringAttribute "font-family"
  
textAnchor :: StringAttr -> Attribute
textAnchor = stringAttribute "text-anchor"

strokeWidth :: Number -> NumberUnit -> Attribute
strokeWidth n u = staticNumberAttrWithUnits "stroke-width" n u

radius :: Number -> NumberUnit -> Attribute
radius n u = staticNumberAttrWithUnits "r" n u

fontSize :: Number -> NumberUnit -> Attribute
fontSize n u = staticNumberAttrWithUnits "font-size" n u

width :: Number -> NumberUnit -> Attribute
width n u = staticNumberAttrWithUnits "width" n u

height :: Number -> NumberUnit -> Attribute
height n u = staticNumberAttrWithUnits "height" n u

x :: Number -> NumberUnit -> Attribute
x n u = staticNumberAttrWithUnits "x" n u

y :: Number -> NumberUnit -> Attribute
y n u = staticNumberAttrWithUnits "y" n u

dx :: Number -> NumberUnit -> Attribute
dx n u = staticNumberAttrWithUnits "dx" n u

dy :: Number -> NumberUnit -> Attribute
dy n u = staticNumberAttrWithUnits "dy" n u

text :: StringAttr -> Attribute
text = stringAttribute "text"

textAnchor :: StringAttr -> Attribute
textAnchor = stringAttribute "text-anchor"

computeStrokeWidth :: NumberUnit -> (Datum -> Number) -> Attribute
computeStrokeWidth u f = StringAttr "stroke-width" (datumToStringWithUnit u f)
  
computeStrokeOpacity :: (Datum -> Number) -> Attribute
computeStrokeOpacity = NumberAttr "stroke-opacity"

computeRadius :: NumberUnit -> (Datum -> Number) -> Attribute
computeRadius u f = StringAttr "r" (datumToStringWithUnit u f)

computeX :: NumberUnit -> (Datum -> Number) -> Attribute
computeX u f = StringAttr "x" (datumToStringWithUnit u f)

computeY :: NumberUnit -> (Datum -> Number) -> Attribute
computeY u f = StringAttr "y" (datumToStringWithUnit u f)

computeDX :: NumberUnit -> (Datum -> Number) -> Attribute
computeDX u f = StringAttr "dx" (datumToStringWithUnit u f)

computeDY :: NumberUnit -> (Datum -> Number) -> Attribute
computeDY u f = StringAttr "dy" (datumToStringWithUnit u f)