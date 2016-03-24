import UIKit
import MusicKit

class ChordTableViewCell: UITableViewCell {
    let label = UILabel()
    let defaultBackgroundColor = UIColor.whiteColor()
    let highlightBackgroundColor = UIColor.groupTableViewBackgroundColor()

    var cellModel: ChordCellModel? = nil
    weak var noteBuffer: NoteBuffer? = nil

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutMargins = UIEdgeInsetsZero
        preservesSuperviewLayoutMargins = false
        separatorInset = UIEdgeInsetsZero
        label.textAlignment = .Center
        addSubview(label)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }

    func configure(model: ChordCellModel, noteBuffer: NoteBuffer) {
        self.cellModel = model
        self.noteBuffer = noteBuffer
        self.label.text = model.chordName
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.backgroundColor = highlightBackgroundColor
        if let pitches = cellModel?.pitchSet {
            noteBuffer?.on(pitches)
        }
    }

    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        super.touchesCancelled(touches, withEvent: event)
        self.backgroundColor = defaultBackgroundColor
        if let pitches = cellModel?.pitchSet {
            noteBuffer?.off(pitches)
        }
    }

    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        self.backgroundColor = defaultBackgroundColor
        if let pitches = cellModel?.pitchSet {
            noteBuffer?.off(pitches)
        }
    }

    // It's important we don't call super for these two methods, since we're providing our own highlight behavior.
    override func setHighlighted(highlighted: Bool, animated: Bool) {}
    override func setSelected(selected: Bool, animated: Bool) {}

}
