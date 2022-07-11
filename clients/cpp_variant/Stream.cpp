#include "Stream.hpp"
#include <algorithm>
#include <cstring>
#include <vector>

// Check if current machine is little endian
bool isLittleEndianMachine()
{
    union {
        unsigned short value;
        char bytes[2];
    } test = { 0x0201 };
    return test.bytes[0] == 1;
}

bool IS_LITTLE_ENDIAN_MACHINE = isLittleEndianMachine();

// Read a bool from this stream
bool InputStream::readBool()
{
    char buffer[1];
    readBytes(buffer, 1);
    return buffer[0] != 0;
}

// Read an int from this stream
int InputStream::readInt()
{
    char buffer[sizeof(int)];
    readBytes(buffer, sizeof(int));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(int));
    }
    return *reinterpret_cast<int*>(buffer);
}

// Read a long long from this stream
long long InputStream::readLongLong()
{
    char buffer[sizeof(long long)];
    readBytes(buffer, sizeof(long long));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(long long));
    }
    return *reinterpret_cast<long long*>(buffer);
}

// Read a float from this stream
float InputStream::readFloat()
{
    char buffer[sizeof(float)];
    readBytes(buffer, sizeof(float));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(float));
    }
    return *reinterpret_cast<float*>(buffer);
}

// Read a double from this stream
double InputStream::readDouble()
{
    char buffer[sizeof(double)];
    readBytes(buffer, sizeof(double));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(double));
    }
    return *reinterpret_cast<double*>(buffer);
}

// Read a string from this stream
std::string InputStream::readString()
{
    std::vector<char> buffer(readInt());
    readBytes(&buffer[0], buffer.size());
    return std::string(&buffer[0], buffer.size());
}

// Write a bool into this stream
void OutputStream::write(bool value)
{
    char buffer[sizeof(bool)];
    std::memcpy(buffer, &value, sizeof(bool));
    writeBytes(buffer, sizeof(bool));
}

// Write an int into this stream
void OutputStream::write(int value)
{
    char buffer[sizeof(int)];
    std::memcpy(buffer, &value, sizeof(int));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(int));
    }
    writeBytes(buffer, sizeof(int));
}

// Write a long long into this stream
void OutputStream::write(long long value)
{
    char buffer[sizeof(long long)];
    std::memcpy(buffer, &value, sizeof(long long));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(long long));
    }
    writeBytes(buffer, sizeof(long long));
}

// Write a float into this stream
void OutputStream::write(float value)
{
    char buffer[sizeof(float)];
    std::memcpy(buffer, &value, sizeof(float));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(float));
    }
    writeBytes(buffer, sizeof(float));
}

// Write a double into this stream
void OutputStream::write(double value)
{
    char buffer[sizeof(double)];
    std::memcpy(buffer, &value, sizeof(double));
    if (!IS_LITTLE_ENDIAN_MACHINE) {
        std::reverse(buffer, buffer + sizeof(double));
    }
    writeBytes(buffer, sizeof(double));
}

// Write a string into this stream
void OutputStream::write(const std::string& value)
{
    write((int)(value.length()));
    writeBytes(value.c_str(), value.length());
}