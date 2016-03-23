import UIKit
import AudioKit

func after(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var viewModel: MainViewModel
    let tableView = UITableView()
    let synth = AKWavetableSynth(waveform: AKTable(.Sine), voiceCount: 5)

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

        AudioKit.output = synth
        AudioKit.start()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = addButton

        view.backgroundColor = UIColor.whiteColor()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = true
        tableView.registerClass(ChordTableViewCell.self,
                                forCellReuseIdentifier: NSStringFromClass(ChordTableViewCell.self))
        view.addSubview(tableView)
    }
    required init?(coder aDecoder: NSCoder) { fatalError() }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func add() {
        viewModel.add()
        tableView.reloadData()
    }

    // MARK: UITableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let chordName = viewModel.chordNames[indexPath.row]
        let id = NSStringFromClass(ChordTableViewCell.self)
        let cell = tableView.dequeueReusableCellWithIdentifier(id) as? ChordTableViewCell
        cell?.label.text = chordName
        return cell!
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.harmonies.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let pitchSet = viewModel.pitchSets[indexPath.row]
        for pitch in pitchSet {
            let midi = Int(pitch.midi)
            synth.playNote(midi, velocity: 100)
            after(0.1) {
                self.synth.stopNote(midi)
            }
        }
    }


}

