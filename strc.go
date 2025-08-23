package strc

const DeviceAuthorize string = "device:authorize"  // map[deviceId]proto(navzy.Device)
const DynamicToStatic string = "dynamic:to:static" // map[string]string

func DevicePort() map[uint16]int32 {
	return map[uint16]int32{10920: 1, 10921: 1}
}
