<?php
// ============================================================
// PHONEZONE - Helper Functions
// Các hàm tiện ích dùng xuyên suốt dự án
// ============================================================

// ---- Định dạng tiền ----
function format_price(int|float $amount): string
{
    return number_format($amount, 0, ',', '.') . '₫';
}

// Tính phần trăm giảm giá
function discount_percent(int|float $original, int|float $sale): int
{
    if ($original <= 0) return 0;
    return (int) round((($original - $sale) / $original) * 100);
}

// ---- URL & Slug ----
function url(string $path = ''): string
{
    return APP_URL . '/' . ltrim($path, '/');
}

function asset(string $path): string
{
    return APP_URL . '/public/' . ltrim($path, '/');
}

/**
 * Trả về URL ảnh đúng:
 * - Nếu là URL đầy đủ (http/https) → dùng thẳng
 * - Nếu là đường dẫn nội bộ → ghép UPLOAD_URL vào trước
 */
function img_url(string $path): string
{
    if (str_starts_with($path, 'http://') || str_starts_with($path, 'https://')) {
        return $path;
    }
    return UPLOAD_URL . ltrim($path, '/');
}

function current_url(): string
{
    return (isset($_SERVER['HTTPS']) ? 'https' : 'http')
         . '://' . $_SERVER['HTTP_HOST']
         . $_SERVER['REQUEST_URI'];
}

// Tạo slug từ chuỗi tiếng Việt
function to_slug(string $str): string
{
    $str = mb_strtolower(trim($str), 'UTF-8');
    $map = [
        'à'=>'a','á'=>'a','ả'=>'a','ã'=>'a','ạ'=>'a',
        'ă'=>'a','ằ'=>'a','ắ'=>'a','ẳ'=>'a','ẵ'=>'a','ặ'=>'a',
        'â'=>'a','ầ'=>'a','ấ'=>'a','ẩ'=>'a','ẫ'=>'a','ậ'=>'a',
        'è'=>'e','é'=>'e','ẻ'=>'e','ẽ'=>'e','ẹ'=>'e',
        'ê'=>'e','ề'=>'e','ế'=>'e','ể'=>'e','ễ'=>'e','ệ'=>'e',
        'ì'=>'i','í'=>'i','ỉ'=>'i','ĩ'=>'i','ị'=>'i',
        'ò'=>'o','ó'=>'o','ỏ'=>'o','õ'=>'o','ọ'=>'o',
        'ô'=>'o','ồ'=>'o','ố'=>'o','ổ'=>'o','ỗ'=>'o','ộ'=>'o',
        'ơ'=>'o','ờ'=>'o','ớ'=>'o','ở'=>'o','ỡ'=>'o','ợ'=>'o',
        'ù'=>'u','ú'=>'u','ủ'=>'u','ũ'=>'u','ụ'=>'u',
        'ư'=>'u','ừ'=>'u','ứ'=>'u','ử'=>'u','ữ'=>'u','ự'=>'u',
        'ỳ'=>'y','ý'=>'y','ỷ'=>'y','ỹ'=>'y','ỵ'=>'y',
        'đ'=>'d',
    ];
    $str = strtr($str, $map);
    $str = preg_replace('/[^a-z0-9\s-]/', '', $str);
    $str = preg_replace('/[\s-]+/', '-', $str);
    return trim($str, '-');
}

// ---- Bảo mật ----
function e(string $str): string
{
    return htmlspecialchars($str, ENT_QUOTES | ENT_HTML5, 'UTF-8');
}

function sanitize(string $str): string
{
    return htmlspecialchars(strip_tags(trim($str)), ENT_QUOTES, 'UTF-8');
}

// ---- Phân trang (render HTML) ----
function render_pagination(array $pager, string $baseUrl): string
{
    if ($pager['last_page'] <= 1) return '';

    $html  = '<nav class="pagination">';
    $cur   = $pager['current_page'];
    $last  = $pager['last_page'];

    // Nút Trước
    if ($cur > 1) {
        $html .= '<a class="page-btn" href="' . $baseUrl . '?page=' . ($cur - 1) . '">‹</a>';
    }

    // Số trang
    for ($i = 1; $i <= $last; $i++) {
        if ($i === $cur) {
            $html .= '<span class="page-btn active">' . $i . '</span>';
        } elseif ($i === 1 || $i === $last || abs($i - $cur) <= 2) {
            $html .= '<a class="page-btn" href="' . $baseUrl . '?page=' . $i . '">' . $i . '</a>';
        } elseif (abs($i - $cur) === 3) {
            $html .= '<span class="page-btn disabled">…</span>';
        }
    }

    // Nút Sau
    if ($cur < $last) {
        $html .= '<a class="page-btn" href="' . $baseUrl . '?page=' . ($cur + 1) . '">›</a>';
    }

    $html .= '</nav>';
    return $html;
}

