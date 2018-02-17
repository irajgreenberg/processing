Table table;

void setup() {
  
  //item,description,name,quantity,cost,width,height,brand,category,unit cost
  table = loadTable("myData.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    
    int item = row.getInt("item");
    String description = row.getString("description");
    String name = row.getString("name");
    String quantity = row.getString("quantity");
    String cost = row.getString("cost");
    String width = row.getString("width");
    String height = row.getString("height");
    String brand = row.getString("brand");
    String category = row.getString("category");
    String unitCost = row.getString("unit cost");
    
    println("Item #: " + item + ", " + description);
    println("Designer: " + name);
    println("Quantity: " + quantity + ", cost: " + cost + ", width: " + width + ", height: " + height);
    println("Brand: " + brand + ", Category: " + category + ", Unit Cost: " + unitCost);
    println("");
  }
  
}