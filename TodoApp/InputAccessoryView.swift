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
        print("BUTTON TAPPED")
        delegate?.tappedSendButton(text: textView.text)
        textView.text = ""
    }
    
}


protocol InputAccessoryViewDelegate: AnyObject {
    func tappedSendButton(text: String)
}
