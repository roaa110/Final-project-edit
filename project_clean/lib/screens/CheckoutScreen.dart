import 'package:flutter/material.dart';
import '../classes/colors.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: const BoxDecoration(
                      color: AppColors.orderBtn,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back_ios_new,
                        color: AppColors.darkBrown, size: 20),
                  ),
                ),
              ),
              _buildSectionTitle('Your Order'),
              _buildOrderItem(
                name: 'Pasta',
                price: '3.00 JOD',
                qty: 1,
                isDelete: true,
              ),
              const SizedBox(height: 10),
              _buildOrderItem(
                name: 'Season Salad',
                price: '6.00 JOD',
                qty: 2,
                isDelete: false,
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Payment Summary'),
              _buildSummaryRow('Basket Total', '9.00 JOD'),
              _buildSummaryRow('Delivery Fee', '1.00 JOD'),
              const SizedBox(height: 10),
              const Divider(color: AppColors.divider, thickness: 1),
              const SizedBox(height: 10),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Order Total',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: AppColors.darkBrown,
                      ),
                    ),
                    Text(
                      '10.00 JOD',
                      style: TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                        color: AppColors.darkBrown,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: AppColors.divider, thickness: 1),
              _buildSectionTitle('Delivery To'),
              _buildActionRow(
                icon: Icons.location_on,
                text: 'Tabarbour',
              ),
              const Divider(color: AppColors.divider, thickness: 1),
              _buildSectionTitle('Note'),
              const Divider(color: AppColors.divider, thickness: 1),
              _buildSectionTitle('Pay With'),
              _buildActionRow(
                icon: Icons.attach_money,
                text: 'Cash',
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: 55,
                  decoration: BoxDecoration(
                    color: AppColors.orderBtn,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      'Place Order 10.00 JOD',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: AppColors.darkBrown,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: AppColors.darkBrown,
        ),
      ),
    );
  }

  Widget _buildOrderItem(
      {required String name,
        required String price,
        required int qty,
        required bool isDelete}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: AppColors.darkBrown),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildQtyButton(
                  icon: isDelete ? Icons.delete_outline : Icons.remove),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  '$qty',
                  style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.italic,
                      color: AppColors.darkBrown),
                ),
              ),
              _buildQtyButton(icon: Icons.add),
              const Spacer(),
              Text(
                price,
                style: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: AppColors.darkBrown),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton({required IconData icon}) {
    return Container(
      width: 28,
      height: 28,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.darkBrown, width: 1.5),
      ),
      child: Icon(icon, size: 18, color: AppColors.darkBrown),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: AppColors.darkBrown),
          ),
          Text(
            value,
            style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: AppColors.darkBrown),
          ),
        ],
      ),
    );
  }

  Widget _buildActionRow({required IconData icon, required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.darkBrown, width: 1),
            ),
            child: Icon(icon, color: AppColors.darkBrown, size: 20),
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: AppColors.darkBrown),
          ),
          const Spacer(),
          const Icon(Icons.chevron_right, color: AppColors.darkBrown),
        ],
      ),
    );
  }
}
