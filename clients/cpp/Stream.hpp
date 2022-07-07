#ifndef __STREAM_HPP__
#define __STREAM_HPP__

#include <string>

// Input stream interface
class InputStream {
public:
    // Read exactly byteCount bytes into buffer
    virtual void readBytes(char* buffer, size_t byteCount) = 0;
    // Read a bool from this stream
    bool readBool();
    // Read an int from this stream
    int readInt();
    // Read a long long from this stream
    long long readLongLong();
    // Read a float from this stream
    float readFloat();
    // Read a double from this stream
    double readDouble();
    // Read a string from this stream
    std::string readString();
};

// Output stream interface
class OutputStream {
public:
    // Write byte buffer into this stream
    virtual void writeBytes(const char* buffer, size_t byteCount) = 0;
    // Flush this stream
    virtual void flush() = 0;
    // Write a bool into this stream
    void write(bool value);
    // Write an int into this stream
    void write(int value);
    // Write a long long into this stream
    void write(long long value);
    // Write a float into this stream
    void write(float value);
    // Write a double into this stream
    void write(double value);
    // Write a string into this stream
    void write(const std::string& value);
};

#endif