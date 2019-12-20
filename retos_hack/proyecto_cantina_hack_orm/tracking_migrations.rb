#Tracking de las migraciones

rake db:new_migration name=CreateCategories options="category_name:string" #crea la tabla Category

rake db:new_migration name=CreateProducts options="product_name:string product_description:string product_quantity:integer selling_price:decimal" #Crea la tabla Products

rake db:new_migration name=AddCategoryRefToProducts options="category:references" #crea la referencia category_id en Product

rake db:new_migration name=CreateClients options="client_name:string client_last_name:string client_rif:string client_address:string client_email:string client_phone:string client_balance:decimal" #Crea la tabla Client

rake db:new_migration name=CreateInvoices options="invoice_date:date" #crea la entidad invoice

rake db:new_migration name=AddClientRefToInvoices options="client:references" #agrega la referencia de cliente

rake db:new_migration name=CreateSales options="sale_quantity:integer sale_price:decimal" #crea la entidad Sale

rake db:new_migration name=AddInvoiceRefToSales options="invoice:references" #crea la referencia del invoice

rake db:new_migration name=AddProductRefToSales options="product:references" #crea la referencia del producto

t.timestamp

rake db:migrate