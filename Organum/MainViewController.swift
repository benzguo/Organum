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
    let noteBuffer = NoteBuffer()

    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)

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
        AudioKit.start()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

    func add() {
        tableView.beginUpdates()
        viewModel.add()
        let indexPath = NSIndexPath(forRow: viewModel.cellModels.count - 1,
                                    inSection: 0)
        tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        tableView.endUpdates()
    }

    // MARK: UITableView
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellModel = viewModel.cellModels[indexPath.row]
        let id = NSStringFromClass(ChordTableViewCell.self)
        let cell = tableView.dequeueReusableCellWithIdentifier(id) as? ChordTableViewCell
        cell?.configure(cellModel, noteBuffer: noteBuffer)
        return cell!
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.cellModels.count
    }


}

