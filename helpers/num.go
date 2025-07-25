package helpers

import (
	"encoding/binary"
	"encoding/hex"
	"math"
)

func Uint64ToBytes(n uint64) []byte {
	bytes := make([]byte, 8)
	binary.BigEndian.PutUint64(bytes, n)
	return bytes
}

func Uint32ToBytes(n uint32) []byte {
	bytes := make([]byte, 4)
	binary.BigEndian.PutUint32(bytes, n)
	return bytes
}

func Uint16ToBytes(n uint16) []byte {
	bytes := make([]byte, 2)
	binary.BigEndian.PutUint16(bytes, n)
	return bytes
}

func FormatHexStringToByte(hexString string) []byte {
	hexBytes, err := hex.DecodeString(hexString)
	if err != nil {
		return nil
	}
	return hexBytes
}

func BytesToUInt16(b []byte) uint16 {
	if len(b) == 1 {
		return uint16(uint8(b[0]))
	}
	return binary.BigEndian.Uint16(b)
}

func BytesToUInt32(b []byte) uint32 {
	if len(b) < 4 {
		panic("byte slice too short for int32")
	}
	return binary.BigEndian.Uint32(b)
}

func BytesToUInt64(b []byte) uint64 {
	if len(b) < 8 {
		panic("byte slice too short for int64")
	}
	return binary.BigEndian.Uint64(b)
}

func BytesToFloat32(b []byte) float32 {
	if len(b) < 4 {
		panic("byte slice too short for float32")
	}
	bits := binary.BigEndian.Uint32(b)
	return math.Float32frombits(bits)
}

func BytesToFloat64(b []byte) float64 {
	if len(b) < 4 {
		panic("byte slice too short for float32")
	}
	bits := binary.BigEndian.Uint64(b)
	return math.Float64frombits(bits)
}

func BytesToInt16(b []byte) int16 {
	return int16(BytesToUInt16(b))
}

func BytesToInt32(b []byte) int32 {
	return int32(BytesToUInt32(b))
}

func BytesToInt64(b []byte) int64 {
	return int64(BytesToUInt64(b))
}
