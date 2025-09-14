import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart'; // Добавь этот пакет

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  final MobileScannerController controller = MobileScannerController();
  String result = 'Наведите камеру на QR-код';
  bool _hasPermission = false;
  bool _isLoading = true;
  bool _isScanning = true;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;
    if (status.isGranted) {
      setState(() {
        _hasPermission = true;
        _isLoading = false;
      });
    } else {
      final res = await Permission.camera.request();
      setState(() {
        _hasPermission = res.isGranted;
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture capture) {
    if (!_isScanning) return;
    
    final String? code = capture.barcodes.first.rawValue;
    if (code != null) {
      setState(() {
        result = 'Найден код: $code';
        _isScanning = false;
      });

      controller.stop();

      // Показываем диалог с действиями
      _showResultDialog(code);
    }
  }

  void _showResultDialog(String code) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('QR-код распознан'),
        content: Text(code),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Закрыть'),
          ),
          // Если это ссылка - показываем кнопку "Открыть"
          if (_isUrl(code))
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _launchUrl(code);
              },
              child: const Text('Открыть в браузере'),
            ),
        ],
      ),
    );
  }

  // Проверяем, является ли текст ссылкой
  bool _isUrl(String text) {
    return text.startsWith('http://') || text.startsWith('https://');
  }

  // Открываем ссылку в браузере
Future<void> _launchUrl(String url) async {
  final Uri uri = Uri.parse(url);
  
  try {
    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Важно: открывает в браузере
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Не удалось открыть: $url')),
      );
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Ошибка: $e')),
    );
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Сканирование QR-кода'),
        backgroundColor: const Color(0xFFF72055),
        foregroundColor: Colors.white,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _hasPermission
              ? _buildScanner()
              : _buildPermissionDenied(),
    );
  }

  Widget _buildScanner() {
    return Column(
      children: [
        Expanded(
          flex: 4,
          child: Stack(
            children: [
              _isScanning 
                  ? MobileScanner(
                      controller: controller,
                      onDetect: _handleBarcode,
                    )
                  : Container(
                      color: Colors.black,
                      child: const Center(
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 64,
                        ),
                      ),
                    ),
              Center(
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFF72055),
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              result,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPermissionDenied() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.camera_alt, size: 64, color: Colors.grey),
          const SizedBox(height: 16),
          const Text(
            'Доступ к камере запрещен',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Разрешите доступ к камере в настройках устройства',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              await openAppSettings();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFF72055),
              foregroundColor: Colors.white,
            ),
            child: const Text('Открыть настройки'),
          ),
        ],
      ),
    );
  }
}