module Attributes.Variant where

import Prelude

import Data.Tuple (Tuple(..))
import Data.Variant (Variant, inj, match)
import Type.Proxy (Proxy(..))

foreign import data Datum :: Type

data UnitType = Px | Pt | Em | Rem | Percent

type StringAttr = (Variant ( static :: String
                           , dynamic :: Datum -> String
                           , indexed :: Datum -> Int -> String))
type NumberAttr = (Variant ( static :: Number
                           , dynamic :: Datum -> Number
                           , indexed :: Datum -> Int -> Number))
type ArrayAttr  = (Variant ( static :: Array Number
                           , dynamic :: Datum -> Array Number
                           , indexed :: Datum -> Int -> Array Number))

staticString :: String -> StringAttr
staticString = inj (Proxy :: Proxy "static") -- "red"

stringFromDatum :: (Datum -> String) -> StringAttr
stringFromDatum f = inj (Proxy :: Proxy "dynamic") f -- (\d -> "red") 

stringFromDatum' :: (Datum -> Int -> String) -> StringAttr
stringFromDatum' f = inj (Proxy :: Proxy "indexed") f -- (\d i -> "red") 

staticNumber :: Number -> NumberAttr
staticNumber = inj (Proxy :: Proxy "static") -- 42.0 

numberFromDatum :: (Datum -> Number) -> NumberAttr
numberFromDatum f = inj (Proxy :: Proxy "dynamic") f -- (\d -> 42.0) 

numberFromDatum' :: (Datum -> Int -> Number) -> NumberAttr
numberFromDatum' f = inj (Proxy :: Proxy "indexed") f -- (\d i -> 42.0) 


staticArray :: Array Number -> ArrayAttr
staticArray = inj (Proxy :: Proxy "static") -- [42.0] 

arrayFromDatum :: (Datum -> Array Number) -> ArrayAttr
arrayFromDatum f = inj (Proxy :: Proxy "dynamic") f -- (\d -> [42.0]) 

arrayFromDatum' :: (Datum -> Int -> Array Number) -> ArrayAttr
arrayFromDatum' f = inj (Proxy :: Proxy "indexed") f -- (\d i -> [42.0]) 


type Label = String
data Attribute = Attr Label (Variant (string :: StringAttr
                                     , number :: NumberAttr
                                     , unitNumber :: Tuple NumberAttr UnitType
                                     , array :: ArrayAttr ))

staticStringAttr :: Label -> String -> Attribute
staticStringAttr label = Attr label <<<
  inj (Proxy :: Proxy "string") <<<
  staticString

stringAttrFromDatum :: Label -> (Datum -> String) -> Attribute
stringAttrFromDatum label = Attr label <<<
  inj (Proxy :: Proxy "string") <<< 
  stringFromDatum

stringAttrFromDatum' :: Label -> (Datum -> Int -> String) -> Attribute
stringAttrFromDatum' label = Attr label <<<
  inj (Proxy :: Proxy "string") <<<
  stringFromDatum'


staticNumberAttr :: Label -> Number -> Attribute
staticNumberAttr label = Attr label <<<
  inj (Proxy :: Proxy "number") <<<
  staticNumber

numberAttrFromDatum :: Label -> (Datum -> Number) -> Attribute
numberAttrFromDatum label = Attr label <<<
  inj (Proxy :: Proxy "number") <<<
  numberFromDatum

numberAttrFromDatum' :: Label -> (Datum -> Int -> Number) -> Attribute
numberAttrFromDatum' label = Attr label <<<
  inj (Proxy :: Proxy "number") <<<
  numberFromDatum'


staticArrayAttr :: Label -> Array Number -> Attribute
staticArrayAttr label = Attr label <<<
  inj (Proxy :: Proxy "array") <<<
  staticArray

arrayAttrFromDatum :: Label -> (Datum -> Array Number) -> Attribute
arrayAttrFromDatum label = Attr label <<<
  inj (Proxy :: Proxy "array") <<<
  arrayFromDatum

arrayAttrFromDatum' :: Label -> (Datum -> Int -> Array Number) -> Attribute
arrayAttrFromDatum' label = Attr label <<<
  inj (Proxy :: Proxy "array") <<<
  arrayFromDatum'

_static    = Proxy :: Proxy "static"
_dynamic   = Proxy :: Proxy "dynamic"
_indexed   = Proxy :: Proxy "indexed"
_string = Proxy :: Proxy "string"
_number = Proxy :: Proxy "number"
_array  = Proxy :: Proxy "array"

stringAttribute :: Label -> StringAttr -> Attribute
stringAttribute label = match
  { static: \a -> staticStringAttr label a
  , dynamic: \f -> stringAttrFromDatum label f
  , indexed: \f -> stringAttrFromDatum' label f
  }

numberAttribute :: Label -> NumberAttr -> Attribute
numberAttribute label = match
  { static: \a -> staticNumberAttr label a
  , dynamic: \f -> numberAttrFromDatum label f
  , indexed: \f -> numberAttrFromDatum' label f
  }

arrayAttribute :: Label -> ArrayAttr -> Attribute
arrayAttribute label = match
  { static: \a -> staticArrayAttr label a
  , dynamic: \f -> arrayAttrFromDatum label f
  , indexed: \f -> arrayAttrFromDatum' label f
  }
