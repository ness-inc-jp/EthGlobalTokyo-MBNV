//
//  ConvertIpfsToHttp.swift
//  EthTokyoApp
//
//  Created by 住居尚弥 on 2023/04/15.
//

import Foundation
import CoreMotion

class MotionManager: ObservableObject {

    private var motionManager: CMMotionManager
    var referenceAttitude: CMAttitude?
    
    @Published var x: Double = 0.0
    @Published var y: Double = 0.0
    @Published var z: Double = 0.0
    @Published var magnitude: Double = 0.0
    
    init() {
        self.motionManager = CMMotionManager()
    }
    
    func startUpdates() {
        self.motionManager.deviceMotionUpdateInterval = 1/100
        guard self.motionManager.isDeviceMotionAvailable else {return}
        self.motionManager.startDeviceMotionUpdates(to: .main) { (deviceData, error) in
            guard error == nil else {
                print(error!)
                return
            }
            if let deviceData = deviceData {
                
                if self.referenceAttitude == nil {
                    
                    self.referenceAttitude = deviceData.attitude
            
                } else {
                    
                    deviceData.attitude.multiply(byInverseOf: self.referenceAttitude!)
                    
                    self.magnitude = self.magnitude(from: deviceData.attitude)
                    self.x = deviceData.attitude.pitch / self.magnitude
                    self.y = deviceData.attitude.roll / self.magnitude
                    self.z = deviceData.attitude.yaw / self.magnitude
                    
                }
            }
        }
    }
    
    func magnitude(from attitude: CMAttitude) -> Double {
        return sqrt(pow(attitude.roll,2) + pow(attitude.pitch,2))
    }
    
    func degrees(_ radians: Double) -> Double {
        return 180 / .pi * radians
    }
    
    func stopUpdates() {
        x = 0
        y = 0
        z = 0
        magnitude = 0
        referenceAttitude = nil
        self.motionManager.stopDeviceMotionUpdates()
    }
}

