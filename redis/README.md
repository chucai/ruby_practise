使用redis/thread 实现进程之间的通信，具体思路是这样的：
现在有两个进程 process1 和 process2
其中 process1 subscribe redis的 'read_book' 频道
process2 进程会不定期的发送消息给process1 进程
但是我不希望Process1进程会阻塞调用，希望他能做其他的事情。
当redis发送消息以后才运行对应的代码
