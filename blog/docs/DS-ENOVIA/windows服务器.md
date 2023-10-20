# windows 服务器

## R2017x

=== "关闭许可证服务"

    ```bash
    @echo off
    net stop "DS License Server"
    timeout /t 4
    ```

=== "启动许可证服务"

    ```bash
    @echo off
    net start "DS License Server"
    timeout /t 4
    ```

---

=== "关闭apache"

    ```bash
    net stop "Apache2.4"
    timeout /t 2
    ```

=== "关闭数据库"

    ```bash
    net stop "OracleOraDB12Home1MTSRecoveryService"
    timeout /t 3
    net stop "OracleOraDB12Home1TNSListener"
    timeout /t 3
    net stop "OracleRemExecServiceV2"
    timeout /t 3
    net stop "OracleServiceORCL"
    timeout /t 3
    net stop "OracleVssWriterORCL"
    timeout /t 3
    ```

=== "关闭TomEE Server"
    ```bash
    net stop "3DPassport_R2017x"
    timeout /t 3
    net stop "3DDashboard_R2017x"
    timeout /t 3
    net stop "federated_R2017x"
    timeout /t 3
    net stop "3DEXPERIENCE R2017x 3DSpace Index"
    timeout /t 3
    net stop "3DSpaceTomEE_R2017x"
    timeout /t 3
    net stop "3DSpaceTomEENoCAS_R2017x"
    timeout /t 3
    ```

---

=== "启动apache"
    ```bash
    net start "Apache2.4"
    timeout /t 4
    ```
=== "启动数据库"
    ```bash
    net start "OracleOraDB12Home1MTSRecoveryService"
    timeout /t 3
    net start "OracleOraDB12Home1TNSListener"
    timeout /t 3
    net start "OracleRemExecServiceV2"
    timeout /t 3
    net start "OracleServiceORCL"
    timeout /t 3
    net start "OracleVssWriterORCL"
    timeout /t 3
    ```
=== "启动TomEE Server"
    ```bash
    net start "3DPassport_R2017x"
    timeout /t 3
    net start "3DDashboard_R2017x"
    timeout /t 3
    net start "federated_R2017x"
    timeout /t 3
    net start "3DEXPERIENCE R2017x 3DSpace Index"
    timeout /t 3
    net start "3DSpaceTomEE_R2017x"
    timeout /t 3
    net start "3DSpaceTomEENoCAS_R2017x"
    timeout /t 3
    ```

---

## R2019x

=== "关闭许可证服务"

    ```bash
    @echo off
    net stop "DS License Server"
    timeout /t 4
    ```

=== "启动许可证服务"

    ```bash
    @echo off
    net start "DS License Server"
    timeout /t 4
    ```

---

=== "关闭apache"
    ```bash
    net stop "Apache2.4"
    timeout /t 2
    ```
=== "关闭数据库"
    ```bash
    net stop "OracleOraDB12Home1MTSRecoveryService"
    timeout /t 3
    net stop "OracleOraDB12Home1TNSListener"
    timeout /t 3
    net stop "OracleRemExecServiceV2"
    timeout /t 3
    net stop "OracleServiceORCL"
    timeout /t 3
    net stop "OracleVssWriterORCL"
    timeout /t 3
    ```

=== "关闭TomEE Server"

    ```bash
    
    net stop "3DPassport_R2019x"
    timeout /t 3
    net stop "3DDashboard_R2019x"
    timeout /t 3
    net stop "federated_R2019x"
    timeout /t 3
    net stop "3DEXPERIENCE R2019x 3DSpace Index"
    timeout /t 3
    net stop "3DSpaceTomEE_R2019x"
    timeout /t 3
    net stop "3DSpaceTomEENoCAS_R2019x"
    timeout /t 3
    ```

---

=== "启动apache"
    ```bash
    net start "Apache2.4"
    timeout /t 4
    ```
=== "启动数据库"
    ```bash
    net start "OracleOraDB12Home1MTSRecoveryService"
    timeout /t 3
    net start "OracleOraDB12Home1TNSListener"
    timeout /t 3
    net start "OracleRemExecServiceV2"
    timeout /t 3
    net start "OracleServiceORCL"
    timeout /t 3
    net start "OracleVssWriterORCL"
    timeout /t 3
    ```
=== "启动TomEE Server"

    ```bash
    net start "3DPassport_R2019x"
    timeout /t 3
    net start "3DDashboard_R2019x"
    timeout /t 3
    net start "federated_R2019x"
    timeout /t 3
    net start "3DEXPERIENCE R2019x 3DSpace Index"
    timeout /t 3
    net start "3DSpaceTomEE_R2019x"
    timeout /t 3
    net start "3DSpaceTomEENoCAS_R2019x"
    timeout /t 3
    ```
