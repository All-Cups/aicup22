import os from "os";

const BOOL_SIZE = 1;
const INT_SIZE = 4;
const LONG_SIZE = 8;
const FLOAT_SIZE = 4;
const DOUBLE_SIZE = 8;

export abstract class Stream {
    isLittleEndianMachine: boolean;

    constructor() {
        this.isLittleEndianMachine = (os.endianness() === 'LE');
    }

    abstract read(byteCount: number): Promise<Buffer>;
    abstract write(data: Buffer): Promise<void>;
    abstract flush(): Promise<void>;

    // Reading primitives

    async readBool(): Promise<boolean> {
        const buffer = await this.read(BOOL_SIZE);
        return !!buffer.readInt8();
    }

    async readInt(): Promise<number> {
        const buffer = await this.read(INT_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readInt32LE(0);
        } else {
            return buffer.readInt32BE(0);
        }
    }

    async readLong(): Promise<bigint> {
        const buffer = await this.read(LONG_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readBigInt64LE();
        } else {
            return buffer.readBigInt64BE();
        }
    }

    async readFloat(): Promise<number> {
        const buffer = await this.read(FLOAT_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readFloatLE();
        } else {
            return buffer.readFloatBE();
        }
    }

    async readDouble(): Promise<number> {
        const buffer = await this.read(DOUBLE_SIZE);
        if (this.isLittleEndianMachine) {
            return buffer.readDoubleLE();
        } else {
            return buffer.readDoubleBE();
        }
    }

    async readString(): Promise<string> {
        const length = await this.readInt();
        const buffer = await this.read(length);
        return buffer.toString();
    }

    // Writing primitives

    async writeBool(value: boolean) {
        const buffer = Buffer.alloc(BOOL_SIZE);
        buffer.writeInt8(value ? 1 : 0);
        return await this.write(buffer);
    }

    async writeInt(value: number) {
        const buffer = Buffer.alloc(INT_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeInt32LE(value);
        } else {
            buffer.writeInt32BE(value);
        }
        return await this.write(buffer);
    }

    async writeLong(value: bigint) {
        const buffer = Buffer.alloc(LONG_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeBigInt64LE(value);
        } else {
            buffer.writeBigInt64BE(value);
        }
        return await this.write(buffer);
    }

    async writeFloat(value: number) {
        const buffer = Buffer.alloc(FLOAT_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeFloatLE(value);
        } else {
            buffer.writeFloatBE(value);
        }
        return await this.write(buffer);
    }

    async writeDouble(value: number) {
        const buffer = Buffer.alloc(DOUBLE_SIZE);
        if (this.isLittleEndianMachine) {
            buffer.writeDoubleLE(value);
        } else {
            buffer.writeDoubleBE(value);
        }
        return await this.write(buffer);
    }

    async writeString(value: string) {
        const data = Buffer.from(value);
        this.writeInt(data.length);
        return await this.write(data);
    }
}