import UIKit

class ViewController: UIViewController {
    var simpleBluetoothIO: SimpleBluetoothIO!

    @IBOutlet weak var ledToggleButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        simpleBluetoothIO = SimpleBluetoothIO(serviceUUID: "180A", delegate: self)
    }

    @IBAction func ledToggleButtonDown(_ sender: UIButton) {
        simpleBluetoothIO.writeValue(value: 1)
    }

    @IBAction func ledToggleButtonUp(_ sender: UIButton) {
        simpleBluetoothIO.writeValue(value: 3)
    }

}

extension ViewController: SimpleBluetoothIODelegate {
    func simpleBluetoothIO(simpleBluetoothIO: SimpleBluetoothIO, didReceiveValue value: Int8) {
        if value > 0 {
            view.backgroundColor = UIColor.yellow
        } else {
            view.backgroundColor = UIColor.black
        }
    }
}
