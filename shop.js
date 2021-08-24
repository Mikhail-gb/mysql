db.catalogs.drop()

db.catalogs.insertMany([
{"name": "Процессоры"},
{"name": "Материнские платы"},
{"name": "Видеокарты"},
{"name": "Жесткие диски"},
{"name": "Оперативная память"},
])

db.products.drop()

var catalog_id = db.catalogs.findOne({'name':"Процессоры"})._id
product = {"name": "product1", "description": "product1_description", "price": "100,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product2", "description": "product2_description", "price": "200,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product3", "description": "product3_description", "price": "300,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

var catalog_id = db.catalogs.findOne({'name':"Материнские платы"})._id
product = {"name": "product1", "description": "product1_description", "price": "100,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product2", "description": "product2_description", "price": "200,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product3", "description": "product3_description", "price": "300,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

var catalog_id = db.catalogs.findOne({'name':"Видеокарты"})._id
product = {"name": "product1", "description": "product1_description", "price": "100,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product2", "description": "product2_description", "price": "200,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product3", "description": "product3_description", "price": "300,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

var catalog_id = db.catalogs.findOne({'name':"Жесткие диски"})._id
product = {"name": "product1", "description": "product1_description", "price": "100,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product2", "description": "product2_description", "price": "200,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product3", "description": "product3_description", "price": "300,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

var catalog_id = db.catalogs.findOne({'name':"Оперативная память"})._id
product = {"name": "product1", "description": "product1_description", "price": "100,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product2", "description": "product2_description", "price": "200,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)

product = {"name": "product3", "description": "product3_description", "price": "300,00", "catalog_id": {$ref: "catalogs", $id: catalog_id}}
db.products.save(product)