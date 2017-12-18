{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import Data.Aeson
import Data.Char
import Data.Default.Class
import Data.Map.Strict (Map)
import Data.Text (Text)
import Network.HTTP.Req
import qualified Data.Map.Strict as M
import qualified Data.Text       as T

newtype CodePoints = CodePoint Text

instance Show CodePoints where
  show (CodePoint txt) = show txt

instance FromJSON CodePoints where
  parseJSON = withObject "entity definition" $ \o ->
    CodePoint . T.pack . fmap chr <$> (o .: "codepoints")

main :: IO ()
main = do
  r <- runReq def $ req GET whatwgEntities NoReqBody jsonResponse mempty
  print (M.mapKeys normalizeName (responseBody r) :: Map Text CodePoints)

normalizeName :: Text -> Text
normalizeName name = g (f name)
  where
    f = if T.head name == '&' then T.drop    1 else id
    g = if T.last name == ';' then T.dropEnd 1 else id

whatwgEntities :: Url 'Https
whatwgEntities = https "html.spec.whatwg.org" /: "entities.json"
