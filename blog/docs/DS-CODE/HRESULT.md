
# HRESULT


HRESULT即函数返回值， 是一种简单的数据类型，通常被属性和 ATL 用作返回值。

* 外文名
    HRESULT
* 性质
    科学 
* 类别
    计算机学 

A value returned from a function call to an interface, consisting of a severity code, context information, a facility code, and a status code that describes the result. For 16-bit Windows systems, the HRESULT is an opaque result handle defined to be zero for a successful return from a function, and nonzero if error or status information is to be returned. To convert an HRESULT into a more detailed SCODE (or return value), applications call GetSCode(). See SCODE.
如果这个函数是执行完返回的话将包含具有实际意义的数据，如果立即返回则包含状态信息--发送成功与否，并不能说明执行的如何。下表说明各种不同的值。头文件 winerror.h 中包含更多的值。

名称    说明    值

```bash
    S_OK 操作成功 0x00000000
    E_UNEXPECTED 意外的失败 0x8000FFFF
    E_NOTIMPL 未实现 0x80004001
    E_OUTOFMEMORY 未能分配所需的内存 0x8007000E
    E_INVALIDARG 一个或多个参数无效 0x80070057
    E_NOINTERFACE 不支持此接口 0x80004002
    E_POINTER 无效指针 0x80004003
    E_HANDLE 无效句柄 0x80070006
    E_ABORT 操作已中止 0x80004004
    E_FAIL 未指定的失败 0x80004005
    E_ACCESSDENIED 一般的访问被拒绝错误 0x80070005
```

不能简单地把返回值与 S_OK 和 E_FAIL 比较，而要用 SUCCEEDED 和 FAILED 宏进行判断。
HRESULT 其实是一个32位的值，其最高位(bit)如果是0表示成功，1表示错误。具体参见 MSDN 之"Structure of COM Error Codes"说明。我们在程序中如果需要判断返回值，则可以使用比较运算符号；switch开关语句；也可以使用VC提供的宏： HRESULT hr = 调用组件函数;

```cpp
if( SUCCEEDED( hr ) ){...} // 如果成功
......
if( FAILED( hr ) ){...} // 如果失败
......

```
