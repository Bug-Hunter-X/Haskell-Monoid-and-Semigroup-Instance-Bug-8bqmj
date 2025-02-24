{-# LANGUAGE FlexibleInstances #-}

instance Monoid [a] where
  mempty = []
  mappend = (++)

instance Semigroup [a] where
  (<>) = (++)

data Tree a = Node a [Tree a] | Leaf

instance Monoid (Tree a) where
  mempty = Leaf
  mappend (Node x xs) (Node y ys) = Node (x <> y) (xs ++ ys)
  mappend (Node x xs) Leaf = Node x xs
  mappend Leaf (Node y ys) = Node y ys
  mappend Leaf Leaf = Leaf

instance Semigroup (Tree a) where
  (<>) = mappend

main :: IO ()
main = do
  print (mempty :: Tree Int)
  print (mempty :: [Int])
  print ((Node 1 [] <> Node 2 []) :: Tree Int)
  print (([] :: [Int]) <> ([] :: [Int]))