// ---- Flash message (render HTML) ----
function flash_messages(): string
{
    $types = ['success' => '✅', 'error' => '❌', 'warning' => '⚠️', 'info' => 'ℹ️'];
    $html  = '';
    foreach ($types as $type => $icon) {
        if (Session::hasFlash($type)) {
            $msg   = e(Session::getFlash($type));
            $html .= "<div class='alert alert-{$type}'>{$icon} {$msg}</div>";
        }
    }

    // Popup tự mất (đăng nhập / đăng xuất)
    if (Session::hasFlash('popup_success')) {
        $data = json_decode(Session::getFlash('popup_success'), true);
        $sec  = (int)($data['seconds'] ?? 5);
        $html .= "
<div id='pz-popup-overlay'>
  <div id='pz-popup'>
    <div id='pz-popup-icon'>✅</div>
    <h3 id='pz-popup-title'>" . e($data['message']) . "</h3>
    <p id='pz-popup-sub'>" . e($data['sub']) . "</p>
    <div id='pz-popup-bar-wrap'><div id='pz-popup-bar'></div></div>
    <p id='pz-popup-count'>Tự động chuyển sau <strong id='pz-count-num'>{$sec}</strong> giây</p>
    <a href='" . $data['url'] . "' id='pz-popup-btn' class='btn btn-blue'>Về trang chủ</a>
  </div>
</div>
<style>
#pz-popup-overlay {
  position:fixed;inset:0;background:rgba(0,0,0,.5);
  display:flex;align-items:center;justify-content:center;
  z-index:99999;backdrop-filter:blur(4px);
  animation:pzFadeIn .25s ease;
}
@keyframes pzFadeIn{from{opacity:0}to{opacity:1}}
#pz-popup {
  background:#fff;border-radius:24px;padding:2.5rem 2rem;
  text-align:center;max-width:380px;width:90%;
  box-shadow:0 20px 60px rgba(0,0,0,.2);
  animation:pzScaleIn .3s cubic-bezier(.4,0,.2,1);
}
@keyframes pzScaleIn{from{transform:scale(.85);opacity:0}to{transform:scale(1);opacity:1}}
#pz-popup-icon{font-size:3.5rem;margin-bottom:1rem}
#pz-popup-title{font-size:1.1rem;font-weight:800;color:#1e293b;margin-bottom:.4rem}
#pz-popup-sub{font-size:.88rem;color:#64748b;margin-bottom:1rem}
#pz-popup-bar-wrap{height:5px;background:#e2e8f0;border-radius:10px;overflow:hidden;margin-bottom:.75rem}
#pz-popup-bar{height:100%;width:100%;background:linear-gradient(90deg,#3b82f6,#1d4ed8);border-radius:10px;transition:width linear}
#pz-popup-count{font-size:.82rem;color:#94a3b8;margin-bottom:1.25rem}
#pz-popup-btn{display:inline-flex;align-items:center;gap:.5rem;padding:.8rem 2rem;border-radius:12px;text-decoration:none;font-weight:700;font-size:.95rem}
</style>
<script>
(function(){
  var sec = {$sec};
  var url = '" . $data['url'] . "';
  var bar = document.getElementById('pz-popup-bar');
  var num = document.getElementById('pz-count-num');
  var start = Date.now();
  var total = sec * 1000;

  function update() {
    var elapsed = Date.now() - start;
    var remain  = Math.max(0, total - elapsed);
    var pct     = (remain / total) * 100;
    bar.style.width = pct + '%';
    num.textContent = Math.ceil(remain / 1000);
    if (remain <= 0) { window.location.href = url; return; }
    requestAnimationFrame(update);
  }
  requestAnimationFrame(update);
})();
</script>";
    }

    return $html;
}

// ---- Ngày giờ ----
function format_date(string $datetime, string $format = 'd/m/Y H:i'): string
{
    return date($format, strtotime($datetime));
}

function time_ago(string $datetime): string
{
    $diff = time() - strtotime($datetime);
    return match (true) {
        $diff < 60     => 'vừa xong',
        $diff < 3600   => (int)($diff / 60)    . ' phút trước',
        $diff < 86400  => (int)($diff / 3600)  . ' giờ trước',
        $diff < 604800 => (int)($diff / 86400) . ' ngày trước',
        default        => date('d/m/Y', strtotime($datetime)),
    };
}

// ---- Upload ảnh ----
function upload_image(array $file, string $folder = 'products'): string|false
{
    if ($file['error'] !== UPLOAD_ERR_OK) return false;
    if ($file['size']  >  UPLOAD_MAX_SIZE)  return false;
    if (!in_array($file['type'], ALLOWED_IMG_TYPES)) return false;

    $ext      = pathinfo($file['name'], PATHINFO_EXTENSION);
    $filename = uniqid('img_', true) . '.' . strtolower($ext);
    $dir      = UPLOAD_PATH . $folder . '/';

    if (!is_dir($dir)) mkdir($dir, 0755, true);

    if (move_uploaded_file($file['tmp_name'], $dir . $filename)) {
        return $folder . '/' . $filename;
    }
    return false;
}

// ---- Giỏ hàng (session) ----
function cart_count(): int
{
    $cart = Session::get('cart', []);
    return array_sum(array_column($cart, 'qty'));
}

// ---- Số sao (render HTML) ----
function render_stars(float $rating, bool $small = false): string
{
    $cls  = $small ? 'star-sm' : 'star';
    $html = '<span class="stars">';
    for ($i = 1; $i <= 5; $i++) {
        if ($rating >= $i)          $html .= "<i class='fas fa-star $cls'></i>";
        elseif ($rating >= $i - .5) $html .= "<i class='fas fa-star-half-alt $cls'></i>";
        else                        $html .= "<i class='far fa-star $cls'></i>";
    }
    return $html . '</span>';
}

// ---- Tạo mã đơn hàng ----
function generate_order_code(): string
{
    return 'ORD-' . date('Ymd') . '-' . strtoupper(substr(uniqid(), -5));
}

// ---- Debug ----
function dd(mixed ...$vars): void
{
    echo '<pre style="background:#1e293b;color:#e2e8f0;padding:16px;border-radius:8px;font-size:.85rem;">';
    foreach ($vars as $var) {
        var_dump($var);
    }
    echo '</pre>';
    exit;
}
