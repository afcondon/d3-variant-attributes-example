module Attributes where

import Data.Variant (Variant, inj)
import Prelude (($))
import Type.Proxy (Proxy(..))

type Datum = Int
type Label = String


type StringAttr = (Variant (static :: String,       dynamic :: Datum -> String,       indexed :: Datum -> Int -> String))
type NumberAttr = (Variant (static :: Number,       dynamic :: Datum -> Number,       indexed :: Datum -> Int -> Number))
type ArrayAttr  = (Variant (static :: Array Number, dynamic :: Datum -> Array Number, indexed :: Datum -> Int -> Array Number))

data Attribute = Attr Label (Variant (stringish :: StringAttr, numberish :: NumberAttr, arrayish :: ArrayAttr))


staticString :: StringAttr
staticString = inj (Proxy :: Proxy "static") "red" 
dynamicString :: StringAttr
dynamicString = inj (Proxy :: Proxy "dynamic") (\d -> "red") 
indexedString :: StringAttr
indexedString = inj (Proxy :: Proxy "indexed") (\d i -> "red") 

staticStringAttr :: Attribute
staticStringAttr = Attr "stroke" $
  inj (Proxy :: Proxy "stringish") staticString
dynamicStringAttr :: Attribute
dynamicStringAttr = Attr "stroke" $
  inj (Proxy :: Proxy "stringish") dynamicString
indexedStringAttr :: Attribute
indexedStringAttr = Attr "stroke" $
  inj (Proxy :: Proxy "stringish") indexedString

staticNumber :: NumberAttr
staticNumber = inj (Proxy :: Proxy "static") 42.0 
dynamicNumber :: NumberAttr
dynamicNumber = inj (Proxy :: Proxy "dynamic") (\d -> 42.0) 
indexedNumber :: NumberAttr
indexedNumber = inj (Proxy :: Proxy "indexed") (\d i -> 42.0) 

staticNumberAttr :: Attribute
staticNumberAttr = Attr "stroke-opacity" $
  inj (Proxy :: Proxy "numberish") staticNumber
dynamicNumberAttr :: Attribute
dynamicNumberAttr = Attr "stroke-opacity" $
  inj (Proxy :: Proxy "numberish") dynamicNumber
indexedNumberAttr :: Attribute
indexedNumberAttr = Attr "stroke-opacity" $
  inj (Proxy :: Proxy "numberish") indexedNumber

staticArray :: ArrayAttr
staticArray = inj (Proxy :: Proxy "static") [42.0] 
dynamicArray :: ArrayAttr
dynamicArray = inj (Proxy :: Proxy "dynamic") (\d -> [42.0]) 
indexedArray :: ArrayAttr
indexedArray = inj (Proxy :: Proxy "indexed") (\d i -> [42.0]) 

staticArrayAttr :: Attribute
staticArrayAttr = Attr "viewbox" $
  inj (Proxy :: Proxy "arrayish") staticArray
dynamicArrayAttr :: Attribute
dynamicArrayAttr = Attr "viewbox" $
  inj (Proxy :: Proxy "arrayish") dynamicArray
indexedArrayAttr :: Attribute
indexedArrayAttr = Attr "viewbox" $
  inj (Proxy :: Proxy "arrayish") indexedArray