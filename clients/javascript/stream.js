'use strict';

const os = require('os');

const BOOL_SIZE = 1;
const INT_SIZE = 4;
const LONG_SIZE = 8;
const FLOAT_SIZE = 4;
const DOUBLE_SIZE = 8;

class Stream {
    constructor() {
        this.isLittleEndianMachine = (os.endianness() === 'LE');
    }

    // Reading primitives
    async readBool() {
        const buffer = await this.read(BOOL_SIZE);
        return !!buffer.readInt8();
    }

    async readInt() {
        const buffer = await this.read(INT_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readInt32LE();
        } else {
            return buffer.readInt32BE();
        }
    }

    async readLong() {
        const buffer = await this.read(LONG_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readBigInt64LE();
        } else {
            return buffer.readBigInt64BE();
        }
    }

    async readFloat() {
        const buffer = await this.read(FLOAT_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readFloatLE();
        } else {
            return buffer.readFloatBE();
        }
    }

    async readDouble() {
        const buffer = await this.read(DOUBLE_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readDoubleLE();
        } else {
            return buffer.readDoubleBE();
        }
    }

    async readString() {
        const length = await this.readInt();
        const buffer = await this.read(length);
        return buffer.toString();
    }

    // Writing primitives

    async writeBool(value) {
        const buffer = Buffer.alloc(BOOL_SIZE);
        buffer.writeInt8(value);
        return await this.write(buffer);
    }

    async writeInt(value) {
        const buffer = Buffer.alloc(INT_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeInt32LE(value);
        } else {
            buffer.writeInt32BE(value);
        }
        return await this.write(buffer);
    }

    async writeLong(value) {
        const buffer = Buffer.alloc(LONG_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeBigInt64LE(value);
        } else {
            buffer.writeBigInt64BE(value);
        }
        return await this.write(buffer);
    }

    async writeFloat(value) {
        const buffer = Buffer.alloc(FLOAT_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeFloatLE(value);
        } else {
            buffer.writeFloatBE(value);
        }
        return await this.write(buffer);
    }

    async writeDouble(value) {
        const buffer = Buffer.alloc(DOUBLE_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeDoubleLE(value);
        } else {
            buffer.writeDoubleBE(value);
        }
        return await this.write(buffer);
    }

    async writeString(value) {
        const data = Buffer.from(value);
        this.writeInt(data.length);
        return await this.write(data);
    }
}

module.exports = Stream;