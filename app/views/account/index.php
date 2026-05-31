<?php
/**
 * app/views/account/index.php
 * @var array  $user        Thông tin khách hàng
 * @var array  $donGanDay   Đơn hàng gần đây
 * @var int    $soYeuThich  Số SP yêu thích
 * @var int    $soDon       Tổng đơn hàng
 * @var string $activeTab   Tab đang active
 */
$user ??= []; $donGanDay ??= []; $soYeuThich ??= 0; $soDon ??= 0;
$statusLabel = ['cho_xac_nhan'=>'Chờ xác nhận','da_xac_nhan'=>'Đã xác nhận','dang_dong_hang'=>'Đóng hàng','dang_giao'=>'Đang giao','da_giao'=>'Đã giao','da_huy'=>'Đã hủy'];
$statusPill  = ['cho_xac_nhan'=>'pill-pending','da_xac_nhan'=>'pill-confirmed','dang_dong_hang'=>'pill-packing','dang_giao'=>'pill-shipping','da_giao'=>'pill-done','da_huy'=>'pill-canceled'];
?>

<!-- Breadcrumb -->
<div class="container"><div class="breadcrumb">
  <a href="<?= url() ?>">Trang chủ</a>
  <i class="fas fa-chevron-right"></i>
  <span>Tài khoản</span>
</div></div>

