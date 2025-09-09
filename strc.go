package strc

const DeviceAuthorize string = "device:authorize"  // map[deviceId]navzy.Device
const DynamicToStatic string = "dynamic:to:static" // map[string]string
const DeviceDynamicKey string = "device:dynamic"   // map[dynamic]navzy.Device

func DevicePort() map[uint16]int32 {
	return map[uint16]int32{10920: 1, 10921: 1}
}
