<div style="max-width:900px;margin:2rem auto;padding:0 5%">
  <div style="text-align:center;padding:2.5rem 1rem;margin-bottom:2rem">
    <div style="width:72px;height:72px;border-radius:20px;background:linear-gradient(135deg,#3b82f6,#1d4ed8);display:flex;align-items:center;justify-content:center;margin:0 auto 1rem;font-size:1.75rem;color:#fff"><i class="fas fa-shield-alt"></i></div>
    <h1 style="font-size:1.75rem;font-weight:800;color:var(--primary);margin-bottom:.5rem">Chính sách bảo hành</h1>
    <p style="color:var(--gray-500)">PhoneZone cam kết bảo hành chính hãng, minh bạch và nhanh chóng</p>
  </div>
  <div style="display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:1.25rem;margin-bottom:1.5rem">
    <?php foreach([
      ['fas fa-clock','#dbeafe','#1d4ed8','Thời gian bảo hành',['iPhone: 12 tháng chính hãng Apple','Samsung: 12 tháng tại trung tâm Samsung','Xiaomi, OPPO, Vivo, Realme: 12 tháng','Pin & phụ kiện đi kèm: 6 tháng']],
      ['fas fa-check-circle','#d1fae5','#059669','Được bảo hành khi',['Sản phẩm bị lỗi do nhà sản xuất','Màn hình, camera, pin lỗi kỹ thuật','Lỗi phần mềm gốc từ nhà sản xuất','Còn trong thời hạn bảo hành']],
      ['fas fa-times-circle','#fee2e2','#dc2626','Không bảo hành khi',['Vỡ màn hình, trầy xước do va đập','Vào nước (không hỗ trợ chống nước)','Tự ý tháo máy, sửa ngoài','Hết thời hạn bảo hành']],
      ['fas fa-map-marker-alt','#ffedd5','#ea580c','Cách thức bảo hành',['Mang đến cửa hàng PhoneZone','Gửi bưu điện kèm hóa đơn mua hàng','Hotline 1800.6789 để được hỗ trợ','Thời gian xử lý: 3–7 ngày làm việc']],
    ] as [$icon,$bg,$color,$title,$items]): ?>
    <div style="background:#fff;border:1px solid var(--gray-200);border-radius:16px;padding:1.5rem">
      <div style="width:44px;height:44px;border-radius:12px;background:<?=$bg?>;color:<?=$color?>;display:flex;align-items:center;justify-content:center;font-size:1.1rem"><i class="<?=$icon?>"></i></div>
      <h3 style="font-size:.95rem;font-weight:700;color:var(--primary);margin:.75rem 0 .5rem"><?=$title?></h3>
      <ul style="padding-left:1.2rem;font-size:.85rem;color:var(--gray-600);line-height:2">
        <?php foreach($items as $i): ?><li><?=$i?></li><?php endforeach; ?>
      </ul>
    </div>
    <?php endforeach; ?>
  </div>
  <div style="background:var(--accent-light);border:1px solid #bfdbfe;border-radius:12px;padding:1rem 1.25rem;display:flex;gap:.75rem;font-size:.85rem;color:var(--gray-700)">
    <i class="fas fa-info-circle" style="color:var(--accent);font-size:1.1rem;flex-shrink:0;margin-top:.1rem"></i>
    <div><strong>Lưu ý:</strong> Vui lòng giữ lại hóa đơn mua hàng. Liên hệ <strong>1800.6789</strong> hoặc <strong>support@phonezone.vn</strong> nếu cần hỗ trợ.</div>
  </div>
</div>
