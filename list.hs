import Data.List

import qualified Data.Map as Map

import qualified Data.Set as Set

-- 模组是包含一组相关的函数，型别(type)和型别类(type class)的组合
-- Preclude 是预加载模组
-- 语法标示  import module
-- 加载模组中全部函数  import Data.List          ghci> :m Data.List
-- 加载指定函数 import Data.List (nub, sort)     
-- 排除指定函数 import Data.List hiding (nub)
-- 避免重名 import qualified Data.Map   呼叫方式 Data.Map.filter
-- module 重命名 import qualified Data.Map as M   M.filter 


-- Data.List  模组

-- intersperse 函数 取一元素与LIST作参数, 并将该元素置于LIST中每对元素中间
{--
    intersperse '.' "MONKEY" 
    intersperse 0 [1,2,3,4,5]
--}

-- intercalate 函数 取两个List作参数，将第一个list交叉置于第二个list中间， 返回一个list
{--
    intercalate " " ["key","there","guys"]
    intercalate [0,0,0] [[1,2,3],[4,5,6],[7,8,9]]
--}

-- transpose 函数 反转一组list 的 list  可看作2d矩阵， 将其列转行操作
{-- 
    transpose [[1,2,3],[4,5,6],[7,8,9]]
    transpose ["key","there","guys"]

    -- 实际应用 取多项式系数相加
    3x^2 + 5x + 9 = 0
    10x^3 + 9 = 0
    8x^3 + 5x^2 + x - 1 = 0

    map sum $ transpose [[0,3,5,9],[10,0,0,9],[8,5,1,-1]]
--}

-- foldl' fold1'  是各自惰性实现的严格版本  防止堆栈溢出

-- concat  函数 将一组List连接为一个List
-- concat ["foo","bar","car"]
-- concat [[3,4,5],[2,3,4],[2,1,1]]

-- concatMap 函数 与 map一个list 后 在concat 等价
-- concatMap (replicate 4) [1..3]

-- and 函数 取一组bool值list作为参数，如果全部为True，才返回True
-- and $ map (>4) [5,6,7,8]
-- and $ map (==4) [4,4,4,3,4]

-- or 函数， 一组bool值List中若存在一个True 它将返回 True
-- or $ map (==4) [2,3,4,5,6,1]
-- or $ map (>4) [1,2,3]

-- any和all函数  取一个限制条件和一组bool值List作参数, 检查list中每个元素是否符合条件
{--
    any (==4) [2,3,4,5,6,1,4] 
    all (>4) [6,9,10]
    all (`elem` ['A'..'Z']) "HEYGUYSwhatsup"
    any (`elem` ['A'..'Z']) "HEYGUYSwhatsup"
--}

-- iterate函数 取一个函数和一个值作参数  用该值呼叫函数并将结果再次呼叫该函数，产生一个无限的List
--take 10 $ iterate (*2) 1
--take 3 $ iterate (++ "haha") "haha"

-- splitAt 取一个数值和一个List作为参数，将该List在特定的位置断开, 返回一个包含两个List的二元组
-- splitAt 3 "heyman"
-- splitAt 100 "heyman"
-- splitAt (-3) "heyman"
-- let (a,b) = splitAt 3 "foobar" in b ++ a

-- takeWhile 取一个函数和list做参数， 从list中取出元素呼叫函数， 一旦遇到不符合条件的元素就停止
-- takeWhile (>3) [6,5,4,3,2,1,2,3,4,5,4,3,2,1]
-- takeWhile (/=' ') "This is a sentence"
-- sum takeWhile (<10000) $ map (^3) [1..]

-- dropWhile 函数 与takeWhile相似 不过是扔掉符合条件的元素
-- dropWhile (/=' ') "This is a sentence" 
-- dropWhile (<3) [1,2,2,2,3,4,5,4,3,2,1] 

-- span 函数 与takeWhile相似 但它返回两个List， 第一个list同参数呼叫takeWhile所得结果相同，第二个List就是原List中余下的部分
-- let (fw, rest) = span (/=' ') "This is a sentence" in "First word:" ++ fw ++ ", the rest:" ++ rest

-- break 函数 与 span (not . p) 等价
-- break (==4) [1,2,3,4,5,6,7]
-- span (/=4) [1,2,3,4,5,6,7]

-- sort 函数 排序一个List
-- sort [8,5,3,2,1,6,4,2]

-- group 函数  取一个List， 将其中*相邻*并相等的元素各自归类，组成一个个子List
-- group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]
-- map (\l@(x:xs) -> (x, length l)) . group .sort $ [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]

