

# 修改文件所有者和所有组使用命令chown

## 命令格式

chown [选项]… [所有者][:[组]] 文件…

## 举例:
chown userA:groupA 1.txt
修改文件1.txt的所有者为userA，所有组为groupA。

chown userA 1.txt
修改文件1.txt的所有者为userA。

chown -R userA:groupA folderA
递归修改文件夹及文件夹内部文件的所有者为userA，所有组为groupA。

chmod -R 777 folder