<?php
/**
 * Copy vào: C:\xampp\htdocs\phonezone\check_form.php
 * Truy cập: http://localhost/phonezone/check_form.php
 * XÓA SAU KHI DÙNG
 */

$file    = __DIR__ . '/app/views/admin/products/form.php';
$content = file_get_contents($file);

echo "<pre style='background:#1e293b;color:#e2e8f0;padding:20px;font-family:monospace;border-radius:8px'>";
echo "<h2 style='color:#60a5fa'>Kiểm tra form.php</h2>\n\n";

echo "Kích thước : " . filesize($file) . " bytes\n";
echo "Sửa lần cuối: " . date('d/m/Y H:i:s', filemtime($file)) . "\n\n";

// Kiểm tra name attribute của input variants
if (strpos($content, 'variants[<?= $vi ?>][mau_sac]') !== false
 || strpos($content, 'variants[${idx}][mau_sac]') !== false) {
    echo "✅ form.php ĐÚNG — dùng index cố định variants[0][mau_sac]\n";
} elseif (strpos($content, 'variants[][mau_sac]') !== false) {
    echo "❌ form.php SAI — vẫn dùng variants[][mau_sac] (lỗi cũ!)\n";
} else {
    echo "⚠️  Không tìm thấy pattern nào — kiểm tra thủ công\n";
}

// Tìm tất cả name="variants..."
preg_match_all('/name="variants[^"]*"/', $content, $matches);
echo "\nTất cả name variants trong form:\n";
foreach (array_unique($matches[0]) as $m) echo "  " . htmlspecialchars($m) . "\n";

echo "</pre>";
