import UIKit
import Moya

var myIndex = 0

class MainTableViewController: UITableViewController {
    
    @IBOutlet var tableview: UITableView!
    static var collections: Shopify?
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (MainTableViewController.collections?.customCollections.count) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = MainTableViewController.collections?.customCollections[indexPath.row].title
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func viewDidLoad() {
        let CustomCollectionProvider = MoyaProvider<CollectionService>()
        CustomCollectionProvider.request(.getCustomCollection()) { result in
            do {
                let decoder = JSONDecoder()
                MainTableViewController.collections = try decoder.decode(Shopify.self, from: (result.value?.data)!)
//                print("\(MainTableViewController.collections)")
                self.tableview.reloadData()
            } catch let err {
                print("Err", err)
            }
            
            
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableview.reloadData()
    }
    
 
}