-- inits， tails函数 与init， tail相似， 只是它们会递归呼叫自身
-- inits "w00t"
-- tails "w00t"
-- let w = "w00t" in zip (inits w) (tails w)

search :: (Eq a) => [a] -> [a] -> Bool
search needle haystack = 
    let nlen = length needle
    in foldl (\acc x -> if take nlen x == needle then True else acc) False (tails haystack)

-- isInfixOf 函数 判断list中是否包含子list
-- "cat" `isInfixOf` "im a cat burglar"

-- isPrefixOf， isSuffixOf 分别检查一个List是否以某个子List开头或者结尾

-- elem, notElem 检查一个List是否包含某元素

-- partition 函数 和span break类似， 但partition 会遍历到结束
-- partition (`elem` ['A'..'Z']) "BOBsidneyMORGANeddy"
-- span (`elem` ['A'..'Z']) "BOBsidneyMORGANeddy"

-- find 函数 取一个限制条件 和一个List作参数， 返回首个符合该条件的元素
-- 这个元素是Maybe值 Mybe值是Just something 或 Nothing
-- find (>4) [1,2,3,4,5,6]  Just 5
-- find (>6) [1,2,3,4,5,6]  Nothing

-- elemIndex 与 elem类似， 不同的是它不返回bool值，它只是可能（Maybe）返回我们找的元素的索引, 若不存在， 就返回Nothing
-- 4 `elemIndex` [1,2,3,4,5,6]
-- 10 `elemIndex` [1,2,3,4,5,6]

-- elemIndices 与 elemIndex 相似， 不过它返回的是List，就不需要Maybe了
-- ' ' `elemIndices` "Where are the spaces?"

-- findIndex 与 find 相似，但它返回的是可能存在的首个符合该条件元素的索引
-- findIndices 会返回所有符合条件的索引
-- findIndex (==4) [5,3,2,1,6,4]
-- findIndex (==7) [5,3,2,1,6,4]
-- findIndices (`elem` ['A'..'Z']) "Where Are The Caps?"

-- zip3, zipWith3 ... zip7, zipWith7  组合多个list，使其成为多元组

-- lines 函数 取一个字符串作参数， 返回其中每一行组成的list
-- lines "first line\nsecond line\nthird line"

-- unlines  lines的反函数， 取一组字串的List, 并将其通过'\n' 合并到一块
-- unlines ["first line", "second line", "third line"]

-- words 和 unwords 可以把一个字串分为一组单词或执行相反的操作
-- words "hey these are the words in this sentence"
-- words "hey these are the words in this\nsentence"
-- unwords ["hey","there","mate"]

-- nub 函数 list 元素去重
-- nub [1,2,3,4,3,2,1,2,3,4,3,2,1]
-- nub "Lots of words and stuff"

-- delete 函数， 取一个元素和List作参数， 会删掉该List中首次出现的这一元素
-- delete 'h' "hey there ghang!"
-- delete 'h' . delete 'h' $ "hey there ghang!"
-- delete 'h' . delete 'h' . delete 'h' $ "hey there ghang!"

-- \ 表示List的差集操作
-- [1..10] \\ [3,5,9]
-- "I'm a big baby" \\ "big"

-- union 返回两个List的并集
-- "hey man" `union` "man what's up"
-- [1..7] `union` [5..10]

-- intersection 相当于集合的交集, 返回两个List的相同部分
-- [1..7] `intersect` [5..10]

-- insert 函数 ，将一个元素插入一个可排序的List， 并将其置于首个大于等于它的元素之前
-- insert 4 [1,2,3,5,6,7]
-- insert 'g' $ ['a'..'f'] ++ ['h'..'z']
-- insert 3 [1,2,4,3,2,1]

-- length, take, drop, splitAt, !!, replicate
-- genericLength genericTake, genericDrop, genericSplitAt, genericIndex, genericReplicate  通用版本

-- nub, delete, union, insect, intersect, group 
-- nubBy, deleteBy, unionBy, insectBy, intersectBy, groupBy 通过版本， 可指定判断函数

-- let values = [-4.3, -2.4, -1.2, 0.4, 2.3, 5.9, 10.5, 29.1, 5.3, -2.4, -14.5, 2.9, 2.3] 
-- groupBy (\x y -> (x > 0) == (y > 0)) values

