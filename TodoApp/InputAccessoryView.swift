import UIKit

class InputAccessoryView: UIView {
    
    @IBOutlet var textView: UITextView!
    @IBOutlet var sendButton: UIButton!
    
    var delegate: InputAccessoryViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadNib() {
        let nib = UINib(nibName: "InputAccessoryView", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func tappedSendButton() {
        delegate = (getTopViewController() as! any InputAccessoryViewDelegate)
        delegate?.tappedSendButton(text: textView.text)

        textView.text = ""
        textView.resignFirstResponder()
    }
    
    func getTopViewController() -> UIViewController? {
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        
        if let rootViewController = window!.rootViewController {
            var topViewController: UIViewController = rootViewController
            while let presentedViewController = topViewController.presentedViewController {
                topViewController = presentedViewController
            }
            return topViewController
        } else {
            return nil
        }
    }
    
}


protocol InputAccessoryViewDelegate: AnyObject {
    func tappedSendButton(text: String)
}
