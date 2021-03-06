import UIKit
import Moya

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var collects: Collects?
    var products: Product?
    var productIds: [Int] = []
    let CustomCollectionProvider = MoyaProvider<CollectionService>()

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.products.count ?? 0
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: "labelCell")
        cell.textLabel?.text = products?.products[indexPath.row].title
        
        var inventorySum: Int = 0
        if let variants = products?.products[indexPath.row].variants {
            for variant in variants {
                inventorySum += variant.inventoryQuantity
            }
        }
        cell.detailTextLabel?.text = "Available: \(inventorySum)"
        
        /**
         A little confused as the spec said "collections image" which means they'd all have the same photo.
        */
        if let url = URL(string: (MainTableViewController.collections?.customCollections[myIndex].image.src ?? "")) {
            let data = try? Data(contentsOf: url)
            cell.imageView?.image = UIImage(data: data!)
        }

        
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        getCollects {
            self.getProducts()
        }
    
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getCollects(_ completion : @escaping ()->()) {
        let id: Int? = MainTableViewController.collections?.customCollections[myIndex].id
        CustomCollectionProvider.request(.getCollects(collectionId: id ?? 0)) { result in
            do {
                let decoder = JSONDecoder()
                self.collects = try decoder.decode(Collects.self, from: (result.value?.data)!)
                for item in (self.collects?.collects)! {
                    self.productIds.append(item.productId)
                }
                completion()
            } catch let err {
                print("Err", err)
            }
        }
    }
    
    func getProducts() {
        CustomCollectionProvider.request(.getProducts(productIds: productIds)) { result in
            do {
                let decoder = JSONDecoder()
                self.products = try decoder.decode(Product.self, from: (result.value?.data)!)
                self.tableView.reloadData()
            } catch let err {
                print("Err", err)
            }
        }
    }
    
    
}
