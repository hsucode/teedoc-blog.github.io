# pwsh执行python环境权限


尝试新的跨平台 PowerShell https://aka.ms/pscore6

```batch
PS C:\Windows\system32> cd C:\XUS\code\pyvenv\pyenv\Scripts
PS C:\XUS\code\pyvenv\pyenv\Scripts> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

执行策略更改
执行策略可帮助你防止执行不信任的脚本。更改执行策略可能会产生安全风险，如 https:/go.microsoft.com/fwlink/?LinkID=135170
中的 about_Execution_Policies 帮助主题所述。是否要更改执行策略?
[Y] 是(Y)  [A] 全是(A)  [N] 否(N)  [L] 全否(L)  [S] 暂停(S)  [?] 帮助 (默认值为“N”): A

```batch
PS C:\XUS\code\pyvenv\pyenv\Scripts>
PS C:\XUS\code\pyvenv\pyenv\Scripts> .\Activate.ps1
(pyenv) PS C:\XUS\code\pyvenv\pyenv\Scripts>
```

