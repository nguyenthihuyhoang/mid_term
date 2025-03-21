import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mid_term/components/product_card.dart';
import 'package:mid_term/components/product_form_dialog.dart';
import 'package:mid_term/models/product.dart';
import 'package:mid_term/pages/login_page.dart';
import 'package:mid_term/services/auth_service%20.dart';
import 'package:mid_term/services/firebase_service.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> _products = [];
  List<Product> _filteredProducts = [];
  bool _isLoading = true;
  final firebaseService = FirebaseService();
  final _searchController = TextEditingController();
  final AuthService _authService = AuthService();
  File? _imageFile;

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
      firebaseService.getProducts().listen((products) {
        setState(() {
          _products = products;
          _filteredProducts = products;
        });
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
    final result = await showDialog<Map<String, dynamic>?>(
      context: context,
      builder: (context) => const ProductFormDialog(),
    );

    if (result != null) {
      final product = result['product'] as Product;
      final imageFile = result['imageFile'] as File?;

      try {
        firebaseService.addProduct(product, imageFile);
        if (mounted) {}
      } catch (e) {
        if (mounted) {}
      }
    }
  }

  Future<void> _editProduct(Product product) async {
    final result = await showDialog<Map<String, dynamic>?>(
      context: context,
      builder: (context) => ProductFormDialog(product: product),
    );

    if (result != null) {
      final product = result['product'] as Product;
      final imageFile = result['imageFile'] as File?;

      try {
        firebaseService.updateProduct(product, imageFile);
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
        firebaseService.deleteProduct(product.id!);
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _filterProducts(String value) {
    setState(() {
      _filteredProducts =
          _products.where((product) {
            final name = product.name.toLowerCase();
            return name.contains(value);
          }).toList();
    });
  }

  Future<void> _logout() async {
    await _authService.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Management'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              _logout();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Logout '), Icon(Icons.logout)],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : _filteredProducts.isEmpty
              ? const Center(child: Text('No products found'))
              : Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: _filteredProducts.length,
                  itemBuilder: (context, index) {
                    final product = _filteredProducts[index];
                    return ProductCard(
                      product: product,
                      onEdit: () => _editProduct(product),
                      onDelete: () => _deleteProduct(product),
                    );
                  },
                ),
              ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        onChanged: _filterProducts,
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search products...',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.grey[200],
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
        ),
      ),
    );
  }
}
