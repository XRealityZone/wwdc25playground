#!/bin/bash

# 检查 wwdc25playground.framer.website 文件夹是否存在
if [ -d "wwdc25playground.framer.website" ]; then
    # 如果存在，则重命名为 page
    mv wwdc25playground.framer.website page
    echo "文件夹已成功重命名为 page"
else
    echo "错误：wwdc25playground.framer.website 文件夹不存在"
fi

# 定义第一个要替换的字符串及其替换内容
OLD_STRING_1="My Framer Site"
NEW_STRING_1="Let's visionOS 2025"

# 定义第二个要替换的字符串及其替换内容
OLD_STRING_2="wwdc25playground.framer.website"
NEW_STRING_2="wwdc25.swiftgg.team"

# 定义第二个要替换的字符串及其替换内容
OLD_STRING_2="wwdc25playground.framer.website"
NEW_STRING_2="wwdc25.swiftgg.team"

# 定义第三个要替换的字符串及其替换内容
OLD_STRING_3="wwdc25.swiftgg.team/en"
NEW_STRING_3="wwdc25.swiftgg.team/page/en"

# 定义第四个要替换的字符串及其替换内容
OLD_STRING_4="Made with Framer"
NEW_STRING_4="Made with love - SwiftGG"

# 定义要删除的标签
#OLD_TAG="<div id=\"__framer-badge-container\"></div>"
#NEW_TAG=""

OLD_PATH=".mjs\")),path:\"/cn\"}"
NEW_PATH=".mjs\")),path:\"/\"}"

# 定义要搜索的文件类型
FILE_TYPES=("html" "css" "js" "mjs" "xml")

# 遍历每种文件类型
for type in "${FILE_TYPES[@]}"; do
    # 使用 find 查找所有匹配的文件，忽略 .git 目录和 .gitignore 文件以及当前目录下的 index.html 文件
    # 然后使用 sed 进行字符串替换
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_1}#${NEW_STRING_1}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_2}#${NEW_STRING_2}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_3}#${NEW_STRING_3}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_STRING_4}#${NEW_STRING_4}#g" {} +
    #find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_TAG}#${NEW_TAG}#g" {} +
    find . -type f -name "*.$type" ! -path './index.html' ! -path './.git/*' ! -name '.gitignore' -exec sed -i '' "s#${OLD_PATH}#${NEW_PATH}#g" {} +
done


# 新增替换逻辑
OLD_HREF="href=\"https://wwdc25.swiftgg.team/page/en\""
NEW_HREF="href=\"https://wwdc25.swiftgg.team/page\""
if [ -f "page/en/index.html" ]; then
    sed -i '' "s#${OLD_HREF}#${NEW_HREF}#g" page/en/index.html
    echo "成功替换 page/en/index.html 中的链接"
else
    echo "错误：page/en/index.html 文件不存在"
fi

OLD_HREF_2="\"en/index.html\""
NEW_HREF_2="\"https://wwdc25.swiftgg.team/page/en\""
if [ -f "page/en/index.html" ]; then
    sed -i '' "s#${OLD_HREF_2}#${NEW_HREF_2}#g" page/index.html
    echo "成功替换 page/index.html 中的链接"
else
    echo "错误：page/index.html 文件不存在"
fi


# 定义要删除的 div 的正则表达式模式
PATTERN='<div id="__framer-badge-container">((?:[^<]+|<(?!/div>))*</div>)*</div>'

# 定义要搜索的文件类型
FILE_TYPES=("html" "css" "js" "mjs" "xml")

# 遍历每种文件类型
for type in "${FILE_TYPES[@]}"; do
    # 使用 find 查找所有匹配的文件，然后使用 perl 进行多行正则替换
    find . -type f -name "*.$type" -exec perl -i -0pe 's/<div id="__framer-badge-container">((?:[^<]+|<(?!\/div>))*<\/div>)*<\/div>//gs' {} +
done

echo "Framer badge removal completed."