<div class="account-wrap">
  <?php include VIEW_PATH . 'account/_sidebar.php'; ?>

  <div>
    <!-- Thống kê nhanh -->
    <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:1rem;margin-bottom:1.5rem">
      <div style="background:#fff;border:1px solid var(--gray-200);border-radius:14px;padding:1.25rem;text-align:center">
        <div style="font-size:2rem;font-weight:800;color:var(--accent)"><?= $soDon ?></div>
        <div style="font-size:.82rem;color:var(--gray-500);margin-top:.25rem">Đơn hàng</div>
      </div>
      <div style="background:#fff;border:1px solid var(--gray-200);border-radius:14px;padding:1.25rem;text-align:center">
        <div style="font-size:2rem;font-weight:800;color:var(--danger)"><?= $soYeuThich ?></div>
        <div style="font-size:.82rem;color:var(--gray-500);margin-top:.25rem">Yêu thích</div>
      </div>
      <div style="background:#fff;border:1px solid var(--gray-200);border-radius:14px;padding:1.25rem;text-align:center">
        <div style="font-size:2rem;font-weight:800;color:var(--success)">✓</div>
        <div style="font-size:.82rem;color:var(--gray-500);margin-top:.25rem">Thành viên</div>
      </div>
    </div>

    <!-- Đơn hàng gần đây -->
    <div class="account-card" style="margin-bottom:1.5rem">
      <div class="account-card-head">
        <h2><i class="fas fa-box"></i> Đơn hàng gần đây</h2>
        <a href="<?= url('tai-khoan/don-hang') ?>" class="link-more" style="font-size:.85rem">
          Xem tất cả <i class="fas fa-arrow-right"></i>
        </a>
      </div>
      <div class="account-card-body">
        <?php if (empty($donGanDay)): ?>
          <div style="text-align:center;padding:2rem;color:var(--gray-400)">
            <i class="fas fa-box-open" style="font-size:2.5rem;margin-bottom:.75rem;display:block"></i>
            Chưa có đơn hàng nào
            <br><a href="<?= url('san-pham') ?>" class="btn btn-blue btn-sm" style="margin-top:.75rem;display:inline-flex">Mua sắm ngay</a>
          </div>
        <?php else: ?>
          <?php foreach ($donGanDay as $dh): ?>
          <div style="display:flex;align-items:center;justify-content:space-between;padding:.75rem 0;border-bottom:1px solid var(--gray-100)">
            <div>
              <a href="<?= url('don-hang/' . e($dh['ma_don'])) ?>"
                 style="font-family:monospace;font-weight:700;color:var(--accent)"><?= e($dh['ma_don']) ?></a>
              <div style="font-size:.78rem;color:var(--gray-400);margin-top:.15rem"><?= format_date($dh['created_at'],'d/m/Y') ?></div>
            </div>
            <span class="status-pill <?= $statusPill[$dh['trang_thai']] ?? 'pill-pending' ?>">
              <?= $statusLabel[$dh['trang_thai']] ?? $dh['trang_thai'] ?>
            </span>
            <strong style="color:var(--danger)"><?= format_price($dh['tong_tien']) ?></strong>
          </div>
          <?php endforeach; ?>
        <?php endif; ?>
      </div>
    </div>

    <!-- Cập nhật hồ sơ -->
    <div class="account-card">
      <div class="account-card-head">
        <h2><i class="fas fa-user-edit"></i> Hồ sơ cá nhân</h2>
      </div>
      <div class="account-card-body">
        <form action="<?= url('tai-khoan/cap-nhat') ?>" method="POST" enctype="multipart/form-data">
          <?= Session::csrfField() ?>

          <!-- ===== AVATAR ===== -->
          <div style="display:flex;align-items:center;gap:1.5rem;margin-bottom:1.5rem;padding-bottom:1.5rem;border-bottom:1px solid var(--gray-100)">
            <!-- Hiển thị avatar hiện tại -->
            <div style="position:relative;flex-shrink:0">
              <div id="avatar-preview" style="width:90px;height:90px;border-radius:50%;overflow:hidden;border:3px solid var(--accent-light);background:var(--gray-100);display:flex;align-items:center;justify-content:center">
                <?php if (!empty($user['avatar'])): ?>
                  <img id="avatar-img" src="<?= img_url(e($user['avatar'])) ?>"
                       style="width:100%;height:100%;object-fit:cover">
                <?php else: ?>
                  <span id="avatar-initial" style="font-size:2.2rem;font-weight:800;color:var(--accent)">
                    <?= mb_substr($user['ho_ten'] ?? 'U', 0, 1, 'UTF-8') ?>
                  </span>
                <?php endif; ?>
              </div>
              <!-- Nút camera -->
              <label for="avatar-input" style="position:absolute;bottom:0;right:0;width:28px;height:28px;background:var(--accent);border-radius:50%;display:flex;align-items:center;justify-content:center;cursor:pointer;box-shadow:0 2px 8px rgba(0,0,0,.2);transition:transform .2s"
                     onmouseover="this.style.transform='scale(1.1)'" onmouseout="this.style.transform='scale(1)'">
                <i class="fas fa-camera" style="color:#fff;font-size:.7rem"></i>
              </label>
              <!-- input KHÔNG có name="avatar" → chỉ preview, chưa submit -->
              <input type="file" id="avatar-input" accept="image/*"
                     style="display:none" onchange="previewAvatar(this)">
              <!-- input ẩn thật sự submit, chỉ bật khi user xác nhận -->
              <input type="file" id="avatar-real" name="avatar" accept="image/*" style="display:none">
            </div>
            <div>
              <div style="font-weight:700;color:var(--primary);margin-bottom:.25rem"><?= e($user['ho_ten']) ?></div>
              <div style="font-size:.82rem;color:var(--gray-400);margin-bottom:.6rem">
                Nhấn vào biểu tượng 📷 để thay ảnh đại diện
              </div>
              <div style="font-size:.75rem;color:var(--gray-400)">JPG, PNG, WEBP • Tối đa 2MB</div>
            </div>
          </div>

          <!-- ===== THÔNG TIN ===== -->
          <div class="profile-grid">
            <div class="form-group">
              <label class="form-label">Họ và tên <span style="color:var(--danger)">*</span></label>
              <input type="text" name="ho_ten" class="form-input"
                     value="<?= e($user['ho_ten']) ?>" required>
            </div>
            <div class="form-group">
              <label class="form-label">Email</label>
              <input type="email" class="form-input" value="<?= e($user['email']) ?>"
                     disabled style="background:var(--gray-100);color:var(--gray-500)">
            </div>
            <div class="form-group">
              <label class="form-label">Số điện thoại</label>
              <input type="tel" name="so_dien_thoai" class="form-input"
                     value="<?= e($user['so_dien_thoai'] ?? '') ?>" placeholder="0912 345 678">
            </div>
            <div class="form-group">
              <label class="form-label">Ngày sinh</label>
              <input type="date" name="ngay_sinh" class="form-input"
                     value="<?= e($user['ngay_sinh'] ?? '') ?>"
                     max="<?= date('Y-m-d', strtotime('-10 years')) ?>">
            </div>

            <!-- Đổi mật khẩu -->
            <div class="form-group full" style="border-top:1px solid var(--gray-100);padding-top:1rem;margin-top:.25rem">
              <label class="form-label" style="font-weight:700;color:var(--primary)">
                Đổi mật khẩu
                <span style="font-weight:400;color:var(--gray-400)">(để trống nếu không đổi)</span>
              </label>
            </div>
            <div class="form-group">
              <label class="form-label">Mật khẩu mới</label>
              <div style="position:relative">
                <input type="password" name="mat_khau_moi" id="pwd-new" class="form-input"
                       placeholder="Ít nhất 6 ký tự" minlength="6" style="padding-right:2.5rem">
                <i class="far fa-eye" onclick="togglePwd('pwd-new',this)"
                   style="position:absolute;right:.75rem;top:50%;transform:translateY(-50%);cursor:pointer;color:var(--gray-400)"></i>
              </div>
            </div>
            <div class="form-group">
              <label class="form-label">Xác nhận mật khẩu</label>
              <div style="position:relative">
                <input type="password" name="xac_nhan_mat_khau" id="pwd-confirm" class="form-input"
                       placeholder="Nhập lại mật khẩu mới" style="padding-right:2.5rem">
                <i class="far fa-eye" onclick="togglePwd('pwd-confirm',this)"
                   style="position:absolute;right:.75rem;top:50%;transform:translateY(-50%);cursor:pointer;color:var(--gray-400)"></i>
              </div>
            </div>
          </div>

          <div style="margin-top:1.25rem;display:flex;gap:.75rem;align-items:center">
            <button type="submit" class="btn btn-blue">
              <i class="fas fa-save"></i> Lưu thay đổi
            </button>
            <span style="font-size:.8rem;color:var(--gray-400)">
              <i class="fas fa-lock" style="color:var(--success)"></i> Thông tin được bảo mật
            </span>
          </div>
        </form>
      </div>
    </div>

    <!-- ===== ĐỊA CHỈ GIAO HÀNG ===== -->
    <?php $addresses = Database::fetchAll(
        "SELECT * FROM dia_chi_khach_hang WHERE khach_hang_id=? ORDER BY la_mac_dinh DESC, id DESC",
        [Session::get('user_id')]
    ); ?>
    <div class="account-card" style="margin-top:1.25rem">
      <div class="account-card-head">
        <h2><i class="fas fa-map-marker-alt"></i> Địa chỉ giao hàng</h2>
        <button type="button" class="btn btn-outline btn-sm"
                onclick="document.getElementById('form-add-addr').style.display=document.getElementById('form-add-addr').style.display==='none'?'block':'none'">
          <i class="fas fa-plus"></i> Thêm địa chỉ
        </button>
      </div>
      <div class="account-card-body">

        <!-- Danh sách địa chỉ -->
        <?php if (empty($addresses)): ?>
          <p style="color:var(--gray-400);font-size:.88rem;text-align:center;padding:1rem">
            Chưa có địa chỉ nào. Thêm địa chỉ để đặt hàng nhanh hơn!
          </p>
        <?php else: ?>
          <div style="display:flex;flex-direction:column;gap:.75rem;margin-bottom:1.25rem">
            <?php foreach ($addresses as $addr): ?>
            <div style="border:1.5px solid <?= $addr['la_mac_dinh']?'var(--accent)':'var(--gray-200)' ?>;border-radius:12px;padding:1rem 1.25rem;background:<?= $addr['la_mac_dinh']?'var(--accent-light)':'#fff' ?>">
              <div style="display:flex;justify-content:space-between;align-items:flex-start;gap:.75rem">
                <div style="flex:1">
                  <div style="font-weight:700;color:var(--primary);margin-bottom:.25rem">
                    <?= e($addr['ho_ten']) ?> – <?= e($addr['so_dien_thoai']) ?>
                    <?php if ($addr['la_mac_dinh']): ?>
                      <span style="background:var(--accent);color:#fff;font-size:.68rem;padding:.1rem .5rem;border-radius:8px;margin-left:.35rem">Mặc định</span>
                    <?php endif; ?>
                  </div>
                  <div style="font-size:.85rem;color:var(--gray-500)">
                    <?= e($addr['so_nha_duong']) ?>, <?= e($addr['phuong_xa']) ?>, <?= e($addr['quan_huyen']) ?>, <?= e($addr['tinh_thanh']) ?>
                  </div>
                </div>
                <div style="display:flex;gap:.5rem;flex-shrink:0">
                  <?php if (!$addr['la_mac_dinh']): ?>
                  <form method="POST" action="<?= url('dia-chi/mac-dinh/'.$addr['id']) ?>" style="display:inline">
                    <?= Session::csrfField() ?>
                    <button type="submit" class="btn btn-outline btn-sm" style="font-size:.75rem">Đặt mặc định</button>
                  </form>
                  <?php endif; ?>
                  <form method="POST" action="<?= url('dia-chi/xoa/'.$addr['id']) ?>" onsubmit="return confirm('Xóa địa chỉ này?')" style="display:inline">
                    <?= Session::csrfField() ?>
                    <button type="submit" class="btn btn-sm" style="background:#fee2e2;color:#dc2626;border:1px solid #fecaca;font-size:.75rem">
                      <i class="fas fa-trash"></i>
                    </button>
                  </form>
                </div>
              </div>
            </div>
            <?php endforeach; ?>
          </div>
        <?php endif; ?>

        <!-- Form thêm địa chỉ mới -->
        <div id="form-add-addr" style="display:none;border-top:1px solid var(--gray-100);padding-top:1.25rem">
          <div style="font-size:.88rem;font-weight:600;color:var(--gray-600);margin-bottom:.85rem">
            <i class="fas fa-plus-circle" style="color:var(--accent)"></i> Thêm địa chỉ mới
          </div>
          <form method="POST" action="<?= url('dia-chi/them') ?>">
            <?= Session::csrfField() ?>
            <div class="profile-grid">
              <div class="form-group">
                <label class="form-label">Họ và tên <span style="color:var(--danger)">*</span></label>
                <input type="text" name="ho_ten" class="form-input" required placeholder="Nguyễn Văn A" value="<?= e($user['ho_ten']) ?>">
              </div>
              <div class="form-group">
                <label class="form-label">Số điện thoại <span style="color:var(--danger)">*</span></label>
                <input type="tel" name="so_dien_thoai" class="form-input" required placeholder="0912 345 678" value="<?= e($user['so_dien_thoai']??'') ?>">
              </div>
              <div class="form-group">
                <label class="form-label">Tỉnh / Thành phố <span style="color:var(--danger)">*</span></label>
                <input type="text" name="tinh_thanh" class="form-input" required placeholder="Hà Nội">
              </div>
              <div class="form-group">
                <label class="form-label">Quận / Huyện <span style="color:var(--danger)">*</span></label>
                <input type="text" name="quan_huyen" class="form-input" required placeholder="Quận Hai Bà Trưng">
              </div>
              <div class="form-group">
                <label class="form-label">Phường / Xã <span style="color:var(--danger)">*</span></label>
                <input type="text" name="phuong_xa" class="form-input" required placeholder="Phường Bách Khoa">
              </div>
              <div class="form-group">
                <label class="form-label">Số nhà, tên đường <span style="color:var(--danger)">*</span></label>
                <input type="text" name="so_nha_duong" class="form-input" required placeholder="123 Phố Huế">
              </div>
            </div>
            <div style="margin-top:.75rem;display:flex;justify-content:space-between;align-items:center">
              <label style="display:flex;align-items:center;gap:.5rem;font-size:.85rem;color:var(--gray-600);cursor:pointer">
                <input type="checkbox" name="la_mac_dinh" value="1" style="accent-color:var(--accent)">
                Đặt làm địa chỉ mặc định
              </label>
              <div style="display:flex;gap:.75rem">
                <button type="button" class="btn btn-outline btn-sm"
                        onclick="document.getElementById('form-add-addr').style.display='none'">Hủy</button>
                <button type="submit" class="btn btn-blue btn-sm"><i class="fas fa-save"></i> Lưu địa chỉ</button>
              </div>
            </div>
          </form>
        </div>

      </div>
    </div>
  </div>
