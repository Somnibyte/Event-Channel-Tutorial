import Foundation
import Flutter

class RandomNumberStreamHandler: NSObject, FlutterStreamHandler{
    var sink: FlutterEventSink?
    var timer: Timer?
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        sink = events
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sendNewRandomNumber), userInfo: nil, repeats: true)
        return nil
    }
    
    @objc func sendNewRandomNumber() {
        guard let sink = sink else { return }
        
        let randomNumber = Int.random(in: 1..<10)
        sink(randomNumber)
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        sink = nil
        timer?.invalidate()
        return nil
    }
}
