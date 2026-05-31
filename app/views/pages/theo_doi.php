<?php
$statusLabel=['cho_xac_nhan'=>'Chờ xác nhận','da_xac_nhan'=>'Đã xác nhận','dang_dong_hang'=>'Đang đóng hàng','dang_giao'=>'Đang giao hàng','da_giao'=>'Đã giao thành công','da_huy'=>'Đã hủy'];
$statusClass =['cho_xac_nhan'=>'s-pending','da_xac_nhan'=>'s-confirmed','dang_dong_hang'=>'s-packing','dang_giao'=>'s-shipping','da_giao'=>'s-done','da_huy'=>'s-canceled'];
?>
<div style="max-width:700px;margin:2rem auto;padding:0 5%">
  <div style="text-align:center;padding:2.5rem 1rem;margin-bottom:2rem">
    <div style="width:72px;height:72px;border-radius:20px;background:linear-gradient(135deg,#3b82f6,#1d4ed8);display:flex;align-items:center;justify-content:center;margin:0 auto 1rem;font-size:1.75rem;color:#fff"><i class="fas fa-box-open"></i></div>
    <h1 style="font-size:1.75rem;font-weight:800;color:var(--primary);margin-bottom:.5rem">Theo dõi đơn hàng</h1>
    <p style="color:var(--gray-500)">Nhập mã đơn hàng để kiểm tra trạng thái giao hàng</p>
  </div>
  <div style="background:#fff;border-radius:16px;padding:1.5rem;border:1px solid var(--gray-200);box-shadow:0 2px 12px rgba(0,0,0,.05);margin-bottom:1.5rem">
    <form method="GET" action="<?=url('theo-doi-don-hang')?>" style="display:flex;gap:.75rem">
      <input type="text" name="ma" value="<?=e($ma??'')?>" class="form-input" style="flex:1" placeholder="Nhập mã đơn hàng VD: DH2026XXXXX" required>
      <button type="submit" class="btn btn-blue" style="white-space:nowrap"><i class="fas fa-search"></i> Tra cứu</button>
    </form>
  </div>
  <?php if(!empty($ma) && !$order): ?>
  <div style="text-align:center;padding:2rem;background:#fff;border-radius:16px;border:1px solid var(--gray-200)">
    <i class="fas fa-search" style="font-size:2.5rem;color:var(--gray-300);margin-bottom:1rem;display:block"></i>
    <h3 style="color:var(--gray-600);margin-bottom:.5rem">Không tìm thấy đơn hàng</h3>
    <p style="color:var(--gray-400)">Mã đơn "<?=e($ma)?>" không tồn tại. Vui lòng kiểm tra lại.</p>
  </div>
  <?php elseif($order): ?>
  <div style="background:#fff;border-radius:16px;border:1px solid var(--gray-200);overflow:hidden">
    <div style="background:linear-gradient(135deg,var(--accent),var(--accent-hover));padding:1.25rem 1.5rem;display:flex;justify-content:space-between;align-items:center">
      <div>
        <div style="color:rgba(255,255,255,.7);font-size:.8rem">Mã đơn hàng</div>
        <div style="color:#fff;font-size:1.1rem;font-weight:800"><?=e($order['ma_don'])?></div>
      </div>
      <span class="badge-status <?=$statusClass[$order['trang_thai']]??'s-pending'?>"><?=$statusLabel[$order['trang_thai']]??$order['trang_thai']?></span>
    </div>
    <div style="padding:1.25rem 1.5rem;border-bottom:1px solid var(--gray-100)">
      <div style="display:grid;grid-template-columns:1fr 1fr;gap:.75rem;font-size:.85rem">
        <div><span style="color:var(--gray-400)">Người nhận:</span> <strong><?=e($order['ten_nguoi_nhan'])?></strong></div>
        <div><span style="color:var(--gray-400)">SĐT:</span> <strong><?=e($order['so_dien_thoai'])?></strong></div>
        <div><span style="color:var(--gray-400)">Ngày đặt:</span> <strong><?=format_date($order['created_at'],'d/m/Y H:i')?></strong></div>
        <div><span style="color:var(--gray-400)">Thanh toán:</span> <strong><?=strtoupper($order['phuong_thuc_tt'])?></strong></div>
      </div>
    </div>
    <div style="padding:1rem 1.5rem;display:flex;justify-content:space-between;align-items:center">
      <span style="color:var(--gray-500)">Tổng thanh toán</span>
      <span style="font-size:1.2rem;font-weight:800;color:var(--danger)"><?=format_price($order['tong_tien'])?></span>
    </div>
  </div>
  <?php else: ?>
  <div style="text-align:center;padding:1.5rem;color:var(--gray-400);font-size:.88rem">
    <i class="fas fa-info-circle" style="color:var(--accent)"></i>
    Mã đơn hàng được gửi qua email sau khi đặt hàng thành công.<br>
    Hoặc xem trong <a href="<?=url('tai-khoan/don-hang')?>" style="color:var(--accent)">Tài khoản → Đơn hàng</a>.
  </div>
  <?php endif; ?>
</div>