</div>

<script>
let _avatarFile = null; // lưu tạm file chờ xác nhận

function previewAvatar(input) {
  if (!input.files || !input.files[0]) return;
  const file = input.files[0];

  if (file.size > 2 * 1024 * 1024) {
    alert('⚠️ Ảnh quá lớn! Tối đa 2MB.');
    input.value = '';
    return;
  }

  const reader = new FileReader();
  reader.onload = e => {
    // Hiện ảnh trong modal xác nhận
    document.getElementById('avatar-modal-img').src = e.target.result;
    document.getElementById('avatar-confirm-modal').style.display = 'flex';
    document.body.style.overflow = 'hidden';
    _avatarFile = file;
  };
  reader.readAsDataURL(file);
  // Reset input preview để có thể chọn lại cùng file
  input.value = '';
}

function confirmAvatar() {
  if (!_avatarFile) return;

  // Dùng DataTransfer để gán file vào input thật
  const dt = new DataTransfer();
  dt.items.add(_avatarFile);
  document.getElementById('avatar-real').files = dt.files;

  // Cập nhật ảnh hiện tại trong form
  const preview = document.getElementById('avatar-preview');
  const existing = preview.querySelector('img');
  const initial  = document.getElementById('avatar-initial');
  const src = document.getElementById('avatar-modal-img').src;

  if (existing) {
    existing.src = src;
  } else {
    if (initial) initial.style.display = 'none';
    const img = document.createElement('img');
    img.id = 'avatar-img';
    img.src = src;
    img.style.cssText = 'width:100%;height:100%;object-fit:cover';
    preview.appendChild(img);
  }

  closeAvatarModal();
}

