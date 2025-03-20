import 'package:flutter/material.dart';
import 'package:mid_term/components/product_card.dart';
import 'package:mid_term/components/product_form_dialog.dart';
import 'package:mid_term/models/product.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _products = [
    Product(name: 'ao', price: 110.000, category: 'korean'),
  ];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    setState(() {
      _isLoading = true;
    });

    try {
      setState(() {
        // _products = products;
      });
    } catch (e) {
      if (mounted) {}
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _addProduct() async {
    final result = await showDialog<Product?>(
      context: context,
      builder: (context) => const ProductFormDialog(),
    );

    if (result != null) {
      try {
        _loadProducts();
        if (mounted) {}
      } catch (e) {
        if (mounted) {}
      }
    }
  }

  Future<void> _editProduct(Product product) async {
    final result = await showDialog<Product?>(
      context: context,
      builder: (context) => ProductFormDialog(product: product),
    );

    if (result != null) {
      try {
        _loadProducts();
        if (mounted) {}
      } catch (e) {
        if (mounted) {}
      }
    }
  }

  Future<void> _deleteProduct(Product product) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Confirm Delete'),
            content: Text('Are you sure you want to delete ${product.name}?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Delete'),
              ),
            ],
          ),
    );

    if (confirm == true) {
      try {
        _loadProducts();
        if (mounted) {}
      } catch (e) {
        if (mounted) {}
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data of Shop'), centerTitle: true),
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _products.isEmpty
              ? const Center(child: Text('No products found'))
              : ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return ProductCard(
                    product: product,
                    onEdit: () => _editProduct(product),
                    onDelete: () => _deleteProduct(product),
                  );
                },
              ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }
}
