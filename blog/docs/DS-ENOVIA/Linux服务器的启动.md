
# Linux服务器的

## 数据库的启动与关闭

oracle启动命令为：

- 启动数据库服务

    su - oracle
    sqlplus "/as sysdba"
    startup
    exit

- 查看数据库是否启动

    select status from v$instance;

- 启动oracle监听

### 启动关闭所有

=== "启动Tomee"

    ```bash

    /app/DassaultSystemes/R2022x/3DSpaceIndex/linux_a64/code/command/startXLAdvancedSearchServer.sh
    dbstart $ORACLE_HOME
    sleep 30
    /app/DassaultSystemes/R2022x/3DPassport/linux_a64/code/tomee/bin/startup.sh
    /app/DassaultSystemes/R2022x/3DDashboard/linux_a64/code/tomee/bin/startup.sh
    /app/DassaultSystemes/R2022x/FedSearch/linux_a64/code/tomee/bin/startup.sh
    /app/DassaultSystemes/R2022x/3DSpace/scripts/TomEECAS_Startup.sh
    /app/DassaultSystemes/R2022x/3DSpace/scripts/TomEENoCAS_Startup.sh
    /app/DassaultSystemes/R2022x/CentralFCS/linux_a64/code/tomee/bin/startup.sh
    /app/DassaultSystemes/R2022x/3DComment/linux_a64/code/tomee/bin/startup.sh
    /app/DassaultSystemes/R2022x/3DSwym/linux_a64/code/tomee/bin/startup.sh
    /app/DassaultSystemes/R2022x/3DSwym/linux_a64/datadir/bin/cvinit.sh start
    /app/DassaultSystemes/R2022x/3DSwym/linux_a64/code/command/ExternalConverterSvc start
    /app/DassaultSystemes/R2022x/3DNotification/linux_a64/code/command/node start
    #/app/DassaultSystemes/R2022x/3DOrchestrate/linux_a64/code/tomee172/bin/startup.sh


    ```

=== "关闭Tomee"

    ```bash

    /app/DassaultSystemes/R2022x/3DNotification/linux_a64/code/command/node stop
    /app/DassaultSystemes/R2022x/3DNotification/linux_a64/code/command/node stop
    /app/DassaultSystemes/R2022x/3DSwym/linux_a64/datadir/bin/cvinit.sh stop
    /app/DassaultSystemes/R2022x/3DSwym/linux_a64/code/command/ExternalConverterSvc stop
    #/app/DassaultSystemes/R2022x/3DOrchestrate/linux_a64/code/tomee172/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/3DSwym/linux_a64/code/tomee/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/3DComment/linux_a64/code/tomee/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/3DSpace/scripts/TomEECAS_Shutdown.sh
    /app/DassaultSystemes/R2022x/3DSpace/scripts/TomEENoCAS_Shutdown.sh
    /app/DassaultSystemes/R2022x/CentralFCS/linux_a64/code/tomee/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/3DPassport/linux_a64/code/tomee/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/FedSearch/linux_a64/code/tomee/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/3DDashboard/linux_a64/code/tomee/bin/shutdown.sh
    /app/DassaultSystemes/R2022x/3DSpaceIndex/linux_a64/code/command/stopXLAdvancedSearchServer.sh
    sleep 30
    dbshut $ORACLE_HOME

    ```