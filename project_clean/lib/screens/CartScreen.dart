import 'package:flutter/material.dart';
import '../widgets/backButton.dart';
import '../classes/app_text.dart';
import '../classes/colors.dart';
import '../widgets/BottomNavBar.dart';

class AppSizes {
  static const imgSize = 90.0;
  static const btnSize = 32.0;
  static const btnIcon = 20.0;
  static const itemFont = 17.0;
  static const priceFont = 15.0;
  static const orderFont = 20.0;
  static const orderH = 48.0;
  static const navH = 64.0;
  static const navIcon = 26.0;
  static const navFont = 10.0;
  static const imgRadius = 10.0;
}

class AppImages {
  static const A11 = 'assets/images/A1.jpg';
  static const A2 = 'assets/images/A2.jpg';
}

class FoodItem {
  final String name;
  final double unitPrice;
  final String imagePath;
  int qty;

  FoodItem({
    required this.name,
    required this.unitPrice,
    required this.imagePath,
    required this.qty,
  });

  double get total => unitPrice * qty;
}

class FoodImage extends StatelessWidget {
  final String path;
  const FoodImage(this.path, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.imgRadius),
      child: Image.asset(
        path,
        width: AppSizes.imgSize,
        height: AppSizes.imgSize,
        fit: BoxFit.cover,
      ),
    );
  }
}

class RoundBtn extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const RoundBtn({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppSizes.btnSize,
        height: AppSizes.btnSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.brown, width: 2),
        ),
        child: Icon(icon, size: AppSizes.btnIcon, color: AppColors.brown),
      ),
    );
  }
}

class CartBadge extends StatelessWidget {
  final int count;

  const CartBadge({this.count = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: AppColors.darkBrown,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          '$count',
          style: const TextStyle(
              color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class FoodRow extends StatelessWidget {
  final FoodItem item;
  final VoidCallback onAdd;
  final VoidCallback onRemove;
  const FoodRow({
    super.key,
    required this.item,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FoodImage(item.imagePath),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                    fontSize: AppSizes.itemFont,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    RoundBtn(
                      icon: item.qty == 1 ? Icons.delete_outline : Icons.remove,
                      onTap: onRemove,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '${item.qty}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.brown,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    RoundBtn(icon: Icons.add, onTap: onAdd),
                  ],
                ),
              ],
            ),
          ),
          Text(
            '${item.total.toStringAsFixed(2)} JOD',
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: AppColors.brown,
              fontSize: AppSizes.priceFont,
            ),
          ),
        ],
      ),
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // قائمة الأكلات
  List<FoodItem> cartItems = [
    FoodItem(name: 'Pasta', unitPrice: 3.0, imagePath: AppImages.A11, qty: 1),
    FoodItem(
        name: 'Seasons Salad', unitPrice: 3.0, imagePath: AppImages.A2, qty: 2),
  ];

  int selectedTab = 2; // 0=Home 1=Location 2=Cart 3=Reorder 4=Profile

  double get grandTotal => cartItems.fold(0, (s, i) => s + i.total);
  int get cartCount => cartItems.fold(0, (s, i) => s + i.qty);

  void _add(int idx) => setState(() => cartItems[idx].qty++);
  void _remove(int idx) => setState(() {
        if (cartItems[idx].qty > 1)
          cartItems[idx].qty--;
        else
          cartItems.removeAt(idx);
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: _appBar(),
      body: cartItems.isEmpty ? _emptyCart() : _body(),
    );
  }

  // ── AppBar ──
  AppBar _appBar() => AppBar(
        backgroundColor: AppColors.bg,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 14),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.orderBtn,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(Icons.arrow_back_ios_new,
                  color: AppColors.brown, size: 16),
            ),
          ),
        ),
        title: const Text(
          'Cart',
          style: TextStyle(
            color: AppColors.brown,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      );

  // ── كارت فاضي ──
  Widget _emptyCart() => const Center(
        child: Text(
          'Your cart is empty 🛒',
          style: TextStyle(color: AppColors.navInactive, fontSize: 16),
        ),
      );

  // ── المحتوى الرئيسي ──
  Widget _body() {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      itemCount: cartItems.length,
      itemBuilder: (_, i) => Column(
        children: [
          // صف الأكلة
          FoodRow(
            item: cartItems[i],
            onAdd: () => _add(i),
            onRemove: () => _remove(i),
          ),

          if (i < cartItems.length - 1)
            const Divider(color: AppColors.divider, thickness: 1, height: 30),

          if (i == cartItems.length - 1) ...[
            const SizedBox(height: 30),
            _orderBtn(),
            const SizedBox(height: 30),
          ],
        ],
      ),
    );
  }

  Widget _orderBtn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 90),
        child: GestureDetector(
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Order placed! ${grandTotal.toStringAsFixed(2)} JOD'),
              backgroundColor: AppColors.brown,
            ),
          ),
          child: Container(
            height: AppSizes.orderH,
            decoration: BoxDecoration(
              color: AppColors.orderBtn,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Center(
              child: Text(
                'Order',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: AppSizes.orderFont,
                  color: AppColors.brown,
                ),
              ),
            ),
          ),
        ),
      );
}
