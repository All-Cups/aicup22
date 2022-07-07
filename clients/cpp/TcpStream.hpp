#ifndef __TCP_STREAM_HPP__
#define __TCP_STREAM_HPP__

#include "Stream.hpp"

#ifdef _WIN32
#ifndef _WIN32_WINNT
#define _WIN32_WINNT 0x0501
#endif
#include <Ws2tcpip.h>
#include <winsock2.h>
typedef int RECV_SEND_T;
#else
#include <arpa/inet.h>
#include <netdb.h>
#include <netinet/tcp.h>
#include <sys/socket.h>
#include <unistd.h>
typedef int SOCKET;
typedef ssize_t RECV_SEND_T;
#endif

class TcpStream : public InputStream, public OutputStream {
public:
    TcpStream(const std::string& host, int port);
    ~TcpStream();
    void readBytes(char* buffer, size_t byteCount);
    void writeBytes(const char* buffer, size_t byteCount);
    void flush();

private:
    SOCKET sock;
    static const size_t BUFFER_CAPACITY = 8 * 1024;
    char readBuffer[BUFFER_CAPACITY];
    size_t readBufferPos;
    size_t readBufferSize;
    char writeBuffer[BUFFER_CAPACITY];
    size_t writeBufferPos;
    size_t writeBufferSize;
};

#endif