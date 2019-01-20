import UIKit
import Moya

var collections: [CustomCollection] = []

class MainTableViewController: UITableViewController {
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return collections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = collections[indexPath.row].title
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
    }
    
    override func viewDidLoad() {
        let CustomCollectionProvider = MoyaProvider<CollectionService>()
        CustomCollectionProvider.request(.getCustomCollection()) { result in
            do {
                let decoder = JSONDecoder()
                let data = try decoder.decode(Shopify.self, from: (result.value?.data)!)
            } catch let err {
                print("Err", err)
            }
            
        }
    }
    
 
}
