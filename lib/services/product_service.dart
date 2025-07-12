import 'package:grocery_mart/models/product_model.dart';

class ProductService {
  static List<Product> getProducts() {
    return [
  Product(
    id: '1',
    name: 'Fresh Apples',
    category: 'Fruits',
    price: 120,
    image: 'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?_gl=1*p450sj*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjA3MDUkajQ0JGwwJGgw',
  ),
  Product(
    id: '2',
    name: 'Bananas',
    category: 'Fruits',
    price: 90,
    image: 'https://images.pexels.com/photos/1093038/pexels-photo-1093038.jpeg?_gl=1*r8dtch*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjA4MjIkajMwJGwwJGgw',
  ),
  Product(
    id: '3',
    name: 'Tomatoes',
    category: 'Vegetables',
    price: 60,
    image: 'https://images.pexels.com/photos/1327838/pexels-photo-1327838.jpeg?_gl=1*1guetr7*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjA4NzgkajU3JGwwJGgw',
  ),
  Product(
    id: '4',
    name: 'Onions',
    category: 'Vegetables',
    price: 55,
    image: 'https://images.pexels.com/photos/533342/pexels-photo-533342.jpeg?_gl=1*pr52e9*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjA5MTEkajI0JGwwJGgw',
  ),
  Product(
    id: '5',
    name: 'Milk Pack',
    category: 'Dairy',
    price: 170,
    image: 'https://images.pexels.com/photos/6804192/pexels-photo-6804192.jpeg?_gl=1*ibe6cv*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjA5OTckajE0JGwwJGgw',
  ),
  Product(
    id: '6',
    name: 'Bread Loaf',
    category: 'Bakery',
    price: 80,
    image: 'https://images.pexels.com/photos/2932678/pexels-photo-2932678.jpeg?_gl=1*fkrwu9*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjEzMjkkajMxJGwwJGgw',
  ),
  Product(
    id: '7',
    name: 'Cheddar Cheese',
    category: 'Dairy',
    price: 300,
    image: 'https://images.pexels.com/photos/16134592/pexels-photo-16134592.jpeg?_gl=1*oihv3k*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjEyODEkajE1JGwwJGgw',
  ),
  Product(
    id: '8',
    name: 'Eggs (12 pcs)',
    category: 'Dairy',
    price: 200,
    image: 'https://images.pexels.com/photos/1556707/pexels-photo-1556707.jpeg?_gl=1*p38mgg*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjExODMkajQ3JGwwJGgw',
  ),
  Product(
    id: '9',
    name: 'Cooking Oil',
    category: 'Essentials',
    price: 380,
    image: 'https://images.pexels.com/photos/10046963/pexels-photo-10046963.jpeg?_gl=1*n91uul*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjExMjMkajE5JGwwJGgw',
  ),
  Product(
    id: '10',
    name: 'Sugar 1kg',
    category: 'Essentials',
    price: 145,
    image: 'https://images.pexels.com/photos/8670506/pexels-photo-8670506.jpeg?_gl=1*meimvi*_ga*MTUzMzk3MjAwMC4xNzUyMzIwNjg5*_ga_8JE65Q40S6*czE3NTIzMjA2ODkkbzEkZzEkdDE3NTIzMjEwODMkajU5JGwwJGgw',
  ),
];

  }
}
