<div style="max-width:900px;margin:2rem auto;padding:0 5%">
  <div style="text-align:center;padding:2.5rem 1rem;margin-bottom:2rem">
    <div style="width:72px;height:72px;border-radius:20px;background:linear-gradient(135deg,#8b5cf6,#7c3aed);display:flex;align-items:center;justify-content:center;margin:0 auto 1rem;font-size:1.75rem;color:#fff"><i class="fas fa-shopping-bag"></i></div>
    <h1 style="font-size:1.75rem;font-weight:800;color:var(--primary);margin-bottom:.5rem">Hướng dẫn mua hàng</h1>
    <p style="color:var(--gray-500)">Mua hàng tại PhoneZone đơn giản chỉ với 4 bước</p>
  </div>
  <div style="display:flex;flex-direction:column;gap:1rem;margin-bottom:1.5rem">
    <?php foreach([
      ['1','fas fa-search','Tìm sản phẩm','Tìm kiếm theo tên, lọc theo hãng, giá, đánh giá. Bấm vào sản phẩm để xem chi tiết thông số, ảnh gallery và đánh giá từ khách hàng.'],
      ['2','fas fa-cart-plus','Thêm vào giỏ hàng','Chọn màu sắc, dung lượng phù hợp. Bấm Thêm vào giỏ hoặc Mua ngay. Có thể dùng mã giảm giá trong giỏ hàng.'],
      ['3','fas fa-map-marker-alt','Nhập địa chỉ & Thanh toán','Điền địa chỉ giao hàng. Chọn phương thức thanh toán: COD, MoMo, Chuyển khoản hoặc VNPay. Bấm Xác nhận đặt hàng.'],
      ['4','fas fa-box','Nhận hàng','Đơn hàng được xử lý trong 1–2 giờ. Giao hàng toàn quốc 2–5 ngày. Theo dõi đơn hàng trong tài khoản của bạn.'],
    ] as [$num,$icon,$title,$desc]): ?>
    <div style="background:#fff;border:1px solid var(--gray-200);border-radius:16px;padding:1.25rem 1.5rem;display:flex;gap:1rem;align-items:flex-start">
      <div style="width:40px;height:40px;border-radius:50%;background:linear-gradient(135deg,var(--accent),var(--accent-hover));color:#fff;font-weight:800;font-size:1.1rem;display:flex;align-items:center;justify-content:center;flex-shrink:0"><?=$num?></div>
      <div>
        <h3 style="font-size:.95rem;font-weight:700;margin-bottom:.4rem"><i class="<?=$icon?>" style="color:var(--accent);margin-right:.4rem"></i><?=$title?></h3>
        <p style="font-size:.85rem;color:var(--gray-600);line-height:1.7;margin:0"><?=$desc?></p>
      </div>
    </div>
    <?php endforeach; ?>
  </div>
  <div style="background:var(--accent-light);border:1px solid #bfdbfe;border-radius:12px;padding:1rem 1.25rem;display:flex;gap:.75rem;font-size:.85rem;color:var(--gray-700)">
    <i class="fas fa-gift" style="color:var(--accent);font-size:1.1rem;flex-shrink:0;margin-top:.1rem"></i>
    <div><strong>Ưu đãi:</strong> Miễn phí vận chuyển cho đơn hàng từ 1.000.000₫. Trả góp 0% qua 32 ngân hàng & ví điện tử.</div>
  </div>
</div>