function cancelAvatar() {
  _avatarFile = null;
  closeAvatarModal();
}

function closeAvatarModal() {
  document.getElementById('avatar-confirm-modal').style.display = 'none';
  document.body.style.overflow = '';
}

function togglePwd(id, icon) {
  const inp = document.getElementById(id);
  if (inp.type === 'password') {
    inp.type = 'text';
    icon.classList.replace('fa-eye', 'fa-eye-slash');
  } else {
    inp.type = 'password';
    icon.classList.replace('fa-eye-slash', 'fa-eye');
  }
}
</script>

<!-- Modal xác nhận avatar -->
<div id="avatar-confirm-modal" style="display:none;position:fixed;inset:0;background:rgba(0,0,0,.6);z-index:99999;align-items:center;justify-content:center;backdrop-filter:blur(4px)">
  <div style="background:#fff;border-radius:24px;padding:2rem;max-width:360px;width:90%;text-align:center;box-shadow:0 20px 60px rgba(0,0,0,.25);animation:pzScaleIn .3s cubic-bezier(.4,0,.2,1)">
    <h3 style="font-size:1rem;font-weight:700;color:var(--primary);margin-bottom:1rem">Xem trước ảnh đại diện</h3>

    <!-- Preview ảnh tròn -->
    <div style="width:110px;height:110px;border-radius:50%;overflow:hidden;margin:0 auto 1rem;border:4px solid var(--accent-light);box-shadow:0 4px 16px rgba(0,0,0,.1)">
      <img id="avatar-modal-img" src="" style="width:100%;height:100%;object-fit:cover">
    </div>

    <p style="font-size:.85rem;color:var(--gray-500);margin-bottom:1.25rem">
      Ảnh trông ổn chứ? Bấm <strong>Dùng ảnh này</strong> để xác nhận,<br>sau đó nhấn <strong>Lưu thay đổi</strong> để cập nhật.
    </p>

    <div style="display:flex;gap:.75rem">
      <button type="button" onclick="cancelAvatar()"
              style="flex:1;padding:.75rem;border:1px solid var(--gray-200);border-radius:12px;background:#fff;font-weight:600;cursor:pointer;font-family:inherit;color:var(--gray-600)">
        <i class="fas fa-times"></i> Chọn lại
      </button>
      <button type="button" onclick="confirmAvatar()"
              style="flex:1;padding:.75rem;background:linear-gradient(135deg,var(--accent),var(--accent-hover));color:#fff;border:none;border-radius:12px;font-weight:700;cursor:pointer;font-family:inherit">
        <i class="fas fa-check"></i> Dùng ảnh này
      </button>
    </div>
  </div>
</div>

<style>
@keyframes pzScaleIn{from{transform:scale(.85);opacity:0}to{transform:scale(1);opacity:1}}
</style>

