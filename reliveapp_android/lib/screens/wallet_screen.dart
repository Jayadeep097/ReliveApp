import 'package:flutter/material.dart';
import '../services/coingecko_service.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final CoinGeckoService _coinGeckoService = CoinGeckoService();

  double? _btcPrice; // Holds the fetched Bitcoin price
  double _conversionRate = 0.0; // Holds conversion rate for dropdown
  String _selectedCrypto = 'bitcoin'; // Default selected crypto
  String _selectedFiat = 'usd'; // Default selected fiat currency

  @override
  void initState() {
    super.initState();
    _loadCryptoPrices(); // Load initial crypto prices
  }

  // Fetch crypto price for the selected crypto and fiat
  Future<void> _loadCryptoPrices() async {
    try {
      final price = await _coinGeckoService.fetchCryptoPrice(_selectedCrypto, _selectedFiat);
      setState(() {
        _btcPrice = price;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching crypto price: $e')),
      );
    }
  }

  // Fetch conversion rate for selected crypto and fiat
  Future<void> _fetchConversionRate() async {
    try {
      final rate = await _coinGeckoService.fetchCryptoPrice(_selectedCrypto, _selectedFiat);
      setState(() {
        _conversionRate = rate ?? 0.0;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching conversion rate: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Your Tokens: 100',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedCrypto,
              items: const [
                DropdownMenuItem(value: 'bitcoin', child: Text('Bitcoin (BTC)')),
                DropdownMenuItem(value: 'ethereum', child: Text('Ethereum (ETH)')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCrypto = value!;
                  _fetchConversionRate();
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedFiat,
              items: const [
                DropdownMenuItem(value: 'usd', child: Text('US Dollar (USD)')),
                DropdownMenuItem(value: 'eur', child: Text('Euro (EUR)')),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedFiat = value!;
                  _fetchConversionRate();
                });
              },
            ),
            const SizedBox(height: 20),
            _btcPrice != null
                ? Text(
              '1 Bitcoin = ${_btcPrice!.toStringAsFixed(2)} $_selectedFiat',
              style: Theme.of(context).textTheme.headlineMedium,
            )
                : const CircularProgressIndicator(),
            const SizedBox(height: 20),
            _conversionRate > 0
                ? Text(
              'Equivalent Value: ${(100 * _conversionRate).toStringAsFixed(2)} $_selectedFiat',
              style: Theme.of(context).textTheme.bodyLarge,
            )
                : const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