-- Data.Function 模组
-- on 函数  用于组合两个函数调用后的结果判断
-- on :: (b -> b -> c) -> (a -> b) -> a -> a -> c
-- f `on` g = \x y -> f (g x) (g y)
-- 按照元素是否大于零，给它分类
-- groupBy ((==) `on` (> 0)) values

-- sort, insert, maximum, min
-- sortBy, insertBy, maximumBy, minimumBy 


-- Data.Char 模组
-- isControl 判断一个字元是否是控制字元
-- isSpace 判断一个字元是否是空格,tab, 换行符等字元
-- isLower 判断一个字元是否为小写
-- isUper 判断一个字元是否为大写
-- isAlpha 判断一个字元是否为字母
-- isAlphaNum 判断一个字元是否为字母或数字
-- isPrint 判断一个字元是否是可打印的
-- isDigit 判断一个字元是否为数字
-- isOctDigit 判断一个字元是否为八进制数字
-- isHexDigit 判断一个字元是否为十六进制数字
-- isLetter 判断一个字元是否为字母
-- isMark 判断是否为unicode注音字元
-- isNumber 判断一个字元是否是数字
-- isPunctuation 判断一个字元是否为标点符号
-- isSymbol 判断一个字元是否为货币符号
-- isSeperater 判断一个字元是否为unicode空格或分隔符
-- isAscii 判断一个字元是否在unicode 字母表前128位
-- isLatin1 判断一个字元是否在unicode 字母表的前256位
-- isAsciiUpper 判断一个字元是否大写ascii字元
-- isAsciiLower 判断一个字元是否为小写ascii字元

-- all isAlphaNum "bobby283"
-- all isAlphaNum "eddy the fish!"

-- words "hey guys its me"
-- groupBy ((==) `on` isSpace) "hey guys its me"
-- filter (not . any isSpace) . groupBy ((==) `on` isSpace) $ "hey guys its me"

-- GeneralCategory 型别类 包含31个成员
-- generalCategory :: Chat -> GeneralCategory
-- generalCategory ' '
-- generalCategory 'A'
-- generalCategory 'a'
-- generalCategory '.'
-- generalCategory '9'
-- map generalCategory " \t\nA9?|"

-- GeneralCategory 是Eq型别的一部分

-- toUpper 函数 将一个字元转为大写字母, 若字元不是小写字母，按原值返回

-- toLower 函数 将一个字元转为小写字母, 若字元不是大写字母，按原值返回

-- toTitle 函数 将一个字元转为 title-case

-- digitToInt 函数  将一个字元转为Int值 这一字元必须得在 '1'..'9','a'..'f' 或'A'..'F'的范围之间

-- map digitToInt "34538"
-- map digitToInt "FF85AB"

-- intToDigit 函数 digitToInt 的反函数。 它取一个0 - 15的Int值作参数， 并返回一个小写的字元
-- intToDigit 15
-- intToDigit 5

-- ord 与chr 函数 可以将字元与其对应的数字相互转换
-- ord 'a'
-- chr 97
-- map ord "abcdefgh"

-- 两个字元的ord值之差就是它们在unicode字元表上的距离

{--
    --Caear ciphar 加密算法
    encode :: Int -> String -> String
    encode shift msg = 
        let ords = map ord msg
            shifted = map (+ shift) ords
        in map chr shifted


    decode :: Int -> String -> String
    decode shift msg = encode (negate shift) msg
--}


-- Data.Map  字典 / 按照键值对排列 而 没有特定顺序的一种List.
-- 二元组List

phoneBook = [("betty","555-2938") ,
             ("bonnie","452-2928") ,
             ("patsy","493-2928") ,
             ("lucille","205-2928") ,
             ("wendy","939-8282") ,
             ("penny","853-2492") ]

--findKey :: (Eq k) => k -> [(k,v)] -> v
--findKey key xs = snd . head . filter (\(k,v) -> key == k) $ xs

--findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
--findKey key [] = Nothing
--findKey key ((k,v):xs) = 
--    if key == k then
--        Just v
--    else
--        findKey key xs

findKey :: (Eq k) => k -> [(k,v)] -> Maybe v
findKey key = foldr (\(k,v) acc -> if key == k then Just v else acc) Nothing


-- findKey 与 list模组中自带的loopup 功能相同


-- fromList 函数 取一个关联列表， 返回一个与之等价的Map
-- 如果存在重复的key， 后面一个覆盖前面一个
-- 并且会按照key(Order typeclass)值，自动排序
{--
  Map.fromList [("betty","555-2938"),("bonnie","452-2928"),("patsy","493-2928")]
  Map.fromList [(1,2),(3,4),(3,2),(5,5)]
--}

