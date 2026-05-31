<div style="max-width:900px;margin:2rem auto;padding:0 5%">
  <div style="text-align:center;padding:2.5rem 1rem;margin-bottom:2rem">
    <div style="width:72px;height:72px;border-radius:20px;background:linear-gradient(135deg,#f59e0b,#d97706);display:flex;align-items:center;justify-content:center;margin:0 auto 1rem;font-size:1.75rem;color:#fff"><i class="fas fa-credit-card"></i></div>
    <h1 style="font-size:1.75rem;font-weight:800;color:var(--primary);margin-bottom:.5rem">Phương thức thanh toán</h1>
    <p style="color:var(--gray-500)">Hỗ trợ nhiều hình thức thanh toán tiện lợi và an toàn</p>
  </div>
  <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:1.25rem;margin-bottom:1.5rem">
    <?php foreach([
      ['fas fa-money-bill-wave','#ffedd5','#ea580c','COD – Thanh toán khi nhận','Trả tiền mặt trực tiếp cho nhân viên giao hàng. Áp dụng toàn quốc. Hoàn toàn miễn phí, không phụ thu.','Phổ biến nhất'],
      ['fas fa-qrcode','#fce7f3','#be185d','Ví MoMo','Quét mã QR MoMo hoặc chuyển tiền đến số 0364663178. Xác nhận đơn hàng tức thì.','Nhanh nhất'],
      ['fas fa-university','#dbeafe','#1d4ed8','Chuyển khoản ngân hàng','Chuyển khoản đến BIDV 5050601244 – CÔNG TY PHONEZONE. Xử lý trong 1 giờ.','An toàn'],
      ['fas fa-credit-card','#d1fae5','#059669','VNPay / Thẻ ATM / Visa','Thanh toán qua cổng VNPay. Hỗ trợ ATM nội địa, Visa, MasterCard. Bảo mật SSL 256-bit.','Trả góp 0%'],
    ] as [$icon,$bg,$color,$title,$desc,$tag]): ?>
    <div style="background:#fff;border:1px solid var(--gray-200);border-radius:16px;padding:1.5rem">
      <div style="width:44px;height:44px;border-radius:12px;background:<?=$bg?>;color:<?=$color?>;display:flex;align-items:center;justify-content:center;font-size:1.1rem"><i class="<?=$icon?>"></i></div>
      <h3 style="font-size:.95rem;font-weight:700;color:var(--primary);margin:.75rem 0 .5rem"><?=$title?></h3>
      <p style="font-size:.85rem;color:var(--gray-600);line-height:1.6;margin-bottom:.75rem"><?=$desc?></p>
      <span style="font-size:.72rem;font-weight:700;background:var(--accent-light);color:var(--accent);padding:.2rem .6rem;border-radius:20px"><?=$tag?></span>
    </div>
    <?php endforeach; ?>
  </div>
  <div style="background:var(--accent-light);border:1px solid #bfdbfe;border-radius:12px;padding:1rem 1.25rem;display:flex;gap:.75rem;font-size:.85rem;color:var(--gray-700)">
    <i class="fas fa-lock" style="color:var(--accent);font-size:1.1rem;flex-shrink:0;margin-top:.1rem"></i>
    <div>Mọi giao dịch đều được mã hóa SSL và bảo mật tuyệt đối. PhoneZone không lưu thông tin thẻ của bạn.</div>
  </div>
</div>
