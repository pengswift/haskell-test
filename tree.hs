-- 定义二元树 结构体
data Tree a = EmptyTree | Node a (Tree a) (Tree a) deriving (Show, Read, Eq)

-- 单节点
singleton :: a -> Tree a
singleton x = Node x EmptyTree EmptyTree

-- 添加节点 节点内容->左树->右树
treeInsert :: (Ord a) => a -> Tree a -> Tree a
treeInsert x EmptyTree = singleton x
treeInsert x (Node a left right)
    | x == a = Node x left right
    -- x < a 时，添加到 a 的左侧
    | x < a = Node a (treeInsert x left) right
    | x > a = Node a left (treeInsert x right)

treeElem :: (Ord a) => a -> Tree a -> Bool
treeElem x EmptyTree = False
treeElem x (Node a left right)
    | x == a = True
    | x < a = treeElem x left
    | x > a = treeElem x right

{--
    let nums = [8,6,4,1,7,3,5] 
    let numsTree = foldr treeInsert EmptyTree nums
    numsTres

    8 `treeElem` numsTree
    100 `treeElem` numsTree
    1 `treeElem` numsTree
    10 `treeElem` numsTree
--}




