import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/colors.dart';
import 'package:flutter_application_1/utils/responsive_size_helper.dart';
import 'package:flutter_application_1/Popular items/chef_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  String _query = '';

  final List<Map<String, dynamic>> _sellers = [
    {'name': 'Rana Aloran', 'rating': 4.0},
    {'name': 'Ahmad Salem', 'rating': 3.5},
    {'name': 'Sara Khalid', 'rating': 5.0},
  ];

  final List<Map<String, dynamic>> _products = [
    {'name': 'Stuffed Grap Leaves', 'rating': 4.0},
    {'name': 'Mansaf', 'rating': 5.0},
    {'name': 'Knafeh', 'rating': 4.5},
  ];

  final List<Map<String, dynamic>> _nearYou = [
    {'name': 'Rana Aloran', 'rating': 4.1},
    {'name': 'Olfat Bishmaph', 'rating': 4.1},
  ];

  List<Map<String, dynamic>> get _filteredSellers =>
      _sellers
          .where((s) => s['name'].toLowerCase().contains(_query.toLowerCase()))
          .toList();

  List<Map<String, dynamic>> get _filteredProducts =>
      _products
          .where((p) => p['name'].toLowerCase().contains(_query.toLowerCase()))
          .toList();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.ScaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            _buildSearchBar(context),
            Expanded(
              child:
                  _query.isEmpty
                      ? _buildNearYou(context)
                      : _buildResults(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNearYou(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 16),
        vertical: responsiveHeight(context, 8),
      ),
      children: [
        _buildSectionTitle('Near You'),
        ..._nearYou.map((s) => _buildSellerCard(s, context)),
      ],
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 16),
        vertical: responsiveHeight(context, 12),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.textcolor,
              size: responsiveWidth(context, 20),
            ),
          ),
          SizedBox(width: responsiveWidth(context, 8)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.btnColor,
                border: Border.all(
                  color: const Color.fromARGB(255, 61, 24, 5),
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: responsiveWidth(context, 20),
                    color: AppColors.textcolor,
                  ),
                  SizedBox(width: responsiveWidth(context, 8)),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 61, 24, 5),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search...',
                        hintStyle: TextStyle(
                          color: Color.fromARGB(150, 61, 24, 5),
                        ),
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) => setState(() => _query = value),
                    ),
                  ),
                  if (_query.isNotEmpty)
                    GestureDetector(
                      onTap: () {
                        _controller.clear();
                        setState(() => _query = '');
                      },
                      child: Icon(
                        Icons.close,
                        size: responsiveWidth(context, 18),
                        color: AppColors.textcolor,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResults(BuildContext context) {
    if (_filteredSellers.isEmpty && _filteredProducts.isEmpty) {
      return _buildNoResults();
    }
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(context, 16),
        vertical: responsiveHeight(context, 8),
      ),
      children: [
        if (_filteredSellers.isNotEmpty) ...[
          _buildSectionTitle('Sellers'),
          ..._filteredSellers.map((s) => _buildSellerCard(s, context)),
        ],
        if (_filteredProducts.isNotEmpty) ...[
          _buildSectionTitle('Products'),
          ..._filteredProducts.map((p) => _buildProductCard(p, context)),
        ],
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.textcolor,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildSellerCard(Map<String, dynamic> seller, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) => ChefPage(
                  name: seller['name'],
                  rating: seller['rating'],
                  description:
                      'Specialist passionate about crafting authentic Eastern dishes and delightful desserts, made with care, quality, and a true homemade touch.',
                  topDishes: [
                    {
                      'name': 'Kibbeh',
                      'price': 1.50,
                      'image': 'assets/images/kibbeh.png',
                    },
                    {
                      'name': 'Fattoush',
                      'price': 2.0,
                      'image': 'assets/images/fattoush.png',
                    },
                    {
                      'name': 'Lemon Cake',
                      'price': 5.0,
                      'image': 'assets/images/lemon_cake.png',
                    },
                  ],
                ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.btnColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(60, 61, 24, 5),
            width: 0.8,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: const Color.fromARGB(40, 61, 24, 5),
              child: Icon(
                Icons.person_outline,
                color: AppColors.textcolor,
                size: 26,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seller['name'],
                    style: TextStyle(
                      color: AppColors.textcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  _buildStars(seller['rating']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.btnColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color.fromARGB(60, 61, 24, 5),
          width: 0.8,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 50,
              height: 50,
              color: const Color.fromARGB(40, 61, 24, 5),
              child: Icon(
                Icons.lunch_dining,
                color: AppColors.textcolor,
                size: 26,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    color: AppColors.textcolor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                _buildStars(product['rating']),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStars(double rating) {
    const starColor = Color.fromARGB(255, 61, 24, 5);
    return Row(
      children: List.generate(5, (i) {
        if (i < rating.floor()) {
          return const Icon(Icons.star, size: 16, color: starColor);
        } else if (i < rating) {
          return const Icon(Icons.star_half, size: 16, color: starColor);
        } else {
          return const Icon(Icons.star_border, size: 16, color: starColor);
        }
      }),
    );
  }

  Widget _buildNoResults() => Center(
    child: Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Text(
        'No results found for "$_query"',
        style: const TextStyle(
          color: Color.fromARGB(150, 61, 24, 5),
          fontSize: 14,
        ),
      ),
    ),
  );
}
