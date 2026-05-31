<?php $faqs = [
  ['Sản phẩm có phải hàng chính hãng không?','Tất cả sản phẩm tại PhoneZone đều là hàng chính hãng 100%, có đầy đủ tem hộp, hóa đơn VAT và bảo hành chính hãng tại Việt Nam.'],
  ['Thời gian giao hàng bao lâu?','Nội thành Hà Nội và TP.HCM: 2–4 giờ hoặc trong ngày. Các tỉnh thành khác: 2–5 ngày làm việc.'],
  ['Phí vận chuyển là bao nhiêu?','Miễn phí vận chuyển cho đơn hàng từ 1.000.000₫. Đơn dưới 1.000.000₫ phí ship 30.000₫.'],
  ['Tôi có thể theo dõi đơn hàng không?','Có! Vào Tài khoản → Đơn hàng hoặc dùng tính năng Theo dõi đơn hàng với mã đơn được gửi qua email.'],
  ['Sản phẩm có bảo hành không?','Tất cả sản phẩm được bảo hành 12 tháng chính hãng. Chi tiết xem tại Chính sách bảo hành.'],
  ['Tôi có thể đổi trả sản phẩm không?','1 đổi 1 trong 7 ngày nếu lỗi nhà sản xuất. Xem chi tiết tại trang Đổi trả & Hoàn tiền.'],
  ['Có hỗ trợ trả góp không?','Có! Hỗ trợ trả góp 0% lãi suất qua 32 ngân hàng và ví điện tử. Liên hệ nhân viên để được tư vấn.'],
  ['Tôi có thể hủy đơn hàng không?','Có thể hủy đơn khi đơn hàng đang ở trạng thái Chờ xác nhận. Vào Tài khoản → Đơn hàng → Hủy đơn hàng.'],
]; ?>
<div style="max-width:860px;margin:2rem auto;padding:0 5%">
  <div style="text-align:center;padding:2.5rem 1rem;margin-bottom:2rem">
    <div style="width:72px;height:72px;border-radius:20px;background:linear-gradient(135deg,#06b6d4,#0891b2);display:flex;align-items:center;justify-content:center;margin:0 auto 1rem;font-size:1.75rem;color:#fff"><i class="fas fa-question-circle"></i></div>
    <h1 style="font-size:1.75rem;font-weight:800;color:var(--primary);margin-bottom:.5rem">Câu hỏi thường gặp</h1>
    <p style="color:var(--gray-500)">Giải đáp nhanh các thắc mắc phổ biến của khách hàng</p>
  </div>
  <div style="display:flex;flex-direction:column;gap:.6rem;margin-bottom:1.5rem">
    <?php foreach($faqs as $i => [$q,$a]): ?>
    <div style="background:#fff;border:1px solid var(--gray-200);border-radius:12px;overflow:hidden;cursor:pointer" onclick="toggleFaq(<?=$i?>)">
      <div style="display:flex;justify-content:space-between;align-items:center;padding:1rem 1.25rem;font-weight:600;color:var(--primary);font-size:.92rem">
        <span><?=e($q)?></span>
        <i class="fas fa-chevron-down" id="fi-<?=$i?>" style="color:var(--accent);transition:transform .25s;flex-shrink:0;margin-left:.75rem"></i>
      </div>
      <div id="fa-<?=$i?>" style="display:none;padding:0 1.25rem 1rem;font-size:.85rem;color:var(--gray-600);line-height:1.7"><?=e($a)?></div>
    </div>
    <?php endforeach; ?>
  </div>
  <div style="background:var(--accent-light);border:1px solid #bfdbfe;border-radius:12px;padding:1rem 1.25rem;display:flex;gap:.75rem;font-size:.85rem;color:var(--gray-700)">
    <i class="fas fa-headset" style="color:var(--accent);font-size:1.1rem;flex-shrink:0;margin-top:.1rem"></i>
    <div>Chưa tìm được câu trả lời? Gọi <strong>1800.6789</strong> (miễn phí) hoặc email <strong>support@phonezone.vn</strong></div>
  </div>
</div>
<script>
function toggleFaq(i){
  const a=document.getElementById('fa-'+i), ic=document.getElementById('fi-'+i);
  const open=a.style.display==='none';
  a.style.display=open?'block':'none';
  ic.style.transform=open?'rotate(180deg)':'rotate(0)';
}
</script>
