# PWSH 复制文件或文件夹 

想要复制一个文件或文件夹到一个新的位置？那么你必须Copy-Item cmdlet 。举个例子，这里有一个命令从C:/ Scripts 文件夹下复制文件 Test.txt  到C: /Test 文件夹：
 
 
 Copy - Item c:/scripts/Test.txt  c:/Test
 
 
要想在 C:/Scripts（包括要覆盖的文件夹） 复制所有项目到 C:/Test ？那么仅仅只要使用一个通配字符，像这样：
 
 
 Copy - Item c:/scripts/ *   c:/Test
 
 
你要使用的方法就摆在我们的面前：是的，下一个命令是在 C:/Scripts 里只复制 .txt 文件到 C:/Test ：
 
 
 Copy - Item c:/scripts/ * .txt  c:/Test
 
 
最后，这个命令会复制一个文件夹 C:/Scripts 复制到文件夹 C:/Test 里；换句话说，这个复制信息将名为 C：/Test/Scripts 的文件夹。 命令在这：
 
 
 Copy - Item c:/scripts c:/Test –recurse
 
 
巧合的是，-recurse 参数在这里绝对是关键；省去它的话，则它会把一个scripts文件夹建立在 C:/Test 里，但是 C:/Scripts 中没有文件和文件夹会复制到这个新的位置；你会建立一个 C:/Test/Scripts 文件夹，但是里面没有任何东西。 
 
 
Copy-Item 别名

    cpi
    cp
    copy
    