<div style="max-width:900px;margin:2rem auto;padding:0 5%">
  <div style="text-align:center;padding:2.5rem 1rem;margin-bottom:2rem">
    <div style="width:72px;height:72px;border-radius:20px;background:linear-gradient(135deg,#10b981,#059669);display:flex;align-items:center;justify-content:center;margin:0 auto 1rem;font-size:1.75rem;color:#fff"><i class="fas fa-exchange-alt"></i></div>
    <h1 style="font-size:1.75rem;font-weight:800;color:var(--primary);margin-bottom:.5rem">Đổi trả & Hoàn tiền</h1>
    <p style="color:var(--gray-500)">Chính sách đổi trả minh bạch, hoàn tiền 100% nếu sản phẩm lỗi</p>
  </div>
  <div style="display:flex;flex-direction:column;gap:1rem;margin-bottom:1.5rem">
    <?php foreach([
      ['1','Điều kiện đổi trả',['Trong vòng 7 ngày kể từ ngày nhận hàng','Sản phẩm chưa qua sử dụng, còn nguyên seal','Đầy đủ phụ kiện, hộp, hóa đơn mua hàng','Lỗi do nhà sản xuất: đổi mới 100%']],
      ['2','Quy trình đổi trả',['Liên hệ hotline 1800.6789 hoặc email support@phonezone.vn','Cung cấp mã đơn hàng và mô tả lỗi','Gửi sản phẩm về kho PhoneZone','Nhận sản phẩm mới trong 3–5 ngày']],
      ['3','Hoàn tiền',['Hoàn tiền 100% nếu hết hàng thay thế','Thời gian hoàn tiền: 3–7 ngày làm việc','Hoàn qua: Chuyển khoản, MoMo, VNPay','Phí ship 2 chiều do PhoneZone chịu nếu lỗi máy']],
    ] as [$num,$title,$items]): ?>
    <div style="background:#fff;border:1px solid var(--gray-200);border-radius:16px;padding:1.25rem 1.5rem;display:flex;gap:1rem;align-items:flex-start">
      <div style="width:36px;height:36px;border-radius:50%;background:var(--accent);color:#fff;font-weight:800;display:flex;align-items:center;justify-content:center;flex-shrink:0"><?=$num?></div>
      <div>
        <h3 style="font-size:.95rem;font-weight:700;color:var(--primary);margin-bottom:.4rem"><?=$title?></h3>
        <ul style="padding-left:1.2rem;font-size:.85rem;color:var(--gray-600);line-height:2;margin:0">
          <?php foreach($items as $i): ?><li><?=$i?></li><?php endforeach; ?>
        </ul>
      </div>
    </div>
    <?php endforeach; ?>
  </div>
  <div style="background:var(--accent-light);border:1px solid #bfdbfe;border-radius:12px;padding:1rem 1.25rem;display:flex;gap:.75rem;font-size:.85rem;color:var(--gray-700)">
    <i class="fas fa-phone" style="color:var(--accent);font-size:1.1rem;flex-shrink:0;margin-top:.1rem"></i>
    <div>Cần hỗ trợ? Gọi <strong>1800.6789</strong> (miễn phí, 8:00–22:00) hoặc email <strong>support@phonezone.vn</strong></div>
  </div>
</div>
