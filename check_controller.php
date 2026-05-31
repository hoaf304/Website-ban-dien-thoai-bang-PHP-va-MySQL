<?php
/**
 * Copy vào: C:\xampp\htdocs\phonezone\check_controller.php
 * Truy cập: http://localhost/phonezone/check_controller.php
 * XÓA SAU KHI DÙNG
 */

$file = __DIR__ . '/app/controllers/Admin/AdminProductController.php';
$content = file_get_contents($file);

echo "<pre style='background:#1e293b;color:#e2e8f0;padding:20px;font-family:monospace;border-radius:8px'>";
echo "<h2 style='color:#60a5fa'>Kiểm tra AdminProductController.php</h2>\n\n";

// Kiểm tra file tồn tại
echo "File tồn tại: " . (file_exists($file) ? "✓ CÓ" : "✗ KHÔNG") . "\n";
echo "Kích thước: " . filesize($file) . " bytes\n";
echo "Sửa lần cuối: " . date('d/m/Y H:i:s', filemtime($file)) . "\n\n";

// Kiểm tra có phải file mới không (file mới có chứa comment "Bắt buộc phải có")
if (strpos($content, 'Bắt buộc phải có màu sắc') !== false) {
    echo "✅ Đang dùng FILE MỚI (đã fix)\n";
} else {
    echo "❌ Đang dùng FILE CŨ (chưa fix) — cần copy đè file mới!\n";
}

echo "\n--- 20 dòng đầu của file ---\n";
$lines = explode("\n", $content);
foreach (array_slice($lines, 0, 20) as $i => $line) {
    echo ($i+1) . ": " . htmlspecialchars($line) . "\n";
}

// Test thêm: xem variants đang được save thế nào
echo "\n--- Đoạn saveVariants ---\n";
preg_match('/private function saveVariants.*?(?=private function|$)/s', $content, $m);
if ($m) echo htmlspecialchars(substr($m[0], 0, 500));

echo "</pre>";
