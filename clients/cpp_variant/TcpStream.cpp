#include "TcpStream.hpp"
#include <cstring>
#include <stdexcept>

TcpStream::TcpStream(const std::string& host, int port)
    : readBufferPos(0)
    , readBufferSize(0)
    , writeBufferPos(0)
    , writeBufferSize(0)
{
#ifdef _WIN32
    WSADATA wsa_data;
    if (WSAStartup(MAKEWORD(1, 1), &wsa_data) != 0) {
        throw std::runtime_error("Failed to initialize sockets");
    }
#endif
    sock = socket(AF_INET, SOCK_STREAM, 0);
    if (sock == -1) {
        throw std::runtime_error("Failed to create socket");
    }
    int yes = 1;
    if (setsockopt(sock, IPPROTO_TCP, TCP_NODELAY, (char*)&yes, sizeof(int)) < 0) {
        throw std::runtime_error("Failed to set TCP_NODELAY");
    }
    addrinfo hints, *servinfo;
    std::memset(&hints, 0, sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_socktype = SOCK_STREAM;
    if (getaddrinfo(host.c_str(), std::to_string(port).c_str(), &hints,
            &servinfo)
        != 0) {
        throw std::runtime_error("Failed to get addr info");
    }
    if (connect(sock, servinfo->ai_addr, servinfo->ai_addrlen) == -1) {
        throw std::runtime_error("Failed to connect");
    }
    freeaddrinfo(servinfo);
}

void TcpStream::readBytes(char* buffer, size_t byteCount)
{
    while (byteCount > 0) {
        if (readBufferSize > 0) {
            if (readBufferSize >= byteCount) {
                memcpy(buffer, this->readBuffer + readBufferPos, byteCount);
                readBufferPos += byteCount;
                readBufferSize -= byteCount;
                return;
            }
            memcpy(buffer, this->readBuffer + readBufferPos, readBufferSize);
            buffer += readBufferSize;
            byteCount -= readBufferSize;
            readBufferPos += readBufferSize;
            readBufferSize = 0;
        }
        if (readBufferPos == BUFFER_CAPACITY) {
            readBufferPos = 0;
        }
        RECV_SEND_T received = recv(sock, this->readBuffer + readBufferPos + readBufferSize,
            BUFFER_CAPACITY - readBufferPos - readBufferSize, 0);
        if (received < 0) {
            throw std::runtime_error("Failed to read from socket");
        }
        readBufferSize += received;
    }
}

TcpStream::~TcpStream()
{
#ifdef _WIN32
    if (closesocket(sock) != 0)
#else
    if (close(sock) != 0)
#endif
    {
        throw std::runtime_error("Failed to close socket");
    }
}

void TcpStream::writeBytes(const char* buffer, size_t byteCount)
{
    while (byteCount > 0) {
        size_t capacity = BUFFER_CAPACITY - writeBufferPos - writeBufferSize;
        if (capacity >= byteCount) {
            memcpy(this->writeBuffer + writeBufferPos + writeBufferSize, buffer, byteCount);
            writeBufferSize += byteCount;
            return;
        }
        memcpy(this->writeBuffer + writeBufferPos + writeBufferSize, buffer, capacity);
        writeBufferSize += capacity;
        byteCount -= capacity;
        buffer += capacity;
        flush();
    }
}

void TcpStream::flush()
{
    while (writeBufferSize > 0) {
        RECV_SEND_T sent = send(sock, writeBuffer + writeBufferPos, writeBufferSize, 0);
        if (sent < 0) {
            throw std::runtime_error("Failed to write to socket");
        }
        writeBufferPos += sent;
        writeBufferSize -= sent;
    }
    writeBufferPos = 0;
}