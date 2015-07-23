-- 前缀函数  前缀函数可以带多个参数
-- succ 9
-- max 5 4

-- 中缀函数  当函数有2个参数时, 可以使用
-- 5 `max` 4


doubleMe x = x + x

--doubleUs x y = x*2 + y*2

doubleUs x y = doubleMe x + doubleMe y

doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

doubleSmallNumber' x = (if x > 100
                        then x
                        else x * 2) + 1

-- 函数名首字母不允许大写
-- 没有参数的函数名被称之为定义
conanO'Brien = "It's a-me,Conan O'Brien!"

-- List  单类别资料存储
-- ghci 交互模式下使用 let定义常量
lostNumbers = [4,8,15,16,23,48]


-- 字符串是一组字元的LIST
--"hello" == ['h','e','l','l','o']

-- ++ 用于两个LIST合并，但会遍历++左侧LIST
{--
    [1,2,3,4] ++ [9,10,11,12]
    "hello" ++ " " ++ "world
--}

-- : 运算子 连接!!一个!!元素到一个LIST或者字符串中
{--
    'A':" SMALL CAT"
    5:[1,2,3,4,5]

    [1,2,3] == 1:2:3:[]
--}

-- !! 运算子 按索引取得LIST中的元素
{--
    "Steve Buscemi" !! 6
    [9.4,33.2,96.2,11.2,23.25] !! 1
--}

-- LIST 可以用来装LIST，甚至LIST的LIST的LIST, 并且每个LIST的字元(或数字)个数可以不一样, 但必须是相同类别
{--
    let b = [[1,2,3,4],[5,3,3,3],[1,2,2,3,4],[1,2,3]]
    b ++ [[1,1,1,1]]
    [6,6,6]:b
    b !! 2
--}

-- >, >= 运算子, 会匹配第一个元素, 如果不相等，会直接返回这次结果，不继续匹配后面的，如果想等，则继续匹配后面的
{--
    [3,2,1] > [2,1,0]
    [3,2,1] > [2,10,100]
    [3,4,2] > [3,4]
    [3,4,2] > [2,4]
    [3,4,2] == [3,4,2]
--}

-- head 运算子, 返回LIST的头部元素, 当然，如果LIST为空，则会报错
-- head [5,4,3,2,1]

-- tail 运算子 LIST除去头部之后的的部分
-- tail [5,4,3,2,1]

-- last 运算子 返回LIST最后一个元素
-- last [5,4,3,2,1]

-- init 运算子 返回LIST除去最后一个元素的部分
-- init [5,4,3,2,1]

-- length 运算子 返回一个LIST的长度
-- length [5,4,3,2,1]

-- null 运算子 检查LIST是否为空
-- null [1,2,3]
-- null []

-- reverse 运算子 将LIST反转
-- reverse [5,4,3,2,1]

-- take 运算子 返回LIST前几个元素
-- take 3 [5,4,3,2,1]
-- take 1 [3,9,3]
-- take 5 [1,2]
-- take 0 [6,6,6]

-- drop 运算子 删除LIST中前几个元素
-- drop 3 [8,4,2,1,5,6]
-- drop 0 [1,2,3,4]
-- drop 100 [1,2,3,4]

-- maximum 运算子 返回LIST中最大的那个元素
-- maximum [8,4,2,1,5,6]

-- minimum 运算子 返回LIST中最小的那个元素
-- minimum [1,9,2,3,4]

-- sum 运算子 返回LIST中所有元素的和
-- sum [5,2,1,6,3,2,5,7]

-- product 运算子 返回LIST中所有元素的积
-- product [6,2,1,2]
-- product [1,2,5,6,7,9,2,0]

-- elem 运算子 判断一个元素是否存在于一个LIST
-- 4 `elem` [3,4,5,6]
-- elem 10 [3,4,5,6]

-- Range 区间， 用于构造LIST方法，其中的值必须是可!!枚举的!!,  可以指定跨度, 用逗号分割, 跨度是加法
-- 如果右侧区间小于左侧区间，则需要标示跨度, 否则返回的是空LIST
-- 避免使用浮点数，因为不精确
-- 如果没有指定Range上线，得到的是无限长度的LIST, 默认跨度是＋1
{--
    [1..20]
    [2,4..20]
    [3,6..20]
    [20,19..1]
    [20..]
--}

-- take 运算子 取得指定长度的LIST, 一般与无限LIST搭配使用
-- [13,26..24*13]
-- take 24 [13,26..]

-- cycle 运算子 接受一个!!LIST!!做参数， 返回一个无限LIST
-- take 10 (cycle [1,2,3])
-- take 12 (cycle "LOL ")

-- repeat 运算子 接受!!一个单元素!!， 返回一个无限LIST
-- take 10 (repeat 5)

-- replicate 运算子 返回指定个数的相同元素的list
-- replicate 3 10
-- 3 `replicate` 10

-- LIST Comprehension  用于构造负责规则的LIST
{--
    [x*2 | x <- [1..10]]
    [x*2 | x <- [1..10], x*2 >= 12]
    [x | x <- [50..100], x `mod` 7 == 3]
--}

-- xs 接受一个数值类型的list，返回一个list
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

--[ x | x <- [10..20], x /= 13, x /= 15, x /= 19]

-- 返回2个list的组合的积, 先取出x一个，在依次取出y元素与x乘积,
--[ x*y | x <- [2,5,10], y <- [8,10,11]]
--[ x*y | x <- [2,5,10], y <- [8,10,11], z <- [1,2,3]]
--[ x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

{--
    let nouns = ["hoho","frog","pope"] 
    let adjectives = ["lazy","grouchy","scheming"]
    [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]
--}

-- 从xs LIST中取出每一个元素，并设置新LIST值都是1, 用SUM 计算 LIST内元素的和，得到LIST长度
length' xs = sum [1 | _ <- xs]

-- 去除字符串中的非大写字母,  取出st LIST中每一个元素, 判断其是否在A..Z区间内，如果是，加入到新LIST
removeNonUppercase st = [ c | c <- st, c `elem` ['A'..'Z']]

-- 操作含LIST的LIST, 如去除奇数
{--
    let xxs = [[1,3,5,2,3,1,2,4,5],[1,2,3,4,5,6,7,8,9],[1,2,4,2,1,6,3,1,3,2,3,6]]
    [ [ x | x <- xs, even x ] | xs <- xxs]
--}

--Tuple 元组 可以存放不同类型值的容器,至少2个数值才有意义,  Tuple可以存放LIST

-- fst 运算子 返回序对的首项,  只对二元组有效
-- fst (8,11)
-- fst ("Wow', False)

-- snd 运算子 返回序对的尾项,  只对二元组有效
-- snd (8,11)
-- snd ("Wow', False)

-- zip 运算子 生成一组序对 （二元组)的LIST,  若两个LIST长度不等，较长的会从中间断开，与较短的匹配，最终返回较短的长度
-- zip [1,2,3,4,5] [5,5,5,5,5]
-- [1,2,3,4,5] `zip` [5,5,5,5,5]
-- zip [1 .. 5] ["one", "two", "three", "four", "five"]
-- [1 .. 5] `zip` ["one", "two", "three", "four", "five"]

-- 获得周长是24的直角三角形 三元组
{--
    let triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ] 
    let rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ] 
    let rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24 ] 
--}