-- Map.empty 函数  返回一个空map

-- insert 函数 取一个值和一个map做参数， 给这个map插入新的键值对，并返回一个新的map

{-- 
    Map.empty
    Map.insert 3 100 Map.empty
    Map.insert 5 600 (Map.insert 4 200 ( Map.insert 3 100 Map.empty))
    Map.insert 5 600 . Map.insert 4 200 . Map.insert 3 100 $ Map.empty
--}

fromList' :: (Ord k) => [(k,v)] -> Map.Map k v
fromList' = foldr (\(k,v) acc -> Map.insert k v acc) Map.empty

-- null 函数 检查一个map是否为空
-- Map.null Map.empty
-- Map.null $ Map.fromList [(2,3),(5,5)]

-- size 函数 返回一个map的大小
-- Map.size Map.empty
-- Map.size $ Map.fromList [(2,4),(3,3),(4,2),(5,4),(6,4)]

-- singleton 取一个键值对做参数，并返回一个只含有一个映射的map
-- Map.singleton 3 9
-- Map.insert 5 9 $ Map.singleton 3 9

-- lookup 与 Data.List 的lookup 很像， 如果找到键对应的值，就返回Just something， 否则返回Nothing

-- member 函数  取一个键与map做参数， 并返回该键是否存在于该map
-- Map.member 3 $ Map.fromList [(3,6),(4,3),(6,9)]
-- Map.member 3 $ Map.fromList [(2,5),(4,5)]

-- map 于 filter 与其对应的List版本相似

-- Map.map (*100) $ Map.fromList [(1,1),(2,4),(3,9)]
-- Map.filter isUpper $ Map.fromList [(1,'a'),(2,'A'),(3,'b'),(4,'B')]

-- toList  是 fromList的反函数
-- Map.toList . Map.insert 9 2 $ Map.singleton 4 3 

-- keys, elems 函数， 分别返回一组由键或值组成的List
-- keys 与 map fst . Map.toList 等价
-- elems 与 map snd . Map.toList 等价

-- fromListWith 与 fromList 类似， 但不会直接忽略掉重复键， 而是交给一个函数处理 

-- insertWith 函数同 insert  用法如fromListWith
-- Map.insertWith (+) 3 100 $ Map.fromList [(3,4),(5,103),(6,339)]

-- Data.Set 模组
-- 提供了对数学中集合的处理，必须是可排序的，并且元素必须唯一 

{--
    text1 = "I just had an anime dream. Anime... Reality... Are they so different?"
    text2 = "The old man left his garbage can out and now his trash is all over my lawn!"

--}

-- fromList 函数， 取一个List作为参数并将其转为一个集合
{--
    let set1 = Set.fromList text1
    let set2 = Set.fromList text2
    set1
    set2
--}

-- intersection函数 ， 取Set交集
-- Set.intersection set1 set2

-- difference 函数， 得到存在于第一个集合但不存在第二个集合的元素
-- Set.difference set1 set2

-- union 函数 求集合并集
-- Set.union set1 set2

-- null, size, member, empty, singleton, insert, delete
{--
    Set.null Set.empty
    Set.null $ Set.fromList [3,4,5,5,4,3]
    Set.size $ Set.fromList [3,4,5,5,4,3]
    Set.singleton 9
    Set.insert 4 $ Set.fromList [9,3,8,1]
    Set.insert 8 $ Set.fromList [5..10]
    Set.delete 4 $ Set.fromList [3,4,5,4,3,5]
--}

-- isSubsetOf 判断子集
-- isProperSubsetOf 判断真子集
{--
    Set.fromList [2,3,4] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]
    Set.fromList [1,2,3,4,5] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]
    Set.fromList [1,2,3,4,5] `Set.isProperSubsetOf` Set.fromList [1,2,3,4,5]
    Set.fromList [2,3,4,8] `Set.isSubsetOf` Set.fromList [1,2,3,4,5]
--}

-- map, filter 
{--
    Set.filter odd $ Set.fromList [3,4,5,6,7,2,3,4]
    Set.map (+1) $ Set.fromList [3,4,5,6,7,2,3,4]
--}

-- fromList 去重 , toList 恢复, 重新排序
{--
    let setNub xs = Set.toList $ Set.fromList xs
    setNub "HEY WHATS CRACKALACKIN"
    nub "HEY WHATS CRACKALACKIN"
--}









